namespace Arlink28.Api.Data.Entities;

public class TeamMember
{
    public Guid Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Role { get; set; } = string.Empty;
    public string Group { get; set; } = string.Empty;
    public string? PhotoPath { get; set; }
    public string? Alt { get; set; }
    public string? Bio { get; set; }
    public int SortOrder { get; set; }
    public bool IsLeadership { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}

