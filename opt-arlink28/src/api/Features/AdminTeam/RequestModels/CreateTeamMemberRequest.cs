namespace Arlink28.Api.Features.AdminTeam.RequestModels;

public class CreateTeamMemberRequest
{
    public string Name { get; set; } = string.Empty;
    public string Role { get; set; } = string.Empty;
    public string Group { get; set; } = string.Empty;
    public string? PhotoPath { get; set; }
    public string? Alt { get; set; }
    public List<string>? Bio { get; set; }
    public int SortOrder { get; set; }
    public bool IsLeadership { get; set; }
}
