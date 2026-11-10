import type { Metadata } from "next";
import Link from "next/link";
import ServiceFooter from "@/components/home/ServiceFooter";
import KindSwitcher from "@/components/products/KindSwitcher";
import HeroSearch from "@/components/packages/HeroSearch";
import { ListingProvider, type ListingParams } from "@/components/packages/ListingContext";
import PackageCard from "@/components/packages/PackageCard";
import Pagination from "@/components/packages/Pagination";
import ResultsBar, { ResultsFrame } from "@/components/packages/ResultsBar";
import { PAGE_SIZE, listDestinations, listPackages } from "@/utils/server/catalogue";
import type { PackageCard as Card } from "@arlink28/api-client";
import "../../styles/packages.css";
import PageBanner from "@/components/PageBanner";

export const metadata: Metadata = {
  title: "Holiday packages | ARLink28",
  description:
    "Safari and lodge packages across Africa with the price up front. See what is included and get a price for your dates.",
};

type SearchParams = Record<string, string | string[] | undefined>;
const one = (value: string | string[] | undefined) => (Array.isArray(value) ? value[0] : value) ?? "";

const PARTNERS: Record<string, string> = { "giraffe-manor": "Giraffe Manor" };

interface CollectionDef {
  page: number;
  id: string;
  matches: (pkg: Card) => boolean;
}

const COLLECTIONS: CollectionDef[] = [
  {
    page: 1,
    id: "giraffe-manor",
    matches: (p) => {
      const slug = (p.slug || "").toLowerCase();
      const title = (p.title || "").toLowerCase();
      return slug.includes("giraffe-manor") || title.includes("giraffe manor") || p.destination?.slug === "nairobi";
    },
  },
  {
    page: 2,
    id: "zanzibar",
    matches: (p) => {
      const slug = (p.slug || "").toLowerCase();
      const title = (p.title || "").toLowerCase();
      const dest = (p.destination?.slug || "").toLowerCase();
      const country = (p.destination?.country || "").toUpperCase();
      return (
        slug.includes("zanzibar") ||
        title.includes("zanzibar") ||
        dest.startsWith("zanzibar") ||
        country === "TZ" ||
        slug.includes("tulia") ||
        slug.includes("blue-ocean")
      );
    },
  },
  {
    page: 3,
    id: "masai-mara",
    matches: (p) => {
      const isGM =
        (p.slug || "").toLowerCase().includes("giraffe-manor") ||
        (p.title || "").toLowerCase().includes("giraffe manor") ||
        p.destination?.slug === "nairobi";
      const isZz =
        (p.slug || "").toLowerCase().includes("zanzibar") ||
        (p.title || "").toLowerCase().includes("zanzibar") ||
        (p.destination?.slug || "").toLowerCase().startsWith("zanzibar") ||
        (p.destination?.country || "").toUpperCase() === "TZ";
      return !isGM && !isZz;
    },
  },
];

function sortItems(items: Card[], sort?: string): Card[] {
  const copy = [...items];
  switch (sort) {
    case "price":
      return copy.sort((a, b) => (a.fromPriceMinor ?? 99999999) - (b.fromPriceMinor ?? 99999999));
    case "-price":
      return copy.sort((a, b) => (b.fromPriceMinor ?? 0) - (a.fromPriceMinor ?? 0));
    case "nights":
      return copy.sort((a, b) => a.nights - b.nights);
    default:
      return copy.sort((a, b) => (b.featured ? 1 : 0) - (a.featured ? 1 : 0));
  }
}

export default async function PackagesPage({ searchParams }: { searchParams: SearchParams }) {
  const params: ListingParams = {
    destination: one(searchParams.destination),
    category: one(searchParams.category),
    partner: one(searchParams.partner),
    adults: one(searchParams.adults),
    sort: one(searchParams.sort),
    q: one(searchParams.q),
  };
  const page = Math.max(1, Number.parseInt(one(searchParams.page), 10) || 1);
  const size = Math.min(48, Math.max(4, Number.parseInt(one(searchParams.size), 10) || PAGE_SIZE));

  const destinations = await listDestinations().catch(() => []);

  // Check if user is searching/filtering specifically or browsing by collection pages
  const isFiltered = Boolean(params.destination || params.category || params.partner || params.q);

  let displayedItems: Card[] = [];
  let totalCount = 0;
  let totalPages = 1;

  if (isFiltered) {
    // Normal query when explicit destination/category/partner/q filter is requested
    const list = await listPackages({
      destination: params.destination,
      category: params.category,
      partner: params.partner,
      adults: params.adults ? Number(params.adults) : undefined,
      sort: params.sort,
      q: params.q,
      page,
      size,
    }).catch(() => null);

    displayedItems = list?.items ?? [];
    totalCount = list?.total ?? displayedItems.length;
    totalPages = Math.max(1, Math.ceil(totalCount / size));
  } else {
    // Collection-based pagination:
    // Page 1: Giraffe Manor
    // Page 2: Zanzibar
    // Page 3: Masai Mara & Safari Collection
    const all = await listPackages({ size: 100 }).catch(() => null);
    let allItems = all?.items ?? [];

    if (params.adults) {
      const minAdults = Number(params.adults);
      allItems = allItems.filter((p) => p.adults >= minAdults);
    }

    const c1 = sortItems(allItems.filter(COLLECTIONS[0].matches), params.sort);
    const c2 = sortItems(allItems.filter(COLLECTIONS[1].matches), params.sort);
    const c3 = sortItems(allItems.filter(COLLECTIONS[2].matches), params.sort);

    const activePage = Math.min(3, Math.max(1, page));
    totalPages = 3;

    if (activePage === 1) displayedItems = c1;
    else if (activePage === 2) displayedItems = c2;
    else displayedItems = c3;

    totalCount = displayedItems.length;
  }

  const hrefFor = (n: number) => {
    const query = new URLSearchParams();
    for (const [key, value] of Object.entries(params)) if (value) query.set(key, value);
    if (isFiltered && size !== PAGE_SIZE) query.set("size", String(size));
    if (n > 1) query.set("page", String(n));
    const qs = query.toString();
    return qs ? `/packages?${qs}` : "/packages";
  };

  return (
    <>
      <ListingProvider params={params}>
        <PageBanner
          overlap
          photo="holidays"
          above={<KindSwitcher active="/packages" />}
          title={
            <>
              Find your
              <br />
              next safari
            </>
          }
          intro="Safari and lodge packages across Africa, with the price up front."
        />

        <div className="pkgs-searchwrap">
          <HeroSearch destinations={destinations} />
        </div>

        <div className="pkgs-page">
          <ResultsBar
            total={totalCount}
            destinations={destinations}
            partnerName={PARTNERS[params.partner]}
          />

          <ResultsFrame>
            {displayedItems.length === 0 ? (
              <div className="pkgs-empty">
                <h2>No packages found</h2>
                <p>Nothing matches these filters. Try removing one, or search for something broader.</p>
                <Link className="pkgs-button" href="/packages">
                  Clear all filters
                </Link>
              </div>
            ) : (
              <>
                <div className="pkgs-grid">
                  {displayedItems.map((pkg, i) => (
                    <PackageCard key={pkg.id} pkg={pkg} priority={i < 4} />
                  ))}
                </div>
                <Pagination
                  page={isFiltered ? page : Math.min(3, Math.max(1, page))}
                  pageSize={isFiltered ? size : displayedItems.length}
                  total={totalCount}
                  totalPages={totalPages}
                  hrefFor={hrefFor}
                />
              </>
            )}
          </ResultsFrame>
        </div>
      </ListingProvider>
      <ServiceFooter service="packages" />
    </>
  );
}
