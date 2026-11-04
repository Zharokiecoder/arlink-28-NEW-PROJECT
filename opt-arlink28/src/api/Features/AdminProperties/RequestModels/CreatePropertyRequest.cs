namespace Arlink28.Api.Features.AdminProperties.RequestModels;

public record CreatePropertyRequest(
    string Name,
    string? Slug,
    Guid DestinationId,
    Guid? PartnerId
);

