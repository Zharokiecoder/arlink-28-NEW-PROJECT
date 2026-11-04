"use client";

import { useEffect, useState, type FormEvent } from "react";
import ProtectedPage from "@/components/ProtectedPage";
import Notice from "@/components/admin/Notice";
import { Crumbs, Spinner } from "@/components/admin/ui";
import { adminPropertiesApi, type AdminPropertyItem } from "@/utils/api/properties";
import { adminPackagesApi } from "@/utils/api/packages";
import type { AdminReference } from "@arlink28/api-client";

export default function PropertiesPage() {
  const [properties, setProperties] = useState<AdminPropertyItem[]>([]);
  const [reference, setReference] = useState<AdminReference | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [search, setSearch] = useState("");
  const [destinationFilter, setDestinationFilter] = useState("");

  // Modal state
  const [showModal, setShowModal] = useState(false);
  const [name, setName] = useState("");
  const [destinationId, setDestinationId] = useState("");
  const [saving, setSaving] = useState(false);
  const [formError, setFormError] = useState("");
  const [deletingId, setDeletingId] = useState<string | null>(null);

  function loadData() {
    setLoading(true);
    setError("");
    Promise.all([adminPropertiesApi.list(), adminPackagesApi.reference()])
      .then(([props, ref]) => {
        setProperties(props);
        setReference(ref);
        if (ref.destinations.length > 0 && !destinationId) {
          setDestinationId(ref.destinations[0].id);
        }
      })
      .catch(() => setError("Failed to load properties. Please try again."))
      .finally(() => setLoading(false));
  }

  useEffect(() => {
    loadData();
  }, []);

  async function handleCreate(e: FormEvent) {
    e.preventDefault();
    if (!name.trim()) {
      setFormError("Please enter a property name.");
      return;
    }
    if (!destinationId) {
      setFormError("Please choose a destination.");
      return;
    }

    setSaving(true);
    setFormError("");
    try {
      const created = await adminPropertiesApi.create({
        name: name.trim(),
        destinationId,
      });
      setProperties((prev) => [...prev, created].sort((a, b) => a.name.localeCompare(b.name)));
      setShowModal(false);
      setName("");
    } catch (err: any) {
      setFormError(err?.message || "Failed to create property.");
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete(prop: AdminPropertyItem) {
    if (prop.packageCount > 0) {
      alert(`"${prop.name}" cannot be deleted because it is used in ${prop.packageCount} package(s).`);
      return;
    }
    if (!confirm(`Are you sure you want to delete "${prop.name}"?`)) return;

    setDeletingId(prop.id);
    try {
      await adminPropertiesApi.delete(prop.id);
      setProperties((prev) => prev.filter((p) => p.id !== prop.id));
    } catch (err: any) {
      alert(err?.message || "Failed to delete property.");
    } finally {
      setDeletingId(null);
    }
  }

  const filtered = properties.filter((p) => {
    const matchesSearch =
      !search.trim() ||
      p.name.toLowerCase().includes(search.toLowerCase()) ||
      p.destinationName.toLowerCase().includes(search.toLowerCase());
    const matchesDest = !destinationFilter || p.destinationId === destinationFilter;
    return matchesSearch && matchesDest;
  });

  return (
    <ProtectedPage wide>
      <div className="pk">
        <Crumbs
          trail={[
            { href: "/admin/dashboard", label: "Dashboard" },
            { label: "Properties" },
          ]}
        />

        <div className="pk-head">
          <div>
            <h1 className="pk-title">Properties</h1>
            <p className="pk-subtitle">Lodges, camps and hotels guests stay at in holiday packages.</p>
          </div>
          <button
            type="button"
            className="btn btn-primary"
            onClick={() => {
              setFormError("");
              setShowModal(true);
            }}
          >
            <i className="fa-solid fa-plus" aria-hidden="true"></i> Add property
          </button>
        </div>

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
            <span className="sr-only">Search properties</span>
            <input
              className="input"
              type="search"
              placeholder="Search by name or destination"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </label>

          {reference && reference.destinations.length > 0 && (
            <select
              className="input"
              aria-label="Filter by destination"
              value={destinationFilter}
              onChange={(e) => setDestinationFilter(e.target.value)}
            >
              <option value="">All destinations</option>
              {reference.destinations.map((d) => (
                <option key={d.id} value={d.id}>
                  {d.name} ({d.country})
                </option>
              ))}
            </select>
          )}

          {(search || destinationFilter) && (
            <button
              type="button"
              className="btn btn-quiet"
              onClick={() => {
                setSearch("");
                setDestinationFilter("");
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
              <p style={{ marginTop: "12px", color: "var(--pk-neutral)" }}>Loading properties...</p>
            </div>
          ) : filtered.length === 0 ? (
            <div style={{ padding: "40px", textAlign: "center" }}>
              <p style={{ color: "var(--pk-neutral)" }}>
                {search || destinationFilter ? "No properties match your filters." : "No properties found."}
              </p>
            </div>
          ) : (
            <div className="pk-table-scroll">
              <table className="pk-table">
                <thead>
                  <tr>
                    <th>Property</th>
                    <th>Destination</th>
                    <th>Partner</th>
                    <th>Packages</th>
                    <th style={{ textAlign: "right" }}>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  {filtered.map((p) => (
                    <tr key={p.id}>
                      <td>
                        <strong>{p.name}</strong>
                        <div style={{ fontSize: "12px", color: "#6b7280" }}>{p.slug}</div>
                      </td>
                      <td>
                        <span className="badge badge-neutral">{p.destinationName}</span>
                      </td>
                      <td>{p.partnerName || "—"}</td>
                      <td>
                        {p.packageCount > 0 ? (
                          <span style={{ fontWeight: 500 }}>
                            {p.packageCount} {p.packageCount === 1 ? "package" : "packages"}
                          </span>
                        ) : (
                          <span style={{ color: "#9ca3af" }}>0 packages</span>
                        )}
                      </td>
                      <td style={{ textAlign: "right" }}>
                        <button
                          type="button"
                          className="btn btn-quiet btn-s"
                          onClick={() => handleDelete(p)}
                          disabled={deletingId === p.id}
                          title={p.packageCount > 0 ? "Cannot delete: used in packages" : "Delete property"}
                          style={{
                            color: p.packageCount > 0 ? "#9ca3af" : "#dc2626",
                            cursor: p.packageCount > 0 ? "not-allowed" : "pointer",
                          }}
                        >
                          {deletingId === p.id ? <Spinner /> : <i className="fa-solid fa-trash" aria-hidden="true"></i>}
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* Modal for adding new property */}
        {showModal && (
          <div
            style={{
              position: "fixed",
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              backgroundColor: "rgba(0, 0, 0, 0.4)",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              zIndex: 1000,
              padding: "20px",
            }}
            onClick={() => setShowModal(false)}
          >
            <div
              style={{
                backgroundColor: "#fff",
                borderRadius: "12px",
                padding: "28px",
                width: "100%",
                maxWidth: "480px",
                boxShadow: "0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)",
              }}
              onClick={(e) => e.stopPropagation()}
            >
              <h2 style={{ fontSize: "20px", fontWeight: 600, marginBottom: "8px" }}>Add new property</h2>
              <p style={{ fontSize: "14px", color: "#6b7280", marginBottom: "20px" }}>
                Add a lodge, hotel, or camp that can be selected for package stays.
              </p>

              {formError && (
                <div style={{ marginBottom: "16px" }}>
                  <Notice tone="error">{formError}</Notice>
                </div>
              )}

              <form onSubmit={handleCreate}>
                <div className="field" style={{ marginBottom: "16px" }}>
                  <label htmlFor="prop-name" style={{ display: "block", fontWeight: 500, marginBottom: "6px" }}>
                    Property name <span style={{ color: "#dc2626" }}>*</span>
                  </label>
                  <input
                    id="prop-name"
                    className="input"
                    type="text"
                    placeholder="e.g. Zuri Zanzibar Resort"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    required
                    autoFocus
                    style={{ width: "100%" }}
                  />
                </div>

                <div className="field" style={{ marginBottom: "24px" }}>
                  <label htmlFor="prop-dest" style={{ display: "block", fontWeight: 500, marginBottom: "6px" }}>
                    Destination <span style={{ color: "#dc2626" }}>*</span>
                  </label>
                  <select
                    id="prop-dest"
                    className="input"
                    value={destinationId}
                    onChange={(e) => setDestinationId(e.target.value)}
                    required
                    style={{ width: "100%" }}
                  >
                    <option value="" disabled>
                      Choose a destination
                    </option>
                    {reference?.destinations.map((d) => (
                      <option key={d.id} value={d.id}>
                        {d.name} ({d.country})
                      </option>
                    ))}
                  </select>
                </div>

                <div style={{ display: "flex", justifyContent: "flex-end", gap: "10px" }}>
                  <button
                    type="button"
                    className="btn btn-quiet"
                    onClick={() => setShowModal(false)}
                    disabled={saving}
                  >
                    Cancel
                  </button>
                  <button type="submit" className="btn btn-primary" disabled={saving}>
                    {saving ? (
                      <>
                        <Spinner /> Saving...
                      </>
                    ) : (
                      "Save property"
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

