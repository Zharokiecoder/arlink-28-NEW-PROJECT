"use client";

import { useEffect, useState, useRef, type FormEvent, type ChangeEvent } from "react";
import ProtectedPage from "@/components/ProtectedPage";
import Notice from "@/components/admin/Notice";
import { Crumbs, Spinner } from "@/components/admin/ui";
import { adminTeamApi, type AdminTeamMemberItem, type SaveTeamMemberInput } from "@/utils/api/team";

const COMMON_GROUPS = [
  "Advisory Chairman",
  "Finance & Admin",
  "Digital & Tech",
  "Partnerships & BD",
  "Human Resources",
  "Aviation Planning",
  "Flight Operations",
  "Customer Experience",
  "Software Engineering",
  "Sales & Administration",
  "Tech & Design",
];

export default function TeamAdminPage() {
  const [members, setMembers] = useState<AdminTeamMemberItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [notice, setNotice] = useState<{ tone: "success" | "error"; text: string } | null>(null);
  const [search, setSearch] = useState("");
  const [groupFilter, setGroupFilter] = useState("");

  // Modal state
  const [showModal, setShowModal] = useState(false);
  const [editingMember, setEditingMember] = useState<AdminTeamMemberItem | null>(null);

  // Form state
  const [name, setName] = useState("");
  const [role, setRole] = useState("");
  const [group, setGroup] = useState("");
  const [photoPath, setPhotoPath] = useState("");
  const [bioText, setBioText] = useState("");
  const [sortOrder, setSortOrder] = useState(1);
  const [isLeadership, setIsLeadership] = useState(false);

  const [saving, setSaving] = useState(false);
  const [uploading, setUploading] = useState(false);
  const [formError, setFormError] = useState("");
  const [deletingId, setDeletingId] = useState<string | null>(null);

  const fileInputRef = useRef<HTMLInputElement>(null);

  function loadData() {
    setLoading(true);
    setError("");
    adminTeamApi
      .list()
      .then((items) => {
        setMembers(items);
      })
      .catch((err) => {
        setError(err instanceof Error ? err.message : "Failed to load team members.");
      })
      .finally(() => setLoading(false));
  }

  useEffect(() => {
    loadData();
  }, []);

  function openCreateModal() {
    setEditingMember(null);
    setName("");
    setRole("");
    setGroup(COMMON_GROUPS[1] || "");
    setPhotoPath("");
    setBioText("");
    const maxOrder = members.reduce((max, m) => Math.max(max, m.sortOrder), 0);
    setSortOrder(maxOrder + 1);
    setIsLeadership(false);
    setFormError("");
    setShowModal(true);
  }

  function openEditModal(m: AdminTeamMemberItem) {
    setEditingMember(m);
    setName(m.name);
    setRole(m.role);
    setGroup(m.group);
    setPhotoPath(m.photoPath || "");
    setBioText(m.bio ? m.bio.join("\n\n") : "");
    setSortOrder(m.sortOrder);
    setIsLeadership(m.isLeadership);
    setFormError("");
    setShowModal(true);
  }

  async function handlePhotoUpload(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;

    setUploading(true);
    setFormError("");
    try {
      const res = await adminTeamApi.uploadPhoto(file);
      setPhotoPath(res.path);
    } catch (err: any) {
      setFormError(err?.message || "Failed to upload photo.");
    } finally {
      setUploading(false);
      if (fileInputRef.current) fileInputRef.current.value = "";
    }
  }

  async function handleSubmit(e: FormEvent) {
    e.preventDefault();
    if (!name.trim()) {
      setFormError("Please enter the team member's full name.");
      return;
    }
    if (!role.trim()) {
      setFormError("Please enter the team member's role or title.");
      return;
    }
    if (!group.trim()) {
      setFormError("Please enter or select a team group label.");
      return;
    }

    const bioParagraphs = bioText
      .split(/\n+/)
      .map((p) => p.trim())
      .filter(Boolean);

    const payload: SaveTeamMemberInput = {
      name: name.trim(),
      role: role.trim(),
      group: group.trim(),
      photoPath: photoPath.trim() || null,
      alt: name.trim(),
      bio: bioParagraphs.length > 0 ? bioParagraphs : undefined,
      sortOrder: Number(sortOrder) || 1,
      isLeadership,
    };

    setSaving(true);
    setFormError("");
    try {
      if (editingMember) {
        const updated = await adminTeamApi.update(editingMember.id, payload);
        setMembers((prev) =>
          prev
            .map((m) => (m.id === updated.id ? updated : m))
            .sort((a, b) => a.sortOrder - b.sortOrder)
        );
        setNotice({ tone: "success", text: `Updated "${updated.name}" successfully.` });
      } else {
        const created = await adminTeamApi.create(payload);
        setMembers((prev) => [...prev, created].sort((a, b) => a.sortOrder - b.sortOrder));
        setNotice({ tone: "success", text: `Added "${created.name}" to the team.` });
      }
      setShowModal(false);
    } catch (err: any) {
      setFormError(err?.message || "Failed to save team member.");
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete(m: AdminTeamMemberItem) {
    if (!confirm(`Are you sure you want to delete "${m.name}" from the team?`)) return;

    setDeletingId(m.id);
    try {
      await adminTeamApi.delete(m.id);
      setMembers((prev) => prev.filter((item) => item.id !== m.id));
      setNotice({ tone: "success", text: `Removed "${m.name}" from the team.` });
    } catch (err: any) {
      alert(err?.message || "Failed to delete team member.");
    } finally {
      setDeletingId(null);
    }
  }

  const groupsInUse = Array.from(new Set(members.map((m) => m.group))).filter(Boolean);

  const filtered = members.filter((m) => {
    const matchesSearch =
      !search.trim() ||
      m.name.toLowerCase().includes(search.toLowerCase()) ||
      m.role.toLowerCase().includes(search.toLowerCase()) ||
      m.group.toLowerCase().includes(search.toLowerCase());
    const matchesGroup = !groupFilter || m.group === groupFilter;
    return matchesSearch && matchesGroup;
  });

  return (
    <ProtectedPage wide>
      <div className="pk">
        <Crumbs
          trail={[
            { href: "/admin/dashboard", label: "Dashboard" },
            { label: "Team" },
          ]}
        />

        <div className="pk-head">
          <div>
            <h1 className="pk-title">Team Members</h1>
            <p className="pk-subtitle">
              Manage the leadership, advisory chairman, and coordinators displayed on the public /team page.
            </p>
          </div>
          <button type="button" className="btn btn-primary" onClick={openCreateModal}>
            <i className="fa-solid fa-plus" aria-hidden="true"></i> Add team member
          </button>
        </div>

        {notice && (
          <div style={{ marginBottom: "16px" }}>
            <Notice tone={notice.tone}>
              {notice.text}{" "}
              <button
                type="button"
                className="btn btn-quiet btn-s"
                style={{ marginLeft: "12px" }}
                onClick={() => setNotice(null)}
              >
                Dismiss
              </button>
            </Notice>
          </div>
        )}

        {error && (
          <Notice tone="error">
            {error}{" "}
            <button type="button" className="pk-link" onClick={loadData}>
              Try again
            </button>
          </Notice>
        )}

        <div className="pk-filters" role="search" style={{ marginBottom: "20px" }}>
          <label className="pk-search">
            <i className="fa-solid fa-magnifying-glass" aria-hidden="true"></i>
            <span className="sr-only">Search team members</span>
            <input
              className="input"
              type="search"
              placeholder="Search by name, role, or group"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </label>

          {groupsInUse.length > 0 && (
            <select
              className="input"
              aria-label="Filter by group"
              value={groupFilter}
              onChange={(e) => setGroupFilter(e.target.value)}
            >
              <option value="">All groups</option>
              {groupsInUse.map((g) => (
                <option key={g} value={g}>
                  {g}
                </option>
              ))}
            </select>
          )}

          {(search || groupFilter) && (
            <button
              type="button"
              className="btn btn-quiet"
              onClick={() => {
                setSearch("");
                setGroupFilter("");
              }}
            >
              Clear filters
            </button>
          )}
        </div>

        <div className="pk-table-panel">
          {loading ? (
            <div style={{ padding: "40px", textAlign: "center" }}>
              <Spinner />
              <p style={{ marginTop: "12px", color: "var(--pk-neutral)" }}>Loading team members...</p>
            </div>
          ) : filtered.length === 0 ? (
            <div style={{ padding: "40px", textAlign: "center" }}>
              <p style={{ color: "var(--pk-neutral)" }}>
                {search || groupFilter ? "No team members match your filters." : "No team members found."}
              </p>
            </div>
          ) : (
            <div className="pk-table-scroll">
              <table className="pk-table">
                <thead>
                  <tr>
                    <th style={{ width: "64px" }}>Photo</th>
                    <th>Name & Role</th>
                    <th>Group</th>
                    <th>Category</th>
                    <th style={{ width: "70px", textAlign: "center" }}>Order</th>
                    <th style={{ textAlign: "right" }}>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.map((m) => (
                    <tr key={m.id}>
                      <td>
                        <div
                          style={{
                            width: "48px",
                            height: "48px",
                            borderRadius: "50%",
                            overflow: "hidden",
                            backgroundColor: "#f3f4f6",
                            display: "flex",
                            alignItems: "center",
                            justifyContent: "center",
                            border: "1px solid #e5e7eb",
                          }}
                        >
                          {m.photoPath ? (
                            <img
                              src={m.photoPath}
                              alt={m.name}
                              style={{ width: "100%", height: "100%", objectFit: "cover" }}
                            />
                          ) : (
                            <i className="fa-solid fa-user" style={{ color: "#9ca3af" }} aria-hidden="true"></i>
                          )}
                        </div>
                      </td>
                      <td>
                        <strong>{m.name}</strong>
                        <div style={{ fontSize: "13px", color: "#4b5563", marginTop: "2px" }}>{m.role}</div>
                      </td>
                      <td>
                        <span className="badge badge-neutral">{m.group}</span>
                      </td>
                      <td>
                        {m.isLeadership ? (
                          <span
                            style={{
                              display: "inline-block",
                              padding: "2px 8px",
                              borderRadius: "12px",
                              fontSize: "12px",
                              fontWeight: 600,
                              backgroundColor: "#fef3c7",
                              color: "#92400e",
                            }}
                          >
                            <i className="fa-solid fa-star" aria-hidden="true" style={{ marginRight: "4px" }}></i>
                            Featured Lead
                          </span>
                        ) : (
                          <span style={{ fontSize: "12px", color: "#6b7280" }}>Coordinator</span>
                        )}
                      </td>
                      <td style={{ textAlign: "center", fontWeight: 600, color: "#374151" }}>{m.sortOrder}</td>
                      <td style={{ textAlign: "right", whiteSpace: "nowrap" }}>
                        <button
                          type="button"
                          className="btn btn-quiet btn-s"
                          style={{ marginRight: "8px" }}
                          onClick={() => openEditModal(m)}
                          title="Edit member"
                        >
                          <i className="fa-solid fa-pen-to-square" aria-hidden="true"></i> Edit
                        </button>
                        <button
                          type="button"
                          className="btn btn-quiet btn-s"
                          onClick={() => handleDelete(m)}
                          disabled={deletingId === m.id}
                          title="Delete member"
                          style={{ color: "#dc2626" }}
                        >
                          {deletingId === m.id ? (
                            <Spinner />
                          ) : (
                            <>
                              <i className="fa-solid fa-trash" aria-hidden="true"></i> Delete
                            </>
                          )}
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* Modal for adding/editing team member */}
        {showModal && (
          <div
            style={{
              position: "fixed",
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              backgroundColor: "rgba(0, 0, 0, 0.45)",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              zIndex: 1000,
              padding: "20px",
              overflowY: "auto",
            }}
            onClick={() => setShowModal(false)}
          >
            <div
              style={{
                backgroundColor: "#fff",
                borderRadius: "14px",
                padding: "28px",
                width: "100%",
                maxWidth: "560px",
                boxShadow: "0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)",
                maxHeight: "90vh",
                overflowY: "auto",
              }}
              onClick={(e) => e.stopPropagation()}
            >
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "16px" }}>
                <div>
                  <h2 style={{ fontSize: "20px", fontWeight: 600 }}>
                    {editingMember ? "Edit Team Member" : "Add Team Member"}
                  </h2>
                  <p style={{ fontSize: "14px", color: "#6b7280", marginTop: "2px" }}>
                    Configure the profile details and bio shown on the public site.
                  </p>
                </div>
                <button
                  type="button"
                  className="btn btn-quiet btn-s"
                  onClick={() => setShowModal(false)}
                  aria-label="Close modal"
                >
                  <i className="fa-solid fa-xmark" aria-hidden="true"></i>
                </button>
              </div>

              {formError && (
                <div style={{ marginBottom: "16px" }}>
                  <Notice tone="error">{formError}</Notice>
                </div>
              )}

              <form onSubmit={handleSubmit}>
                <div className="field" style={{ marginBottom: "14px" }}>
                  <label htmlFor="tm-name" style={{ display: "block", fontWeight: 500, marginBottom: "5px" }}>
                    Full name <span style={{ color: "#dc2626" }}>*</span>
                  </label>
                  <input
                    id="tm-name"
                    className="input"
                    type="text"
                    placeholder="e.g. Dr. Richard O. Aisuebeogun"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    required
                    style={{ width: "100%" }}
                  />
                </div>

                <div className="field" style={{ marginBottom: "14px" }}>
                  <label htmlFor="tm-role" style={{ display: "block", fontWeight: 500, marginBottom: "5px" }}>
                    Role / Title <span style={{ color: "#dc2626" }}>*</span>
                  </label>
                  <input
                    id="tm-role"
                    className="input"
                    type="text"
                    placeholder="e.g. Strategic Partnerships & BD Coordinator"
                    value={role}
                    onChange={(e) => setRole(e.target.value)}
                    required
                    style={{ width: "100%" }}
                  />
                </div>

                <div className="field" style={{ marginBottom: "14px" }}>
                  <label htmlFor="tm-group" style={{ display: "block", fontWeight: 500, marginBottom: "5px" }}>
                    Group Label <span style={{ color: "#dc2626" }}>*</span>
                  </label>
                  <input
                    id="tm-group"
                    className="input"
                    type="text"
                    placeholder="e.g. Partnerships & BD"
                    value={group}
                    onChange={(e) => setGroup(e.target.value)}
                    required
                    style={{ width: "100%", marginBottom: "6px" }}
                  />
                  <div style={{ display: "flex", flexWrap: "wrap", gap: "6px" }}>
                    {COMMON_GROUPS.slice(0, 6).map((g) => (
                      <button
                        key={g}
                        type="button"
                        style={{
                          fontSize: "11px",
                          padding: "2px 8px",
                          borderRadius: "6px",
                          border: "1px solid #e5e7eb",
                          backgroundColor: group === g ? "#f3f4f6" : "#ffffff",
                          cursor: "pointer",
                        }}
                        onClick={() => setGroup(g)}
                      >
                        {g}
                      </button>
                    ))}
                  </div>
                </div>

                <div className="field" style={{ marginBottom: "14px" }}>
                  <label style={{ display: "block", fontWeight: 500, marginBottom: "5px" }}>Photo</label>
                  <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "8px" }}>
                    <div
                      style={{
                        width: "60px",
                        height: "60px",
                        borderRadius: "8px",
                        backgroundColor: "#f3f4f6",
                        overflow: "hidden",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        border: "1px solid #e5e7eb",
                        flexShrink: 0,
                      }}
                    >
                      {photoPath ? (
                        <img
                          src={photoPath}
                          alt="Preview"
                          style={{ width: "100%", height: "100%", objectFit: "cover" }}
                        />
                      ) : (
                        <i className="fa-solid fa-image" style={{ color: "#9ca3af", fontSize: "20px" }} aria-hidden="true"></i>
                      )}
                    </div>
                    <div style={{ flex: 1 }}>
                      <input
                        ref={fileInputRef}
                        type="file"
                        accept="image/jpeg,image/png,image/webp"
                        style={{ display: "none" }}
                        onChange={handlePhotoUpload}
                        disabled={uploading}
                      />
                      <button
                        type="button"
                        className="btn btn-quiet btn-s"
                        onClick={() => fileInputRef.current?.click()}
                        disabled={uploading}
                      >
                        {uploading ? (
                          <>
                            <Spinner /> Uploading...
                          </>
                        ) : (
                          <>
                            <i className="fa-solid fa-upload" aria-hidden="true"></i> Upload photo
                          </>
                        )}
                      </button>
                      <span style={{ fontSize: "12px", color: "#6b7280", marginLeft: "10px" }}>
                        JPG, PNG, WebP up to 10 MB
                      </span>
                    </div>
                  </div>
                  <input
                    className="input"
                    type="text"
                    placeholder="Or enter image URL (e.g. /images/team/name.webp)"
                    value={photoPath}
                    onChange={(e) => setPhotoPath(e.target.value)}
                    style={{ width: "100%", fontSize: "13px" }}
                  />
                </div>

                <div className="field" style={{ marginBottom: "14px" }}>
                  <label htmlFor="tm-bio" style={{ display: "block", fontWeight: 500, marginBottom: "5px" }}>
                    Biography
                  </label>
                  <textarea
                    id="tm-bio"
                    className="input"
                    rows={4}
                    placeholder="Enter the person's professional background and biography. Separate paragraphs with an empty line."
                    value={bioText}
                    onChange={(e) => setBioText(e.target.value)}
                    style={{ width: "100%", fontSize: "14px" }}
                  />
                </div>

                <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "16px", marginBottom: "20px" }}>
                  <div>
                    <label htmlFor="tm-order" style={{ display: "block", fontWeight: 500, marginBottom: "5px" }}>
                      Sort order
                    </label>
                    <input
                      id="tm-order"
                      className="input"
                      type="number"
                      min={1}
                      value={sortOrder}
                      onChange={(e) => setSortOrder(Number(e.target.value))}
                      style={{ width: "100%" }}
                    />
                  </div>
                  <div style={{ display: "flex", alignItems: "center", paddingTop: "26px" }}>
                    <label style={{ display: "flex", alignItems: "center", gap: "8px", cursor: "pointer", fontSize: "14px", fontWeight: 500 }}>
                      <input
                        type="checkbox"
                        checked={isLeadership}
                        onChange={(e) => setIsLeadership(e.target.checked)}
                        style={{ width: "18px", height: "18px", accentColor: "#991b1b" }}
                      />
                      Featured Lead / Chairman
                    </label>
                  </div>
                </div>

                <div style={{ display: "flex", justifyContent: "flex-end", gap: "10px", borderTop: "1px solid #f3f4f6", paddingTop: "16px" }}>
                  <button
                    type="button"
                    className="btn btn-quiet"
                    onClick={() => setShowModal(false)}
                    disabled={saving}
                  >
                    Cancel
                  </button>
                  <button type="submit" className="btn btn-primary" disabled={saving || uploading}>
                    {saving ? (
                      <>
                        <Spinner /> Saving...
                      </>
                    ) : editingMember ? (
                      "Save changes"
                    ) : (
                      "Add team member"
                    )}
                  </button>
                </div>
              </form>
            </div>
          </div>
        )}
      </div>
    </ProtectedPage>
  );
}
