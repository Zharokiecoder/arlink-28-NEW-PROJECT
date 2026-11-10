using Arlink28.Api.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Arlink28.Api.Data.Configuration;

public class TeamMemberConfiguration : IEntityTypeConfiguration<TeamMember>
{
    public void Configure(EntityTypeBuilder<TeamMember> builder)
    {
        builder.ToTable("TeamMembers");
        builder.HasKey(t => t.Id);
        builder.Property(t => t.Name).HasMaxLength(120).IsRequired();
        builder.Property(t => t.Role).HasMaxLength(120).IsRequired();
        builder.Property(t => t.Group).HasMaxLength(120).IsRequired();
        builder.Property(t => t.PhotoPath).HasMaxLength(255);
        builder.Property(t => t.Alt).HasMaxLength(250);
        builder.Property(t => t.SortOrder).IsRequired();
        builder.Property(t => t.IsLeadership).IsRequired();
        builder.Property(t => t.CreatedAt).IsRequired();
        builder.Property(t => t.UpdatedAt).IsRequired();
    }
}

