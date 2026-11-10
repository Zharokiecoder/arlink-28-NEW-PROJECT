import { apiFetch, parseResponse, returnToSignInIfExpired } from "./client";

export interface AdminTeamMemberItem {
  id: string;
  name: string;
  role: string;
  group: string;
  photoPath?: string | null;
  alt?: string | null;
  bio: string[];
  sortOrder: number;
  isLeadership: boolean;
  createdAt: string;
  updatedAt: string;
}

export interface SaveTeamMemberInput {
  name: string;
  role: string;
  group: string;
  photoPath?: string | null;
  alt?: string | null;
  bio?: string[];
  sortOrder: number;
  isLeadership: boolean;
}

const ADMIN = "/api/v1/admin/team";
const json = (method: string, body: unknown): RequestInit => ({
  method,
  body: JSON.stringify(body),
  headers: { "Content-Type": "application/json" },
});

export const adminTeamApi = {
  list: () => apiFetch<AdminTeamMemberItem[]>(ADMIN),
  create: (body: SaveTeamMemberInput) => apiFetch<AdminTeamMemberItem>(ADMIN, json("POST", body)),
  update: (id: string, body: SaveTeamMemberInput) => apiFetch<AdminTeamMemberItem>(`${ADMIN}/${id}`, json("PUT", body)),
  delete: (id: string) => apiFetch<void>(`${ADMIN}/${id}`, { method: "DELETE" }),
  uploadPhoto: async (file: File): Promise<{ path: string }> => {
    const form = new FormData();
    form.append("file", file);

    const res = await fetch(`${ADMIN}/photo`, {
      method: "POST",
      body: form,
      headers: { Accept: "application/json" },
    });

    returnToSignInIfExpired(res.status, `${ADMIN}/photo`);
    return parseResponse<{ path: string }>(res);
  },
};
