namespace Arlink28.Api.Features.AdminProperties.ResponseModels;

public record AdminPropertyResponse(
    Guid Id,
    string Slug,
    string Name,
    Guid DestinationId,
    string DestinationName,
    Guid? PartnerId,
    string? PartnerName,
    DateTime UpdatedAt,
    int PackageCount
);

