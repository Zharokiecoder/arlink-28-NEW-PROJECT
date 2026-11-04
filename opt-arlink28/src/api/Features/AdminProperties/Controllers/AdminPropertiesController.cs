using System.Security.Claims;
using Arlink28.Api.Data;
using Arlink28.Api.Data.Entities;
using Arlink28.Api.Features.AdminPackages.Services;
using Arlink28.Api.Features.AdminProperties.RequestModels;
using Arlink28.Api.Features.AdminProperties.ResponseModels;
using Arlink28.Api.Helpers;
using Asp.Versioning;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Arlink28.Api.Features.AdminProperties.Controllers;

[ApiController]
[ApiVersion(1)]
[Authorize]
[Route("api/v{version:apiVersion}/admin/properties")]
public class AdminPropertiesController(ApplicationDbContext db) : ControllerBase
{
    private string? ActorId => User.FindFirstValue(ClaimTypes.NameIdentifier);

    [HttpGet]
    [ProducesResponseType(typeof(IReadOnlyList<AdminPropertyResponse>), StatusCodes.Status200OK)]
    public async Task<IActionResult> List(CancellationToken ct = default)
    {
        var items = await db.Properties
            .AsNoTracking()
            .Include(p => p.Destination)
            .Include(p => p.Partner)
            .OrderBy(p => p.Name)
            .Select(p => new AdminPropertyResponse(
                p.Id,
                p.Slug,
                p.Name,
                p.DestinationId,
                p.Destination.Name,
                p.PartnerId,
                p.Partner == null ? null : p.Partner.Name,
                p.UpdatedAt,
                p.PackageStays.Count
            ))
            .ToListAsync(ct);

        return Ok(items);
    }

    [HttpPost]
    [ProducesResponseType(typeof(AdminPropertyResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> Create([FromBody] CreatePropertyRequest request, CancellationToken ct = default)
    {
        if (string.IsNullOrWhiteSpace(request.Name))
            throw new AppException("Please provide a name for the property.");

        var destination = await db.Destinations.FirstOrDefaultAsync(d => d.Id == request.DestinationId, ct);
        if (destination == null)
            throw new AppException("The selected destination does not exist.");

        if (request.PartnerId.HasValue)
        {
            var partnerExists = await db.Partners.AnyAsync(p => p.Id == request.PartnerId.Value, ct);
            if (!partnerExists)
                throw new AppException("The selected partner does not exist.");
        }

        var name = request.Name.Trim();
        string slug;
        if (!string.IsNullOrWhiteSpace(request.Slug))
        {
            slug = request.Slug.Trim().ToLowerInvariant();
            if (await db.Properties.AnyAsync(p => p.Slug == slug, ct))
                throw new ConflictException($"The slug '{slug}' is already in use by another property.");
        }
        else
        {
            var baseSlug = AdminPackageService.Slugify(name);
            if (string.IsNullOrWhiteSpace(baseSlug) || baseSlug == "package") baseSlug = "property";
            slug = baseSlug;
            for (var n = 2; await db.Properties.AnyAsync(p => p.Slug == slug, ct); n++)
                slug = $"{baseSlug}-{n}";
        }

        var now = DateTime.UtcNow;
        var property = new Property
        {
            Id = Guid.NewGuid(),
            Slug = slug,
            Name = name,
            DestinationId = destination.Id,
            PartnerId = request.PartnerId,
            CreatedAt = now,
            UpdatedAt = now
        };

        db.Properties.Add(property);

        db.AuditLogs.Add(new AuditLog
        {
            Id = Guid.NewGuid(),
            CreatedAt = now,
            ActorId = ActorId,
            Action = "PropertyCreated",
            EntityType = "Property",
            EntityId = property.Id.ToString(),
            After = System.Text.Json.JsonSerializer.Serialize(new { property.Slug, property.Name, property.DestinationId })
        });

        await db.SaveChangesAsync(ct);

        string? partnerName = null;
        if (request.PartnerId.HasValue)
        {
            partnerName = await db.Partners
                .Where(p => p.Id == request.PartnerId.Value)
                .Select(p => p.Name)
                .FirstOrDefaultAsync(ct);
        }

        var result = new AdminPropertyResponse(
            property.Id,
            property.Slug,
            property.Name,
            destination.Id,
            destination.Name,
            property.PartnerId,
            partnerName,
            property.UpdatedAt,
            0
        );

        return CreatedAtAction(nameof(List), new { id = property.Id }, result);
    }

    [HttpDelete("{id:guid}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> Delete(Guid id, CancellationToken ct = default)
    {
        var property = await db.Properties.FirstOrDefaultAsync(p => p.Id == id, ct);
        if (property == null) return NotFound();

        var inUse = await db.PackageStays.AnyAsync(s => s.PropertyId == id, ct);
        if (inUse)
            throw new ConflictException("Cannot delete this property because it is used in one or more packages.");

        db.Properties.Remove(property);

        db.AuditLogs.Add(new AuditLog
        {
            Id = Guid.NewGuid(),
            CreatedAt = DateTime.UtcNow,
            ActorId = ActorId,
            Action = "PropertyDeleted",
            EntityType = "Property",
            EntityId = id.ToString(),
            After = System.Text.Json.JsonSerializer.Serialize(new { property.Slug, property.Name })
        });

        await db.SaveChangesAsync(ct);
        return NoContent();
    }
}

