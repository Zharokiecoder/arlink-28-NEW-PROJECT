--
-- PostgreSQL database cluster dump
--

\restrict UyiTSgFtGrkanlac80tgHQqSlQlq7td8TdOY95cQpCBpNRTS5Al3NEeXgF20ecI

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE arlink28;
ALTER ROLE arlink28 WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:azowdqVldSmHwKjIUkeLsQ==$jDkQRTEWtN3eOm00qK1288GC2/X1FUWiSBNQJfLO4OA=:d+O2qxVRkgBzKJ6UPVvon9HnNd/LQ/a2IPcswAJX4QY=';

--
-- User Configurations
--








\unrestrict UyiTSgFtGrkanlac80tgHQqSlQlq7td8TdOY95cQpCBpNRTS5Al3NEeXgF20ecI

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict kJhdBXSdIcV17iqzJhWrcYis6ago8HQUM5FRqd8aRtVi4kyZkW8OA9TI23oHKzY

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict kJhdBXSdIcV17iqzJhWrcYis6ago8HQUM5FRqd8aRtVi4kyZkW8OA9TI23oHKzY

--
-- Database "arlink28" dump
--

--
-- PostgreSQL database dump
--

\restrict Tr79teDlgSmbxDfCPXU3RJBbh8YQnzWdPudUhOcPJOhJojhnkbaS888NiSYeJGO

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: arlink28; Type: DATABASE; Schema: -; Owner: arlink28
--

CREATE DATABASE arlink28 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE arlink28 OWNER TO arlink28;

\unrestrict Tr79teDlgSmbxDfCPXU3RJBbh8YQnzWdPudUhOcPJOhJojhnkbaS888NiSYeJGO
\connect arlink28
\restrict Tr79teDlgSmbxDfCPXU3RJBbh8YQnzWdPudUhOcPJOhJojhnkbaS888NiSYeJGO

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: DestinationAttractions; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."DestinationAttractions" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "DestinationId" uuid NOT NULL,
    "Name" character varying(120) NOT NULL,
    "Summary" character varying(300),
    "PhotoPath" character varying(255),
    "PhotoAlt" character varying(250),
    "PhotoCredit" character varying(250),
    "SortOrder" integer NOT NULL,
    "CreatedAt" timestamp with time zone NOT NULL,
    "UpdatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."DestinationAttractions" OWNER TO arlink28;

--
-- Name: Destinations; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."Destinations" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Slug" character varying(100) NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Country" character(2) NOT NULL,
    "Kind" character varying(20) NOT NULL,
    "Status" character varying(20) NOT NULL,
    "ParentId" uuid,
    "Tagline" character varying(160),
    "Summary" character varying(400),
    "Description" text,
    "BestTimeToVisit" character varying(200),
    "HeroPath" character varying(255),
    "HeroAlt" character varying(250),
    "HeroCredit" character varying(250),
    "Latitude" double precision,
    "Longitude" double precision,
    "SortOrder" integer NOT NULL,
    "PublishedAt" timestamp with time zone,
    "CreatedAt" timestamp with time zone NOT NULL,
    "UpdatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Destinations" OWNER TO arlink28;

--
-- Name: Enquiries; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."Enquiries" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Reference" character varying(20) NOT NULL,
    "Type" character varying(20) NOT NULL,
    "Status" character varying(20) NOT NULL,
    "PackageId" uuid,
    "PackageTitle" character varying(200),
    "CheckIn" date,
    "Nights" integer,
    "QuotedTotalMinor" bigint,
    "Currency" character(3),
    "Name" character varying(120) NOT NULL,
    "Email" character varying(200) NOT NULL,
    "Phone" character varying(40),
    "Subject" character varying(200),
    "Message" character varying(4000),
    "ConsentAt" timestamp with time zone NOT NULL,
    "SourceUrl" character varying(500),
    "HandledById" uuid,
    "CreatedAt" timestamp with time zone NOT NULL,
    "UpdatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Enquiries" OWNER TO arlink28;

--
-- Name: Features; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."Features" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Slug" character varying(100) NOT NULL,
    "Label" character varying(200) NOT NULL,
    "Icon" character varying(100),
    "CreatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Features" OWNER TO arlink28;

--
-- Name: PackageAddOns; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."PackageAddOns" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "PackageId" uuid NOT NULL,
    "Name" character varying(200) NOT NULL,
    "Description" character varying(500),
    "Unit" character varying(20) NOT NULL,
    "Currency" character(3) NOT NULL,
    "PriceMinor" bigint NOT NULL,
    "SortOrder" integer NOT NULL
);


ALTER TABLE public."PackageAddOns" OWNER TO arlink28;

--
-- Name: PackageFeatures; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."PackageFeatures" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "PackageId" uuid NOT NULL,
    "Section" character varying(30) NOT NULL,
    "FeatureId" uuid,
    "LabelOverride" character varying(200),
    "Footnote" character varying(500),
    "SortOrder" integer NOT NULL
);


ALTER TABLE public."PackageFeatures" OWNER TO arlink28;

--
-- Name: PackageMedia; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."PackageMedia" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "PackageId" uuid NOT NULL,
    "Role" character varying(20) NOT NULL,
    "Path" character varying(500) NOT NULL,
    "Alt" character varying(250),
    "Caption" character varying(500),
    "Width" integer,
    "Height" integer,
    "VideoProvider" character varying(20),
    "VideoId" character varying(100),
    "VariantsReady" boolean NOT NULL,
    "SortKey" integer NOT NULL,
    "CreatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."PackageMedia" OWNER TO arlink28;

--
-- Name: PackageRates; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."PackageRates" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "PackageId" uuid NOT NULL,
    "SeasonId" uuid NOT NULL,
    "Currency" character(3) NOT NULL,
    "PriceMinor" bigint NOT NULL,
    "ExtraNightPriceMinor" bigint
);


ALTER TABLE public."PackageRates" OWNER TO arlink28;

--
-- Name: PackageStays; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."PackageStays" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "PackageId" uuid NOT NULL,
    "PropertyId" uuid NOT NULL,
    "Nights" integer NOT NULL,
    "RoomType" character varying(100),
    "SortOrder" integer NOT NULL
);


ALTER TABLE public."PackageStays" OWNER TO arlink28;

--
-- Name: Packages; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."Packages" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Slug" character varying(100) NOT NULL,
    "ProductType" character varying(20) NOT NULL,
    "Details" jsonb,
    "Status" character varying(20) NOT NULL,
    "Title" character varying(200) NOT NULL,
    "Subtitle" character varying(200),
    "Summary" character varying(500),
    "Description" text,
    "Category" character varying(50) NOT NULL,
    "DestinationId" uuid NOT NULL,
    "Nights" integer NOT NULL,
    "MinNights" integer NOT NULL,
    "Adults" integer NOT NULL,
    "Children" integer NOT NULL,
    "PricingBasis" character varying(20) NOT NULL,
    "BaseCurrency" character(3) NOT NULL,
    "FromPriceMinor" bigint,
    "Featured" boolean NOT NULL,
    "SortOrder" integer NOT NULL,
    "SeoTitle" character varying(70),
    "SeoDescription" character varying(160),
    "Version" integer NOT NULL,
    "PublishedAt" timestamp with time zone,
    "CreatedAt" timestamp with time zone NOT NULL,
    "UpdatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Packages" OWNER TO arlink28;

--
-- Name: Partners; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."Partners" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Slug" character varying(100) NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Tagline" character varying(200),
    "LogoPath" character varying(500),
    "CreatedAt" timestamp with time zone NOT NULL,
    "UpdatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Partners" OWNER TO arlink28;

--
-- Name: Properties; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."Properties" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Slug" character varying(100) NOT NULL,
    "Name" character varying(200) NOT NULL,
    "PartnerId" uuid,
    "DestinationId" uuid NOT NULL,
    "CreatedAt" timestamp with time zone NOT NULL,
    "UpdatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Properties" OWNER TO arlink28;

--
-- Name: PropertyMedia; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."PropertyMedia" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "PropertyId" uuid NOT NULL,
    "Path" character varying(500) NOT NULL,
    "Alt" character varying(250),
    "Caption" character varying(500),
    "Width" integer,
    "Height" integer,
    "VideoProvider" character varying(20),
    "VideoId" character varying(100),
    "VariantsReady" boolean NOT NULL,
    "SortKey" integer NOT NULL,
    "CreatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."PropertyMedia" OWNER TO arlink28;

--
-- Name: SeasonRanges; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."SeasonRanges" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "SeasonId" uuid NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date NOT NULL
);


ALTER TABLE public."SeasonRanges" OWNER TO arlink28;

--
-- Name: Seasons; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."Seasons" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Slug" character varying(100) NOT NULL,
    "Name" character varying(100) NOT NULL,
    "PartnerId" uuid,
    "CreatedAt" timestamp with time zone NOT NULL,
    "UpdatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Seasons" OWNER TO arlink28;

--
-- Name: Staff; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."Staff" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Username" character varying(50) NOT NULL,
    "Email" character varying(200) NOT NULL,
    "PasswordHash" text NOT NULL,
    "Role" character varying(20) NOT NULL,
    "IsActive" boolean NOT NULL,
    "FailedLoginAttempts" integer NOT NULL,
    "LockedUntil" timestamp with time zone,
    "LastLoginAt" timestamp with time zone,
    "InvitedById" uuid,
    "CreatedAt" timestamp with time zone NOT NULL,
    "UpdatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Staff" OWNER TO arlink28;

--
-- Name: StaffTokens; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."StaffTokens" (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "Type" character varying(20) NOT NULL,
    "TokenHash" character varying(64) NOT NULL,
    "Email" character varying(200) NOT NULL,
    "RoleToAssign" character varying(20),
    "StaffId" uuid,
    "ExpiresAt" timestamp with time zone NOT NULL,
    "UsedAt" timestamp with time zone,
    "CreatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."StaffTokens" OWNER TO arlink28;

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO arlink28;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: arlink28
--

CREATE TABLE public.audit_logs (
    "Id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "ActorId" character varying(36),
    "Action" character varying(100) NOT NULL,
    "EntityType" character varying(100) NOT NULL,
    "EntityId" character varying(36) NOT NULL,
    "Before" text,
    "After" text,
    "CreatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.audit_logs OWNER TO arlink28;

--
-- Data for Name: DestinationAttractions; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."DestinationAttractions" ("Id", "DestinationId", "Name", "Summary", "PhotoPath", "PhotoAlt", "PhotoCredit", "SortOrder", "CreatedAt", "UpdatedAt") FROM stdin;
\.


--
-- Data for Name: Destinations; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Destinations" ("Id", "Slug", "Name", "Country", "Kind", "Status", "ParentId", "Tagline", "Summary", "Description", "BestTimeToVisit", "HeroPath", "HeroAlt", "HeroCredit", "Latitude", "Longitude", "SortOrder", "PublishedAt", "CreatedAt", "UpdatedAt") FROM stdin;
eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	kenya	Kenya	KE	Country	Draft	\N	\N	\N	\N	\N	/media/destinations/eb2d59e3ac544d93b88c3da09d04c9d2/45d8d198ba48430ea1018b83a880e68d.jpg	Kenya	\N	\N	\N	0	\N	2026-10-16 02:13:59.79865+00	2026-10-27 07:48:01.840731+00
2031dab8-2aca-402c-8fed-083dbe481884	masai-mara	Masai Mara	KE	Place	Published	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	\N	\N	\N	\N	/media/destinations/2031dab82aca402c8fed083dbe481884/c0f9acda04fe4915ae1df23aba508586.jpg	Masai Mara	\N	\N	\N	0	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00	2026-10-27 07:50:01.565286+00
f1da7e79-5a02-49b0-902e-68145c23d5e3	nairobi	Nairobi	KE	Place	Published	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	\N	\N	\N	\N	/media/destinations/f1da7e795a0249b0902e68145c23d5e3/30cd8ed8cac54ec088314784597c28da.jpg	Nairobi	\N	\N	\N	0	2026-10-16 02:13:59.79865+00	2026-10-16 02:13:59.79865+00	2026-10-27 07:51:17.111776+00
f44e0c8f-b08a-4d8d-9ce2-69c97f310917	samburu	Samburu	KE	Place	Published	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	\N	\N	\N	\N	/media/destinations/f44e0c8fb08a4d8d9ce269c97f310917/6c486b08aebf40a9bdb4f4085657acc3.jpg	Samburu	\N	\N	\N	0	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00	2026-10-27 07:52:14.985422+00
\.


--
-- Data for Name: Enquiries; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Enquiries" ("Id", "Reference", "Type", "Status", "PackageId", "PackageTitle", "CheckIn", "Nights", "QuotedTotalMinor", "Currency", "Name", "Email", "Phone", "Subject", "Message", "ConsentAt", "SourceUrl", "HandledById", "CreatedAt", "UpdatedAt") FROM stdin;
098ba038-42e1-4ef6-9a97-3d200c911146	ENQ-2026-0006	Package	Closed	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Giraffe Manor Family Experience	2026-10-17	5	2657600	USD	Prosper Tinarwo	shifttechgs1@gmail.com	+27814303023	\N	testing ignore	2026-10-16 02:19:08.923976+00	/contact?package=Giraffe+Manor+Family+Experience&slug=giraffe-manor-family-experience&checkIn=2026-10-17&nights=5	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 02:19:08.923976+00	2026-10-26 13:56:37.765822+00
3965844a-abd7-4635-b4a3-0909e29ff40f	ENQ-2026-0005	Booking	Closed	\N	\N	\N	\N	\N	\N	Prosper Tinarwo	shifttechgs1@gmail.com	+27814303023	Flight quote: Cape Town	Service: Flight\nDestination: Cape Town\nTravellers: 1 person\n\ntesting	2026-10-16 01:18:10.009061+00	/quote	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 01:18:10.009061+00	2026-10-28 18:26:45.703461+00
dfa8b115-ea99-4bfe-b1db-cf397c311a66	ENQ-2026-0004	General	Closed	\N	\N	\N	\N	\N	\N	Playwright email test	developers@arlink28.com	\N	Email test 2026-10-16T01:04:08.205Z	Automated check that enquiry emails send from production. Safe to delete.	2026-10-16 01:04:13.259535+00	/contact	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 01:04:13.259535+00	2026-10-28 18:26:47.702635+00
664f8419-53ce-4f70-8ef4-94b4c00a34b8	ENQ-2026-0003	Booking	Closed	\N	\N	\N	\N	\N	\N	Prosper Tinarwo	shifttechgs1@gmail.com	+27814303023	Hotel reservation quote: Cape Town	Service: Hotel reservation\nDestination: Cape Town\nTravellers: 1 person\n\ntesting ignore this	2026-10-15 23:27:48.92886+00	/quote	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-15 23:27:48.92886+00	2026-10-28 18:26:48.494782+00
84c66f82-a9de-44b3-b72b-b8a5949891eb	ENQ-2026-0002	Booking	Closed	\N	\N	\N	\N	\N	\N	Playwright test 23:23:46 (ignore)	developers@arlink28.com	+44 7000 000000	Flight quote: Mail test destination	Service: Flight\nDestination: Mail test destination\nTravellers: 1 person\n\nAutomated test of the quote email routing 23:23:46. Please ignore.	2026-10-15 23:23:57.506447+00	/quote	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-15 23:23:57.506447+00	2026-10-28 18:26:49.105801+00
42638c3b-72ce-49d8-934b-b5237a420af4	ENQ-2026-0001	General	Closed	\N	\N	\N	\N	\N	\N	Playwright test 23:23:46 (ignore)	developers@arlink28.com	+44 7000 000000	Mail test 23:23:46 - contact form	Automated test of the contact form email routing. Please ignore.	2026-10-15 23:23:47.775762+00	/contact	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-15 23:23:47.775762+00	2026-10-28 18:26:49.780148+00
aa03554e-32a1-48b9-a07c-5a1608b5d8e0	ENQ-2026-0007	Booking	New	\N	\N	\N	\N	\N	\N	Abdullahi Mohammed SULAIMON	barahamasulyman@gmail.com	+2347069500910	Flight quote: Johannesburg (JNB) to Kasane (BBK)	Trip: Return\nFrom: Johannesburg (JNB)\nTo: Kasane (BBK)\nDepart: 2026-10-30\nReturn: 2026-10-31\nTravellers: 1 person	2026-10-30 11:23:56.822264+00	/	\N	2026-10-30 11:23:56.822264+00	2026-10-30 11:23:56.822264+00
\.


--
-- Data for Name: Features; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Features" ("Id", "Slug", "Label", "Icon", "CreatedAt") FROM stdin;
06d26b77-6072-47c1-a8c9-7f41997e7e83	meet-and-greet	Meet & greet service from the airport to the destination	people-group	2026-10-16 02:13:59.79865+00
29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	vip-airport-to-resort	VIP transfer from airport to resort	plane	2026-10-16 02:13:59.79865+00
2ce2ac79-841c-465b-923f-5dc5106b44e3	tips	Tips	hand-holding-dollar	2026-10-16 02:13:59.79865+00
369530dd-dbcf-4fe7-a4e8-da09eb4206c7	vip-home-to-airport	VIP transfer from home to airport	car	2026-10-16 02:13:59.79865+00
44d688c1-caa2-4f41-87b6-14a95030bca0	vat	VAT	receipt	2026-10-16 02:13:59.79865+00
4578c46a-05f6-4efc-8689-23d57bf4ba05	boules-croquet	Boules & croquet	baseball-bat-ball	2026-10-16 02:13:59.79865+00
55a674d9-c7ff-438e-b14f-81c304b70f52	personal-effects	Personal effects	suitcase	2026-10-16 02:13:59.79865+00
5ed14816-6744-407b-b9c7-3e25dec318af	massage-treatments	Massage treatments	spa	2026-10-16 02:13:59.79865+00
861b903c-b7c1-4cb2-a8e4-b052dc780ec5	afew-giraffe-centre	AFEW Giraffe Centre entry	ticket	2026-10-16 02:13:59.79865+00
a55e53f2-a1e9-479a-a536-6780bf407a41	luxury-spirits	Luxury spirits	wine-bottle	2026-10-16 02:13:59.79865+00
a755ca68-16b1-496a-bcda-8b529a09b921	all-meals	All meals	utensils	2026-10-16 02:13:59.79865+00
ab597b1d-b14b-49e5-b735-42e59c1455bc	retreat-access	Access to The Retreat during check-in & check-out	spa	2026-10-16 02:13:59.79865+00
b17f4b12-ceda-4499-b696-b2a28116674e	orchid-house-dining	Orchid House dining	utensils	2026-10-16 02:13:59.79865+00
c0fc5481-9e17-48d5-8237-fb6a8dc39134	selected-wines	Selected wines	wine-glass-empty	2026-10-16 02:13:59.79865+00
c9d32790-1fd1-469e-8326-6a95ad6ef1cd	house-drinks	House wines, soft drinks, beers & spirits	wine-glass	2026-10-16 02:13:59.79865+00
cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	laundry	Laundry	shirt	2026-10-16 02:13:59.79865+00
dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	wifi	Wi-Fi	wifi	2026-10-16 02:13:59.79865+00
de9ac8e5-85f5-4c7c-8c54-b31d83f94636	champagne	Champagne	champagne-glasses	2026-10-16 02:13:59.79865+00
e6040660-0d06-4f1d-bf65-7d1d5c6db260	karen-langata-transfers	Arrival & departure transfers – Karen & Langata area	van-shuttle	2026-10-16 02:13:59.79865+00
eede9629-2716-46c7-9fcf-406c54cd6b3f	health-insurance	Health insurance	notes-medical	2026-10-16 02:13:59.79865+00
01a3db82-ee8e-4965-a87d-f603e9eacbd4	childrens-activities	Children's activities	children	2026-10-16 03:06:40.798023+00
037c2c14-563b-4c47-957f-e991571c2c55	bush-meals	Bush meals	bell-concierge	2026-10-16 03:06:40.798023+00
0501e344-a643-40e5-8dfb-27648183e3c4	plumbed-shower	Plumbed shower	shower	2026-10-16 03:06:40.798023+00
20d438f1-6cd7-4182-87c9-21928942f318	keekorok-transfers	Transfers from Keekorok Airstrip	plane-arrival	2026-10-16 03:06:40.798023+00
372e5cc9-ad2f-429d-8807-8a4531495a88	park-fees	Park fees	ticket	2026-10-16 03:06:40.798023+00
3974ba56-869f-416b-8319-45260065f4c1	camp-airstrip-transfers	Camp and airstrip transfers	plane-arrival	2026-10-16 03:06:40.798023+00
48027ec6-d4f9-42b2-9ff2-459ad39dfdac	luxury-tent-plunge-pool	Luxury tent with private plunge pool	bed	2026-10-16 03:06:40.798023+00
4f48f79b-1db3-4be8-a41e-868f477287f6	evacuation-insurance	Travel emergency evacuation insurance	kit-medical	2026-10-16 03:06:40.798023+00
5222a5e2-40ce-47ab-a4a8-cd1d65853bff	game-drives	Game drives	car-side	2026-10-16 03:06:40.798023+00
56c88cad-d63a-48e1-b9ed-14958de834b5	house-wines	House wines	wine-glass	2026-10-16 03:06:40.798023+00
57e1dc5f-c01a-4deb-be90-cdb9c5207a9f	house-spirits	House spirits	martini-glass	2026-10-16 03:06:40.798023+00
78deb886-ccd0-40a4-adde-63361e4da68c	luxury-accommodation	Luxury accommodation	house	2026-10-16 03:06:40.798023+00
85cbb574-c2e8-490c-8e73-3db3473d33ff	airport-transfers	Airport transfers	plane-arrival	2026-10-16 03:06:40.798023+00
89474492-8f77-4eb6-baa8-a60762d5cdd6	house-soft-drinks	House soft drinks	glass-water	2026-10-16 03:06:40.798023+00
8c331ab1-987b-4a73-b101-bba173f1a5e0	flushing-toilet	Flushing toilet	toilet	2026-10-16 03:06:40.798023+00
9e6ab6ad-810b-4662-bcad-540130c27315	nights-at-property	Nights at the property	bed	2026-10-16 03:06:40.798023+00
a3c836d4-8ff2-4bd4-8816-2dda253459f2	bush-volleyball	Seasonal bush volleyball	volleyball	2026-10-16 03:06:40.798023+00
a9151242-f2f0-4633-9771-cec31507a780	nature-walks	Nature walks	person-hiking	2026-10-16 03:06:40.798023+00
b4ba5418-17cb-4de2-a550-4c16ea5c9dd3	camp-activities	Other camp activities	binoculars	2026-10-16 03:06:40.798023+00
ccdcb881-b143-41ec-a22a-ad793438a741	private-plunge-pools	All tents have private plunge pools	water-ladder	2026-10-16 03:06:40.798023+00
e5a0ba2b-a8b8-4093-8672-3d8d8f6d592f	cigars	Cigars	smoking	2026-10-16 03:06:40.798023+00
e6550ec4-006c-4782-a29b-54c9d3bf97df	sundowners	Sundowners	sun	2026-10-16 03:06:40.798023+00
ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	house-beers	House beers	beer-mug-empty	2026-10-16 03:06:40.798023+00
f8c7fe88-bf72-4a74-b3a3-45ca527dfa8c	ensuite-bath	En suite bathrooms with a bath	bath	2026-10-16 03:06:40.798023+00
\.


--
-- Data for Name: PackageAddOns; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."PackageAddOns" ("Id", "PackageId", "Name", "Description", "Unit", "Currency", "PriceMinor", "SortOrder") FROM stdin;
06fd9882-3786-4b18-9f39-4c4f2a28b416	3becabc0-2844-47e8-a330-f83a44db48cc	Private exclusive vehicle	Exclusive use of a game-drive vehicle for your party, charged per day of your stay.	PerDay	USD	49000	0
179831eb-2acf-429c-8634-27d0797b4d6d	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Private exclusive vehicle	Exclusive use of a game-drive vehicle for your party, charged per day of your stay.	PerDay	USD	49000	0
2766cd31-5b6f-4c51-901f-8734a7fa6741	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Private exclusive vehicle	Exclusive use of a game-drive vehicle for your party, charged per day of your stay.	PerDay	USD	49000	0
4bf39f4d-6dc0-4dfd-9c24-2d800654683e	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Private exclusive vehicle	Exclusive use of a game-drive vehicle for your party, charged per day of your stay.	PerDay	USD	49000	0
a007018d-1bbd-4e7d-9a18-ed6f509d6133	46a039e6-d50d-4f47-ac0e-30ab22d97535	Private Nairobi National Park vehicle	Exclusive use of a vehicle for up to 6 guests, with the park entrance fees included. It cannot be combined with the arrival or departure transfer.	PerStay	USD	49000	0
a6f00686-a328-4703-871e-93070d557cb5	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Private exclusive vehicle	Exclusive use of a game-drive vehicle for your party, charged per day of your stay.	PerDay	USD	49000	0
d6df036d-a94b-4a9d-8b33-322d00489382	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Private exclusive vehicle	Exclusive use of a game-drive vehicle for your party, charged per day of your stay.	PerDay	USD	49000	0
c5ac3931-db6e-4f58-9c9f-1865d4ada97c	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Private Nairobi National Park vehicle	Exclusive use of a vehicle for up to 6 guests, with the park entrance fees included. It cannot be combined with the arrival or departure transfer.	PerStay	USD	49000	0
8eff4f19-0c17-4de3-ad1a-53e855004463	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Private Nairobi National Park vehicle	Exclusive use of a vehicle for up to 6 guests, with the park entrance fees included. It cannot be combined with the arrival or departure transfer.	PerStay	USD	49000	0
3721d383-1222-423b-93d5-4562b90528ca	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Private Nairobi National Park vehicle	Exclusive use of a vehicle for up to 6 guests, with the park entrance fees included. It cannot be combined with the arrival or departure transfer.	PerStay	USD	49000	0
a07be070-e0d6-4cf0-90d2-d278d29d1b35	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Private Nairobi National Park vehicle	Exclusive use of a vehicle for up to 6 guests, with the park entrance fees included. It cannot be combined with the arrival or departure transfer.	PerStay	USD	49000	0
2e7c9609-ba60-4299-9445-2b7e426ea15d	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Private Nairobi National Park vehicle	Exclusive use of a vehicle for up to 6 guests, with the park entrance fees included. It cannot be combined with the arrival or departure transfer.	PerStay	USD	49000	0
\.


--
-- Data for Name: PackageFeatures; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."PackageFeatures" ("Id", "PackageId", "Section", "FeatureId", "LabelOverride", "Footnote", "SortOrder") FROM stdin;
019551f3-dbae-4166-a741-516355c3b8e8	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	20d438f1-6cd7-4182-87c9-21928942f318	\N	\N	9
01cd9276-10eb-4955-bc3a-4b3c5f161b19	46a039e6-d50d-4f47-ac0e-30ab22d97535	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	VIP transfer from home to airport	If required	0
03c8ced5-4720-4136-8acb-f168551ff22d	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	01a3db82-ee8e-4965-a87d-f603e9eacbd4	\N	\N	13
04073cce-38c8-498c-b1ea-c73a59e8e252	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	57e1dc5f-c01a-4deb-be90-cdb9c5207a9f	\N	\N	5
04103d3f-50d2-4781-97d1-8a6e0c276ecc	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	20d438f1-6cd7-4182-87c9-21928942f318	\N	\N	9
058b8e7d-b466-4477-8d74-59673f255c8a	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	\N	\N	6
05be0a12-593f-407e-a098-cc78cdde2bc1	76d3ed1d-0d97-46e5-96b8-365498c4f85b	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	\N	\N	2
075e6858-f6cc-48fc-bdf1-4c0252cabfea	46a039e6-d50d-4f47-ac0e-30ab22d97535	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
07acbe0a-78e1-480e-bad5-b81db088b657	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Excluded	e5a0ba2b-a8b8-4093-8672-3d8d8f6d592f	\N	\N	3
0b3787a6-ea3b-472b-9248-b2dc63d3eea5	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	a9151242-f2f0-4633-9771-cec31507a780	\N	\N	14
0b39cb84-7386-4252-adf5-46cfc214926f	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	3974ba56-869f-416b-8319-45260065f4c1	\N	\N	11
0b405a14-02af-4216-abaf-430044d8c835	3becabc0-2844-47e8-a330-f83a44db48cc	Highlight	8c331ab1-987b-4a73-b101-bba173f1a5e0	\N	\N	2
0c2a11c0-c1a3-477f-89c2-808e5412ac3d	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	57e1dc5f-c01a-4deb-be90-cdb9c5207a9f	\N	\N	5
0ceea746-0923-4220-8523-005cce24d6b5	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	9e6ab6ad-810b-4662-bcad-540130c27315	5 nights in Sala's Camp	\N	0
0f2ff787-fdab-40d4-b604-d7c79ff76a55	46a039e6-d50d-4f47-ac0e-30ab22d97535	Note	\N	An early arrival or a late departure may need Retreat access booked separately, subject to availability.	\N	1
0fafc9d0-4c08-4708-b0a0-e31a1e3b2dd3	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	5222a5e2-40ce-47ab-a4a8-cd1d65853bff	\N	\N	6
100feedb-3150-4978-8d0d-0e453967ba6b	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Excluded	4f48f79b-1db3-4be8-a41e-868f477287f6	\N	\N	5
10415a2d-fce3-4b3b-a1ad-8c214fab74d5	0ae7b7eb-acae-481d-9606-b99cdb5af83e	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	\N	\N	2
10fd0539-e67e-404c-b802-b7063d08179f	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	56c88cad-d63a-48e1-b9ed-14958de834b5	\N	\N	4
1162d550-7dca-4442-be83-649b3ef8ddbb	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Excluded	4f48f79b-1db3-4be8-a41e-868f477287f6	\N	\N	5
11ef519e-2a41-4e10-bf95-445d17888540	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	037c2c14-563b-4c47-957f-e991571c2c55	\N	\N	7
15a236c3-73bb-434d-8d4e-7271a73e84f4	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	01a3db82-ee8e-4965-a87d-f603e9eacbd4	\N	\N	13
15afd685-5601-4b68-983e-e8be61d78658	46a039e6-d50d-4f47-ac0e-30ab22d97535	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	3
17e2cef8-7d97-42b9-8594-171d2f8d28d3	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	9e6ab6ad-810b-4662-bcad-540130c27315	4 nights in Sala's Camp	\N	0
186c3999-b8b0-4f90-999e-0b70b6fb2e43	46a039e6-d50d-4f47-ac0e-30ab22d97535	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	Meet & greet service at the airport	\N	1
1a0e9dca-2f56-45a8-be61-dc1b9356a8e4	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
1b294642-0df7-44a0-a043-340f7d35244e	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Highlight	0501e344-a643-40e5-8dfb-27648183e3c4	\N	\N	3
1b83fb02-8f5b-4e8f-aaf1-9c0d76fa2f89	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	89474492-8f77-4eb6-baa8-a60762d5cdd6	\N	\N	5
1bd56c87-98c1-450e-ad6e-c1ff0ebb97e3	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	48027ec6-d4f9-42b2-9ff2-459ad39dfdac	3 nights in a luxury tent with private plunge pool	\N	0
1c3427b8-b912-456e-ad81-be1614a4b743	3becabc0-2844-47e8-a330-f83a44db48cc	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
1d87ba57-0879-499f-a22d-b39bc2a7a6c3	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
1e0e135d-bc96-4beb-bf13-ed574accac74	3becabc0-2844-47e8-a330-f83a44db48cc	Included	a3c836d4-8ff2-4bd4-8816-2dda253459f2	\N	\N	11
1e910c40-094f-4f45-aa25-51860495bcd3	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
1f3a4348-8289-4969-8f5e-a28d1615778d	46a039e6-d50d-4f47-ac0e-30ab22d97535	Note	\N	Arrival and departure transfers are included when the arrival collection is after 11:30 a.m. and the departure transfer is before the 10:00 a.m. check-out.	\N	2
20f91093-20fd-4707-8da5-7fee95fae44b	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Highlight	ccdcb881-b143-41ec-a22a-ad793438a741	Private plunge pools	\N	0
2117fe22-0540-45e0-aa26-8b2a98357d25	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
2197ad35-2246-4897-a232-e8c5b67687a5	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	a3c836d4-8ff2-4bd4-8816-2dda253459f2	\N	\N	13
222f0358-99f5-4e82-816f-60e49bf7e5f1	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Excluded	4f48f79b-1db3-4be8-a41e-868f477287f6	\N	\N	5
22d17f53-b742-48d7-84a6-4e4837b6a548	79054381-312c-4e5f-aba3-dbfdffcf2d9a	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	\N	\N	2
242140b5-d1eb-490f-8a61-70ea2e90f079	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	e6550ec4-006c-4782-a29b-54c9d3bf97df	\N	\N	10
254e8f3a-9bb9-4721-a080-01057f2d53af	46a039e6-d50d-4f47-ac0e-30ab22d97535	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
26ec0133-23d6-4ace-8e95-89a5f3acc94a	46a039e6-d50d-4f47-ac0e-30ab22d97535	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
2baccd8c-acb1-440d-9873-597264754a79	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Highlight	0501e344-a643-40e5-8dfb-27648183e3c4	\N	\N	3
2c53d107-066c-438b-bfa7-92bc6e377c82	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	\N	\N	4
2dde0960-104b-476c-af91-6f4ef11ec4b0	3becabc0-2844-47e8-a330-f83a44db48cc	Included	037c2c14-563b-4c47-957f-e991571c2c55	\N	\N	7
31b0d554-5c53-4497-b6dd-45bf782d5acb	46a039e6-d50d-4f47-ac0e-30ab22d97535	Note	\N	Child sharing and extra bed arrangements are confirmed with the booking where they apply.	\N	4
31d301df-a280-4754-b3b4-5a380feaf414	76d3ed1d-0d97-46e5-96b8-365498c4f85b	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	0
32ced583-e60c-429e-b61d-5ef732af671b	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	56c88cad-d63a-48e1-b9ed-14958de834b5	\N	\N	2
35b6d295-e579-42e6-a9b3-b80f94596245	46a039e6-d50d-4f47-ac0e-30ab22d97535	Excluded	5ed14816-6744-407b-b9c7-3e25dec318af	\N	\N	5
368fc7bb-d936-4067-8684-c63ef7714cdc	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	a9151242-f2f0-4633-9771-cec31507a780	\N	\N	12
374172d1-dd1e-4d15-b0ce-085112df5c12	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	4
39c85516-c192-4abf-ab38-1379b706ec02	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Vehicle	\N	Private exclusive vehicle use is available at an extra charge of $490 per day.	\N	1
3b347873-3887-40a1-94f7-2ad81c247961	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Excluded	4f48f79b-1db3-4be8-a41e-868f477287f6	\N	\N	5
40080b27-eb9c-4f1f-938a-26ea3ccafb18	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Perk	\N	Eligibility for a complimentary retreat day pass and 30% off the retreat day room or early bed & breakfast package.	\N	0
4116c477-e43b-4a8f-83b0-78f97c03babd	3becabc0-2844-47e8-a330-f83a44db48cc	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	0
42f03a0b-33a4-487f-b8b1-acbfa88e5f84	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	5222a5e2-40ce-47ab-a4a8-cd1d65853bff	\N	\N	8
431ce931-f6be-4116-8a54-4288fae1bd35	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
4451d1ed-bc41-46e1-942f-3bfbf6a961b0	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
456fe4fb-e257-43e0-815d-092785df99cd	3becabc0-2844-47e8-a330-f83a44db48cc	Included	57e1dc5f-c01a-4deb-be90-cdb9c5207a9f	\N	\N	5
45bd27b8-f62a-48bd-8d0b-38c026bb4c78	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	b4ba5418-17cb-4de2-a550-4c16ea5c9dd3	\N	\N	14
46ed6445-0272-46d8-bcdd-fc4fc49638dc	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	b4ba5418-17cb-4de2-a550-4c16ea5c9dd3	\N	\N	16
48e268db-899c-4779-9cac-5fa17a207ec0	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	037c2c14-563b-4c47-957f-e991571c2c55	\N	\N	9
4c9cf2ca-0335-44a8-8762-d5e40a3b191d	3becabc0-2844-47e8-a330-f83a44db48cc	Vehicle	\N	For two adults and two children: Sala's Family Safari guests staying in the standard Keekorok Tent with Pool or Forest Tent with Pool receive shared game-drive vehicle use.	\N	0
4f1405ed-b1f1-444c-b79f-9f5500672933	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Highlight	f8c7fe88-bf72-4a74-b3a3-45ca527dfa8c	\N	\N	1
4f34bab2-6af0-4945-9090-e3da9adb2fe6	3becabc0-2844-47e8-a330-f83a44db48cc	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
504ecbbc-bffc-4953-bf72-166bef87bdc5	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
506cb793-c689-4d54-afec-5e3ab5b63593	3becabc0-2844-47e8-a330-f83a44db48cc	Included	b4ba5418-17cb-4de2-a550-4c16ea5c9dd3	\N	\N	14
5079f980-e5fe-434d-b75f-8ccd71ea0a73	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	4578c46a-05f6-4efc-8689-23d57bf4ba05	\N	\N	7
5183f678-c51e-49d4-a085-571eea87f704	3becabc0-2844-47e8-a330-f83a44db48cc	Included	56c88cad-d63a-48e1-b9ed-14958de834b5	\N	\N	2
537638bf-8df1-44b7-99e4-fe2748dd4735	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	3
5402055b-5979-4eeb-8600-4e7abe62486d	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Vehicle	\N	For two adults: Sala Mara Escape guests staying in the standard Keekorok Tent with Pool or Forest Tent with Pool receive shared game-drive vehicle use.	\N	0
54e61a62-aa48-468c-a653-4f93644f3af6	3becabc0-2844-47e8-a330-f83a44db48cc	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	1
55ebfdf1-c5ea-42b7-b82e-d72310e29c5e	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	89474492-8f77-4eb6-baa8-a60762d5cdd6	\N	\N	3
568908d6-aa66-4c5a-b7e3-4210e449bf24	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	861b903c-b7c1-4cb2-a8e4-b052dc780ec5	\N	\N	4
570ee3cc-6891-4e69-99ce-efec75604dfa	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	9e6ab6ad-810b-4662-bcad-540130c27315	5 nights in Sasaab	\N	1
5b78e7c1-12dd-42a4-bd0e-4f36a1ff0fc9	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	01a3db82-ee8e-4965-a87d-f603e9eacbd4	\N	\N	13
5e7c12d1-f40d-48c0-8386-2c69fa4f87d5	3becabc0-2844-47e8-a330-f83a44db48cc	Included	a9151242-f2f0-4633-9771-cec31507a780	\N	\N	12
5e7d5ea9-6888-4a8e-9f38-ef592c390fdf	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Highlight	0501e344-a643-40e5-8dfb-27648183e3c4	\N	\N	3
5f705920-c74f-4cee-a97d-f456c24ec8fe	79054381-312c-4e5f-aba3-dbfdffcf2d9a	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	0
60368b19-a6c5-412a-94e4-d117c8e3abd1	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
61d5a674-d4d7-4fd7-b248-4c7f8bbcefc7	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	4
6286fcb2-2282-442f-abb5-db861e1d1ec1	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
642c3ea0-1360-4b89-b0b8-55757d3a5fca	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	1
6657db4b-b9c3-45d4-a79f-738850d8bbe9	3becabc0-2844-47e8-a330-f83a44db48cc	Excluded	e5a0ba2b-a8b8-4093-8672-3d8d8f6d592f	\N	\N	3
67643e0d-2420-4ce8-ba6a-6780cad38131	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Excluded	e5a0ba2b-a8b8-4093-8672-3d8d8f6d592f	\N	\N	3
67763043-ae73-4684-97ea-7e418f9cc574	3becabc0-2844-47e8-a330-f83a44db48cc	Included	ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	\N	\N	4
69069716-9a2c-44e6-b13c-119f2f601f6e	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	3
6971a7f2-1f19-47aa-bfff-a8824c6f52dc	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Vehicle	\N	For two adults, Ultimate Safari Collection Journey guests receive shared game-drive vehicle use.	\N	0
6b115d8e-e1fb-4f63-9134-99d4834d35a9	46a039e6-d50d-4f47-ac0e-30ab22d97535	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
6b353b90-6b4b-4b8c-b51f-edf96c6732ba	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	4
6bd7c9fe-ece7-455f-a438-98566550c6a2	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Perk	\N	Eligibility for a complimentary retreat day pass and 30% off the retreat day room or early bed & breakfast package.	\N	0
6cce9cac-b03c-4c64-bfce-7e244a885f9d	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Highlight	ccdcb881-b143-41ec-a22a-ad793438a741	\N	\N	0
6d9a2811-91ca-4140-9e08-10a6b1e8d1c7	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	9e6ab6ad-810b-4662-bcad-540130c27315	3 nights in Sasaab	\N	1
6dd8436b-35c4-413b-baa5-d6fcd54a0694	3becabc0-2844-47e8-a330-f83a44db48cc	Vehicle	\N	Private exclusive vehicle use is available at an extra charge of $490 per day.	\N	1
6e65c127-60f7-406f-a1ff-e8e53e4ff4e8	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Excluded	e5a0ba2b-a8b8-4093-8672-3d8d8f6d592f	\N	\N	3
70093200-b830-4dfb-8e67-46581d8d6568	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Highlight	8c331ab1-987b-4a73-b101-bba173f1a5e0	\N	\N	2
705a6bda-c3bc-4f42-8183-4089e9be2393	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	b4ba5418-17cb-4de2-a550-4c16ea5c9dd3	\N	\N	16
715a8bf7-4fe9-49cf-8253-baed53c6b833	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	ab597b1d-b14b-49e5-b735-42e59c1455bc	\N	\N	6
728ded3d-fc39-48c8-b283-b211a40199a1	46a039e6-d50d-4f47-ac0e-30ab22d97535	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
72ced930-0262-429f-8a57-510f22ae94f3	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	037c2c14-563b-4c47-957f-e991571c2c55	\N	\N	7
739f5af3-52eb-4af3-8ea6-dcdef89f92ce	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Highlight	f8c7fe88-bf72-4a74-b3a3-45ca527dfa8c	\N	\N	1
73fe7a81-fc2d-4a27-8926-14515459d8c4	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	78deb886-ccd0-40a4-adde-63361e4da68c	\N	\N	2
74c54569-fea1-4008-9245-414181fb59ae	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	\N	\N	4
7b26fc9d-326f-4a8a-a507-c6b02835d8df	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	89474492-8f77-4eb6-baa8-a60762d5cdd6	\N	\N	5
7c9a7dc8-61b6-4e92-8bef-72c7b17df96d	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	\N	\N	2
7cb2bd6f-c1a8-4366-b0e5-92c8a7851097	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	e6550ec4-006c-4782-a29b-54c9d3bf97df	\N	\N	8
7d86b487-2ff9-41e0-a801-545a6c69b03b	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	e6550ec4-006c-4782-a29b-54c9d3bf97df	\N	\N	8
80069d9e-a972-4dda-a1e4-d9ae0e05ec01	3becabc0-2844-47e8-a330-f83a44db48cc	Highlight	0501e344-a643-40e5-8dfb-27648183e3c4	\N	\N	3
8064967a-da33-4433-92d5-b904769ca2d4	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
80f78861-79aa-464c-843e-427c66e1daeb	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Vehicle	\N	Private exclusive vehicle use is available at an extra charge of $490 per day.	\N	1
81023541-30d1-41e8-8e7b-0b86e2015b20	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	\N	\N	2
819436c0-9cdd-47ba-9f5e-08ead40b1334	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Highlight	0501e344-a643-40e5-8dfb-27648183e3c4	\N	\N	3
830bd246-6c48-43ad-94cb-3900428733c4	79054381-312c-4e5f-aba3-dbfdffcf2d9a	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	1
8474c958-9522-451c-bd54-cc30c20a55ad	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	56c88cad-d63a-48e1-b9ed-14958de834b5	\N	\N	2
85311f9c-a36a-4f20-8d93-9efa77031b7d	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Highlight	ccdcb881-b143-41ec-a22a-ad793438a741	\N	\N	0
85efe65c-d5d2-4405-80ca-5549ccf57f41	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	48027ec6-d4f9-42b2-9ff2-459ad39dfdac	4 nights in a luxury tent with private plunge pool	\N	0
8d78fe63-4846-4dd1-8ec0-6c2858a211ce	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	12
8d7ff079-735c-4075-8aea-618f8320d74c	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Highlight	ccdcb881-b143-41ec-a22a-ad793438a741	Private plunge pools	\N	0
8e91eefe-30d6-49eb-ae51-c2d83ed2793f	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	56c88cad-d63a-48e1-b9ed-14958de834b5	\N	\N	4
91759731-6a6e-426d-9995-9ad8693ef4a5	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	e6550ec4-006c-4782-a29b-54c9d3bf97df	\N	\N	10
91f234ab-7c2c-40d1-9be9-0232920f3c5e	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
920738a6-3ff6-480b-915f-2f572589aacd	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	56c88cad-d63a-48e1-b9ed-14958de834b5	\N	\N	2
930bee32-4e0f-46f3-a75d-ef627c754f43	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	89474492-8f77-4eb6-baa8-a60762d5cdd6	\N	\N	3
937f246f-d34a-407d-85ac-3f5529b2d2c7	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Highlight	f8c7fe88-bf72-4a74-b3a3-45ca527dfa8c	\N	\N	1
959be1a9-48f6-4dcf-be04-eb66038da565	3becabc0-2844-47e8-a330-f83a44db48cc	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	4
95d368b6-c2bd-482b-a6e4-9feae4f518db	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
96cc942d-5315-4a35-8e74-2296024c1818	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
978dcaa9-d12f-4b34-95f3-1e928e31ba06	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Vehicle	\N	For two adults: Sala's Classic Safari guests staying in the standard Keekorok Tent with Pool or Forest Tent with Pool receive shared game-drive vehicle use.	\N	0
9868d4b9-bea1-49fb-b31f-622d6069fb02	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	3
99422777-a254-4868-adc4-053d13e0582f	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
9afea59f-51df-4bfe-92b2-bdaa13dd6e46	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	10
9ece49ee-3e8e-4fff-b525-df2441c3461c	3becabc0-2844-47e8-a330-f83a44db48cc	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
a034c6f9-4648-4629-b6f3-63cd65ef9d14	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Vehicle	\N	For two adults, Safari Collection Explorer guests receive shared game-drive vehicle use.	\N	0
a14c9cfe-8d4d-4a0a-b933-cc8e83de9b3b	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	a9151242-f2f0-4633-9771-cec31507a780	\N	\N	14
a255ab13-8a38-4004-823f-178d25045c6b	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
a45bbb20-ee62-4e28-aeec-2c5c7a7932eb	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
a53231ca-a23f-4823-9151-033eb8d04b53	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	5222a5e2-40ce-47ab-a4a8-cd1d65853bff	\N	\N	6
a9a99a5c-db6c-41ec-acb3-dc04799e987c	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	a9151242-f2f0-4633-9771-cec31507a780	\N	\N	12
ac815650-a2b0-413f-9b24-b8796e6c2f52	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	1
acc94394-df3b-4095-a554-0dec2cb90d73	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Highlight	0501e344-a643-40e5-8dfb-27648183e3c4	\N	\N	3
aceb564e-3715-49bb-b6cc-58563b78c20b	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	a3c836d4-8ff2-4bd4-8816-2dda253459f2	\N	\N	11
adf2dba7-6684-42f3-ab47-d734a1f1e38f	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	3974ba56-869f-416b-8319-45260065f4c1	\N	\N	11
ae392d3c-01b7-4cb7-bbd9-6d14824e2169	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Vehicle	\N	Private exclusive vehicle use is available at an extra charge of $490 per day.	\N	1
b50052e0-155d-4926-aef3-1b7648203de7	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Highlight	8c331ab1-987b-4a73-b101-bba173f1a5e0	\N	\N	2
b74e079c-a2b4-4b22-bafa-dfce8900716a	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	Laundry service	\N	2
b7ceb87d-cb7e-4d0d-b2e8-587859e5307e	3becabc0-2844-47e8-a330-f83a44db48cc	Included	5222a5e2-40ce-47ab-a4a8-cd1d65853bff	\N	\N	6
bc15d298-c082-4a3d-907b-dd34aa4257cc	3becabc0-2844-47e8-a330-f83a44db48cc	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	\N	\N	2
bd9e2034-18f7-49fb-b375-4c246f7eb959	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	12
be7975b4-f8ee-4b79-8687-7ffbbfa87da6	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
c073d922-4e78-4c0f-983f-0f430197f0da	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	4
c0bf04e2-6ff8-4ca1-b6dc-9ed98bdc9ed3	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Highlight	8c331ab1-987b-4a73-b101-bba173f1a5e0	\N	\N	2
c224a578-dac5-4b9e-87e8-c6edb1436656	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Excluded	e5a0ba2b-a8b8-4093-8672-3d8d8f6d592f	\N	\N	3
c26bdb4a-ce55-435a-b5b9-017fde0c003a	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	b4ba5418-17cb-4de2-a550-4c16ea5c9dd3	\N	\N	14
c2ecf5d7-5c67-4d78-bbe4-0d299c206d41	3becabc0-2844-47e8-a330-f83a44db48cc	Highlight	f8c7fe88-bf72-4a74-b3a3-45ca527dfa8c	\N	\N	1
c349ab6c-f42c-4a76-8166-0af45ee4c4c7	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	48027ec6-d4f9-42b2-9ff2-459ad39dfdac	2 nights in a luxury tent with private plunge pool	\N	0
c3c78fae-d6b5-4e89-bca3-0080734d9ada	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
c60e09dd-2a8f-409e-946c-cf8350bc7232	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	8
c6df3f64-527a-492d-b6fb-2e1ab55dae40	0ae7b7eb-acae-481d-9606-b99cdb5af83e	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	0
c79d3c8d-795b-456c-9bfa-93520f5979cc	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	20d438f1-6cd7-4182-87c9-21928942f318	\N	\N	9
c83bec81-8ad3-413e-9c61-6d7baf64938f	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	0
c89a93b8-c5d3-4e5d-be21-6a00cc171b5b	46a039e6-d50d-4f47-ac0e-30ab22d97535	Excluded	eede9629-2716-46c7-9fcf-406c54cd6b3f	\N	\N	4
c8e03af7-c43b-4535-a562-9d57c3cfc71d	76d3ed1d-0d97-46e5-96b8-365498c4f85b	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	1
c9afcd39-e3e1-4ad4-a3e6-715bc9ef8346	46a039e6-d50d-4f47-ac0e-30ab22d97535	Note	\N	Children aged 3 to 11 are classed as children, guests aged 12 and over as adults, and infants aged 0 to 2 stay free.	\N	3
ca5197a9-8a08-4af9-a29c-a2e043665325	0ae7b7eb-acae-481d-9606-b99cdb5af83e	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	1
cacc6bca-c109-4b80-818f-a3ec73aef9d6	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	10
cbe36264-3bf0-4747-a3f3-d57ae6adec57	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Highlight	8c331ab1-987b-4a73-b101-bba173f1a5e0	\N	\N	2
cbe3e303-de59-4c25-ab2a-9e3a6e36e85e	3becabc0-2844-47e8-a330-f83a44db48cc	Included	01a3db82-ee8e-4965-a87d-f603e9eacbd4	\N	\N	13
ccb0012a-ada0-4f2b-b7eb-b0f2a252162b	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Highlight	f8c7fe88-bf72-4a74-b3a3-45ca527dfa8c	\N	\N	1
ce9401bb-3f94-479c-a998-e5afa99363b4	3becabc0-2844-47e8-a330-f83a44db48cc	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	10
ce9b6e7c-81e3-422a-8e81-b20d6c34a8c8	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	78deb886-ccd0-40a4-adde-63361e4da68c	\N	\N	2
d125da58-dfb5-4e65-aec6-8108c4696a63	3becabc0-2844-47e8-a330-f83a44db48cc	Included	48027ec6-d4f9-42b2-9ff2-459ad39dfdac	4 nights in a luxury tent with private plunge pool	\N	0
d2e5bbdf-5495-49fd-8ea1-337caf367211	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	1
d5b4c9f8-e167-448e-a748-1154374e6fee	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Highlight	f8c7fe88-bf72-4a74-b3a3-45ca527dfa8c	\N	\N	1
d7426314-e7bb-40b5-ac23-83028b4b5252	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	e6040660-0d06-4f1d-bf65-7d1d5c6db260	\N	Subject to applicable collection and departure times.	9
d74e43df-fa79-49ce-9211-5c2bb594756f	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	037c2c14-563b-4c47-957f-e991571c2c55	\N	\N	9
d75871fd-07fb-40a7-8852-ae287f1a6d99	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	57e1dc5f-c01a-4deb-be90-cdb9c5207a9f	\N	\N	5
d84a366f-b429-4e05-91cb-99572e1d81df	46a039e6-d50d-4f47-ac0e-30ab22d97535	Note	\N	Check-in is from 12 noon and check-out is by 10:00 a.m.	\N	0
d8f6b071-b839-4959-a3e2-f6eca6a1f2cb	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	5222a5e2-40ce-47ab-a4a8-cd1d65853bff	\N	\N	8
d9c6f60c-d4c0-4253-98c7-7d81d0193879	46a039e6-d50d-4f47-ac0e-30ab22d97535	Included	b17f4b12-ceda-4499-b696-b2a28116674e	\N	\N	5
dceca53e-a0f1-49d2-81ec-5e8fab9a7e9f	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	\N	\N	6
df836364-f852-4f60-8a2c-8f8a5cb00547	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
df9b914c-6e5d-479a-8d54-857e99605a07	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	037c2c14-563b-4c47-957f-e991571c2c55	\N	\N	7
e08b7b2a-72e6-49b5-92a2-3f6743b99656	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Excluded	4f48f79b-1db3-4be8-a41e-868f477287f6	\N	\N	5
e0dd28b9-94e6-490a-9b70-f5c0029d5c2d	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Vehicle	\N	For two adults: Sala's Extended Mara Experience guests staying in the standard Keekorok Tent with Pool or Forest Tent with Pool receive shared game-drive vehicle use.	\N	0
e11cb748-e0c1-4e57-a93e-7d36c39fd7b7	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	10
e120db30-8a6a-47b7-87d5-701447bdc4ea	3becabc0-2844-47e8-a330-f83a44db48cc	Highlight	ccdcb881-b143-41ec-a22a-ad793438a741	\N	\N	0
e1537dff-a20d-460c-9f10-2898ac9554b0	3becabc0-2844-47e8-a330-f83a44db48cc	Included	e6550ec4-006c-4782-a29b-54c9d3bf97df	\N	\N	8
e24bdefb-5744-430f-a92c-c5a4ea63cacd	3becabc0-2844-47e8-a330-f83a44db48cc	Included	89474492-8f77-4eb6-baa8-a60762d5cdd6	\N	\N	3
e28e8810-d028-477b-9f7f-1f8ba7859d1e	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
e466429e-fa16-4cf6-af1f-6d7532181959	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	a3c836d4-8ff2-4bd4-8816-2dda253459f2	\N	\N	11
e5c27c52-cba6-4a24-bfb3-19608c00e724	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
e687ea0d-d454-4c05-a6b1-8012da2f380d	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	a3c836d4-8ff2-4bd4-8816-2dda253459f2	\N	\N	11
e7cf7924-e07d-424f-8c46-6751d38297d1	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Vehicle	\N	Private exclusive vehicle use is available at an extra charge of $490 per day.	\N	1
eadbee13-b559-45ca-9f8e-0197adbfa3b6	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Excluded	e5a0ba2b-a8b8-4093-8672-3d8d8f6d592f	\N	\N	3
eb0813f0-c6d0-45db-b428-43f059d55eb2	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	01a3db82-ee8e-4965-a87d-f603e9eacbd4	\N	\N	15
eb0e45bc-845a-404e-b8c2-15df1b048f0f	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	e6550ec4-006c-4782-a29b-54c9d3bf97df	\N	\N	8
eb360be7-8eb8-4851-b143-7feba2548327	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	4
ebe30162-8162-441f-b36f-af0777f7fb96	3becabc0-2844-47e8-a330-f83a44db48cc	Excluded	4f48f79b-1db3-4be8-a41e-868f477287f6	\N	\N	5
ec949bfe-7fab-4f18-a118-48e99d3caa58	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	a3c836d4-8ff2-4bd4-8816-2dda253459f2	\N	\N	13
ed4b0e01-298e-4e74-9b07-afcf7192d8e3	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	5222a5e2-40ce-47ab-a4a8-cd1d65853bff	\N	\N	6
edb6fbb9-701b-437a-b71b-7053e5712cc0	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	a9151242-f2f0-4633-9771-cec31507a780	\N	\N	12
eed930f4-365e-4288-af1a-8c34da07760e	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Highlight	ccdcb881-b143-41ec-a22a-ad793438a741	\N	\N	0
eeecafc8-c464-411f-95ad-62684f08bcc1	3becabc0-2844-47e8-a330-f83a44db48cc	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
ef719819-58ac-442f-a8fc-f990caaae90f	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Included	b4ba5418-17cb-4de2-a550-4c16ea5c9dd3	\N	\N	14
ef9f83f9-6701-4741-b63a-b684f556b009	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
efa58aa3-2277-4f3e-9624-500274e271f9	3becabc0-2844-47e8-a330-f83a44db48cc	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
f06c8e7f-6bc0-4c9a-9a43-72c7eb1eaac9	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Highlight	8c331ab1-987b-4a73-b101-bba173f1a5e0	\N	\N	2
f2a909ea-f35c-4ba7-8fa6-e0151fd56c14	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	89474492-8f77-4eb6-baa8-a60762d5cdd6	\N	\N	3
f30cd968-4326-4b39-b3ff-e69e295253a9	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
f42f6d0c-daa7-4018-86d0-eb15a9c01ec8	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
f7e86124-6b82-4d9c-93af-b572bd90b125	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Vehicle	\N	Private exclusive vehicle use is available at an extra charge of $490 per day.	\N	1
f81a806b-a165-44ca-9426-3c185b641d57	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Included	57e1dc5f-c01a-4deb-be90-cdb9c5207a9f	\N	\N	7
f82dc684-4723-47e3-8498-8dbe2e231c25	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Included	ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	\N	\N	4
fa98cb10-ac09-4a0b-bd8a-2836503e2c93	3becabc0-2844-47e8-a330-f83a44db48cc	Included	20d438f1-6cd7-4182-87c9-21928942f318	\N	\N	9
fadd1db5-03e1-44d1-bde9-d88f8dc75a45	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	0
fbaa5ba3-973c-42f6-b692-ab6c82fff5c4	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	01a3db82-ee8e-4965-a87d-f603e9eacbd4	\N	\N	15
fcb01523-626f-4ac2-a4ea-db833f89c5b9	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Included	57e1dc5f-c01a-4deb-be90-cdb9c5207a9f	\N	\N	7
05cd3285-285d-4794-819d-5cb8f6feb1d4	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Note	\N	Check-in is from 12 noon and check-out is by 10:00 a.m.	\N	0
148599b9-c107-4338-9e88-16ca3f51879c	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Note	\N	Arrival and departure transfers are included when the arrival collection is after 11:30 a.m. and the departure transfer is before the 10:00 a.m. check-out.	\N	2
2cd8c264-f8a2-42e1-8f61-f1d3b8567429	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	3
36130c2f-af87-4e56-9413-e0b5a9420434	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	3
64bac7f1-3944-41d6-9634-fd0c3c519fd0	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Note	\N	An early arrival or a late departure may need Retreat access booked separately, subject to availability.	\N	1
6e9dd109-c112-4b07-aefc-9b908cdd372d	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Excluded	5ed14816-6744-407b-b9c7-3e25dec318af	\N	\N	5
7bff2b81-62b3-4632-a10e-0ca89e4be216	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	Meet & greet service at the airport	\N	1
7f630afb-3679-45ce-8a71-334f1eef0910	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	b17f4b12-ceda-4499-b696-b2a28116674e	\N	\N	5
8922a414-2c35-473c-9eb5-ad9b7ce52440	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	Laundry service	\N	2
a6acb46a-30f0-48c8-820d-759f776f9b03	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	8
abb802c2-f644-48c4-8f75-55fd677f4a62	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	VIP transfer from home to airport	If required	0
b4716ede-3e7b-441b-806c-c24136cd545d	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Note	\N	Children aged 3 to 11 are classed as children, guests aged 12 and over as adults, and infants aged 0 to 2 stay free.	\N	3
b4756f4c-07ee-4c20-878d-8e336d10ad69	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
b916b922-de7a-4111-8b6e-5a156cca1a43	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
bbc177cd-68e7-4c57-9af5-1d9788cd0e2a	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
be3651f3-e0c7-4af8-be40-fa27851c1765	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	ab597b1d-b14b-49e5-b735-42e59c1455bc	\N	\N	6
cb404229-7d53-45df-8bcf-7881dd108e7e	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	861b903c-b7c1-4cb2-a8e4-b052dc780ec5	\N	\N	4
d87e817a-62d9-4387-af55-6bb566d8170c	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Excluded	eede9629-2716-46c7-9fcf-406c54cd6b3f	\N	\N	4
e00c5a03-a243-4f93-91fd-92faf28bba32	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Note	\N	Child sharing and extra bed arrangements are confirmed with the booking where they apply.	\N	4
e1ff1e90-6cdf-46f2-93d9-0b233c8802dc	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	4578c46a-05f6-4efc-8689-23d57bf4ba05	\N	\N	7
e431fba6-2da2-4334-a345-ef97f1b042a3	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
ebbca30a-9352-4565-af7c-927d265e3eba	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
ef007848-2da5-4651-af38-975172c8337f	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
f59eb0f7-2626-449d-8bf0-6c23f8650b63	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	1
fddd9b7a-5d3e-45fc-8d54-49b398c0dca6	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Included	e6040660-0d06-4f1d-bf65-7d1d5c6db260	\N	Subject to applicable collection and departure times.	9
0bde4fb3-60ed-49dc-a2a5-f906838c9ff4	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Note	\N	An early arrival or a late departure may need Retreat access booked separately, subject to availability.	\N	1
0c81afaa-7461-4669-987e-535f5d6c96e8	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
0e3e13bc-4f58-4dba-b53a-34bdeeffefc2	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	e6040660-0d06-4f1d-bf65-7d1d5c6db260	\N	Subject to applicable collection and departure times.	9
1614b9be-8b3f-4d74-b12b-656f5319f014	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	ab597b1d-b14b-49e5-b735-42e59c1455bc	\N	\N	6
19fcc7ce-e352-44ec-a177-32b905b5bf7b	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Note	\N	Children aged 3 to 11 are classed as children, guests aged 12 and over as adults, and infants aged 0 to 2 stay free.	\N	3
230dd72f-7698-4cc0-b43b-81bb03d9a79b	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Note	\N	Arrival and departure transfers are included when the arrival collection is after 11:30 a.m. and the departure transfer is before the 10:00 a.m. check-out.	\N	2
2b1978f6-34e5-4cd4-87b5-03f20e3100dd	5daabefd-e115-48ab-a84e-33e6eb68f7f9	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	VIP transfer from home to airport	If required	0
2f443464-5c24-4e7f-a3b4-32e9d95f8f7e	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	861b903c-b7c1-4cb2-a8e4-b052dc780ec5	\N	\N	4
45a6f68a-5a48-483e-b854-b5166d71e7ab	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	b17f4b12-ceda-4499-b696-b2a28116674e	\N	\N	5
4bbe0989-70f5-4854-8a00-aa4f58b13995	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Note	\N	Check-in is from 12 noon and check-out is by 10:00 a.m.	\N	0
4c89c8d2-c389-4e91-af48-10a40ad75d7a	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	3
551bd3f9-6e5f-42e4-8ffe-7a2ac7e25239	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	4578c46a-05f6-4efc-8689-23d57bf4ba05	\N	\N	7
584733ff-3c89-4c8c-ace9-0df1d38b994e	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Excluded	eede9629-2716-46c7-9fcf-406c54cd6b3f	\N	\N	4
609bb4ad-3055-4cb6-9d7a-70759837623c	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
638f3945-a823-44c7-8067-a0a8580d2e28	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	1
6a370d3e-8dcb-4bf7-9926-8fcdbf02d69c	5daabefd-e115-48ab-a84e-33e6eb68f7f9	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	Meet & greet service at the airport	\N	1
b1afa6ea-5e81-410a-bc99-496fb9bac547	5daabefd-e115-48ab-a84e-33e6eb68f7f9	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
b41ecfd3-3eca-4816-a16c-c2588e0fe503	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	8
cf65b946-0cb3-4a2a-8f3a-be4e4f2770c1	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
d13511b9-82ca-42ea-a69b-5f8dbbb3d960	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	3
d57ddc0a-b706-447a-a797-22b89b6dc889	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
dca40b98-5d98-4bb1-baec-07d62a3e1d8f	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Note	\N	Child sharing and extra bed arrangements are confirmed with the booking where they apply.	\N	4
de0ae57b-2234-4eb3-82ea-888954f8cd77	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
f4c9b0f4-88fa-43e0-b633-4a276e54fefe	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	Laundry service	\N	2
f8cc0953-2bc9-4c61-a44c-bd19a12d9348	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Excluded	5ed14816-6744-407b-b9c7-3e25dec318af	\N	\N	5
074e1bd2-303d-41ee-a5dd-b8111ccebd49	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
0d84bc57-07f0-4fbb-b406-300b4f65e8e7	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	VIP transfer from home to airport	If required	0
16e8ae9a-bb5e-4ffb-9d78-6450e4c83c41	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
1da8e5b3-9979-4d13-98f8-6afef2ec893b	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Note	\N	Check-in is from 12 noon and check-out is by 10:00 a.m.	\N	0
4e19297c-1f8d-4d7d-b8a1-7b70c53a8728	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	b17f4b12-ceda-4499-b696-b2a28116674e	\N	\N	5
5b80e638-b2bc-4e78-87f9-5ad712f0b5e6	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Note	\N	Child sharing and extra bed arrangements are confirmed with the booking where they apply.	\N	4
5fa7d1b5-37b4-41cc-90c2-86c76a210199	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Excluded	5ed14816-6744-407b-b9c7-3e25dec318af	\N	\N	5
6be82ccc-2a0a-41df-afc2-ed26b5887c4d	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Note	\N	An early arrival or a late departure may need Retreat access booked separately, subject to availability.	\N	1
73cd79eb-4605-4896-a78b-cf7271cefa4c	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Note	\N	Arrival and departure transfers are included when the arrival collection is after 11:30 a.m. and the departure transfer is before the 10:00 a.m. check-out.	\N	2
75e08783-9a7d-4629-a3d2-55d132f0a6b6	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	3
76496d79-3e38-4f9a-8ad7-0d369231f7ea	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	1
7fe18540-6bdd-465c-8b34-1f4f61bafdb5	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	Laundry service	\N	2
84d72698-28af-4d6d-b7fa-1d919b709dd8	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Excluded	eede9629-2716-46c7-9fcf-406c54cd6b3f	\N	\N	4
8bbc3e41-479b-4a09-a7d5-b0fe14d5d9c9	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	8
8f62c44b-fef6-41c1-8d2c-b8613a54a915	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
953302ce-5138-4556-a462-c368b16e2845	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	e6040660-0d06-4f1d-bf65-7d1d5c6db260	\N	Subject to applicable collection and departure times.	9
ac9b407c-f086-4a69-a333-887148a229b5	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	861b903c-b7c1-4cb2-a8e4-b052dc780ec5	\N	\N	4
be68fe1e-609f-407f-ab54-83572cab8938	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Note	\N	A third child is charged in addition to the suite minimum.	\N	5
d2e1176f-6b08-493d-8746-143b6a43b90c	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
d6badd2c-896c-4aa9-9b50-e4bac1de26d1	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	ab597b1d-b14b-49e5-b735-42e59c1455bc	\N	\N	6
dfc27abc-ce82-41ff-aed3-a96a7bd1197a	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
e3c65c6b-0101-4aa5-8a6c-4ac46deae1dd	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
e49ccec4-e41a-4f84-a9ab-7c64c87443ff	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	3
f0d77921-e55c-4a3f-9732-b4a593c8b8ed	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	Meet & greet service at the airport	\N	1
f9865196-eb09-483d-bc91-802d096acce9	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Note	\N	Children aged 3 to 11 are classed as children, guests aged 12 and over as adults, and infants aged 0 to 2 stay free.	\N	3
fb4a93ff-bb87-403c-b446-616d022b5647	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Included	4578c46a-05f6-4efc-8689-23d57bf4ba05	\N	\N	7
04ee1b55-adc1-4c65-a525-81916a851c92	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	b17f4b12-ceda-4499-b696-b2a28116674e	\N	\N	5
1b38e601-b4eb-4f0e-be25-c3e4a815360c	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Note	\N	Children aged 3 to 11 are classed as children, guests aged 12 and over as adults, and infants aged 0 to 2 stay free.	\N	3
269beea0-132a-4b4e-9b5b-e6bd17984dd6	d4d1b4e2-95d8-41fc-88a7-a25103292e81	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	VIP transfer from home to airport	If required	0
2a9e9bf9-f0b8-430a-a7af-dd3a00f42aa3	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
32afd72a-069a-43df-b7e9-cdeebd93194b	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	8
37a15bfb-ed9d-4faf-869c-ad52fb29e256	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Excluded	eede9629-2716-46c7-9fcf-406c54cd6b3f	\N	\N	4
3dfd5f09-a5c6-4c1f-a1c5-9caa12048e13	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Note	\N	An early arrival or a late departure may need Retreat access booked separately, subject to availability.	\N	1
5c487a20-dc9d-456a-b529-87a7579aa2b4	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
60b4a20a-5c70-4482-99f8-4ae940f7c19c	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Note	\N	Arrival and departure transfers are included when the arrival collection is after 11:30 a.m. and the departure transfer is before the 10:00 a.m. check-out.	\N	2
6d4f5c08-4fae-47a1-96a9-cdd9569080e0	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	e6040660-0d06-4f1d-bf65-7d1d5c6db260	\N	Subject to applicable collection and departure times.	9
7a03193a-223d-4da2-ae62-d567a9f73b78	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	Laundry service	\N	2
8c2d28ec-0b2a-4daf-8d55-356915fc7291	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	3
93bc520f-3534-4bdd-b5e5-56e915e4de1e	d4d1b4e2-95d8-41fc-88a7-a25103292e81	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
b870ada5-fdb9-492f-97a2-fcabefd4b02d	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
bb2066a9-93e1-4e15-aa67-6764c8453de3	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Note	\N	Check-in is from 12 noon and check-out is by 10:00 a.m.	\N	0
bdd11309-acbb-4e62-88f9-63c81a0af3c6	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	ab597b1d-b14b-49e5-b735-42e59c1455bc	\N	\N	6
c4eb177d-f45a-4df1-9358-4e8ae52dae85	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Excluded	5ed14816-6744-407b-b9c7-3e25dec318af	\N	\N	5
c701540e-56a8-4029-91dd-6c0bcf4fc41f	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
d0830b7c-d06e-45c0-8d4b-37028a4544de	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	861b903c-b7c1-4cb2-a8e4-b052dc780ec5	\N	\N	4
d7d6d5ae-2461-4d91-9d4f-45956806f6f8	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
dbf5e445-79ad-4380-9eec-c2ba02650110	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	3
de148c2d-cc5b-4e87-9dd5-d4cd67b45488	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Note	\N	Child sharing and extra bed arrangements are confirmed with the booking where they apply.	\N	4
f0213bec-d352-4f4e-a59e-bbbc4b1cbc14	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	1
f37a7a8d-54e6-4bd6-9d8f-7754330c01cf	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Included	4578c46a-05f6-4efc-8689-23d57bf4ba05	\N	\N	7
f6c4edbd-27aa-4173-914e-d96e1ab17a83	d4d1b4e2-95d8-41fc-88a7-a25103292e81	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	Meet & greet service at the airport	\N	1
099ae844-0930-48c9-93d8-7528b793bad4	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	ab597b1d-b14b-49e5-b735-42e59c1455bc	\N	\N	6
0d08a810-af0a-4460-a1cb-f9d792d4f166	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
105de84c-2464-408e-9b0b-bc1b2a5f0eb6	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
1ed0c026-dc62-4b13-af51-d03d06f58267	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	1
1fb6a167-ab60-40c8-9f0d-3889385dc608	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Note	\N	Arrival and departure transfers are included when the arrival collection is after 11:30 a.m. and the departure transfer is before the 10:00 a.m. check-out.	\N	2
2525ab8b-4885-4a7a-b19c-ccd8f23f1e9b	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Excluded	eede9629-2716-46c7-9fcf-406c54cd6b3f	\N	\N	4
269eb703-68b9-4e7b-b49a-423c4f10af6f	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	4578c46a-05f6-4efc-8689-23d57bf4ba05	\N	\N	7
31ae5a9d-c426-440e-91e7-eb9e2cb1bb8c	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	e6040660-0d06-4f1d-bf65-7d1d5c6db260	\N	Subject to applicable collection and departure times.	9
3acd0521-b69a-4374-a2a3-4fa77beacfab	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	861b903c-b7c1-4cb2-a8e4-b052dc780ec5	\N	\N	4
3c89696e-293b-45a9-9a18-66a3b014a8b8	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	8
428920ad-5452-430f-bfe4-579176c40ebd	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	b17f4b12-ceda-4499-b696-b2a28116674e	\N	\N	5
58600158-cccf-403f-8d03-8733a1fd44ce	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
65df1892-0b26-4998-bcf1-d1be5d36695d	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
6e3c5467-e341-4a23-b2b5-8cecb0d90525	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	VIP transfer from home to airport	If required	0
81f4acf3-0250-4c35-8747-5e021fbede53	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Note	\N	Check-in is from 12 noon and check-out is by 10:00 a.m.	\N	0
8b1ba9c9-3e2b-4ef9-8523-f7630beb4f15	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
96f352c6-bc33-4a84-b058-85a782c32add	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	3
99ff6ad3-dfcb-494e-81b4-712101b6e074	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Note	\N	Children aged 3 to 11 are classed as children, guests aged 12 and over as adults, and infants aged 0 to 2 stay free.	\N	3
ac75d616-1637-4d3d-9a9c-53756fe0d5e2	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	Laundry service	\N	2
af5f2728-55fa-4315-b91c-21fa5f964b63	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
ba5101e7-6e0b-41a7-9d36-91203ef163e9	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Note	\N	An early arrival or a late departure may need Retreat access booked separately, subject to availability.	\N	1
bb86371f-f8d3-4434-903c-40c85dd6856c	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	Meet & greet service at the airport	\N	1
c2150eeb-6d17-4464-b86e-8d2566737a28	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	3
c630498c-2442-4f0e-bbbe-995172ddc47c	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Note	\N	Child sharing and extra bed arrangements are confirmed with the booking where they apply.	\N	4
cdbf7f15-424f-4484-b45a-bf49d3da3763	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Excluded	5ed14816-6744-407b-b9c7-3e25dec318af	\N	\N	5
05a7d2ac-93e1-415a-80f7-928d6944bba8	695be048-ccc7-4aa5-aa00-46e16d238edf	Note	\N	Nairobi National Park fees are not included.	\N	0
1ba819a9-1558-41ec-90e3-387b8601eb1e	695be048-ccc7-4aa5-aa00-46e16d238edf	PremiumService	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
311a7811-2518-4eb2-8214-6cabca3324c6	695be048-ccc7-4aa5-aa00-46e16d238edf	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	1
3def28bf-6a0e-485c-9b58-3af5c066326f	695be048-ccc7-4aa5-aa00-46e16d238edf	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	3
41962337-1937-4c6f-90a8-54de4522194d	695be048-ccc7-4aa5-aa00-46e16d238edf	Excluded	eede9629-2716-46c7-9fcf-406c54cd6b3f	\N	\N	4
477bf3ed-eb9d-440f-a740-3316e8541123	695be048-ccc7-4aa5-aa00-46e16d238edf	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	Laundry service	\N	2
4e516e58-4c36-4202-b341-839c70f4bd52	695be048-ccc7-4aa5-aa00-46e16d238edf	Excluded	2ce2ac79-841c-465b-923f-5dc5106b44e3	\N	\N	3
576bc290-0669-4129-8f74-548d0b27f88e	695be048-ccc7-4aa5-aa00-46e16d238edf	Included	372e5cc9-ad2f-429d-8807-8a4531495a88	\N	\N	5
67bbbbac-eef3-4adb-b2e3-599a610544ee	695be048-ccc7-4aa5-aa00-46e16d238edf	PremiumService	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	VIP transfer from home to airport	If required	0
67f1f631-91bb-4947-b23b-6c2492e5c3e9	695be048-ccc7-4aa5-aa00-46e16d238edf	Excluded	c0fc5481-9e17-48d5-8237-fb6a8dc39134	\N	\N	2
6d9a5f08-672a-4ca4-8132-824f14c46600	695be048-ccc7-4aa5-aa00-46e16d238edf	Excluded	5ed14816-6744-407b-b9c7-3e25dec318af	\N	\N	5
8ef5549b-9d2a-4823-8e07-01d21ea5b8c3	695be048-ccc7-4aa5-aa00-46e16d238edf	Excluded	de9ac8e5-85f5-4c7c-8c54-b31d83f94636	\N	\N	0
b617a5ff-6201-40e3-af89-7776330f0f2b	695be048-ccc7-4aa5-aa00-46e16d238edf	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
bb30c987-c092-4700-9303-438a62f55dec	695be048-ccc7-4aa5-aa00-46e16d238edf	Included	5222a5e2-40ce-47ab-a4a8-cd1d65853bff	\N	\N	4
c3e0e06f-7807-46ff-b7bd-b5af7331097c	695be048-ccc7-4aa5-aa00-46e16d238edf	PremiumService	06d26b77-6072-47c1-a8c9-7f41997e7e83	Meet & greet service at the airport	\N	1
c903bd13-b081-43eb-9cdb-421ef5e3cfa1	695be048-ccc7-4aa5-aa00-46e16d238edf	Excluded	55a674d9-c7ff-438e-b14f-81c304b70f52	\N	\N	6
d4b61a9f-f52b-4e66-8b31-a47c647097f8	695be048-ccc7-4aa5-aa00-46e16d238edf	Excluded	a55e53f2-a1e9-479a-a536-6780bf407a41	\N	\N	1
fc94c287-1a6c-44c9-8904-e81dc7799074	695be048-ccc7-4aa5-aa00-46e16d238edf	Included	85cbb574-c2e8-490c-8e73-3db3473d33ff	\N	\N	6
\.


--
-- Data for Name: PackageMedia; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."PackageMedia" ("Id", "PackageId", "Role", "Path", "Alt", "Caption", "Width", "Height", "VideoProvider", "VideoId", "VariantsReady", "SortKey", "CreatedAt") FROM stdin;
5d1f504b-eaec-44db-b246-1fdd35b69636	695be048-ccc7-4aa5-aa00-46e16d238edf	Hero	/media/packages/695be048ccc74aa5aa0046e16d238edf/2821e8881d4e41f9add81f84b3470e79.jpg	Magical Bush Breakfasts	\N	\N	\N	\N	\N	f	0	2026-10-27 06:27:55.103534+00
85c2e67c-6b16-4439-84cc-fbce06ab5406	695be048-ccc7-4aa5-aa00-46e16d238edf	Gallery	/media/packages/695be048ccc74aa5aa0046e16d238edf/fd8672ccf53943d2a49c799f0c088a99.jpg	A quiet moment with one of the Manor’s tallest…	\N	\N	\N	\N	\N	f	1	2026-10-27 06:28:00.346948+00
0d410954-3f6d-40b0-98f1-f001c8b03853	695be048-ccc7-4aa5-aa00-46e16d238edf	Gallery	/media/packages/695be048ccc74aa5aa0046e16d238edf/5a9bc9de8b1a4a988ba9ddc4be3915f0.jpg	giraffe manor family celebration	\N	\N	\N	\N	\N	f	3	2026-10-27 06:28:20.424161+00
08059155-065c-4e52-a211-10136c438ed1	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Gallery	/images/packages/gm-savanna.jpg?for=salas-classic-safari	An acacia tree at sunset on the savanna	\N	\N	\N	\N	\N	t	1	2026-10-16 03:06:40.798023+00
ce54fd3e-0e43-4212-8907-87171000b508	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Gallery	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/0b3c7ea8c5b943689580a2271ab52994.jpg	CONSERVANCY SECRETS OL PEJETA	\N	\N	\N	\N	\N	f	1	2026-10-27 06:36:32.328099+00
45815461-9d54-48cf-b1fd-69b11e174bf1	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Gallery	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/f422c02f8c0146bb93767db902a2db17.jpg	Elegant Power Murchison's Beauty	\N	\N	\N	\N	\N	f	2	2026-10-27 06:36:36.610314+00
da073999-2df7-40a3-9b69-bf800383aac4	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Gallery	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/8534c4f6a4e7400986560a8428f1f8a3.jpg	Tusks & Peaks Amboseli's Elephant & Kilimanjaro Vista 🐘🗻	\N	\N	\N	\N	\N	f	3	2026-10-27 06:36:43.658953+00
9f66416f-1973-4919-a158-88db0ad4a3d5	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Gallery	/media/packages/f415c589bdfc4fd1804dffa5fff66ac6/4038f96b1b2544c28b2b35e62e3cdf93.jpg	421086633904840382	\N	\N	\N	\N	\N	f	1	2026-10-27 06:39:41.381004+00
6e66f4cb-c3fc-42ab-8935-d0ae0cd9f853	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Hero	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/a5629b0680ae4747b3b46578c0c492e7.jpg	𝐌𝐀𝐀𝐒𝐀𝐈 𝐌𝐀𝐑𝐀 🇰🇪– Considered The…	\N	\N	\N	\N	\N	f	0	2026-10-27 06:43:47.335139+00
04823132-185e-42e1-b405-1691f598d9ec	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Gallery	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/98e379517f134f70bda0483496dcbb1a.jpg	𝐌𝐀𝐀𝐒𝐀𝐈 𝐌𝐀𝐑𝐀 🇰🇪– Considered The…	\N	\N	\N	\N	\N	f	1	2026-10-27 06:43:52.569801+00
fd77cde0-ed01-495d-bce6-6df7ed1e727d	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Gallery	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/8df919a4dff04216ba2bff5c2a8931a0.jpg	African honeymoon hotspots	\N	\N	\N	\N	\N	f	2	2026-10-27 06:43:57.794782+00
55e08775-6dd7-409a-9fab-92209df44c16	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Gallery	/media/packages/5daabefde11548aba84e33e6eb68f7f9/4886d6d38e73476ca0aa59111915467a.jpg	giraffe wildlife escape	\N	\N	\N	\N	\N	f	3	2026-10-27 06:29:52.800651+00
a6220344-855c-4f34-bdb6-9cabc6647000	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Gallery	/media/packages/5daabefde11548aba84e33e6eb68f7f9/7ee692a7495143e081e46fb3c67d7e01.jpg	giraffe family celebration 3nights	\N	\N	\N	\N	\N	f	2	2026-10-27 06:30:20.401911+00
29657589-b3c9-4004-acf9-704f0df581a6	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Gallery	/media/packages/5daabefde11548aba84e33e6eb68f7f9/5b6f44fd79e54e7f95782ad797063995.jpg	giraffe manor signature escape	\N	\N	\N	\N	\N	f	1	2026-10-27 06:29:57.490488+00
ef2f462f-cf0d-46f3-b7f4-c72f71e9ae84	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Hero	/media/packages/5daabefde11548aba84e33e6eb68f7f9/868306afe7094f008e709381046eda10.jpg	e139bcf05fcf158843402bbaaf704ca9	\N	\N	\N	\N	\N	f	0	2026-10-27 06:30:04.258351+00
90eff34a-9e59-4320-b4f6-8f6f16b56f40	695be048-ccc7-4aa5-aa00-46e16d238edf	Gallery	/media/packages/695be048ccc74aa5aa0046e16d238edf/cc8c7435af6e4005b0ac56c639826468.jpg	242561129994262996	\N	\N	\N	\N	\N	f	2	2026-10-27 06:28:05.550269+00
136e638e-b4dd-4266-b23e-cd1cda03e2ce	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Gallery	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/d51b43e2c7cb4886bfabf99dfd16a665.jpg	From City to Savanah and Sand Kenya Safari and Beach Itinerary	\N	\N	\N	\N	\N	f	4	2026-10-27 06:36:55.40207+00
b030271b-19f3-4d80-8d9a-e544ad48e8fd	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Gallery	/images/packages/gm-pool.jpg?for=giraffe-manor-extended-family-package	A guest watching a giraffe from a lodge pool	\N	\N	\N	\N	\N	t	1	2026-10-16 03:06:40.798023+00
b5b69c87-e529-4601-9387-4af2d411e533	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-extended-family-package	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	2	2026-10-16 03:06:40.798023+00
ab6b2a97-9946-4a1c-86be-9bd90d587008	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Gallery	/images/packages/stock-lodgepool.jpg?for=salas-classic-safari	A safari lodge and its pool at dusk	\N	\N	\N	\N	\N	t	2	2026-10-16 03:06:40.798023+00
042dffe0-dfe2-4618-9983-4e23fb1b1f36	46a039e6-d50d-4f47-ac0e-30ab22d97535	Gallery	/images/packages/gm-dining.jpg?for=giraffe-manor-solo-escape	A lodge dining room with a timber ceiling	\N	\N	\N	\N	\N	t	2	2026-10-16 03:06:40.798023+00
1d23e8d8-73e1-435d-864f-388bb917f866	46a039e6-d50d-4f47-ac0e-30ab22d97535	Gallery	/images/packages/gm-giraffe.jpg?for=giraffe-manor-solo-escape	A giraffe on the open plains	\N	\N	\N	\N	\N	t	1	2026-10-16 03:06:40.798023+00
29626bb4-cf9a-4497-8987-37a5240d2d93	46a039e6-d50d-4f47-ac0e-30ab22d97535	Hero	/images/packages/gm-pool.jpg?for=giraffe-manor-solo-escape	A guest watching a giraffe from a lodge pool	\N	\N	\N	\N	\N	t	0	2026-10-16 03:06:40.798023+00
aa3224d2-797b-4eca-8266-87d6b217e41f	46a039e6-d50d-4f47-ac0e-30ab22d97535	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-solo-escape	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	3	2026-10-16 03:06:40.798023+00
c4510116-5c45-4419-b8de-e745b29ac2f5	46a039e6-d50d-4f47-ac0e-30ab22d97535	Gallery	/images/packages/gm-savanna.jpg?for=giraffe-manor-solo-escape	An acacia tree at sunset on the savanna	\N	\N	\N	\N	\N	t	4	2026-10-16 03:06:40.798023+00
2a90c349-43d9-4660-ab0c-79db12ad6c97	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Gallery	/images/packages/gm-pool.jpg?for=giraffe-manor-signature-escape	A guest watching a giraffe from a lodge pool	\N	\N	\N	\N	\N	t	2	2026-10-16 03:06:40.798023+00
4167baf2-7c19-47c7-8cb4-80195b4976e8	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Hero	/images/packages/gm-giraffe.jpg?for=giraffe-manor-signature-escape	A giraffe on the open plains	\N	\N	\N	\N	\N	t	0	2026-10-16 03:06:40.798023+00
4f1ac93e-d761-46e5-8f4a-a7799d4c1fd9	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Gallery	/images/packages/gm-herd.jpg?for=giraffe-manor-signature-escape	Giraffes crossing dry grassland	\N	\N	\N	\N	\N	t	4	2026-10-16 03:06:40.798023+00
b1bdd921-b9d5-4db1-a405-bf21391202c5	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-signature-escape	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	3	2026-10-16 03:06:40.798023+00
fed30132-13f8-49f4-aef4-9ebbbd19db63	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Gallery	/images/packages/gm-dining.jpg?for=giraffe-manor-signature-escape	A lodge dining room with a timber ceiling	\N	\N	\N	\N	\N	t	1	2026-10-16 03:06:40.798023+00
ef58c8eb-18f9-4c9b-b7dd-dc08725d7a21	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Gallery	/images/packages/gm-dining.jpg?for=giraffe-manor-extended-family-package	A lodge dining room with a timber ceiling	\N	\N	\N	\N	\N	t	4	2026-10-16 03:06:40.798023+00
21bdbddb-bb4e-4bab-9ac4-91b548d63534	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Gallery	/images/packages/gm-herd.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	Giraffes crossing dry grassland	\N	\N	\N	\N	\N	t	4	2026-10-16 03:06:40.798023+00
31e5d6ba-ba2a-40c1-9d84-17bd6c9be2cb	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	1	2026-10-16 03:06:40.798023+00
bc4a5d53-ee9c-4f63-8c1d-c556f740f565	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Gallery	/images/packages/gm-herd.jpg?for=giraffe-manor-extended-family-package	Giraffes crossing dry grassland	\N	\N	\N	\N	\N	t	3	2026-10-16 03:06:40.798023+00
cb780f0a-09ce-4567-83cd-3e1f7ae544b5	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Gallery	/images/packages/gm-lodge.jpg?for=salas-classic-safari	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	4	2026-10-16 03:06:40.798023+00
7c48168c-8f6d-43a6-8296-813a44d19a00	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Gallery	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/b4951f6811984922bf9c983455611c21.jpg	Tucked away amid the trees in the wildlife rich…	\N	\N	\N	\N	\N	f	3	2026-10-27 06:44:03.232592+00
9408e5c9-7e34-4872-83fb-e2151fbe3786	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Gallery	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/f8ae3d055f384f7ab18195eaae4dfa74.jpg	Angama Mara, Maasai Mara, Kenya Luxury Hotel Review by TravelPlusStyle	\N	\N	\N	\N	\N	f	4	2026-10-27 06:44:18.494852+00
4e6deb53-2e12-47e3-b309-79065f768cd5	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Hero	/media/packages/0ae7b7ebacae481d9606b99cdb5af83e/79d45d0e82f04bdbbd311ab79e3786cf.jpg	elewana sand river camp masai mara	\N	\N	\N	\N	\N	f	0	2026-10-27 06:33:46.863721+00
8b3b632d-23ba-4162-b42b-34d3d79ec576	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Hero	/images/packages/gm-dining.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	A lodge dining room with a timber ceiling	\N	\N	\N	\N	\N	t	0	2026-10-16 03:06:40.798023+00
e540863d-d468-4fa9-a653-94d69a8f882c	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Gallery	/images/packages/gm-savanna.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	An acacia tree at sunset on the savanna	\N	\N	\N	\N	\N	t	3	2026-10-16 03:06:40.798023+00
f1a9776e-b6b5-4a1e-a464-54da8fa66e60	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Gallery	/images/packages/gm-giraffe.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	A giraffe on the open plains	\N	\N	\N	\N	\N	t	2	2026-10-16 03:06:40.798023+00
0660fd3e-24d0-4082-b049-1d8a6ce4eec8	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Gallery	/images/packages/gm-pool.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	A guest watching a giraffe from a lodge pool	\N	\N	\N	\N	\N	t	4	2026-10-16 03:06:40.798023+00
11ca6fcd-4af4-4ea1-b6fc-19540485dff9	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Gallery	/images/packages/gm-giraffe.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	A giraffe on the open plains	\N	\N	\N	\N	\N	t	2	2026-10-16 03:06:40.798023+00
28b43b6c-9d69-492a-b3c2-04dc49ab6f12	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Hero	/images/packages/gm-savanna.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	An acacia tree at sunset on the savanna	\N	\N	\N	\N	\N	t	0	2026-10-16 03:06:40.798023+00
713bc7f3-d502-4992-806f-7c185ec34287	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	3	2026-10-16 03:06:40.798023+00
828dd204-7892-4c40-85b0-14a06bd84e20	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Gallery	/images/packages/gm-herd.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	Giraffes crossing dry grassland	\N	\N	\N	\N	\N	t	1	2026-10-16 03:06:40.798023+00
91b95793-504c-4880-b710-2432c521a791	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Hero	/media/packages/a324c89d1ba646e289dd4cdf0d314a0e/036e5dd98d944f06a257e3b8cbe39ce8.jpg	giraffe manor luxury escape	\N	\N	\N	\N	\N	f	0	2026-10-27 06:29:04.017652+00
b4123589-2349-48f5-b8cf-94939361e076	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Gallery	/media/packages/0ae7b7ebacae481d9606b99cdb5af83e/d9a73e1255324872af6fb420897efbfe.jpg	sand river camp luxury safari masai mara national reserve	\N	\N	\N	\N	\N	f	5	2026-10-27 06:34:03.084418+00
83828407-da49-4b13-86f4-87d833210870	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Hero	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/fb68915dcf48401d9d3d75430052c156.jpg	Nairobi Safari Tours	\N	\N	\N	\N	\N	f	0	2026-10-27 06:36:21.823787+00
133e9384-23c3-4243-94ad-6e05ca5d068b	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Hero	/media/packages/f415c589bdfc4fd1804dffa5fff66ac6/d542b7019fe24a26af81de4693033b1f.jpg	Fantastic game viewing opportunities from open…	\N	\N	\N	\N	\N	f	0	2026-10-27 06:39:26.094296+00
95c441b8-91e2-4e30-9a03-54786ab9fabd	3becabc0-2844-47e8-a330-f83a44db48cc	Hero	/media/packages/3becabc0284447e8a330f83a44db48cc/e63f6aa41def4d5098657ca0855f2e96.jpg	Salas Gallery Safari Living Arial View	\N	\N	\N	\N	\N	f	0	2026-10-26 12:37:18.26429+00
234ba414-7eaf-48a0-afaf-8f1719d23e05	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/99808a756ad54bbbb56bcd27a2dcb9cb.jpg	Salas Camp room with plunge pool overlooking the river	\N	\N	\N	\N	\N	f	1	2026-10-26 12:37:30.20931+00
609a5855-5ef5-49f6-8d5a-a9695fe5272a	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/8a743f229e2b46a3b194859214e43918.jpg	Salas Gallery Gamedrive Spotter	\N	\N	\N	\N	\N	f	3	2026-10-26 12:37:40.558915+00
5f231b29-6271-48b1-8045-b274d6d762e4	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/0915bc0201c54772a755995d1252f0c5.jpg	Salas Gallery Activities Hot Air Baloon	\N	\N	\N	\N	\N	f	4	2026-10-26 12:37:48.633013+00
f0d8a9fb-dc02-4cba-955b-3c7874befc94	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/9ac41f55a942485796d07e0f8970d059.jpg	Salas Camp Wooden bridge to rooms	\N	\N	\N	\N	\N	f	5	2026-10-26 12:37:57.219118+00
e4dec99a-6bdf-43d1-afcc-b3b5fea7059f	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/8963a14d00da45dcbfe2e9d47c10d14f.jpg	Salas Gallery Wildlife Arial Migration Over River	\N	\N	\N	\N	\N	f	6	2026-10-26 12:38:13.667825+00
5ff017ab-3ca8-4e10-aaba-92a1896a793f	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Hero	/media/packages/12f4b08b286b4f7ab05a3c6e14edd43c/a14c5030b32a4176be7b849c16ec39a8.jpg	sala s camp deck overlooking	\N	\N	\N	\N	\N	f	0	2026-10-26 12:44:36.330697+00
deff5984-e322-4f37-b32a-d5b0a9b82818	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Gallery	/media/packages/12f4b08b286b4f7ab05a3c6e14edd43c/7a64cb446aa04818a318e507a1bdbfa7.jpg	aerial view of sala s	\N	\N	\N	\N	\N	f	1	2026-10-26 12:44:56.889793+00
546a4566-d2e9-4552-8299-d266b574c623	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Gallery	/media/packages/12f4b08b286b4f7ab05a3c6e14edd43c/1f05131124274fe08a4c599465f77d69.jpg	sala s camp treats by	\N	\N	\N	\N	\N	f	2	2026-10-26 12:45:09.590812+00
b82e754c-f52a-4f2b-96cb-8fad2936276a	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Gallery	/media/packages/12f4b08b286b4f7ab05a3c6e14edd43c/3c24b130e07640ed962afc4e575415cb.jpg	sala s camp	\N	\N	\N	\N	\N	f	3	2026-10-26 12:45:23.213064+00
f4ec33c3-374c-4061-86c3-9ab07cda35a8	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Gallery	/media/packages/f415c589bdfc4fd1804dffa5fff66ac6/4d6d69ff6cb446ad9393a5fc6cf1dc30.jpg	Far in Tanzania’s western reaches, Katavi remains…	\N	\N	\N	\N	\N	f	2	2026-10-27 06:39:55.768815+00
0892469e-34e7-45cd-8402-a0ebf81dbc25	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Gallery	/media/packages/f415c589bdfc4fd1804dffa5fff66ac6/8a1160ff209b4e8ea4ad95ade0bd2cc6.jpg	Go on a 14 Day Adventure Filled Safari in Zambia	\N	\N	\N	\N	\N	f	3	2026-10-27 06:40:16.576839+00
\.


--
-- Data for Name: PackageRates; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."PackageRates" ("Id", "PackageId", "SeasonId", "Currency", "PriceMinor", "ExtraNightPriceMinor") FROM stdin;
4ba8f7b0-d021-4ceb-b5ea-9e09175f23f5	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	e4e42114-65d5-4f36-b922-581a56d4d537	USD	2366600	\N
50531204-9bd9-494d-a8a9-64be8b50cf73	76d3ed1d-0d97-46e5-96b8-365498c4f85b	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	747200	\N
6d76f2d3-cdea-4c80-8609-53da93f2b0cf	0ae7b7eb-acae-481d-9606-b99cdb5af83e	e4e42114-65d5-4f36-b922-581a56d4d537	USD	1775000	\N
80719420-cd88-4146-9043-9ae998983157	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	1494400	\N
8462f5ac-97f0-4920-b550-b2d506035edb	3becabc0-2844-47e8-a330-f83a44db48cc	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	2688400	\N
85a83e96-d5fb-4d77-a30f-135b83c21c91	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	1936900	\N
8fb22853-decc-47b9-96cc-414423794e08	46a039e6-d50d-4f47-ac0e-30ab22d97535	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	698670	\N
aeadf9be-2d40-4835-8221-cfa3864582b8	79054381-312c-4e5f-aba3-dbfdffcf2d9a	e4e42114-65d5-4f36-b922-581a56d4d537	USD	4484800	\N
b066756d-2114-4251-b0bf-e16f059f4f25	3becabc0-2844-47e8-a330-f83a44db48cc	e4e42114-65d5-4f36-b922-581a56d4d537	USD	3788200	\N
c8bc12a6-2a05-4afc-853d-d65a3b8eddf3	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	e4e42114-65d5-4f36-b922-581a56d4d537	USD	3398500	\N
dfdcc9a7-b8ed-46e6-a395-b65a7c77d07a	79054381-312c-4e5f-aba3-dbfdffcf2d9a	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	3088900	\N
31dcadc0-153c-40b7-8df3-30283a02d33d	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	1413000	\N
ba1ed56f-d053-4260-b18e-e9f597068eae	5daabefd-e115-48ab-a84e-33e6eb68f7f9	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	2657600	\N
a0410ae6-3fec-4f53-b790-d830ecc2b5de	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	2863350	\N
d75cc5e9-1042-4855-8400-2aab633d1948	d4d1b4e2-95d8-41fc-88a7-a25103292e81	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	3720640	\N
013ecb30-7fc7-46e3-91ee-6df90692e850	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	4154220	\N
4c681800-291f-4bef-b2d2-55450fc05cd3	695be048-ccc7-4aa5-aa00-46e16d238edf	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	658900	\N
\.


--
-- Data for Name: PackageStays; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."PackageStays" ("Id", "PackageId", "PropertyId", "Nights", "RoomType", "SortOrder") FROM stdin;
407d0af9-a725-4b17-b0e8-3296e32bb22b	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	c1630f23-bb5f-43fe-9fb6-b72812fa5354	3	\N	1
7bed621d-af77-44dc-b53e-6abf3abc71ad	46a039e6-d50d-4f47-ac0e-30ab22d97535	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	3	Superior Single Room	0
8bc73ed2-92a5-4e98-a294-45296db558ae	0ae7b7eb-acae-481d-9606-b99cdb5af83e	260b8c6b-d0b4-4534-9833-9fc93fc80494	3	Keekorok Tent with Pool or Forest Tent with Pool	0
9dda8fb0-c8fe-40b3-820d-3002344229ee	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	260b8c6b-d0b4-4534-9833-9fc93fc80494	4	Keekorok Tent with Pool or Forest Tent with Pool	0
a869ab10-985e-4d05-aaf5-85b6e404dbc7	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	260b8c6b-d0b4-4534-9833-9fc93fc80494	4	\N	0
aba61819-43a9-486c-b541-9ebd7fae9ec5	76d3ed1d-0d97-46e5-96b8-365498c4f85b	260b8c6b-d0b4-4534-9833-9fc93fc80494	2	Keekorok Tent with Pool or Forest Tent with Pool	0
cd16af45-5571-4d9c-b24d-b5a817286588	3becabc0-2844-47e8-a330-f83a44db48cc	260b8c6b-d0b4-4534-9833-9fc93fc80494	4	Keekorok Tent with Pool or Forest Tent with Pool	0
f2b9629d-f4e4-4516-8243-f3e0533a412a	79054381-312c-4e5f-aba3-dbfdffcf2d9a	c1630f23-bb5f-43fe-9fb6-b72812fa5354	5	\N	1
ff3e616e-174b-4768-b8cf-c6e24505d6f2	79054381-312c-4e5f-aba3-dbfdffcf2d9a	260b8c6b-d0b4-4534-9833-9fc93fc80494	5	\N	0
bd0e495c-f850-49df-a118-bc3fc7dabd37	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	5	Superior Room	0
b722212a-4b6e-402c-8b91-d3ee7c2e9600	5daabefd-e115-48ab-a84e-33e6eb68f7f9	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	5	Karen Blixen / Finch Hatton Suite	0
ace772c2-cc47-4f90-9e62-219507216a64	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	5	Karen Blixen / Finch Hatton Suites	0
31c88c93-44bf-4f6b-b08f-a120f867edf1	d4d1b4e2-95d8-41fc-88a7-a25103292e81	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	7	Karen Blixen / Finch Hatton Suites	0
83458f95-0a13-4ad3-a55c-9b9b7d39f16d	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	7	Karen Blixen / Finch Hatton Suite	0
c2106157-0ee8-47e3-bffa-05e73bb2e97e	695be048-ccc7-4aa5-aa00-46e16d238edf	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	2	\N	0
\.


--
-- Data for Name: Packages; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Packages" ("Id", "Slug", "ProductType", "Details", "Status", "Title", "Subtitle", "Summary", "Description", "Category", "DestinationId", "Nights", "MinNights", "Adults", "Children", "PricingBasis", "BaseCurrency", "FromPriceMinor", "Featured", "SortOrder", "SeoTitle", "SeoDescription", "Version", "PublishedAt", "CreatedAt", "UpdatedAt") FROM stdin;
5daabefd-e115-48ab-a84e-33e6eb68f7f9	giraffe-manor-family-experience	HolidayPackage	\N	Published	Giraffe Manor Family Experience	5 Nights / 6 Days for Two Adults + Up to Two Children	A family stay in a two-bedroom suite with the Giraffe Manor fully inclusive experience.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	5	5	2	2	PerParty	USD	2657600	t	120	\N	\N	2	2026-10-16 02:13:59.79865+00	2026-10-16 02:13:59.79865+00	2026-10-27 06:30:40.776534+00
46a039e6-d50d-4f47-ac0e-30ab22d97535	giraffe-manor-solo-escape	HolidayPackage	\N	Published	Giraffe Manor Solo Escape	3 Nights / 4 Days for One Adult	An intimate, fully inclusive Giraffe Manor stay with meals, selected house drinks, Giraffe Centre access and qualifying transfers.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	3	3	1	0	PerParty	USD	698670	t	100	\N	\N	2	2026-10-16 02:13:59.79865+00	2026-10-16 02:13:59.79865+00	2026-10-16 03:06:40.798023+00
b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	giraffe-manor-signature-escape	HolidayPackage	\N	Published	Giraffe Manor Signature Escape	5 Nights / 6 Days for Two Adults	A fully inclusive stay for two with meals, selected house drinks, Giraffe Centre access and qualifying transfers.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	5	5	2	0	PerParty	USD	1413000	t	110	\N	\N	2	2026-10-16 02:13:59.79865+00	2026-10-16 02:13:59.79865+00	2026-10-16 03:06:40.798023+00
d4d1b4e2-95d8-41fc-88a7-a25103292e81	giraffe-manor-family-and-friends-retreat-3-adults	HolidayPackage	\N	Published	Giraffe Manor Family and Friends Retreat (3 Adults)	7 Nights / 8 Days for Three Adults	A shared two-bedroom suite stay for three adults with the Giraffe Manor fully inclusive experience.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	7	7	3	0	PerParty	USD	3720640	t	140	\N	\N	2	2026-10-16 02:13:59.79865+00	2026-10-16 02:13:59.79865+00	2026-10-16 03:06:40.798023+00
cbcb141f-458b-45b5-8d16-d1d4a883bbb8	giraffe-manor-family-and-friends-retreat-4-adults	HolidayPackage	\N	Published	Giraffe Manor Family and Friends Retreat (4 Adults)	7 Nights / 8 Days for Four Adults	A shared two-bedroom suite stay for four adults with the Giraffe Manor fully inclusive experience.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	7	7	4	0	PerParty	USD	4154220	t	150	\N	\N	2	2026-10-16 02:13:59.79865+00	2026-10-16 02:13:59.79865+00	2026-10-16 03:06:40.798023+00
a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	giraffe-manor-extended-family-package	HolidayPackage	\N	Published	Giraffe Manor Extended Family Package	5 Nights / 6 Days for Two Adults + Three Children	A family suite experience for a larger family, with a third child charged in addition to the suite minimum.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	5	5	2	3	PerParty	USD	2863350	t	130	\N	\N	2	2026-10-16 02:13:59.79865+00	2026-10-16 02:13:59.79865+00	2026-10-27 06:29:09.240578+00
79054381-312c-4e5f-aba3-dbfdffcf2d9a	ultimate-safari-collection-journey	HolidayPackage	\N	Published	Ultimate Safari Collection Journey	10-Night Premium Long-Stay Safari for Two Adults	Luxury multi-destination travel with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	10	10	2	0	PerParty	USD	3088900	f	60	\N	\N	0	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00	2026-10-27 06:36:55.402354+00
0ae7b7eb-acae-481d-9606-b99cdb5af83e	salas-classic-safari	HolidayPackage	\N	Published	Sala's Classic Safari	3-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	3	3	2	0	PerParty	USD	1775000	f	20	\N	\N	0	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00	2026-10-27 06:34:03.084792+00
695be048-ccc7-4aa5-aa00-46e16d238edf	giraffe-and-nairobi-wildlife-escape	HolidayPackage	\N	Published	Giraffe and Nairobi Wildlife Escape	2 Nights / 3 Days for Two Adults	Experience the best of Nairobi's wildlife and iconic landscapes.	\N	SAFARI	f1da7e79-5a02-49b0-902e-68145c23d5e3	2	2	2	0	PerParty	USD	658900	f	170	\N	\N	1	2026-10-16 03:41:17.317107+00	2026-10-16 03:06:40.798023+00	2026-10-27 06:28:20.424336+00
12f4b08b-286b-4f7a-b05a-3c6e14edd43c	salas-extended-mara-experience	HolidayPackage	\N	Published	Sala's Extended Mara Experience	4-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	4	4	2	0	PerParty	USD	1494400	f	30	\N	\N	1	2026-10-16 03:41:26.959689+00	2026-10-16 03:06:40.798023+00	2026-10-26 12:45:23.213283+00
3becabc0-2844-47e8-a330-f83a44db48cc	salas-family-safari	HolidayPackage	\N	Published	Sala's Family Safari	4-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults & Two Children	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	4	4	2	2	PerParty	USD	2688400	f	40	\N	\N	1	2026-10-16 03:41:31.662808+00	2026-10-16 03:06:40.798023+00	2026-10-26 12:38:13.668181+00
76d3ed1d-0d97-46e5-96b8-365498c4f85b	sala-mara-escape	HolidayPackage	\N	Published	Sala Mara Escape	2-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	2	2	2	0	PerParty	USD	747200	f	10	\N	\N	0	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00	2026-10-27 06:44:18.495002+00
f415c589-bdfc-4fd1-804d-ffa5fff66ac6	safari-collection-explorer	HolidayPackage	\N	Published	Safari Collection Explorer	7-Night Luxury Multi-Destination Safari for Two Adults	Luxury multi-destination travel with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	7	7	2	0	PerParty	USD	1936900	f	50	\N	\N	1	2026-10-16 03:41:21.670404+00	2026-10-16 03:06:40.798023+00	2026-10-27 06:40:16.576946+00
\.


--
-- Data for Name: Partners; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Partners" ("Id", "Slug", "Name", "Tagline", "LogoPath", "CreatedAt", "UpdatedAt") FROM stdin;
544979d3-cbf6-4ed4-95cf-c8138a167259	giraffe-manor	Giraffe Manor	An exclusive partnership. Extraordinary experiences.	\N	2026-10-16 02:13:59.79865+00	2026-10-16 03:06:40.798023+00
d793c981-583e-49f8-95aa-f4cbdbf251a3	the-safari-collection	The Safari Collection	\N	\N	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00
\.


--
-- Data for Name: Properties; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Properties" ("Id", "Slug", "Name", "PartnerId", "DestinationId", "CreatedAt", "UpdatedAt") FROM stdin;
df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	giraffe-manor	Giraffe Manor	544979d3-cbf6-4ed4-95cf-c8138a167259	f1da7e79-5a02-49b0-902e-68145c23d5e3	2026-10-16 02:13:59.79865+00	2026-10-16 03:06:40.798023+00
260b8c6b-d0b4-4534-9833-9fc93fc80494	salas-camp	Sala's Camp	d793c981-583e-49f8-95aa-f4cbdbf251a3	2031dab8-2aca-402c-8fed-083dbe481884	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00
c1630f23-bb5f-43fe-9fb6-b72812fa5354	sasaab	Sasaab	d793c981-583e-49f8-95aa-f4cbdbf251a3	f44e0c8f-b08a-4d8d-9ce2-69c97f310917	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00
\.


--
-- Data for Name: PropertyMedia; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."PropertyMedia" ("Id", "PropertyId", "Path", "Alt", "Caption", "Width", "Height", "VideoProvider", "VideoId", "VariantsReady", "SortKey", "CreatedAt") FROM stdin;
\.


--
-- Data for Name: SeasonRanges; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."SeasonRanges" ("Id", "SeasonId", "StartDate", "EndDate") FROM stdin;
4b251ae8-3602-4c50-908e-ea255f07bcd4	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	2026-01-01	2026-12-31
1cf3454f-ecca-4cd3-9d8e-e90f3c71c413	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	2026-01-06	2026-05-31
39e373fc-84e0-4cc3-b84e-a28feee7748e	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	2026-11-01	2026-12-15
3a6e005c-afd5-4e9d-82cc-806520d0a2e5	e4e42114-65d5-4f36-b922-581a56d4d537	2026-01-01	2026-01-05
49a45666-a6d3-4062-aebf-94655a6c14de	e4e42114-65d5-4f36-b922-581a56d4d537	2026-12-16	2026-12-31
c2e77c86-269d-4409-a3d1-39430a5d2eb8	e4e42114-65d5-4f36-b922-581a56d4d537	2026-06-01	2026-10-31
\.


--
-- Data for Name: Seasons; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Seasons" ("Id", "Slug", "Name", "PartnerId", "CreatedAt", "UpdatedAt") FROM stdin;
2fab7c39-088e-4a6e-b2f2-f3c341b91e18	giraffe-manor-2026	2026	544979d3-cbf6-4ed4-95cf-c8138a167259	2026-10-16 02:13:59.79865+00	2026-10-16 03:06:40.798023+00
9d0143d1-3afe-4f1d-8e5f-e444067a87bf	safari-collection-savings-2026	Savings Season 2026	d793c981-583e-49f8-95aa-f4cbdbf251a3	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00
e4e42114-65d5-4f36-b922-581a56d4d537	safari-collection-peak-2026	Peak Season 2026	d793c981-583e-49f8-95aa-f4cbdbf251a3	2026-10-16 03:06:40.798023+00	2026-10-16 03:06:40.798023+00
\.


--
-- Data for Name: Staff; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Staff" ("Id", "Username", "Email", "PasswordHash", "Role", "IsActive", "FailedLoginAttempts", "LockedUntil", "LastLoginAt", "InvitedById", "CreatedAt", "UpdatedAt") FROM stdin;
e9705320-15ae-4dc4-acca-7a9e0872bd64	developers	developers@arlink28.com	AQAAAAIAAYagAAAAEI+jlx1Cwq3gYI8Xx6lgn79XgG2FJdLcBTWljBLAnOaeOy5A6ys/nZvPKNTYz6DXWQ==	SuperAdmin	t	0	\N	2026-10-30 16:46:46.143669+00	\N	2026-10-14 22:50:48.990239+00	2026-10-30 16:46:46.14367+00
\.


--
-- Data for Name: StaffTokens; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."StaffTokens" ("Id", "Type", "TokenHash", "Email", "RoleToAssign", "StaffId", "ExpiresAt", "UsedAt", "CreatedAt") FROM stdin;
c0633fc9-dede-4494-bf8f-39978b65806e	PasswordReset	daec6dde218404ae4200169908a68493e7f1f5b4cf6023afdd10901d017f86fc	developers@arlink28.com	\N	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-30 13:50:43.32803+00	\N	2026-10-30 12:50:43.328054+00
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20261014210441_InitialCreate	10.0.0
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public.audit_logs ("Id", "ActorId", "Action", "EntityType", "EntityId", "Before", "After", "CreatedAt") FROM stdin;
9bb50cd7-bdf4-4250-b51c-3a699d5153a2	\N	Enquiry.Created	Enquiry	42638c3b-72ce-49d8-934b-b5237a420af4	\N	\N	2026-10-15 23:23:47.775762+00
2d3537d1-5efa-47fe-a83a-d4121d9f49bc	\N	Enquiry.Created	Enquiry	84c66f82-a9de-44b3-b72b-b8a5949891eb	\N	\N	2026-10-15 23:23:57.506447+00
2871d057-692e-4bf2-b21b-de97468f61c9	\N	Enquiry.Created	Enquiry	664f8419-53ce-4f70-8ef4-94b4c00a34b8	\N	\N	2026-10-15 23:27:48.92886+00
1c968bd3-6662-4c08-9970-d14e77d39d05	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 00:32:18.822304+00
db8a8988-8b4e-4bc6-9d6d-db91e78dc172	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 00:33:36.314447+00
2867a8a0-e03f-4ed1-84ec-4900b45e34f6	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 00:43:41.994324+00
b3b9f430-1b3a-430b-a00c-bb96cbddf48e	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 00:44:19.36717+00
acd034b8-1fad-4b97-bf51-104cf1e2ac91	\N	Enquiry.Created	Enquiry	dfa8b115-ea99-4bfe-b1db-cf397c311a66	\N	\N	2026-10-16 01:04:13.259535+00
c8e06ed8-94af-43fc-8625-f5f7ba42f6b8	\N	Enquiry.Created	Enquiry	3965844a-abd7-4635-b4a3-0909e29ff40f	\N	\N	2026-10-16 01:18:10.009061+00
a0ad905d-bb27-4046-9b6f-dd2e9f58d0f5	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 02:01:07.415804+00
0ee73261-a226-42e5-9403-8062e73dcf64	\N	seed.package.create	package	5daabefd-e115-48ab-a84e-33e6eb68f7f9	\N	{"Slug":"giraffe-manor-family-experience","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2657600}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (2).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:13:59.79865+00
1b9bdbea-569d-482b-a051-c5a47817ff2f	\N	seed.package.create	package	d4d1b4e2-95d8-41fc-88a7-a25103292e81	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-3-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":3720640}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (4).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:13:59.79865+00
1d707fb6-2b77-4878-b495-cbcda3730307	\N	seed.package.create	package	46a039e6-d50d-4f47-ac0e-30ab22d97535	\N	{"Slug":"giraffe-manor-solo-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":698670}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:13:59.79865+00
c451fec6-365f-44e7-a4f9-95ac883935dc	\N	seed.package.create	package	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	\N	{"Slug":"giraffe-manor-signature-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":1413000}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (1).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:13:59.79865+00
d785f746-f30f-4f27-ab80-5aa9b25d1b67	\N	seed.package.create	package	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-4-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":4154220}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.46.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:13:59.79865+00
e66b5211-87c4-44e4-a107-4dd818b2c67b	\N	seed.package.create	package	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	\N	{"Slug":"giraffe-manor-extended-family-package","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2863350}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (3).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:13:59.79865+00
d71cf39a-6d76-490d-850e-f7318fdf1eb6	\N	Enquiry.Created	Enquiry	098ba038-42e1-4ef6-9a97-3d200c911146	\N	\N	2026-10-16 02:19:08.923976+00
587d659b-e88c-48da-b98d-996fb703e2eb	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 02:24:16.271649+00
14c58c9f-7652-4d2e-bc25-f5608cfbae71	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 02:29:12.121145+00
1ca58955-0f6d-4b2f-b140-ceb00b557703	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 02:31:46.509528+00
777abeaa-cd34-489a-8ed7-2eb2a340aaa8	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 02:31:52.471984+00
d8cfb16c-e391-4f9d-9404-a26e5992096d	\N	seed.package.update	package	46a039e6-d50d-4f47-ac0e-30ab22d97535	\N	{"Slug":"giraffe-manor-solo-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":698670}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:33:07.577045+00
cdab79e1-fcd6-4510-a69f-791b55a97d43	\N	seed.package.update	package	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	\N	{"Slug":"giraffe-manor-signature-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":1413000}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (1).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:33:07.577045+00
ddb10f1d-bde6-4f41-af28-38d476b257b0	\N	seed.package.update	package	5daabefd-e115-48ab-a84e-33e6eb68f7f9	\N	{"Slug":"giraffe-manor-family-experience","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2657600}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (2).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:33:07.577045+00
18f0f208-c051-4932-8e9b-e8ff9402ec67	\N	seed.package.update	package	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	\N	{"Slug":"giraffe-manor-extended-family-package","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2863350}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (3).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:33:07.577045+00
0fba4c16-fb17-497f-a004-ea1ed3c2cccb	\N	seed.package.update	package	d4d1b4e2-95d8-41fc-88a7-a25103292e81	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-3-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":3720640}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (4).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:33:07.577045+00
c24930a9-6b8d-491b-9a76-ade49a7b7bd6	\N	seed.package.update	package	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-4-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":4154220}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.46.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 02:33:07.577045+00
13d1a5d0-5a27-4701-95e3-73be65f3f302	\N	seed.package.create	package	79054381-312c-4e5f-aba3-dbfdffcf2d9a	\N	{"Slug":"ultimate-safari-collection-journey","Status":"Published","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":3088900},{"Season":"safari-collection-peak-2026","PriceMinor":4484800}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.34.jpeg","WhatsApp Image 2026-09-25 at 02.19.34 (1).jpeg"]}	2026-10-16 03:06:40.798023+00
7cd59574-a8f2-457c-86b4-ca40249885e0	\N	seed.package.create	package	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	\N	{"Slug":"safari-collection-explorer","Status":"Draft","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":1936900},{"Season":"safari-collection-peak-2026","PriceMinor":3398500}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.34 (2).jpeg","WhatsApp Image 2026-09-25 at 02.19.34 (3).jpeg"]}	2026-10-16 03:06:40.798023+00
c0589362-b6cc-45c5-a846-49545845fb05	\N	seed.package.create	package	76d3ed1d-0d97-46e5-96b8-365498c4f85b	\N	{"Slug":"sala-mara-escape","Status":"Published","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":747200}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.33.jpeg"]}	2026-10-16 03:06:40.798023+00
c0ec95c7-ef24-428c-bc51-10de5f9171dd	\N	seed.package.create	package	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	\N	{"Slug":"salas-extended-mara-experience","Status":"Draft","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":1494400},{"Season":"safari-collection-peak-2026","PriceMinor":2366600}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.33 (2).jpeg","WhatsApp Image 2026-09-25 at 02.19.33 (3).jpeg"]}	2026-10-16 03:06:40.798023+00
cba46fc3-61cd-477d-a241-7a09d06280c4	\N	seed.package.create	package	3becabc0-2844-47e8-a330-f83a44db48cc	\N	{"Slug":"salas-family-safari","Status":"Draft","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":2688400},{"Season":"safari-collection-peak-2026","PriceMinor":3788200}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.33 (4).jpeg","WhatsApp Image 2026-09-25 at 02.19.34 (4).jpeg"]}	2026-10-16 03:06:40.798023+00
e81f4fd7-e54a-4fa9-8104-5a0e2ef429cf	\N	seed.package.create	package	0ae7b7eb-acae-481d-9606-b99cdb5af83e	\N	{"Slug":"salas-classic-safari","Status":"Published","Rates":[{"Season":"safari-collection-peak-2026","PriceMinor":1775000}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.33 (1).jpeg"]}	2026-10-16 03:06:40.798023+00
791b634d-3c61-4af2-b2e3-a590ec8dc0a4	\N	seed.package.update	package	46a039e6-d50d-4f47-ac0e-30ab22d97535	\N	{"Slug":"giraffe-manor-solo-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":698670}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:06:40.798023+00
b67245c2-862f-4076-bfaa-a865e7a91dbf	\N	seed.package.update	package	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	\N	{"Slug":"giraffe-manor-signature-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":1413000}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (1).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:06:40.798023+00
af949bb2-c604-4e0e-97f0-41466e72e6ed	\N	seed.package.update	package	5daabefd-e115-48ab-a84e-33e6eb68f7f9	\N	{"Slug":"giraffe-manor-family-experience","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2657600}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (2).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:06:40.798023+00
e4ee3dcd-3bde-404a-98ce-277f72f97bde	\N	seed.package.update	package	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	\N	{"Slug":"giraffe-manor-extended-family-package","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2863350}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (3).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:06:40.798023+00
21b15173-3e88-43fb-ab06-4cee2462a76b	\N	seed.package.update	package	d4d1b4e2-95d8-41fc-88a7-a25103292e81	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-3-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":3720640}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (4).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:06:40.798023+00
99c85ec0-5f23-4001-8472-8feece5e6a00	\N	seed.package.create	package	695be048-ccc7-4aa5-aa00-46e16d238edf	\N	{"Slug":"giraffe-and-nairobi-wildlife-escape","Status":"Draft","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":658900}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.37.jpeg"]}	2026-10-16 03:06:40.798023+00
be234468-5e12-4772-b0eb-71b3df4ab7ce	\N	seed.package.update	package	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-4-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":4154220}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.46.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:06:40.798023+00
32c94313-ae67-4e90-85a4-cd2c92ee2f51	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 03:10:12.608689+00
d7223b77-9e73-4895-b925-9ed0ead3d91f	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 03:40:27.683257+00
79906d1a-0ce3-4bf4-813c-c173b1aeea44	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 07:54:07.512359+00
42730ee2-334f-464d-81fa-9826d189401d	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 07:54:45.212418+00
b515bf72-a14d-48eb-a81b-9cbdad653db8	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 12:26:21.858673+00
c42ea26b-b7a8-4f18-820d-df3bdb8629eb	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	098ba038-42e1-4ef6-9a97-3d200c911146	New	Contacted	2026-10-26 13:54:14.16149+00
0d1a47d9-1b12-4747-9caa-f61ef56b3db2	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	098ba038-42e1-4ef6-9a97-3d200c911146	Contacted	Closed	2026-10-26 13:56:37.765822+00
87dd3ec4-7c67-4cf7-b841-e3addf820fcb	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 16:30:46.288287+00
8506873c-55f7-4808-8bcf-fdacc65c14ab	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 16:31:21.597044+00
0453565a-5c1c-48c2-82fe-830abe5ce529	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-27 06:25:50.859904+00
613808bd-0c13-41e9-8bc9-aef4ed7aaac7	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	\N	{"path":"/media/destinations/eb2d59e3ac544d93b88c3da09d04c9d2/45d8d198ba48430ea1018b83a880e68d.jpg"}	2026-10-27 07:48:01.894489+00
65f27546-dd6f-4128-8861-e6833a47830f	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	2031dab8-2aca-402c-8fed-083dbe481884	\N	{"path":"/media/destinations/2031dab82aca402c8fed083dbe481884/c0f9acda04fe4915ae1df23aba508586.jpg"}	2026-10-27 07:50:01.565357+00
56524308-9de0-45c8-b003-17a7057cc8d5	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	f1da7e79-5a02-49b0-902e-68145c23d5e3	\N	{"path":"/media/destinations/f1da7e795a0249b0902e68145c23d5e3/30cd8ed8cac54ec088314784597c28da.jpg"}	2026-10-27 07:51:17.111816+00
3c46b959-7588-41ba-87dd-c49d17c6c9c4	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	f44e0c8f-b08a-4d8d-9ce2-69c97f310917	\N	{"path":"/media/destinations/f44e0c8fb08a4d8d9ce269c97f310917/6c486b08aebf40a9bdb4f4085657acc3.jpg"}	2026-10-27 07:52:14.985469+00
2f25addd-eb98-4f31-b30c-19385a340525	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 18:25:32.664471+00
e379f44e-6d3a-48ea-832b-ab44c98ce45a	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	3965844a-abd7-4635-b4a3-0909e29ff40f	New	Closed	2026-10-28 18:26:45.703461+00
e88cc096-a88c-4c36-beed-951409e53c1e	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	dfa8b115-ea99-4bfe-b1db-cf397c311a66	New	Closed	2026-10-28 18:26:47.702635+00
e590edd3-7fc5-4fca-9004-319f13fd64bb	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	664f8419-53ce-4f70-8ef4-94b4c00a34b8	New	Closed	2026-10-28 18:26:48.494782+00
51f22578-d18b-4491-a763-bad515fa81a9	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	84c66f82-a9de-44b3-b72b-b8a5949891eb	New	Closed	2026-10-28 18:26:49.105801+00
b5df4770-40a0-4f9f-8ed5-ddadd97c1612	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	42638c3b-72ce-49d8-934b-b5237a420af4	New	Closed	2026-10-28 18:26:49.780148+00
e36fc8f2-6709-4544-9d37-6d2f4c646c18	e9705320-15ae-4dc4-acca-7a9e0872bd64	PasswordChanged	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 18:34:59.47142+00
220ae846-3942-4698-9349-a76f23bbd3e2	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 18:35:33.399901+00
8d427a89-8ce8-4706-8f04-ac08acc27a01	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 18:35:38.15587+00
024c755e-ba63-4fd7-956a-52c8c8c10875	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 18:35:51.515785+00
9e7e7aad-716e-4dc5-985e-9012ba55d640	\N	Enquiry.Created	Enquiry	aa03554e-32a1-48b9-a07c-5a1608b5d8e0	\N	\N	2026-10-30 11:23:56.822264+00
a4b1b3e5-6000-443e-b51e-abd238e58c20	\N	AccountLocked	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 11:27:56.449185+00
eb0618d7-de2d-4cdd-9929-90c4f97d89cc	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 16:21:22.014247+00
fcba569d-2422-4243-8a4d-c0276a9c8a55	e9705320-15ae-4dc4-acca-7a9e0872bd64	PasswordChanged	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 16:21:54.409665+00
6eac1254-00e3-458e-aeb7-2e7f36874676	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 16:22:02.770092+00
8e70ccfe-dd60-4f74-8a02-2fcb6c2b53e8	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 16:22:07.214964+00
84b9fd6c-5f54-4d16-a5da-7610c76efc6d	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 16:34:50.40948+00
aaea1061-a4bc-4be5-995b-e5d02cfda681	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 16:46:46.143687+00
1f34d661-ac7e-44a0-82a1-9f961e328fc0	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 16:52:28.152323+00
\.


--
-- Name: DestinationAttractions PK_DestinationAttractions; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."DestinationAttractions"
    ADD CONSTRAINT "PK_DestinationAttractions" PRIMARY KEY ("Id");


--
-- Name: Destinations PK_Destinations; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Destinations"
    ADD CONSTRAINT "PK_Destinations" PRIMARY KEY ("Id");


--
-- Name: Enquiries PK_Enquiries; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Enquiries"
    ADD CONSTRAINT "PK_Enquiries" PRIMARY KEY ("Id");


--
-- Name: Features PK_Features; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Features"
    ADD CONSTRAINT "PK_Features" PRIMARY KEY ("Id");


--
-- Name: PackageAddOns PK_PackageAddOns; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageAddOns"
    ADD CONSTRAINT "PK_PackageAddOns" PRIMARY KEY ("Id");


--
-- Name: PackageFeatures PK_PackageFeatures; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageFeatures"
    ADD CONSTRAINT "PK_PackageFeatures" PRIMARY KEY ("Id");


--
-- Name: PackageMedia PK_PackageMedia; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageMedia"
    ADD CONSTRAINT "PK_PackageMedia" PRIMARY KEY ("Id");


--
-- Name: PackageRates PK_PackageRates; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageRates"
    ADD CONSTRAINT "PK_PackageRates" PRIMARY KEY ("Id");


--
-- Name: PackageStays PK_PackageStays; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageStays"
    ADD CONSTRAINT "PK_PackageStays" PRIMARY KEY ("Id");


--
-- Name: Packages PK_Packages; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Packages"
    ADD CONSTRAINT "PK_Packages" PRIMARY KEY ("Id");


--
-- Name: Partners PK_Partners; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Partners"
    ADD CONSTRAINT "PK_Partners" PRIMARY KEY ("Id");


--
-- Name: Properties PK_Properties; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "PK_Properties" PRIMARY KEY ("Id");


--
-- Name: PropertyMedia PK_PropertyMedia; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PropertyMedia"
    ADD CONSTRAINT "PK_PropertyMedia" PRIMARY KEY ("Id");


--
-- Name: SeasonRanges PK_SeasonRanges; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."SeasonRanges"
    ADD CONSTRAINT "PK_SeasonRanges" PRIMARY KEY ("Id");


--
-- Name: Seasons PK_Seasons; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Seasons"
    ADD CONSTRAINT "PK_Seasons" PRIMARY KEY ("Id");


--
-- Name: Staff PK_Staff; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "PK_Staff" PRIMARY KEY ("Id");


--
-- Name: StaffTokens PK_StaffTokens; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."StaffTokens"
    ADD CONSTRAINT "PK_StaffTokens" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: audit_logs PK_audit_logs; Type: CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT "PK_audit_logs" PRIMARY KEY ("Id");


--
-- Name: IX_DestinationAttractions_DestinationId_SortOrder; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_DestinationAttractions_DestinationId_SortOrder" ON public."DestinationAttractions" USING btree ("DestinationId", "SortOrder");


--
-- Name: IX_Destinations_ParentId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Destinations_ParentId" ON public."Destinations" USING btree ("ParentId");


--
-- Name: IX_Destinations_Slug; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Destinations_Slug" ON public."Destinations" USING btree ("Slug");


--
-- Name: IX_Destinations_Status_Country_SortOrder; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Destinations_Status_Country_SortOrder" ON public."Destinations" USING btree ("Status", "Country", "SortOrder");


--
-- Name: IX_Enquiries_HandledById; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Enquiries_HandledById" ON public."Enquiries" USING btree ("HandledById");


--
-- Name: IX_Enquiries_PackageId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Enquiries_PackageId" ON public."Enquiries" USING btree ("PackageId");


--
-- Name: IX_Enquiries_Reference; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Enquiries_Reference" ON public."Enquiries" USING btree ("Reference");


--
-- Name: IX_Enquiries_Status_CreatedAt; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Enquiries_Status_CreatedAt" ON public."Enquiries" USING btree ("Status", "CreatedAt");


--
-- Name: IX_Features_Slug; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Features_Slug" ON public."Features" USING btree ("Slug");


--
-- Name: IX_PackageAddOns_PackageId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_PackageAddOns_PackageId" ON public."PackageAddOns" USING btree ("PackageId");


--
-- Name: IX_PackageFeatures_FeatureId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_PackageFeatures_FeatureId" ON public."PackageFeatures" USING btree ("FeatureId");


--
-- Name: IX_PackageFeatures_PackageId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_PackageFeatures_PackageId" ON public."PackageFeatures" USING btree ("PackageId");


--
-- Name: IX_PackageMedia_PackageId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_PackageMedia_PackageId" ON public."PackageMedia" USING btree ("PackageId");


--
-- Name: IX_PackageMedia_Path; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_PackageMedia_Path" ON public."PackageMedia" USING btree ("Path");


--
-- Name: IX_PackageRates_PackageId_SeasonId_Currency; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_PackageRates_PackageId_SeasonId_Currency" ON public."PackageRates" USING btree ("PackageId", "SeasonId", "Currency");


--
-- Name: IX_PackageRates_SeasonId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_PackageRates_SeasonId" ON public."PackageRates" USING btree ("SeasonId");


--
-- Name: IX_PackageStays_PackageId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_PackageStays_PackageId" ON public."PackageStays" USING btree ("PackageId");


--
-- Name: IX_PackageStays_PropertyId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_PackageStays_PropertyId" ON public."PackageStays" USING btree ("PropertyId");


--
-- Name: IX_Packages_DestinationId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Packages_DestinationId" ON public."Packages" USING btree ("DestinationId");


--
-- Name: IX_Packages_Featured_SortOrder_Id; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Packages_Featured_SortOrder_Id" ON public."Packages" USING btree ("Featured", "SortOrder", "Id");


--
-- Name: IX_Packages_ProductType_Status; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Packages_ProductType_Status" ON public."Packages" USING btree ("ProductType", "Status");


--
-- Name: IX_Packages_Slug; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Packages_Slug" ON public."Packages" USING btree ("Slug");


--
-- Name: IX_Partners_Slug; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Partners_Slug" ON public."Partners" USING btree ("Slug");


--
-- Name: IX_Properties_DestinationId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Properties_DestinationId" ON public."Properties" USING btree ("DestinationId");


--
-- Name: IX_Properties_PartnerId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Properties_PartnerId" ON public."Properties" USING btree ("PartnerId");


--
-- Name: IX_Properties_Slug; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Properties_Slug" ON public."Properties" USING btree ("Slug");


--
-- Name: IX_PropertyMedia_Path; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_PropertyMedia_Path" ON public."PropertyMedia" USING btree ("Path");


--
-- Name: IX_PropertyMedia_PropertyId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_PropertyMedia_PropertyId" ON public."PropertyMedia" USING btree ("PropertyId");


--
-- Name: IX_SeasonRanges_SeasonId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_SeasonRanges_SeasonId" ON public."SeasonRanges" USING btree ("SeasonId");


--
-- Name: IX_Seasons_PartnerId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Seasons_PartnerId" ON public."Seasons" USING btree ("PartnerId");


--
-- Name: IX_Seasons_Slug; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Seasons_Slug" ON public."Seasons" USING btree ("Slug");


--
-- Name: IX_StaffTokens_Email_Type; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_StaffTokens_Email_Type" ON public."StaffTokens" USING btree ("Email", "Type");


--
-- Name: IX_StaffTokens_StaffId; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_StaffTokens_StaffId" ON public."StaffTokens" USING btree ("StaffId");


--
-- Name: IX_StaffTokens_TokenHash; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_StaffTokens_TokenHash" ON public."StaffTokens" USING btree ("TokenHash");


--
-- Name: IX_Staff_Email; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Staff_Email" ON public."Staff" USING btree ("Email");


--
-- Name: IX_Staff_InvitedById; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE INDEX "IX_Staff_InvitedById" ON public."Staff" USING btree ("InvitedById");


--
-- Name: IX_Staff_Username; Type: INDEX; Schema: public; Owner: arlink28
--

CREATE UNIQUE INDEX "IX_Staff_Username" ON public."Staff" USING btree ("Username");


--
-- Name: DestinationAttractions FK_DestinationAttractions_Destinations_DestinationId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."DestinationAttractions"
    ADD CONSTRAINT "FK_DestinationAttractions_Destinations_DestinationId" FOREIGN KEY ("DestinationId") REFERENCES public."Destinations"("Id") ON DELETE CASCADE;


--
-- Name: Destinations FK_Destinations_Destinations_ParentId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Destinations"
    ADD CONSTRAINT "FK_Destinations_Destinations_ParentId" FOREIGN KEY ("ParentId") REFERENCES public."Destinations"("Id") ON DELETE RESTRICT;


--
-- Name: Enquiries FK_Enquiries_Packages_PackageId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Enquiries"
    ADD CONSTRAINT "FK_Enquiries_Packages_PackageId" FOREIGN KEY ("PackageId") REFERENCES public."Packages"("Id") ON DELETE SET NULL;


--
-- Name: Enquiries FK_Enquiries_Staff_HandledById; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Enquiries"
    ADD CONSTRAINT "FK_Enquiries_Staff_HandledById" FOREIGN KEY ("HandledById") REFERENCES public."Staff"("Id") ON DELETE SET NULL;


--
-- Name: PackageAddOns FK_PackageAddOns_Packages_PackageId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageAddOns"
    ADD CONSTRAINT "FK_PackageAddOns_Packages_PackageId" FOREIGN KEY ("PackageId") REFERENCES public."Packages"("Id") ON DELETE CASCADE;


--
-- Name: PackageFeatures FK_PackageFeatures_Features_FeatureId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageFeatures"
    ADD CONSTRAINT "FK_PackageFeatures_Features_FeatureId" FOREIGN KEY ("FeatureId") REFERENCES public."Features"("Id") ON DELETE SET NULL;


--
-- Name: PackageFeatures FK_PackageFeatures_Packages_PackageId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageFeatures"
    ADD CONSTRAINT "FK_PackageFeatures_Packages_PackageId" FOREIGN KEY ("PackageId") REFERENCES public."Packages"("Id") ON DELETE CASCADE;


--
-- Name: PackageMedia FK_PackageMedia_Packages_PackageId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageMedia"
    ADD CONSTRAINT "FK_PackageMedia_Packages_PackageId" FOREIGN KEY ("PackageId") REFERENCES public."Packages"("Id") ON DELETE CASCADE;


--
-- Name: PackageRates FK_PackageRates_Packages_PackageId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageRates"
    ADD CONSTRAINT "FK_PackageRates_Packages_PackageId" FOREIGN KEY ("PackageId") REFERENCES public."Packages"("Id") ON DELETE CASCADE;


--
-- Name: PackageRates FK_PackageRates_Seasons_SeasonId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageRates"
    ADD CONSTRAINT "FK_PackageRates_Seasons_SeasonId" FOREIGN KEY ("SeasonId") REFERENCES public."Seasons"("Id") ON DELETE RESTRICT;


--
-- Name: PackageStays FK_PackageStays_Packages_PackageId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageStays"
    ADD CONSTRAINT "FK_PackageStays_Packages_PackageId" FOREIGN KEY ("PackageId") REFERENCES public."Packages"("Id") ON DELETE CASCADE;


--
-- Name: PackageStays FK_PackageStays_Properties_PropertyId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PackageStays"
    ADD CONSTRAINT "FK_PackageStays_Properties_PropertyId" FOREIGN KEY ("PropertyId") REFERENCES public."Properties"("Id") ON DELETE RESTRICT;


--
-- Name: Packages FK_Packages_Destinations_DestinationId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Packages"
    ADD CONSTRAINT "FK_Packages_Destinations_DestinationId" FOREIGN KEY ("DestinationId") REFERENCES public."Destinations"("Id") ON DELETE RESTRICT;


--
-- Name: Properties FK_Properties_Destinations_DestinationId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "FK_Properties_Destinations_DestinationId" FOREIGN KEY ("DestinationId") REFERENCES public."Destinations"("Id") ON DELETE RESTRICT;


--
-- Name: Properties FK_Properties_Partners_PartnerId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "FK_Properties_Partners_PartnerId" FOREIGN KEY ("PartnerId") REFERENCES public."Partners"("Id") ON DELETE SET NULL;


--
-- Name: PropertyMedia FK_PropertyMedia_Properties_PropertyId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."PropertyMedia"
    ADD CONSTRAINT "FK_PropertyMedia_Properties_PropertyId" FOREIGN KEY ("PropertyId") REFERENCES public."Properties"("Id") ON DELETE CASCADE;


--
-- Name: SeasonRanges FK_SeasonRanges_Seasons_SeasonId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."SeasonRanges"
    ADD CONSTRAINT "FK_SeasonRanges_Seasons_SeasonId" FOREIGN KEY ("SeasonId") REFERENCES public."Seasons"("Id") ON DELETE CASCADE;


--
-- Name: Seasons FK_Seasons_Partners_PartnerId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Seasons"
    ADD CONSTRAINT "FK_Seasons_Partners_PartnerId" FOREIGN KEY ("PartnerId") REFERENCES public."Partners"("Id") ON DELETE SET NULL;


--
-- Name: StaffTokens FK_StaffTokens_Staff_StaffId; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."StaffTokens"
    ADD CONSTRAINT "FK_StaffTokens_Staff_StaffId" FOREIGN KEY ("StaffId") REFERENCES public."Staff"("Id") ON DELETE CASCADE;


--
-- Name: Staff FK_Staff_Staff_InvitedById; Type: FK CONSTRAINT; Schema: public; Owner: arlink28
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "FK_Staff_Staff_InvitedById" FOREIGN KEY ("InvitedById") REFERENCES public."Staff"("Id") ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict Tr79teDlgSmbxDfCPXU3RJBbh8YQnzWdPudUhOcPJOhJojhnkbaS888NiSYeJGO

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict CTa5OecsoPCR13AP7iIxrtC9FJQtG9xmNovdIRvw8zpN9UlDbJc8HYSj7epWeek

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict CTa5OecsoPCR13AP7iIxrtC9FJQtG9xmNovdIRvw8zpN9UlDbJc8HYSj7epWeek

--
-- PostgreSQL database cluster dump complete
--

