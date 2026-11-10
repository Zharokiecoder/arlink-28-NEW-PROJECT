import type { Metadata } from "next";
import "../../styles/home.css";
import PageBanner from "@/components/PageBanner";
import ClosingCta from "@/components/home/ClosingCta";
import FaqSection from "@/components/home/FaqSection";
import Reveal from "@/components/home/Reveal";
import { SERVICE_FAQS } from "@/content/service-faqs";
import TeamGrid from "@/components/home/TeamGrid";
import { loadTeamMembers } from "@/utils/server/team";

export const dynamic = "force-dynamic";

export const metadata: Metadata = {
  title: "Team | ARLink28",
  description:
    "The advisory chairman and the coordinators behind ARLink28, across aviation, finance, technology, partnerships, people and customer experience.",
};

export default async function TeamPage() {
  const people = await loadTeamMembers();

  return (
    <div className="hm">
      <Reveal />
      <PageBanner
        photo="team"
        label="Our team"
        title={
          <>
            The people
            <br />
            behind ARLink28.
          </>
        }
        intro="Our advisory chairman and ten coordinators, from aviation and finance to technology, partnerships and customer experience."
      />
      <TeamGrid people={people} />
      <FaqSection items={SERVICE_FAQS.team} />
      <ClosingCta bleed />
    </div>
  );
}
