import { apiUrl } from "./api";
import { TEAM, type Person } from "@/content/team";

export type TeamPerson = Person & {
  isLeadership?: boolean;
};

export async function loadTeamMembers(): Promise<TeamPerson[]> {
  try {
    const res = await fetch(`${apiUrl()}/api/v1/team`, {
      cache: "no-store",
      headers: { Accept: "application/json" },
    });
    if (!res.ok) return TEAM;
    const items = (await res.json()) as Array<{
      id: string;
      name: string;
      role: string;
      group: string;
      photoPath?: string | null;
      alt?: string | null;
      bio: string[];
      sortOrder: number;
      isLeadership: boolean;
    }>;
    if (!items || items.length === 0) return TEAM;
    return items.map((m) => ({
      id: m.id,
      name: m.name,
      role: m.role,
      group: m.group,
      photo: m.photoPath || "/images/home/team-support.webp",
      alt: m.alt || m.name,
      bio: m.bio && m.bio.length > 0 ? m.bio : ["Team member at ARLink28."],
      isLeadership: m.isLeadership,
    }));
  } catch {
    return TEAM;
  }
}
