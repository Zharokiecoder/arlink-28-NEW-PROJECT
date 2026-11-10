using System.Security.Claims;
using System.Text.Json;
using Arlink28.Api.Data;
using Arlink28.Api.Data.Entities;
using Arlink28.Api.Features.AdminTeam.RequestModels;
using Arlink28.Api.Features.AdminTeam.ResponseModels;
using Arlink28.Api.Features.Shared.Services.Interfaces;
using Arlink28.Api.Helpers;
using Asp.Versioning;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Arlink28.Api.Features.AdminTeam.Controllers;

[ApiController]
[ApiVersion(1)]
[Authorize]
[Route("api/v{version:apiVersion}/admin/team")]
public class AdminTeamController(ApplicationDbContext db, IMediaStorage storage) : ControllerBase
{
    private string? ActorId => User.FindFirstValue(ClaimTypes.NameIdentifier);

    [HttpGet]
    [ProducesResponseType(typeof(IReadOnlyList<TeamMemberResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> List(CancellationToken ct = default)
    {
        var items = await db.TeamMembers
            .AsNoTracking()
            .OrderBy(t => t.SortOrder)
            .ThenBy(t => t.Name)
            .ToListAsync(ct);

        var responses = items.Select(ToResponse).ToList();
        return Ok(responses);
    }

    [HttpPost]
    [ProducesResponseType(typeof(TeamMemberResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Create([FromBody] CreateTeamMemberRequest request, CancellationToken ct = default)
    {
        if (string.IsNullOrWhiteSpace(request.Name))
            throw new AppException("Please provide a name for the team member.");

        if (string.IsNullOrWhiteSpace(request.Role))
            throw new AppException("Please provide a role for the team member.");

        if (string.IsNullOrWhiteSpace(request.Group))
            throw new AppException("Please provide a group label for the team member.");

        var now = DateTime.UtcNow;
        var member = new TeamMember
        {
            Id = Guid.NewGuid(),
            Name = request.Name.Trim(),
            Role = request.Role.Trim(),
            Group = request.Group.Trim(),
            PhotoPath = string.IsNullOrWhiteSpace(request.PhotoPath) ? null : request.PhotoPath.Trim(),
            Alt = string.IsNullOrWhiteSpace(request.Alt) ? request.Name.Trim() : request.Alt.Trim(),
            Bio = request.Bio != null && request.Bio.Count > 0 ? JsonSerializer.Serialize(request.Bio) : null,
            SortOrder = request.SortOrder,
            IsLeadership = request.IsLeadership,
            CreatedAt = now,
            UpdatedAt = now
        };

        db.TeamMembers.Add(member);

        db.AuditLogs.Add(new AuditLog
        {
            Id = Guid.NewGuid(),
            CreatedAt = now,
            ActorId = ActorId,
            Action = "TeamMemberCreated",
            EntityType = "TeamMember",
            EntityId = member.Id.ToString(),
            After = JsonSerializer.Serialize(new { member.Name, member.Role, member.Group })
        });

        await db.SaveChangesAsync(ct);

        return CreatedAtAction(nameof(List), new { id = member.Id }, ToResponse(member));
    }

    [HttpPut("{id:guid}")]
    [ProducesResponseType(typeof(TeamMemberResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Update(Guid id, [FromBody] UpdateTeamMemberRequest request, CancellationToken ct = default)
    {
        var member = await db.TeamMembers.FirstOrDefaultAsync(t => t.Id == id, ct);
        if (member == null) return NotFound();

        if (string.IsNullOrWhiteSpace(request.Name))
            throw new AppException("Please provide a name for the team member.");

        if (string.IsNullOrWhiteSpace(request.Role))
            throw new AppException("Please provide a role for the team member.");

        if (string.IsNullOrWhiteSpace(request.Group))
            throw new AppException("Please provide a group label for the team member.");

        var now = DateTime.UtcNow;
        member.Name = request.Name.Trim();
        member.Role = request.Role.Trim();
        member.Group = request.Group.Trim();
        member.PhotoPath = string.IsNullOrWhiteSpace(request.PhotoPath) ? null : request.PhotoPath.Trim();
        member.Alt = string.IsNullOrWhiteSpace(request.Alt) ? request.Name.Trim() : request.Alt.Trim();
        member.Bio = request.Bio != null && request.Bio.Count > 0 ? JsonSerializer.Serialize(request.Bio) : null;
        member.SortOrder = request.SortOrder;
        member.IsLeadership = request.IsLeadership;
        member.UpdatedAt = now;

        db.AuditLogs.Add(new AuditLog
        {
            Id = Guid.NewGuid(),
            CreatedAt = now,
            ActorId = ActorId,
            Action = "TeamMemberUpdated",
            EntityType = "TeamMember",
            EntityId = member.Id.ToString(),
            After = JsonSerializer.Serialize(new { member.Name, member.Role, member.Group })
        });

        await db.SaveChangesAsync(ct);

        return Ok(ToResponse(member));
    }

    [HttpDelete("{id:guid}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Delete(Guid id, CancellationToken ct = default)
    {
        var member = await db.TeamMembers.FirstOrDefaultAsync(t => t.Id == id, ct);
        if (member == null) return NotFound();

        db.TeamMembers.Remove(member);

        db.AuditLogs.Add(new AuditLog
        {
            Id = Guid.NewGuid(),
            CreatedAt = DateTime.UtcNow,
            ActorId = ActorId,
            Action = "TeamMemberDeleted",
            EntityType = "TeamMember",
            EntityId = id.ToString(),
            After = JsonSerializer.Serialize(new { member.Name, member.Role })
        });

        await db.SaveChangesAsync(ct);
        return NoContent();
    }

    [HttpPost("photo")]
    [Consumes("multipart/form-data")]
    public async Task<IActionResult> UploadPhoto(IFormFile file, CancellationToken ct = default)
    {
        if (file == null || file.Length == 0)
            throw new AppException("Please choose a photo to upload.");

        if (file.Length > 10 * 1024 * 1024)
            throw new AppException("The photo must be 10 MB or smaller.");

        var header = new byte[12];
        await using (var peek = file.OpenReadStream())
        {
            await peek.ReadAtLeastAsync(header, header.Length, throwOnEndOfStream: false, ct);
        }

        var contentType = storage.SniffContentType(header);
        if (contentType == null)
            throw new AppException("Only JPEG, PNG or WebP images are allowed.");

        await using var stream = file.OpenReadStream();
        var stored = await storage.SaveAsync("team", stream, contentType, ct);

        return Ok(new { path = stored.Path });
    }

    private static TeamMemberResponse ToResponse(TeamMember m)
    {
        IReadOnlyList<string> bioList = [];
        if (!string.IsNullOrWhiteSpace(m.Bio))
        {
            try
            {
                bioList = JsonSerializer.Deserialize<List<string>>(m.Bio) ?? [];
            }
            catch
            {
                bioList = [m.Bio];
            }
        }

        return new TeamMemberResponse(
            m.Id,
            m.Name,
            m.Role,
            m.Group,
            m.PhotoPath,
            m.Alt,
            bioList,
            m.SortOrder,
            m.IsLeadership,
            m.CreatedAt,
            m.UpdatedAt
        );
    }
}
