namespace Arlink28.Api.Features.AdminTeam.ResponseModels;

public record TeamMemberResponse(
    Guid Id,
    string Name,
    string Role,
    string Group,
    string? PhotoPath,
    string? Alt,
    IReadOnlyList<string> Bio,
    int SortOrder,
    bool IsLeadership,
    DateTime CreatedAt,
    DateTime UpdatedAt
);

