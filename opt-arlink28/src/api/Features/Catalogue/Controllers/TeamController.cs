using System.Text.Json;
using Arlink28.Api.Data;
using Arlink28.Api.Data.Entities;
using Arlink28.Api.Features.AdminTeam.ResponseModels;
using Asp.Versioning;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Arlink28.Api.Features.Catalogue.Controllers;

[ApiController]
[ApiVersion(1)]
[Route("api/v{version:apiVersion}/team")]
public class TeamController(ApplicationDbContext db) : ControllerBase
{
    [HttpGet]
    [ProducesResponseType(typeof(IReadOnlyList<TeamMemberResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> List(CancellationToken ct = default)
    {
        var items = await db.TeamMembers
            .AsNoTracking()
            .OrderBy(t => t.SortOrder)
            .ThenBy(t => t.Name)
            .ToListAsync(ct);

        var responses = items.Select(m =>
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
        }).ToList();

        return Ok(responses);
    }
}
