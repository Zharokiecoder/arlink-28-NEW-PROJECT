import { apiFetch } from "./client";

export interface AdminPropertyItem {
  id: string;
  slug: string;
  name: string;
  destinationId: string;
  destinationName: string;
  partnerId?: string | null;
  partnerName?: string | null;
  updatedAt: string;
  packageCount: number;
}

export interface CreatePropertyInput {
  name: string;
  slug?: string;
  destinationId: string;
  partnerId?: string;
}

const ADMIN = "/api/v1/admin/properties";
const json = (method: string, body: unknown): RequestInit => ({ method, body: JSON.stringify(body) });

export const adminPropertiesApi = {
  list: () => apiFetch<AdminPropertyItem[]>(ADMIN),
  create: (body: CreatePropertyInput) => apiFetch<AdminPropertyItem>(ADMIN, json("POST", body)),
  delete: (id: string) => apiFetch<void>(`${ADMIN}/${id}`, { method: "DELETE" }),
};

