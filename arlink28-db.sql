--
-- PostgreSQL database dump
--

\restrict CXaoZWFOSy8N9rQNE7hoYLHm15uHb8OMV25BRPQtPU4AgokzbHfKG9hGnRzyrk5

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
f022523d-7ee9-412b-bb79-0870f44c6a54	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	Zanzibar Escape	\N	\N	\N	\N	0	2026-11-03 11:46:41.268358+01	2026-11-03 11:46:41.268358+01
85b2c55d-0da4-4847-96ea-93d12f2a62f1	db21e135-cd2c-454a-aef6-bccffc43ff43	Zanzibar Escape	Resort	\N	\N	\N	0	2026-11-03 16:33:13.762923+01	2026-11-03 16:33:13.762923+01
\.


--
-- Data for Name: Destinations; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Destinations" ("Id", "Slug", "Name", "Country", "Kind", "Status", "ParentId", "Tagline", "Summary", "Description", "BestTimeToVisit", "HeroPath", "HeroAlt", "HeroCredit", "Latitude", "Longitude", "SortOrder", "PublishedAt", "CreatedAt", "UpdatedAt") FROM stdin;
eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	kenya	Kenya	KE	Country	Draft	\N	\N	\N	\N	\N	/media/destinations/eb2d59e3ac544d93b88c3da09d04c9d2/45d8d198ba48430ea1018b83a880e68d.jpg	Kenya	\N	\N	\N	0	\N	2026-10-16 03:13:59.79865+01	2026-10-27 08:48:01.840731+01
2031dab8-2aca-402c-8fed-083dbe481884	masai-mara	Masai Mara	KE	Place	Published	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	\N	\N	\N	\N	/media/destinations/2031dab82aca402c8fed083dbe481884/c0f9acda04fe4915ae1df23aba508586.jpg	Masai Mara	\N	\N	\N	0	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01	2026-10-27 08:50:01.565286+01
f1da7e79-5a02-49b0-902e-68145c23d5e3	nairobi	Nairobi	KE	Place	Published	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	\N	\N	\N	\N	/media/destinations/f1da7e795a0249b0902e68145c23d5e3/30cd8ed8cac54ec088314784597c28da.jpg	Nairobi	\N	\N	\N	0	2026-10-16 03:13:59.79865+01	2026-10-16 03:13:59.79865+01	2026-10-27 08:51:17.111776+01
f44e0c8f-b08a-4d8d-9ce2-69c97f310917	samburu	Samburu	KE	Place	Published	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	\N	\N	\N	\N	/media/destinations/f44e0c8fb08a4d8d9ce269c97f310917/6c486b08aebf40a9bdb4f4085657acc3.jpg	Samburu	\N	\N	\N	0	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01	2026-10-27 08:52:14.985422+01
77b58b85-aea3-423a-85e5-ec35d76be58f	zanzibar-2	Zanzibar	TZ	Place	Draft	2f114f3d-7af7-4bd0-ae19-055b80f69d26	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	2026-11-03 11:43:15.27649+01	2026-11-03 11:43:15.27649+01
02ee1ddf-a393-492a-a78d-ccb4b4d18629	zanzibar-3	Zanzibar	TZ	Place	Draft	2f114f3d-7af7-4bd0-ae19-055b80f69d26	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	2026-11-03 11:43:46.863207+01	2026-11-03 11:43:46.863207+01
f7b4e7c4-7e18-43d6-a637-8aa7de0af193	zanzibar-4	Zanzibar	TZ	Place	Published	2f114f3d-7af7-4bd0-ae19-055b80f69d26	\N	resort	\N	\N	/media/destinations/f7b4e7c47e1843d6a6378aa7de0af193/90a83a5070a54189b2174f92b5120cb9.jpg	Zanzibar	\N	\N	\N	0	2026-11-03 11:46:43.795726+01	2026-11-03 11:45:13.43839+01	2026-11-03 11:46:43.795726+01
2f114f3d-7af7-4bd0-ae19-055b80f69d26	zanzibar	Zanzibar	TZ	Country	Published	\N	\N	zanzibar tanzania	\N	\N	/media/destinations/2f114f3d7af74bd0ae19055b80f69d26/3b3ce6f3f6d44b96b7c3e405190eee62.jpg	Zanzibar	\N	\N	\N	0	2026-11-03 11:46:54.813652+01	2026-11-03 11:40:53.492576+01	2026-11-03 11:46:54.813652+01
db21e135-cd2c-454a-aef6-bccffc43ff43	zanzibar-5	Zanzibar	TZ	Place	Published	2f114f3d-7af7-4bd0-ae19-055b80f69d26	\N	zanzibar escape	\N	\N	/media/destinations/db21e135cd2c454aaef6bccffc43ff43/3e4bc4dc76fd4310bcb7ad0bed9d3ac5.jpg	Zanzibar	\N	\N	\N	0	2026-11-03 16:33:16.451638+01	2026-11-03 16:31:34.203889+01	2026-11-03 16:33:16.451638+01
\.


--
-- Data for Name: Enquiries; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Enquiries" ("Id", "Reference", "Type", "Status", "PackageId", "PackageTitle", "CheckIn", "Nights", "QuotedTotalMinor", "Currency", "Name", "Email", "Phone", "Subject", "Message", "ConsentAt", "SourceUrl", "HandledById", "CreatedAt", "UpdatedAt") FROM stdin;
098ba038-42e1-4ef6-9a97-3d200c911146	ENQ-2026-0006	Package	Closed	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Giraffe Manor Family Experience	2026-10-17	5	2657600	USD	Prosper Tinarwo	shifttechgs1@gmail.com	+27814303023	\N	testing ignore	2026-10-16 03:19:08.923976+01	/contact?package=Giraffe+Manor+Family+Experience&slug=giraffe-manor-family-experience&checkIn=2026-10-17&nights=5	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 03:19:08.923976+01	2026-10-26 14:56:37.765822+01
3965844a-abd7-4635-b4a3-0909e29ff40f	ENQ-2026-0005	Booking	Closed	\N	\N	\N	\N	\N	\N	Prosper Tinarwo	shifttechgs1@gmail.com	+27814303023	Flight quote: Cape Town	Service: Flight\nDestination: Cape Town\nTravellers: 1 person\n\ntesting	2026-10-16 02:18:10.009061+01	/quote	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 02:18:10.009061+01	2026-10-28 19:26:45.703461+01
dfa8b115-ea99-4bfe-b1db-cf397c311a66	ENQ-2026-0004	General	Closed	\N	\N	\N	\N	\N	\N	Playwright email test	developers@arlink28.com	\N	Email test 2026-10-16T01:04:08.205Z	Automated check that enquiry emails send from production. Safe to delete.	2026-10-16 02:04:13.259535+01	/contact	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 02:04:13.259535+01	2026-10-28 19:26:47.702635+01
664f8419-53ce-4f70-8ef4-94b4c00a34b8	ENQ-2026-0003	Booking	Closed	\N	\N	\N	\N	\N	\N	Prosper Tinarwo	shifttechgs1@gmail.com	+27814303023	Hotel reservation quote: Cape Town	Service: Hotel reservation\nDestination: Cape Town\nTravellers: 1 person\n\ntesting ignore this	2026-10-16 00:27:48.92886+01	/quote	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 00:27:48.92886+01	2026-10-28 19:26:48.494782+01
84c66f82-a9de-44b3-b72b-b8a5949891eb	ENQ-2026-0002	Booking	Closed	\N	\N	\N	\N	\N	\N	Playwright test 23:23:46 (ignore)	developers@arlink28.com	+44 7000 000000	Flight quote: Mail test destination	Service: Flight\nDestination: Mail test destination\nTravellers: 1 person\n\nAutomated test of the quote email routing 23:23:46. Please ignore.	2026-10-16 00:23:57.506447+01	/quote	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 00:23:57.506447+01	2026-10-28 19:26:49.105801+01
42638c3b-72ce-49d8-934b-b5237a420af4	ENQ-2026-0001	General	Closed	\N	\N	\N	\N	\N	\N	Playwright test 23:23:46 (ignore)	developers@arlink28.com	+44 7000 000000	Mail test 23:23:46 - contact form	Automated test of the contact form email routing. Please ignore.	2026-10-16 00:23:47.775762+01	/contact	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-16 00:23:47.775762+01	2026-10-28 19:26:49.780148+01
aa03554e-32a1-48b9-a07c-5a1608b5d8e0	ENQ-2026-0007	Booking	New	\N	\N	\N	\N	\N	\N	Abdullahi Mohammed SULAIMON	barahamasulyman@gmail.com	+2347069500910	Flight quote: Johannesburg (JNB) to Kasane (BBK)	Trip: Return\nFrom: Johannesburg (JNB)\nTo: Kasane (BBK)\nDepart: 2026-10-30\nReturn: 2026-10-31\nTravellers: 1 person	2026-10-30 12:23:56.822264+01	/	\N	2026-10-30 12:23:56.822264+01	2026-10-30 12:23:56.822264+01
\.


--
-- Data for Name: Features; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Features" ("Id", "Slug", "Label", "Icon", "CreatedAt") FROM stdin;
06d26b77-6072-47c1-a8c9-7f41997e7e83	meet-and-greet	Meet & greet service from the airport to the destination	people-group	2026-10-16 03:13:59.79865+01
29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	vip-airport-to-resort	VIP transfer from airport to resort	plane	2026-10-16 03:13:59.79865+01
2ce2ac79-841c-465b-923f-5dc5106b44e3	tips	Tips	hand-holding-dollar	2026-10-16 03:13:59.79865+01
369530dd-dbcf-4fe7-a4e8-da09eb4206c7	vip-home-to-airport	VIP transfer from home to airport	car	2026-10-16 03:13:59.79865+01
44d688c1-caa2-4f41-87b6-14a95030bca0	vat	VAT	receipt	2026-10-16 03:13:59.79865+01
4578c46a-05f6-4efc-8689-23d57bf4ba05	boules-croquet	Boules & croquet	baseball-bat-ball	2026-10-16 03:13:59.79865+01
55a674d9-c7ff-438e-b14f-81c304b70f52	personal-effects	Personal effects	suitcase	2026-10-16 03:13:59.79865+01
5ed14816-6744-407b-b9c7-3e25dec318af	massage-treatments	Massage treatments	spa	2026-10-16 03:13:59.79865+01
861b903c-b7c1-4cb2-a8e4-b052dc780ec5	afew-giraffe-centre	AFEW Giraffe Centre entry	ticket	2026-10-16 03:13:59.79865+01
a55e53f2-a1e9-479a-a536-6780bf407a41	luxury-spirits	Luxury spirits	wine-bottle	2026-10-16 03:13:59.79865+01
a755ca68-16b1-496a-bcda-8b529a09b921	all-meals	All meals	utensils	2026-10-16 03:13:59.79865+01
ab597b1d-b14b-49e5-b735-42e59c1455bc	retreat-access	Access to The Retreat during check-in & check-out	spa	2026-10-16 03:13:59.79865+01
b17f4b12-ceda-4499-b696-b2a28116674e	orchid-house-dining	Orchid House dining	utensils	2026-10-16 03:13:59.79865+01
c0fc5481-9e17-48d5-8237-fb6a8dc39134	selected-wines	Selected wines	wine-glass-empty	2026-10-16 03:13:59.79865+01
c9d32790-1fd1-469e-8326-6a95ad6ef1cd	house-drinks	House wines, soft drinks, beers & spirits	wine-glass	2026-10-16 03:13:59.79865+01
cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	laundry	Laundry	shirt	2026-10-16 03:13:59.79865+01
dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	wifi	Wi-Fi	wifi	2026-10-16 03:13:59.79865+01
de9ac8e5-85f5-4c7c-8c54-b31d83f94636	champagne	Champagne	champagne-glasses	2026-10-16 03:13:59.79865+01
e6040660-0d06-4f1d-bf65-7d1d5c6db260	karen-langata-transfers	Arrival & departure transfers – Karen & Langata area	van-shuttle	2026-10-16 03:13:59.79865+01
eede9629-2716-46c7-9fcf-406c54cd6b3f	health-insurance	Health insurance	notes-medical	2026-10-16 03:13:59.79865+01
01a3db82-ee8e-4965-a87d-f603e9eacbd4	childrens-activities	Children's activities	children	2026-10-16 04:06:40.798023+01
037c2c14-563b-4c47-957f-e991571c2c55	bush-meals	Bush meals	bell-concierge	2026-10-16 04:06:40.798023+01
0501e344-a643-40e5-8dfb-27648183e3c4	plumbed-shower	Plumbed shower	shower	2026-10-16 04:06:40.798023+01
20d438f1-6cd7-4182-87c9-21928942f318	keekorok-transfers	Transfers from Keekorok Airstrip	plane-arrival	2026-10-16 04:06:40.798023+01
372e5cc9-ad2f-429d-8807-8a4531495a88	park-fees	Park fees	ticket	2026-10-16 04:06:40.798023+01
3974ba56-869f-416b-8319-45260065f4c1	camp-airstrip-transfers	Camp and airstrip transfers	plane-arrival	2026-10-16 04:06:40.798023+01
48027ec6-d4f9-42b2-9ff2-459ad39dfdac	luxury-tent-plunge-pool	Luxury tent with private plunge pool	bed	2026-10-16 04:06:40.798023+01
4f48f79b-1db3-4be8-a41e-868f477287f6	evacuation-insurance	Travel emergency evacuation insurance	kit-medical	2026-10-16 04:06:40.798023+01
5222a5e2-40ce-47ab-a4a8-cd1d65853bff	game-drives	Game drives	car-side	2026-10-16 04:06:40.798023+01
56c88cad-d63a-48e1-b9ed-14958de834b5	house-wines	House wines	wine-glass	2026-10-16 04:06:40.798023+01
57e1dc5f-c01a-4deb-be90-cdb9c5207a9f	house-spirits	House spirits	martini-glass	2026-10-16 04:06:40.798023+01
78deb886-ccd0-40a4-adde-63361e4da68c	luxury-accommodation	Luxury accommodation	house	2026-10-16 04:06:40.798023+01
85cbb574-c2e8-490c-8e73-3db3473d33ff	airport-transfers	Airport transfers	plane-arrival	2026-10-16 04:06:40.798023+01
89474492-8f77-4eb6-baa8-a60762d5cdd6	house-soft-drinks	House soft drinks	glass-water	2026-10-16 04:06:40.798023+01
8c331ab1-987b-4a73-b101-bba173f1a5e0	flushing-toilet	Flushing toilet	toilet	2026-10-16 04:06:40.798023+01
9e6ab6ad-810b-4662-bcad-540130c27315	nights-at-property	Nights at the property	bed	2026-10-16 04:06:40.798023+01
a3c836d4-8ff2-4bd4-8816-2dda253459f2	bush-volleyball	Seasonal bush volleyball	volleyball	2026-10-16 04:06:40.798023+01
a9151242-f2f0-4633-9771-cec31507a780	nature-walks	Nature walks	person-hiking	2026-10-16 04:06:40.798023+01
b4ba5418-17cb-4de2-a550-4c16ea5c9dd3	camp-activities	Other camp activities	binoculars	2026-10-16 04:06:40.798023+01
ccdcb881-b143-41ec-a22a-ad793438a741	private-plunge-pools	All tents have private plunge pools	water-ladder	2026-10-16 04:06:40.798023+01
e5a0ba2b-a8b8-4093-8672-3d8d8f6d592f	cigars	Cigars	smoking	2026-10-16 04:06:40.798023+01
e6550ec4-006c-4782-a29b-54c9d3bf97df	sundowners	Sundowners	sun	2026-10-16 04:06:40.798023+01
ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	house-beers	House beers	beer-mug-empty	2026-10-16 04:06:40.798023+01
f8c7fe88-bf72-4a74-b3a3-45ca527dfa8c	ensuite-bath	En suite bathrooms with a bath	bath	2026-10-16 04:06:40.798023+01
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
e2e05894-da91-43dd-89df-6e925a3f74b2	3de13ea3-67d6-47f1-abd0-d4df4106333f	Included	\N	5 nights in Sala’s Camp	\N	0
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
2819b3ac-fd2b-46ee-a330-38b5a9f8172a	0eb3e4e4-40e7-41f9-8ffb-6f83552ed290	Included	\N	4 Nights Accommodation, Premium Sea View Room Daily Breakfast for 2 Adults Return Airport/Port Transfers (Up to 4 pax) Complimentary Wi-Fi Access to Resort Facilities ARLINK28 Booking Support	\N	0
73847195-3643-47ed-a19d-dc347a009c98	3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	Included	\N	Access to Resort Facilities	\N	0
b5f4769a-aeaa-4fc9-98a9-118464babc64	3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	Included	\N	Daily Breakfast for 2 Adults	\N	1
b55894d9-e0cd-45a5-a046-75226a6b0a37	3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	Included	\N	ARLINK28 Booking Support	\N	4
20017f99-0589-46f7-af92-4a4625b44afe	3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	Included	\N	Complimentary Wi-Fi	\N	3
6537d2c5-90a5-4fbb-8192-da22291a9e69	3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	Included	\N	Return Airport/Port Transfers (Up to 4 pax)	\N	2
697dd33d-1a54-4584-8a95-bd1b7ca223c4	6e6117f8-3b1c-411e-9bea-e58e302c8751	Included	\N	ARLINK28 Booking Support	\N	3
ad4d291e-443e-447d-bdcc-f336a91bea53	6e6117f8-3b1c-411e-9bea-e58e302c8751	Included	\N	Return Airport/Port Transfers (Up to 4 pax)	\N	4
0eb85c06-c63f-4aca-8cf4-272ccbf6a5bd	6e6117f8-3b1c-411e-9bea-e58e302c8751	Included	\N	Family Residence	\N	0
c42f38e8-d415-4d65-a2a1-819ff067ab34	6e6117f8-3b1c-411e-9bea-e58e302c8751	Included	\N	5 Nights Accommodation, Spacious Family Residence	\N	5
374ac0de-a60e-4f1e-a4bb-8d4a720a8569	6e6117f8-3b1c-411e-9bea-e58e302c8751	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	1
ec25b624-3d5f-4192-8cdd-ceb3f43c990f	6e6117f8-3b1c-411e-9bea-e58e302c8751	Included	\N	Access to Resort Facilities	\N	2
fe3bc694-20c0-46e1-8353-bde4cd3d6ebd	3de13ea3-67d6-47f1-abd0-d4df4106333f	Included	\N	5 nights in Sasaab	\N	1
905f97f9-b078-4f1b-bea5-6a15e194fa53	3de13ea3-67d6-47f1-abd0-d4df4106333f	Included	\N	Ultimate Safari Collection Journey guests receive shared game-drive vehicle use.	\N	3
6a1ce51a-4086-44c8-83ea-c3f12ce53c05	3de13ea3-67d6-47f1-abd0-d4df4106333f	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	2
81a36878-e8df-462b-8408-75ea6bda606a	dd2a894c-406c-4749-a3ac-9fc75ef98476	Included	\N	2 nights in a luxury tent with private plunge pool,	\N	0
ee3bf200-46b4-45fe-b04f-c22622a18b34	dd2a894c-406c-4749-a3ac-9fc75ef98476	Included	\N	Vehicle Use: For two adults	\N	1
8c6be2c1-e3d6-4822-ad42-53868f9da40f	dd2a894c-406c-4749-a3ac-9fc75ef98476	Included	\N	Tent with Pool or Forest Tent with Pool	\N	2
533a4693-dcab-4c9b-b521-d54e89f71e71	60c8085a-40fc-4924-8761-510541786917	Included	\N	4 nights in a luxury tent with private plunge pool, plus the single-camp list	\N	0
737f7b6e-1147-4306-bd50-b7854c85f7d8	60c8085a-40fc-4924-8761-510541786917	Included	\N	Vehicle Use: For two adults and two children: Sala’s Family Safari guests staying in the standard Keekorok Tent with Pool or Forest Tent with Pool receive shared game-drive vehicle use.	\N	1
aa9a0f59-829c-4e2e-bc0b-f1b8469462c7	c785217e-c83f-4a5c-92c8-fe04be1777eb	Included	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
e868c17a-5384-4c64-8df0-6f971f4a655f	c785217e-c83f-4a5c-92c8-fe04be1777eb	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
fa7e6466-01c8-480f-a19b-55c4f0377c40	c785217e-c83f-4a5c-92c8-fe04be1777eb	Included	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	4
0ad705dd-d51c-4d9e-9101-f3ad47b631b6	c785217e-c83f-4a5c-92c8-fe04be1777eb	Included	06d26b77-6072-47c1-a8c9-7f41997e7e83	\N	\N	3
4963de70-8d7a-4580-b801-c1ef473119ba	c785217e-c83f-4a5c-92c8-fe04be1777eb	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	1
0de44fbc-2dd4-45ad-92cd-fffc4a2ac6c3	c785217e-c83f-4a5c-92c8-fe04be1777eb	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	5
57b7594a-0c8b-42ff-ad34-09b7d41bbb42	a6d5a198-7be4-44fe-8a4b-e16afcd8af25	Included	\N	Vehicle Use: For two adults: Sala’s Extended Mara Experience guests staying in the standard Keekorok Tent with Pool or Forest Tent with Pool receive shared game-drive vehicle use.	\N	1
2f191ae8-136a-4fb6-884e-3708a74626f6	a6d5a198-7be4-44fe-8a4b-e16afcd8af25	Included	\N	4 nights in a luxury tent with private plunge pool, plus the single-camp list	\N	0
266abeca-40ba-4324-b880-272af8f9f351	5851c539-085a-4136-b48f-4cbaa381c97a	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
24c33f29-ecd3-4db2-b8f7-33d759da3ece	5851c539-085a-4136-b48f-4cbaa381c97a	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	10
b9bb2a78-46a9-4f1e-b04c-57f661d65807	5851c539-085a-4136-b48f-4cbaa381c97a	Included	85cbb574-c2e8-490c-8e73-3db3473d33ff	\N	\N	1
7b45f456-3183-4114-ba4e-4e1b098445b0	5851c539-085a-4136-b48f-4cbaa381c97a	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	5
aca0910a-719b-4830-a4f3-ced58847875f	5851c539-085a-4136-b48f-4cbaa381c97a	Included	861b903c-b7c1-4cb2-a8e4-b052dc780ec5	\N	\N	2
9f4fc4cc-e95f-4138-95fa-1d2c549f7bfc	5851c539-085a-4136-b48f-4cbaa381c97a	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	6
49330331-ac4b-45e6-99bc-85de9c6ab50b	5851c539-085a-4136-b48f-4cbaa381c97a	Included	b17f4b12-ceda-4499-b696-b2a28116674e	\N	\N	3
4c266ac3-8725-44d8-a317-8d169691086d	5851c539-085a-4136-b48f-4cbaa381c97a	Included	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	7
379cd652-e3b6-401c-8251-faef587a46ac	5851c539-085a-4136-b48f-4cbaa381c97a	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	9
9350951d-18bd-4edf-b65e-5d54173977b4	5851c539-085a-4136-b48f-4cbaa381c97a	Included	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	8
e5b9e5c4-932b-4484-b790-d4a439cc7cbf	5851c539-085a-4136-b48f-4cbaa381c97a	Included	4578c46a-05f6-4efc-8689-23d57bf4ba05	\N	\N	4
c362dc2c-ee74-4bd1-a57b-5747923f135f	2a3ead31-d5d3-4828-902d-62830a221dc4	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	2
ed830cd4-e235-4cfc-9608-9ba7d084cc28	2a3ead31-d5d3-4828-902d-62830a221dc4	Included	\N	3 nights in Sasaab, plus the multi-destination list	\N	1
94bfc4af-d725-4968-b51c-23b0cf58e08d	2a3ead31-d5d3-4828-902d-62830a221dc4	Included	\N	4 nights in Sala’s Camp	\N	0
9868116c-c2b6-470d-b7b1-9dd357e868b2	2a3ead31-d5d3-4828-902d-62830a221dc4	Included	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	5
76493a50-f0f2-4847-99f2-922c564d0b77	2a3ead31-d5d3-4828-902d-62830a221dc4	Included	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	6
5bbd9b16-03d6-4d94-b541-192b49d0db8c	2a3ead31-d5d3-4828-902d-62830a221dc4	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	3
5e5e0de7-6d87-4624-89c9-dc78b268d2ec	2a3ead31-d5d3-4828-902d-62830a221dc4	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	4
2a25ee38-c563-4b70-a78a-6deaffd14442	203427b1-0e3d-43a3-a274-d7247284fbb8	Included	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	6
818beb25-da66-4e8e-9f86-308576270d79	203427b1-0e3d-43a3-a274-d7247284fbb8	Included	44d688c1-caa2-4f41-87b6-14a95030bca0	\N	\N	5
42cc01f7-3563-42cd-ac16-148290a29f19	203427b1-0e3d-43a3-a274-d7247284fbb8	Included	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	7
275a8335-3928-4cc3-86ba-6894a7865db1	203427b1-0e3d-43a3-a274-d7247284fbb8	Included	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	2
a9863605-5fcd-45fd-baff-44cd2e4364a3	203427b1-0e3d-43a3-a274-d7247284fbb8	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	1
e70fe9c4-a48d-4328-bcb1-5c233cf56e7c	203427b1-0e3d-43a3-a274-d7247284fbb8	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
c69b7306-1dd2-49d6-a77c-7b6fdc1a596c	203427b1-0e3d-43a3-a274-d7247284fbb8	Included	b17f4b12-ceda-4499-b696-b2a28116674e	\N	\N	4
72b145f2-fb6e-42cd-93b9-35a798f2ffc2	203427b1-0e3d-43a3-a274-d7247284fbb8	Included	861b903c-b7c1-4cb2-a8e4-b052dc780ec5	\N	\N	3
675a7ec4-7cf9-49f2-831b-8351f766f9b5	032d070d-1470-4067-8405-69add602c27f	Included	\N	Seafront Luxury Villa | Meal Plan: All-Inclusive	\N	0
c2bfe70b-73b5-4b98-8eae-62dcb51dde8c	1ed61be3-6527-4962-90b9-4cdded3f6395	Included	85cbb574-c2e8-490c-8e73-3db3473d33ff	\N	\N	5
b1510702-5075-496e-87ad-65573296055e	1ed61be3-6527-4962-90b9-4cdded3f6395	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	4
c2927654-7527-453c-a1be-9428cf81fe73	1ed61be3-6527-4962-90b9-4cdded3f6395	Included	ef0a5418-0ae9-4e84-8f79-a9ca99d5dd98	\N	\N	1
8d5df681-3245-4194-a707-fc095144d618	1ed61be3-6527-4962-90b9-4cdded3f6395	Included	89474492-8f77-4eb6-baa8-a60762d5cdd6	\N	\N	0
ecb51436-a21c-4e10-8b0f-e1c98fa9a10f	1ed61be3-6527-4962-90b9-4cdded3f6395	Included	c9d32790-1fd1-469e-8326-6a95ad6ef1cd	\N	\N	2
980377ee-c00d-4ccf-a2a3-ed96704a384e	1ed61be3-6527-4962-90b9-4cdded3f6395	Included	cb59e7a9-b6d6-49c3-87d9-0b0ec113fef8	\N	\N	3
afcc62b0-4028-44a9-b77a-02db68f21fa3	77bb9837-129a-48bd-a38a-d3f1c7e239d1	Included	85cbb574-c2e8-490c-8e73-3db3473d33ff	\N	\N	0
5b677c40-10e0-4b8e-93d9-1fefa2e61ee5	77bb9837-129a-48bd-a38a-d3f1c7e239d1	Included	369530dd-dbcf-4fe7-a4e8-da09eb4206c7	\N	\N	3
9b0bc0f5-b64f-4e18-b648-77c428c0f3b1	77bb9837-129a-48bd-a38a-d3f1c7e239d1	Included	06d26b77-6072-47c1-a8c9-7f41997e7e83	\N	\N	1
1d2430e5-458e-4703-9c3e-d0c78ebf6200	77bb9837-129a-48bd-a38a-d3f1c7e239d1	Included	29bfc2fb-810d-4ea1-8bc4-bfdc8344aced	\N	\N	2
fcc4e2c1-1b61-40bb-abde-b608ab319f76	d23065b8-67e5-4b53-9d62-98b13e764580	Included	\N	All-Inclusive Meal Plan	\N	1
18c39b88-edfb-4484-b103-140786cbd0bf	d23065b8-67e5-4b53-9d62-98b13e764580	Included	\N	Seafront Luxury Villa with Private Pool	\N	0
68e3accb-ef0c-4b8f-a7e2-780e095ae5b4	cfbaf17e-44fb-43fa-86cd-f60946243f01	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
e398fd77-82f1-4a45-be39-2c6bb45a0b49	cfbaf17e-44fb-43fa-86cd-f60946243f01	Included	78deb886-ccd0-40a4-adde-63361e4da68c	\N	\N	1
e1c9cb4c-901b-4937-a963-baec6e552e20	5675c10b-efe3-4b81-bbef-58887a70d72c	PremiumService	89474492-8f77-4eb6-baa8-a60762d5cdd6	\N	\N	2
f7573d33-a390-4249-95b2-6b2dbeca1d45	5675c10b-efe3-4b81-bbef-58887a70d72c	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	0
17579608-397b-4c34-896a-97b4cbae631a	5675c10b-efe3-4b81-bbef-58887a70d72c	PremiumService	dcd88b59-3ba2-4abe-87dc-43cb2e46b5cc	\N	\N	1
2cabb034-5833-4c9b-a69e-0ffc55eb6856	038d47c1-b03c-4eab-a9e6-f6e7b37a5699	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
949cb547-34e6-4455-a7a6-7643119cb4f5	038d47c1-b03c-4eab-a9e6-f6e7b37a5699	Included	\N	Deluxe Garden Bungalow with Partial Sea View	\N	0
f1946f95-9d93-4293-b309-597633d7feb0	6142a357-faeb-4c78-b7b4-4c2a1ae5a3a4	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
36069961-9c4b-441f-9127-f29ec0496c5e	6142a357-faeb-4c78-b7b4-4c2a1ae5a3a4	Included	\N	And More	\N	2
73c3cf95-48a4-4a00-8e65-aa12b65a470f	6142a357-faeb-4c78-b7b4-4c2a1ae5a3a4	Included	\N	Family Villa with Private Pool	\N	0
0cb71687-0502-487a-b4a0-5a932d06c2f2	b8a18ecb-ed12-4444-bd94-694a5c607cce	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
eae6b5a6-f014-45f3-bcc3-c63e6fb5b327	b8a18ecb-ed12-4444-bd94-694a5c607cce	Included	\N	Deluxe Garden Bungalow with Partial Sea View	\N	0
27a3086b-da91-4af7-8abd-71a9199a4276	b3e46c78-9eed-4aa1-abc8-337a462bcbb0	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
a783efde-02fa-4afb-85fe-851bbd175ab7	b3e46c78-9eed-4aa1-abc8-337a462bcbb0	Included	\N	Family Villa with Private Pool	\N	0
9923dc31-1be6-4d04-a88a-d5faa86ea215	36c61c62-83f7-41bf-a605-9521abd2e931	Included	a755ca68-16b1-496a-bcda-8b529a09b921	\N	\N	1
d90a012b-8eed-4cfc-9046-0cc65d692bb6	36c61c62-83f7-41bf-a605-9521abd2e931	Included	\N	Royal Garden Villa with Private Pool	\N	0
2981ea2f-12ba-4840-ba3d-d31e5d1172ae	11111111-1111-1111-1111-111111111111	Included	\N	Private aircraft charter	\N	0
71c97c81-6ed1-45b1-8741-d2339cd8ddd5	11111111-1111-1111-1111-111111111111	Included	\N	VIP ground transfer	\N	1
7735406f-b7ac-42ee-931c-dcc25833fd75	11111111-1111-1111-1111-111111111111	Included	\N	Airport meet and greet	\N	2
d37921ca-9541-44a3-b168-2f13e10b380e	11111111-1111-1111-1111-111111111111	Included	\N	Pre-flight travel coordination	\N	3
4207360e-19f0-4b63-af45-fcf5e720df72	11111111-1111-1111-1111-111111111111	Included	\N	Dedicated booking support	\N	4
e6ba5575-d969-4fb8-902c-ecc5cf834702	22222222-2222-2222-2222-222222222222	Included	\N	Premium in-flight catering	\N	0
386a3b74-15b7-4d07-b195-9bc24c8e4446	22222222-2222-2222-2222-222222222222	Included	\N	Personalised cabin preferences	\N	1
055c983f-f5f0-4c33-829f-3de4a03ff2bf	22222222-2222-2222-2222-222222222222	Included	\N	Welcome gift for the client	\N	2
5f915e02-212f-4d41-9c98-4aa3aae1075f	22222222-2222-2222-2222-222222222222	Included	\N	Enhanced guest-experience coordination	\N	3
f4d20c75-cb48-423f-9137-4055f2c7b8ce	22222222-2222-2222-2222-222222222222	Included	\N	Special dietary and hospitality requirements where available	\N	4
73e3e7f9-2d95-4001-9414-2db132dca5ca	33333333-3333-3333-3333-333333333333	Included	\N	Private aircraft charter	\N	0
9d381a69-4327-4a5a-8940-af6be2f48460	33333333-3333-3333-3333-333333333333	Included	\N	VIP ground transfers	\N	1
de17cd4f-04ef-41af-9955-517d4268a6b1	33333333-3333-3333-3333-333333333333	Included	\N	Meet and greet	\N	2
8ea79f78-2e62-4c34-badb-00d77d72d760	33333333-3333-3333-3333-333333333333	Included	\N	Bespoke cabin styling and décor	\N	3
9e428d99-441a-40da-bb6a-886f7d805913	33333333-3333-3333-3333-333333333333	Included	\N	Specialised catering	\N	4
cf76106c-8be3-4494-a582-5ca07e6a3f59	33333333-3333-3333-3333-333333333333	Included	\N	Personalised guest amenities	\N	5
c1e7fdc0-1464-4f54-8d4b-006466731ef7	33333333-3333-3333-3333-333333333333	Included	\N	Security arrangements	\N	6
7ae783ab-6665-452e-bcee-237e37fb0863	33333333-3333-3333-3333-333333333333	Included	\N	Destination concierge	\N	7
dc5c7183-0a38-460e-9c2e-1cd335433d10	33333333-3333-3333-3333-333333333333	Included	\N	Celebration arrangements	\N	8
af17b9d1-c2e4-42a1-b009-1b78927e1662	33333333-3333-3333-3333-333333333333	Included	\N	Special occasions and welcome setups	\N	9
055c408b-2561-423d-b5e5-80a6947b74ec	33333333-3333-3333-3333-333333333333	Included	\N	Custom gifts and hospitality requirements	\N	10
a999155e-94b8-4afe-9bde-529cc74beed0	33333333-3333-3333-3333-333333333333	Included	\N	Other tailored travel requests based on the client's needs	\N	11
0000c2cf-256a-477d-8f18-b1dc83968b6f	96225bea-1bb5-4992-a7e4-c9e595dc261b	Included	\N	Bed & Breakfast	\N	1
5249c5ae-215d-4274-bc96-6ff05cdef71a	96225bea-1bb5-4992-a7e4-c9e595dc261b	Included	\N	Return Transfers	\N	2
0a3d9266-0e85-467f-830d-c76e9197d818	96225bea-1bb5-4992-a7e4-c9e595dc261b	Included	\N	Premium Partial Sea View Room	\N	0
e768597a-2fef-4afa-814e-08b4d2bff1ab	0b2a1680-e2f8-4ea4-b777-7484839428f9	Included	\N	3-Bedroom Sea View Suite	\N	0
26b7b4db-1a06-4e96-9833-8aef8cf290f4	0b2a1680-e2f8-4ea4-b777-7484839428f9	Included	\N	Return Transfers	\N	1
6c0dd84f-e912-4ccc-b569-3a41ddc7fdb9	0b2a1680-e2f8-4ea4-b777-7484839428f9	Included	\N	Daily Breakfast	\N	2
e9fc11e6-ea92-42aa-a048-18cf9d0e2e0f	904a68f3-bac6-4076-b404-b8cf418cb4ce	Included	\N	Equipped Kitchen, Private Pool & Large Garden Butler Service, Private Chef on Request	\N	5
7816bda2-88a1-4462-a45f-3e57e8e00c81	904a68f3-bac6-4076-b404-b8cf418cb4ce	Included	\N	Complimentary Wi-Fi	\N	3
c2867382-1e79-4b2a-8e16-cec60b9bea09	904a68f3-bac6-4076-b404-b8cf418cb4ce	Included	\N	Royal Villa with Private Pool & Sea View	\N	0
d218429d-5bb2-4b38-9bd2-dca9a10e1857	904a68f3-bac6-4076-b404-b8cf418cb4ce	Included	\N	Return Airport/Port Transfers (Up to 9 pax)	\N	2
adce564d-3689-4d19-aee4-f29e29ec3536	904a68f3-bac6-4076-b404-b8cf418cb4ce	Included	\N	Daily Breakfast for 6 Adults	\N	1
b8c0ed8b-e584-4026-bd2e-adf040fa605a	904a68f3-bac6-4076-b404-b8cf418cb4ce	Included	\N	Access to Resort Facilities	\N	4
e2b34304-4bbd-41d7-8a4e-46d569b47d84	4d05e06f-86f1-4e81-a921-feb8de65b121	Included	\N	Premium Partial Sea View Room	\N	2
d54b69c2-125d-416a-ae77-2e4e8d491134	4d05e06f-86f1-4e81-a921-feb8de65b121	Included	\N	Return Airport/Port Transfers	\N	4
bb80edaf-a30e-4bcc-b79a-2f6af523d368	4d05e06f-86f1-4e81-a921-feb8de65b121	Included	\N	Complimentary Wi-Fi	\N	5
f8539181-a1c7-4c89-9e0e-9a0f3209b912	4d05e06f-86f1-4e81-a921-feb8de65b121	Included	\N	Daily Breakfast	\N	3
a3305522-1806-4788-a20f-ddadad961a6f	4d05e06f-86f1-4e81-a921-feb8de65b121	Included	\N	Access to Resort Facilities	\N	1
a9dd5df7-f94e-48d7-871b-18f951a8a786	4d05e06f-86f1-4e81-a921-feb8de65b121	Included	\N	3 Nights Accommodation	\N	0
1ad7d943-d7f0-4f57-9775-2f749f50ff4a	5b7901a1-09d3-45e2-9603-d6909c7852f5	Included	\N	3 Nights Accommodation, Premium Sea View Room Daily Breakfast Return Airport/Port Transfers Complimentary Wi-Fi Access to Resort Facilities ARLINK28 Booking Support	\N	0
38067041-b07a-4d39-962a-ab2cfdc8c899	d84ad498-15ae-4835-9269-fd60883a88ea	Included	\N	4 Nights Accommodation, Premium Partial Sea View Room Daily Breakfast for 1 Adult Return Airport/Port Transfers Complimentary Wi-Fi	\N	0
\.


--
-- Data for Name: PackageMedia; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."PackageMedia" ("Id", "PackageId", "Role", "Path", "Alt", "Caption", "Width", "Height", "VideoProvider", "VideoId", "VariantsReady", "SortKey", "CreatedAt") FROM stdin;
b5b69c87-e529-4601-9387-4af2d411e533	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-extended-family-package	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	2	2026-10-16 04:06:40.798023+01
ab6b2a97-9946-4a1c-86be-9bd90d587008	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Gallery	/images/packages/stock-lodgepool.jpg?for=salas-classic-safari	A safari lodge and its pool at dusk	\N	\N	\N	\N	\N	t	2	2026-10-16 04:06:40.798023+01
042dffe0-dfe2-4618-9983-4e23fb1b1f36	46a039e6-d50d-4f47-ac0e-30ab22d97535	Gallery	/images/packages/gm-dining.jpg?for=giraffe-manor-solo-escape	A lodge dining room with a timber ceiling	\N	\N	\N	\N	\N	t	2	2026-10-16 04:06:40.798023+01
1d23e8d8-73e1-435d-864f-388bb917f866	46a039e6-d50d-4f47-ac0e-30ab22d97535	Gallery	/images/packages/gm-giraffe.jpg?for=giraffe-manor-solo-escape	A giraffe on the open plains	\N	\N	\N	\N	\N	t	1	2026-10-16 04:06:40.798023+01
29626bb4-cf9a-4497-8987-37a5240d2d93	46a039e6-d50d-4f47-ac0e-30ab22d97535	Hero	/images/packages/gm-pool.jpg?for=giraffe-manor-solo-escape	A guest watching a giraffe from a lodge pool	\N	\N	\N	\N	\N	t	0	2026-10-16 04:06:40.798023+01
aa3224d2-797b-4eca-8266-87d6b217e41f	46a039e6-d50d-4f47-ac0e-30ab22d97535	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-solo-escape	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	3	2026-10-16 04:06:40.798023+01
c4510116-5c45-4419-b8de-e745b29ac2f5	46a039e6-d50d-4f47-ac0e-30ab22d97535	Gallery	/images/packages/gm-savanna.jpg?for=giraffe-manor-solo-escape	An acacia tree at sunset on the savanna	\N	\N	\N	\N	\N	t	4	2026-10-16 04:06:40.798023+01
2a90c349-43d9-4660-ab0c-79db12ad6c97	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Gallery	/images/packages/gm-pool.jpg?for=giraffe-manor-signature-escape	A guest watching a giraffe from a lodge pool	\N	\N	\N	\N	\N	t	2	2026-10-16 04:06:40.798023+01
4167baf2-7c19-47c7-8cb4-80195b4976e8	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Hero	/images/packages/gm-giraffe.jpg?for=giraffe-manor-signature-escape	A giraffe on the open plains	\N	\N	\N	\N	\N	t	0	2026-10-16 04:06:40.798023+01
4f1ac93e-d761-46e5-8f4a-a7799d4c1fd9	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Gallery	/images/packages/gm-herd.jpg?for=giraffe-manor-signature-escape	Giraffes crossing dry grassland	\N	\N	\N	\N	\N	t	4	2026-10-16 04:06:40.798023+01
b1bdd921-b9d5-4db1-a405-bf21391202c5	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-signature-escape	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	3	2026-10-16 04:06:40.798023+01
fed30132-13f8-49f4-aef4-9ebbbd19db63	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	Gallery	/images/packages/gm-dining.jpg?for=giraffe-manor-signature-escape	A lodge dining room with a timber ceiling	\N	\N	\N	\N	\N	t	1	2026-10-16 04:06:40.798023+01
ef58c8eb-18f9-4c9b-b7dd-dc08725d7a21	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Gallery	/images/packages/gm-dining.jpg?for=giraffe-manor-extended-family-package	A lodge dining room with a timber ceiling	\N	\N	\N	\N	\N	t	4	2026-10-16 04:06:40.798023+01
21bdbddb-bb4e-4bab-9ac4-91b548d63534	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Gallery	/images/packages/gm-herd.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	Giraffes crossing dry grassland	\N	\N	\N	\N	\N	t	4	2026-10-16 04:06:40.798023+01
31e5d6ba-ba2a-40c1-9d84-17bd6c9be2cb	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	1	2026-10-16 04:06:40.798023+01
bc4a5d53-ee9c-4f63-8c1d-c556f740f565	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Gallery	/images/packages/gm-herd.jpg?for=giraffe-manor-extended-family-package	Giraffes crossing dry grassland	\N	\N	\N	\N	\N	t	3	2026-10-16 04:06:40.798023+01
8b3b632d-23ba-4162-b42b-34d3d79ec576	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Hero	/images/packages/gm-dining.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	A lodge dining room with a timber ceiling	\N	\N	\N	\N	\N	t	0	2026-10-16 04:06:40.798023+01
08059155-065c-4e52-a211-10136c438ed1	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Hero	/images/packages/gm-savanna.jpg?for=salas-classic-safari	An acacia tree at sunset on the savanna	\N	\N	\N	\N	\N	t	0	2026-10-16 04:06:40.798023+01
cb780f0a-09ce-4567-83cd-3e1f7ae544b5	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Gallery	/images/packages/gm-lodge.jpg?for=salas-classic-safari	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	3	2026-10-16 04:06:40.798023+01
b030271b-19f3-4d80-8d9a-e544ad48e8fd	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	Hero	/images/packages/gm-pool.jpg?for=giraffe-manor-extended-family-package	A guest watching a giraffe from a lodge pool	\N	\N	\N	\N	\N	t	1	2026-10-16 04:06:40.798023+01
e540863d-d468-4fa9-a653-94d69a8f882c	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Gallery	/images/packages/gm-savanna.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	An acacia tree at sunset on the savanna	\N	\N	\N	\N	\N	t	3	2026-10-16 04:06:40.798023+01
f1a9776e-b6b5-4a1e-a464-54da8fa66e60	d4d1b4e2-95d8-41fc-88a7-a25103292e81	Gallery	/images/packages/gm-giraffe.jpg?for=giraffe-manor-family-and-friends-retreat-3-adults	A giraffe on the open plains	\N	\N	\N	\N	\N	t	2	2026-10-16 04:06:40.798023+01
0660fd3e-24d0-4082-b049-1d8a6ce4eec8	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Gallery	/images/packages/gm-pool.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	A guest watching a giraffe from a lodge pool	\N	\N	\N	\N	\N	t	4	2026-10-16 04:06:40.798023+01
11ca6fcd-4af4-4ea1-b6fc-19540485dff9	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Gallery	/images/packages/gm-giraffe.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	A giraffe on the open plains	\N	\N	\N	\N	\N	t	2	2026-10-16 04:06:40.798023+01
28b43b6c-9d69-492a-b3c2-04dc49ab6f12	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Hero	/images/packages/gm-savanna.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	An acacia tree at sunset on the savanna	\N	\N	\N	\N	\N	t	0	2026-10-16 04:06:40.798023+01
713bc7f3-d502-4992-806f-7c185ec34287	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Gallery	/images/packages/gm-lodge.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	The open-air lounge of a thatched lodge	\N	\N	\N	\N	\N	t	3	2026-10-16 04:06:40.798023+01
828dd204-7892-4c40-85b0-14a06bd84e20	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	Gallery	/images/packages/gm-herd.jpg?for=giraffe-manor-family-and-friends-retreat-4-adults	Giraffes crossing dry grassland	\N	\N	\N	\N	\N	t	1	2026-10-16 04:06:40.798023+01
57f23530-496f-4d8a-9a98-83998b7c17f2	0eb3e4e4-40e7-41f9-8ffb-6f83552ed290	Hero	/media/packages/0eb3e4e440e741f98ffb6f83552ed290/8b46af2e29994661b274e449ee9657c7.jpg	zanzibar escape	\N	\N	\N	\N	\N	f	0	2026-11-03 11:27:42.266857+01
93a0dc9f-5d77-459c-9422-ae2457766aad	3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	Hero	/media/packages/3fbc4d93c09c4403932ac7ff79b2d2b6/c28d9fbe5a354941bd87ca56e21105d7.jpg	Zanzibar Mini Escape	\N	\N	\N	\N	\N	f	0	2026-11-03 11:55:35.460098+01
49382929-5e86-4ad4-b4b8-cabe93b0bdcb	6e6117f8-3b1c-411e-9bea-e58e302c8751	Hero	/media/packages/6e6117f83b1c411e9beae58e302c8751/37620c0a340940c990360f7a7fb918b0.jpg	Zanzibar Family & Friends Escape	\N	\N	\N	\N	\N	f	0	2026-11-03 12:09:08.745672+01
27c598d2-b791-4f90-bcf9-1d2a6d202201	3de13ea3-67d6-47f1-abd0-d4df4106333f	Hero	/media/packages/3de13ea367d647f1abd0d4df4106333f/ba414db9cd9a44b3ad0d619f16c29ad5.jpg	Ultimate Safari Collection Journey (savings season)	\N	\N	\N	\N	\N	f	0	2026-11-03 13:23:00.199699+01
83888f26-c4fd-4bcc-af9d-66fc863378dc	dd2a894c-406c-4749-a3ac-9fc75ef98476	Hero	/media/packages/dd2a894c406c4749a3ac9fc75ef98476/dbd18524ff084750a04b16c51949fe46.jpg	Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	\N	\N	\N	\N	\N	f	0	2026-11-03 13:36:37.893167+01
7424caf1-e612-4115-8f23-bfdde76be641	60c8085a-40fc-4924-8761-510541786917	Gallery	/media/packages/60c8085a40fc49248761510541786917/7676fadc7845481e8e9e8633dd53e816.jpg	Sala’s Family Safari	\N	\N	\N	\N	\N	f	2	2026-11-03 13:45:31.53345+01
8b8b50ff-eaec-4b9a-91c6-5418e7d32dce	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Hero	/media/packages/f415c589bdfc4fd1804dffa5fff66ac6/2926f55a353346918b9593e6e35c219a.jpg	Safari Collection Explorer (Sasaab first)3	\N	\N	\N	\N	\N	f	0	2026-11-03 14:03:42.26835+01
a218133a-20b1-4521-b1d9-d8725d46948d	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Gallery	/media/packages/f415c589bdfc4fd1804dffa5fff66ac6/f936526aeca5472080f0c3a524af4649.jpg	Safari Collection Explorer (Sasaab first)	\N	\N	\N	\N	\N	f	3	2026-11-03 14:03:42.282843+01
0579b401-1989-4bb9-a319-04bed582cd53	60c8085a-40fc-4924-8761-510541786917	Gallery	/media/packages/60c8085a40fc49248761510541786917/46c39318912741c6a32a37b949fa7407.jpg	Sala’s Family Safari1	\N	\N	\N	\N	\N	f	1	2026-11-03 13:45:31.310448+01
699c4fb9-79ac-47c8-8b86-b730338c3453	60c8085a-40fc-4924-8761-510541786917	Hero	/media/packages/60c8085a40fc49248761510541786917/e2ecae48151e4ecca414963dac37d8f9.jpg	Sala’s Family Safari	\N	\N	\N	\N	\N	f	0	2026-11-03 13:45:31.376482+01
f71b09a0-5f0f-4060-9afd-c3f94255d97b	c785217e-c83f-4a5c-92c8-fe04be1777eb	Gallery	/media/packages/c785217ec83f4a5c92c8fe04be1777eb/fafe4a1161004ff0a56c261b2e369360.jpg	Giraffe Manor Family Celebration	\N	\N	\N	\N	\N	f	2	2026-11-03 13:55:40.05359+01
2a9f68fa-5b37-4824-8819-f13b624d1ca8	c785217e-c83f-4a5c-92c8-fe04be1777eb	Gallery	/media/packages/c785217ec83f4a5c92c8fe04be1777eb/f1c1b74ca3034a188c691fe214e5f369.jpg	Giraffe Manor Family Celebration2	\N	\N	\N	\N	\N	f	1	2026-11-03 13:55:40.050669+01
29d0dee4-167a-4db9-a687-6c39d92a21ad	c785217e-c83f-4a5c-92c8-fe04be1777eb	Hero	/media/packages/c785217ec83f4a5c92c8fe04be1777eb/cc35184ebe0644929093dc4a640e2ec0.jpg	Giraffe Manor Family Celebration1	\N	\N	\N	\N	\N	f	0	2026-11-03 13:55:40.007101+01
be704549-1030-4aa2-8cae-30ca675c738c	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Gallery	/media/packages/f415c589bdfc4fd1804dffa5fff66ac6/6a6f85fd12ac4695a56bdd9a107e1799.jpg	Safari Collection Explorer (Sasaab first)2	\N	\N	\N	\N	\N	f	1	2026-11-03 14:03:42.274016+01
084b8293-8af2-4179-b277-9d602f22367c	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	Gallery	/media/packages/f415c589bdfc4fd1804dffa5fff66ac6/999378275f0340bc813989cb7f1c767e.jpg	Safari Collection Explorer (Sasaab first)1	\N	\N	\N	\N	\N	f	2	2026-11-03 14:03:42.277909+01
94b03beb-b8b9-458a-af17-268dd26661cf	a6d5a198-7be4-44fe-8a4b-e16afcd8af25	Hero	/media/packages/a6d5a1987be444fe8a4be16afcd8af25/9773a4ade6984f98a3e9a60146d980b2.jpg	Masai Mara Safari Experience3	\N	\N	\N	\N	\N	f	0	2026-11-03 14:10:19.606889+01
5eaadee7-febc-45a5-bfa9-34d067679df8	a6d5a198-7be4-44fe-8a4b-e16afcd8af25	Gallery	/media/packages/a6d5a1987be444fe8a4be16afcd8af25/f6acdf3e3b5e4bacb73227be6f68151f.jpg	Masai Mara Safari Experience2	\N	\N	\N	\N	\N	f	1	2026-11-03 14:10:19.615613+01
b2707033-f9e0-460a-ae91-6d621411820c	a6d5a198-7be4-44fe-8a4b-e16afcd8af25	Gallery	/media/packages/a6d5a1987be444fe8a4be16afcd8af25/5ee2dda347344642b2f849f0d9c1df82.jpg	Masai Mara Safari Experience1	\N	\N	\N	\N	\N	f	2	2026-11-03 14:10:19.853847+01
ca4efacb-7be0-4ba6-a018-b91d355e4751	a6d5a198-7be4-44fe-8a4b-e16afcd8af25	Gallery	/media/packages/a6d5a1987be444fe8a4be16afcd8af25/4dfd5e16111749e39337c07c742c1f58.jpg	Masai Mara Safari Experience	\N	\N	\N	\N	\N	f	3	2026-11-03 14:10:19.855823+01
4e6deb53-2e12-47e3-b309-79065f768cd5	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Gallery	/media/packages/0ae7b7ebacae481d9606b99cdb5af83e/79d45d0e82f04bdbbd311ab79e3786cf.jpg	elewana sand river camp masai mara	\N	\N	\N	\N	\N	f	1	2026-10-27 07:33:46.863721+01
b4123589-2349-48f5-b8cf-94939361e076	0ae7b7eb-acae-481d-9606-b99cdb5af83e	Gallery	/media/packages/0ae7b7ebacae481d9606b99cdb5af83e/d9a73e1255324872af6fb420897efbfe.jpg	sand river camp luxury safari masai mara national reserve	\N	\N	\N	\N	\N	f	4	2026-10-27 07:34:03.084418+01
b7a56baf-796d-4946-b23e-d7c269bd8eab	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Gallery	/media/packages/12f4b08b286b4f7ab05a3c6e14edd43c/1f5a5f903eb049ef9604350cdd3e65d6.jpg	Sala’s Extended Mara Experience	\N	\N	\N	\N	\N	f	3	2026-11-03 14:14:02.235121+01
079bc7c5-084a-4133-9a14-2578936e88d6	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Gallery	/media/packages/12f4b08b286b4f7ab05a3c6e14edd43c/aafc35d60ea34818b938df3ef309f9e4.jpg	Sala’s Extended Mara Experience1	\N	\N	\N	\N	\N	f	2	2026-11-03 14:14:02.231933+01
faca7e9d-6b53-4c07-808a-79aa13ba33c2	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Hero	/media/packages/12f4b08b286b4f7ab05a3c6e14edd43c/207a29021d89441492d000d6296e7bab.jpg	Sala's Extended Mara Experience	\N	\N	\N	\N	\N	f	0	2026-11-03 14:14:02.210185+01
851b225b-85c9-4081-9251-e0b1b2604fd4	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	Gallery	/media/packages/12f4b08b286b4f7ab05a3c6e14edd43c/6aa791a555fc4db9b39a943b325dec9f.jpg	Sala’s Extended Mara Experience3	\N	\N	\N	\N	\N	f	1	2026-11-03 14:14:02.226947+01
1c308878-6dbc-4f9e-82ec-7fd38c00d38b	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Gallery	/media/packages/5daabefde11548aba84e33e6eb68f7f9/de2489795a9f4b5f933416086fdb6701.jpg	Giraffe Manor Family Experience5	\N	\N	\N	\N	\N	f	1	2026-11-03 14:19:24.03228+01
3fc2ca6d-e24e-49e8-98cf-2ddeabe39ab0	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Gallery	/media/packages/5daabefde11548aba84e33e6eb68f7f9/0fc14a084a984e61b0c7dc819bfe30aa.jpg	Giraffe Manor Family Experience	\N	\N	\N	\N	\N	f	3	2026-11-03 14:19:24.066624+01
c9f16cd1-fdc1-4ecb-bd3d-7a073f75342f	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Gallery	/media/packages/5daabefde11548aba84e33e6eb68f7f9/5a97e0517aa44476adb5d6dba19efc86.jpg	Giraffe Manor Family Experience	\N	\N	\N	\N	\N	f	2	2026-11-03 14:19:24.058461+01
9f8e9b43-4ba2-45c4-bbcb-e49626d7c2ae	5daabefd-e115-48ab-a84e-33e6eb68f7f9	Hero	/media/packages/5daabefde11548aba84e33e6eb68f7f9/f5b1150505d5473dabd2cc5709fd96d9.jpg	Giraffe Manor Family Experience7	\N	\N	\N	\N	\N	f	0	2026-11-03 14:19:23.992233+01
37615cc9-f657-438f-a018-ba77e22d1a81	5851c539-085a-4136-b48f-4cbaa381c97a	Gallery	/media/packages/5851c539085a4136b48f4cbaa381c97a/5def9a84039a4dc6ba2336de7fb1775e.jpg	Giraffe Manor Grand Escape	\N	\N	\N	\N	\N	f	3	2026-11-03 14:27:22.889624+01
67d375a4-d1fd-4bff-a95d-f12bc66920ab	5851c539-085a-4136-b48f-4cbaa381c97a	Hero	/media/packages/5851c539085a4136b48f4cbaa381c97a/83bf9b97c73744e89585cc2a599cf667.jpg	Giraffe Manor Grand Escape2	\N	\N	\N	\N	\N	f	0	2026-11-03 14:27:22.873319+01
3ee5d5b4-79a0-48ed-a14a-56d465a457ef	5851c539-085a-4136-b48f-4cbaa381c97a	Gallery	/media/packages/5851c539085a4136b48f4cbaa381c97a/9e45aad93dde4e89ae424041029b88e8.jpg	Giraffe Manor Grand Escape1	\N	\N	\N	\N	\N	f	2	2026-11-03 14:27:22.886165+01
b8e40c6c-4e0b-4e20-98e4-b21976edee53	5851c539-085a-4136-b48f-4cbaa381c97a	Gallery	/media/packages/5851c539085a4136b48f4cbaa381c97a/13d9a76d3dee45e48205de207572a454.jpg	Giraffe Manor Grand Escape3	\N	\N	\N	\N	\N	f	1	2026-11-03 14:27:22.882939+01
5e5f1354-a3fb-4e46-aff3-ef34f62115a6	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/802d88f121ba49b0bc7b88c79f27a275.jpg	Sala’s Family Safari	\N	\N	\N	\N	\N	f	3	2026-11-03 14:32:17.093502+01
e602410c-5d8a-483a-8269-c641c016391d	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/2d7c39c5205c40139715f88ef9fdc025.jpg	Sala’s Family Safari 1	\N	\N	\N	\N	\N	f	4	2026-11-03 14:32:17.098066+01
d92e1a39-508f-424b-821e-9cc1fd89c3eb	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/5ef186020faf48979212412f5c089334.jpg	Sala’s Family Safari5	\N	\N	\N	\N	\N	f	2	2026-11-03 14:32:17.088417+01
878857eb-4a3a-4f1b-bf25-d6d6aa0a9137	032d070d-1470-4067-8405-69add602c27f	Gallery	/media/packages/032d070d14704067840569add602c27f/2bb94a34cee547c3b73d330c90e2a1ae.jpg	Tulia Seafront Luxury Escape	\N	\N	\N	\N	\N	f	1	2026-11-03 20:13:03.332711+01
be203d59-38f3-4dcc-88cd-e143db8cf8a5	1ed61be3-6527-4962-90b9-4cdded3f6395	Gallery	/media/packages/1ed61be36527496290b94cdded3f6395/9f05b828ff094a8da33c16bb0494adb9.jpg	Ultimate Safari Collection Journey	\N	\N	\N	\N	\N	f	3	2026-11-03 20:31:53.813589+01
67012f76-b62a-4709-a67e-98381447f7f2	3becabc0-2844-47e8-a330-f83a44db48cc	Hero	/media/packages/3becabc0284447e8a330f83a44db48cc/53b72d50fbbe4b2e88e4b12814847a6d.jpg	Sala’s Family Safari	\N	\N	\N	\N	\N	f	0	2026-11-03 14:32:17.082728+01
84fc31a6-71d7-4e73-915a-0719ec04fc5f	3becabc0-2844-47e8-a330-f83a44db48cc	Gallery	/media/packages/3becabc0284447e8a330f83a44db48cc/dc30b3c6c46e429aa1ada5a2e55e85a4.jpg	Sala’s Family Safari=	\N	\N	\N	\N	\N	f	1	2026-11-03 14:32:17.069216+01
b22d18ee-3763-442d-a781-e795081a1420	2a3ead31-d5d3-4828-902d-62830a221dc4	Gallery	/media/packages/2a3ead31d5d34828902d62830a221dc4/3765cae0ea0044b3b981cdcd19c0f178.jpg	Safari Collection Explorer (Sala’s first)1	\N	\N	\N	\N	\N	f	2	2026-11-03 14:50:19.660217+01
0676bd6d-d1c4-4d44-8edf-517d320fe655	2a3ead31-d5d3-4828-902d-62830a221dc4	Gallery	/media/packages/2a3ead31d5d34828902d62830a221dc4/54771b5ab32a411f8ef0ed90cd406595.jpg	Safari Collection Explorer (Sala’s first)	\N	\N	\N	\N	\N	f	3	2026-11-03 14:50:19.662799+01
1ef3a117-4765-458b-b3f5-4d4d557c271d	2a3ead31-d5d3-4828-902d-62830a221dc4	Hero	/media/packages/2a3ead31d5d34828902d62830a221dc4/814e7b6c719b4abca90fb947c1bbceb1.jpg	Safari Collection Explorer (Sala’s first)=	\N	\N	\N	\N	\N	f	0	2026-11-03 14:50:19.649719+01
33f0a4c2-a67d-4777-8ffc-501329817aa4	2a3ead31-d5d3-4828-902d-62830a221dc4	Gallery	/media/packages/2a3ead31d5d34828902d62830a221dc4/da99700da1314f87aef22a17bdccc6f0.jpg	Safari Collection Explorer (Sala’s first)3	\N	\N	\N	\N	\N	f	1	2026-11-03 14:50:19.657156+01
c10a62a6-c5dd-4e9d-9c0d-ea6b5a15c4a8	203427b1-0e3d-43a3-a274-d7247284fbb8	Gallery	/media/packages/203427b10e3d43a3a274d7247284fbb8/dadd9b0fecb34edb88b87d70fd847531.jpg	Giraffe Manor Luxury Escape	\N	\N	\N	\N	\N	f	2	2026-11-03 14:59:02.031398+01
f5b54b41-0817-486f-8ec1-0cd772be80cf	203427b1-0e3d-43a3-a274-d7247284fbb8	Hero	/media/packages/203427b10e3d43a3a274d7247284fbb8/aed77a709921499db7cbc7aeffb6b57d.jpg	Giraffe Manor Luxury Escape2	\N	\N	\N	\N	\N	f	0	2026-11-03 14:59:01.94794+01
272cf00a-ec59-4a77-9a0d-e500620f5c9d	203427b1-0e3d-43a3-a274-d7247284fbb8	Gallery	/media/packages/203427b10e3d43a3a274d7247284fbb8/707cadd3200c42c6a0b4517bd304fc0c.jpg	Giraffe Manor Luxury Escape=	\N	\N	\N	\N	\N	f	1	2026-11-03 14:59:02.00118+01
c7e88d02-ce69-4a43-9ba9-64f4c4b0afa5	1ed61be3-6527-4962-90b9-4cdded3f6395	Hero	/media/packages/1ed61be36527496290b94cdded3f6395/7763365af0ec4f6d9dcedd7c0ede706f.jpg	Ultimate Safari Collection Journey0	\N	\N	\N	\N	\N	f	0	2026-11-03 20:31:53.79889+01
22bffc22-d82c-462f-8249-95ee79e82a46	1ed61be3-6527-4962-90b9-4cdded3f6395	Gallery	/media/packages/1ed61be36527496290b94cdded3f6395/32211b604fff4dcda874068a0fa05850.jpg	Ultimate Safari Collection Journey1	\N	\N	\N	\N	\N	f	2	2026-11-03 20:31:53.807756+01
d00d4c47-35cb-4503-8558-1233ced20c7c	77bb9837-129a-48bd-a38a-d3f1c7e239d1	Gallery	/media/packages/77bb9837129a48bda38ad3f1c7e239d1/efcdd5642c10401fb7ee32a2994aa0c2.jpg	Tulia Extended Stay	\N	\N	\N	\N	\N	f	2	2026-11-03 20:40:00.074121+01
b88e349e-99c8-4e1e-8b24-19565f11dad8	77bb9837-129a-48bd-a38a-d3f1c7e239d1	Hero	/media/packages/77bb9837129a48bda38ad3f1c7e239d1/ee10359c15004984b0558254a3c8e580.jpg	Tulia Extended Stay3	\N	\N	\N	\N	\N	f	0	2026-11-03 20:40:00.062331+01
23cf8dec-a001-495b-9003-d0ee824e4ff7	1ed61be3-6527-4962-90b9-4cdded3f6395	Gallery	/media/packages/1ed61be36527496290b94cdded3f6395/c8a13920d50d4f359a8082665a8e68bb.jpg	Ultimate Safari Collection Journey=	\N	\N	\N	\N	\N	f	1	2026-11-03 20:31:53.80383+01
3941680e-0863-4ec6-b035-04d10f8c13c6	032d070d-1470-4067-8405-69add602c27f	Gallery	/media/packages/032d070d14704067840569add602c27f/2510ec5d5cbb490499e8ab4f446c9299.jpg	Tulia Seafront Luxury Escape	\N	\N	\N	\N	\N	f	2	2026-11-03 20:13:03.244168+01
3706e332-415f-4e80-8180-0ae2276f910f	032d070d-1470-4067-8405-69add602c27f	Hero	/media/packages/032d070d14704067840569add602c27f/661a6e1540414aa1b75ab3fe666fe342.jpg	Tulia Seafront Luxury Escape1	\N	\N	\N	\N	\N	f	0	2026-11-03 20:13:03.328185+01
a59d9ecb-7c76-4aeb-afda-311123b5e584	77bb9837-129a-48bd-a38a-d3f1c7e239d1	Gallery	/media/packages/77bb9837129a48bda38ad3f1c7e239d1/e9d1373b2cc3416094af7e6786bdcef1.jpg	Tulia Extended Stay1	\N	\N	\N	\N	\N	f	1	2026-11-03 20:40:00.069722+01
c5dfdd48-a0a4-4b61-a592-c52ccd7b359e	d23065b8-67e5-4b53-9d62-98b13e764580	Gallery	/media/packages/d23065b867e54b539d6298b13e764580/7f9692349b144ef5825408fe9c5d740c.jpg	Tulia Ultimate Private Pool Escape2	\N	\N	\N	\N	\N	f	2	2026-11-03 21:03:58.40226+01
bb72386c-603f-405e-80ff-1995296e1e6c	d23065b8-67e5-4b53-9d62-98b13e764580	Gallery	/media/packages/d23065b867e54b539d6298b13e764580/608938a4c14545b3a4dcc906fb0e171a.jpg	Tulia Ultimate Private Pool Escape=	\N	\N	\N	\N	\N	f	1	2026-11-03 21:03:58.397085+01
d7c4d5ab-2a31-4368-b1ba-5970e9c2ab08	d23065b8-67e5-4b53-9d62-98b13e764580	Hero	/media/packages/d23065b867e54b539d6298b13e764580/3418112a7c444bec855d51f56e7e8b0e.jpg	Tulia Ultimate Private Pool Escape	\N	\N	\N	\N	\N	f	0	2026-11-03 21:03:58.390501+01
bdbea060-048a-43d5-9d06-499075eaa847	d23065b8-67e5-4b53-9d62-98b13e764580	Gallery	/media/packages/d23065b867e54b539d6298b13e764580/8625a4b4e4fd44c687d0c665caef2a38.jpg	Tulia Ultimate Private Pool Escape1	\N	\N	\N	\N	\N	f	3	2026-11-03 21:03:58.410712+01
985200d7-4136-4ff2-b1d5-cdebf69de3d9	cfbaf17e-44fb-43fa-86cd-f60946243f01	Gallery	/media/packages/cfbaf17e44fb43fa86cdf60946243f01/2b6cb2e017e8476b87e8905878148919.jpg	Tulia All Inclusive Escape 1	\N	\N	\N	\N	\N	f	2	2026-11-03 21:16:50.076789+01
b10031ce-3f16-4301-990c-2d470455f3f9	cfbaf17e-44fb-43fa-86cd-f60946243f01	Gallery	/media/packages/cfbaf17e44fb43fa86cdf60946243f01/c531324e550d4ed8b437832a495d6601.jpg	Tulia All Inclusive Escape 5	\N	\N	\N	\N	\N	f	1	2026-11-03 21:16:50.070475+01
745ec61d-8bf7-43f4-9664-0294524b5aa1	cfbaf17e-44fb-43fa-86cd-f60946243f01	Gallery	/media/packages/cfbaf17e44fb43fa86cdf60946243f01/77ecbbf5a9914687aa0d5af7a8b7d10d.jpg	Tulia All Inclusive Escape	\N	\N	\N	\N	\N	f	3	2026-11-03 21:16:50.081253+01
e2fddbc9-bc73-48a7-ae09-b68ac0bb05a6	cfbaf17e-44fb-43fa-86cd-f60946243f01	Hero	/media/packages/cfbaf17e44fb43fa86cdf60946243f01/15a58611ffd04bcfb1a1f4a51dabbbb3.jpg	Tulia All Inclusive Escape2	\N	\N	\N	\N	\N	f	0	2026-11-03 21:16:50.065895+01
222e6f38-c07b-4595-bae3-363fbd89e8bc	5675c10b-efe3-4b81-bbef-58887a70d72c	Hero	/media/packages/5675c10befe34b81bbef58887a70d72c/5668f8fbedc54622be97f49f1b08b0c8.jpg	Tulia All Inclusive Short Escape3	\N	\N	\N	\N	\N	f	0	2026-11-03 21:22:38.655035+01
20181e6e-3463-45ad-bcc2-dec17f74cbb5	5675c10b-efe3-4b81-bbef-58887a70d72c	Gallery	/media/packages/5675c10befe34b81bbef58887a70d72c/898d271a392745019d8ecef79531156a.jpg	Tulia All Inclusive Short Escape	\N	\N	\N	\N	\N	f	2	2026-11-03 21:22:38.6634+01
6cf081d3-7eea-4f78-a3e9-b077725b301f	5675c10b-efe3-4b81-bbef-58887a70d72c	Gallery	/media/packages/5675c10befe34b81bbef58887a70d72c/6314cbde53d94bd0bdac2171f6acb42c.jpg	Tulia All Inclusive Short Escape2	\N	\N	\N	\N	\N	f	1	2026-11-03 21:22:38.659907+01
a7ec26fc-e5d3-4c89-bad9-63f4cb5606af	038d47c1-b03c-4eab-a9e6-f6e7b37a5699	Gallery	/media/packages/038d47c1b03c4eaba9e6f6e7b37a5699/27e88cf5ba264e128d926fdfcdd53a9b.jpg	Tulia Romantic Sea View Escape1	\N	\N	\N	\N	\N	f	1	2026-11-03 21:29:04.151834+01
b87c4e0e-ef71-4785-9995-a4935dac80fd	038d47c1-b03c-4eab-a9e6-f6e7b37a5699	Gallery	/media/packages/038d47c1b03c4eaba9e6f6e7b37a5699/ca2887d837cb4f5e94c53c9b49c5257a.jpg	Tulia Romantic Sea View Escape	\N	\N	\N	\N	\N	f	2	2026-11-03 21:29:04.155288+01
92ee292d-e9bf-43eb-ab09-73bab947cf25	038d47c1-b03c-4eab-a9e6-f6e7b37a5699	Hero	/media/packages/038d47c1b03c4eaba9e6f6e7b37a5699/881dabf00101447aaa2091c2256f183c.jpg	Tulia Romantic Sea View Escape2	\N	\N	\N	\N	\N	f	0	2026-11-03 21:29:04.143422+01
69d50ca8-ba39-4aed-a3f6-b18a81143829	6142a357-faeb-4c78-b7b4-4c2a1ae5a3a4	Hero	/media/packages/6142a357faeb4c78b7b44c2a1ae5a3a4/9cd97de631304a4ca41e8f7dae0fa98a.jpg	Tulia Family Private Pool Escape (1 child14	\N	\N	\N	\N	\N	f	0	2026-11-03 21:36:39.044886+01
bad52b7c-844b-4166-91ac-2cfe7459dc3f	6142a357-faeb-4c78-b7b4-4c2a1ae5a3a4	Gallery	/media/packages/6142a357faeb4c78b7b44c2a1ae5a3a4/a7127abe8fb1470ba2788266a2ec9e1b.jpg	images	\N	\N	\N	\N	\N	f	1	2026-11-03 21:36:39.053444+01
49e8b80b-9b6c-461c-942d-1dfa71f79f59	b8a18ecb-ed12-4444-bd94-694a5c607cce	Gallery	/media/packages/b8a18ecbed124444bd94694a5c607cce/b538e8c8418e4947bac0e4d75ca763cb.jpg	Tulia Honeymoon Escape	\N	\N	\N	\N	\N	f	3	2026-11-04 10:02:41.222642+01
10a84756-8628-4685-a022-066077926b9d	b8a18ecb-ed12-4444-bd94-694a5c607cce	Gallery	/media/packages/b8a18ecbed124444bd94694a5c607cce/2e9bc5f2eeb647529e718de7719d1699.jpg	Tulia Honeymoon Escape3	\N	\N	\N	\N	\N	f	1	2026-11-04 10:02:41.214896+01
d4fcf031-9434-4a09-82e1-960da19112e3	b8a18ecb-ed12-4444-bd94-694a5c607cce	Hero	/media/packages/b8a18ecbed124444bd94694a5c607cce/737872c2e5c748fb9e34e16377f73bf4.jpg	Tulia Honeymoon Escape2	\N	\N	\N	\N	\N	f	0	2026-11-04 10:02:41.148789+01
781c6e1b-9f3a-44f9-954f-5d75432f0185	b8a18ecb-ed12-4444-bd94-694a5c607cce	Gallery	/media/packages/b8a18ecbed124444bd94694a5c607cce/32e2088578984979a2247dc57d2b42c9.jpg	Tulia Honeymoon Escape1	\N	\N	\N	\N	\N	f	2	2026-11-04 10:02:41.218694+01
a8616d98-78ff-4fd2-b7e0-2393d1ffaf6e	b3e46c78-9eed-4aa1-abc8-337a462bcbb0	Gallery	/media/packages/b3e46c789eed4aa1abc8337a462bcbb0/925efbba33614a5d8f084249e71cf23d.jpg	Tulia Family Private Pool Escape (2 children)1	\N	\N	\N	\N	\N	f	1	2026-11-04 10:07:01.2914+01
20902f30-40f7-45ce-8b53-54df5f2b8797	b3e46c78-9eed-4aa1-abc8-337a462bcbb0	Hero	/media/packages/b3e46c789eed4aa1abc8337a462bcbb0/df0de823188c4ce6a318b658682ca1f7.jpg	Tulia Family Private Pool Escape (1 child14	\N	\N	\N	\N	\N	f	0	2026-11-04 10:07:01.283698+01
18711053-a8a2-495a-9bbe-4711e47b16a8	b3e46c78-9eed-4aa1-abc8-337a462bcbb0	Gallery	/media/packages/b3e46c789eed4aa1abc8337a462bcbb0/510239b91bdc4f87afa4dd995626202f.jpg	Tulia Family Private Pool Escape (2 children)	\N	\N	\N	\N	\N	f	2	2026-11-04 10:07:01.296053+01
3b286226-5d62-4133-89b4-ccce11a89735	36c61c62-83f7-41bf-a605-9521abd2e931	Gallery	/media/packages/36c61c6283f741bfa6059521abd2e931/8ba21483271a4c0a922249d67fbd52b4.jpg	Tulia Zanzibar Escape1	\N	\N	\N	\N	\N	f	1	2026-11-04 10:38:15.628185+01
6a97abfe-a01e-46f4-97a2-dcffbfbb1b35	36c61c62-83f7-41bf-a605-9521abd2e931	Hero	/media/packages/36c61c6283f741bfa6059521abd2e931/44089d2dfa5145828c00c481e044c2b5.jpg	Tulia Zanzibar Escape2	\N	\N	\N	\N	\N	f	0	2026-11-04 10:38:15.623747+01
06ad3ae7-3b80-4d4c-b79b-ce082a9edb7a	36c61c62-83f7-41bf-a605-9521abd2e931	Gallery	/media/packages/36c61c6283f741bfa6059521abd2e931/0581d5c6075f4537b6d7b9a472e7ea89.jpg	Tulia Zanzibar Escape	\N	\N	\N	\N	\N	f	2	2026-11-04 10:38:15.630595+01
b98220f7-c616-455a-b9c8-8a36979de18d	e39e7ba5-f2e4-4931-88ac-4db2aa647c1e	Hero	/media/packages/e39e7ba5f2e4493188ac4db2aa647c1e/0976fd821e84424aad1d7de4f9f0d7ab.jpg	Tulia Zanzibar Escape1	\N	\N	\N	\N	\N	f	0	2026-11-04 11:51:04.963789+01
1ccbea61-0c77-419f-8b7d-0097bd67947d	22222222-2222-2222-2222-222222222222	Gallery	/media/packages/22222222222222222222222222222222/d7a4496c62674524909a3e43ae638a99.jpg	CDY 24	\N	\N	\N	\N	\N	f	1	2026-11-04 12:57:33.877431+01
b7a60aab-02f8-4659-bf31-b38f81cef8c8	22222222-2222-2222-2222-222222222222	Gallery	/media/packages/22222222222222222222222222222222/8e6496861f394c219ea1725ba405dffa.jpg	CDY 10	\N	\N	\N	\N	\N	f	2	2026-11-04 12:57:33.849985+01
f6eee7af-014b-47da-b029-a3a935e9bf54	22222222-2222-2222-2222-222222222222	Hero	/media/packages/22222222222222222222222222222222/64fae40616ed48688dc20c44a5396178.png	FEA6CC9A 7486 4819 BC5D 2029D82EEF12	\N	\N	\N	\N	\N	f	0	2026-11-04 12:57:33.889043+01
71c29de2-8da6-403d-8a3f-d7c355a126b0	11111111-1111-1111-1111-111111111111	Gallery	/media/packages/11111111111111111111111111111111/7fc72a985a074a9b8a78436b145a7cb7.jpg	ARLink28 Elite	\N	\N	\N	\N	\N	f	1	2026-11-04 12:28:07.055397+01
803020c9-67e7-42e4-82bd-52a6511a72b5	11111111-1111-1111-1111-111111111111	Gallery	/media/packages/11111111111111111111111111111111/8201fbf1231941348fe7afccd70bbbb2.jpg	ARLink28 Elite	\N	\N	\N	\N	\N	f	2	2026-11-04 12:28:07.066476+01
97b5f21a-b43d-47a7-977f-971ef6f1f932	11111111-1111-1111-1111-111111111111	Hero	/media/packages/11111111111111111111111111111111/ed2aa108611249078128a0935f0b80e9.png	Arlink28 elite	\N	\N	\N	\N	\N	f	0	2026-11-04 12:28:07.074094+01
f3fb752d-4016-40ff-acf7-3bc0951b0ddb	33333333-3333-3333-3333-333333333333	Gallery	/media/packages/33333333333333333333333333333333/292cac0c396c4e859a5dba82d4301ffc.png	Copy of PICTURE E	\N	\N	\N	\N	\N	f	2	2026-11-04 13:03:11.86208+01
5a621373-68da-49a2-949e-8cace24cbcf2	33333333-3333-3333-3333-333333333333	Hero	/media/packages/33333333333333333333333333333333/b5a1d001d8cf45acbac641945a556773.jpg	bespoke	\N	\N	\N	\N	\N	f	0	2026-11-04 13:03:11.842109+01
dda2ace7-02e2-4aee-af53-ec47daa6c01c	33333333-3333-3333-3333-333333333333	Gallery	/media/packages/33333333333333333333333333333333/57e0647121134eceb2272303eee5f0ea.png	Copy of PICTURE D	\N	\N	\N	\N	\N	f	1	2026-11-04 13:03:11.8546+01
ce6e1541-6cbb-46f8-bea7-2e46686dffb9	33333333-3333-3333-3333-333333333333	Gallery	/media/packages/33333333333333333333333333333333/3af586941f0149c8952346666621bc36.png	Copy of PICTURE F	\N	\N	\N	\N	\N	f	3	2026-11-04 13:03:11.870422+01
299ceb59-bbf5-4d89-99fc-f9b102b3df1b	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Gallery	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/b75065bb587248e49122a8b0db2b6865.jpg	sala mara escape jpg3	\N	\N	\N	\N	\N	f	3	2026-11-04 13:23:41.513677+01
7b64792c-e4d1-4734-86fe-0be4e537247c	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Gallery	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/3a7a8a4700b04e59ad33dc9180661451.jpg	sala mara escape jpg2	\N	\N	\N	\N	\N	f	4	2026-11-04 13:23:41.518987+01
e4bcb3d2-dfba-41d5-a475-370a1ef8ee99	5b7901a1-09d3-45e2-9603-d6909c7852f5	Hero	/media/packages/5b7901a109d345e29603d6909c7852f5/7daf48d1fdd24ad09fb020e070ee075f.jpg	Zanzibar Solo Sea View Escape3	\N	\N	\N	\N	\N	f	0	2026-11-04 14:05:42.576001+01
a6235e2c-db05-4311-a6a8-187f593492eb	5b7901a1-09d3-45e2-9603-d6909c7852f5	Gallery	/media/packages/5b7901a109d345e29603d6909c7852f5/b3e445166a8245778f888bdc10e1d72c.jpg	Zanzibar Solo Sea View Escape	\N	\N	\N	\N	\N	f	3	2026-11-04 14:05:42.589758+01
b8a2e450-38aa-4010-a26f-00b757ebf17c	5b7901a1-09d3-45e2-9603-d6909c7852f5	Gallery	/media/packages/5b7901a109d345e29603d6909c7852f5/c60c4e4f75814d66ab48adedeec792cf.jpg	Zanzibar Solo Sea View Escape1	\N	\N	\N	\N	\N	f	2	2026-11-04 14:05:42.584047+01
d700b607-414c-47cc-819d-ed7cbbcc2f1e	5b7901a1-09d3-45e2-9603-d6909c7852f5	Gallery	/media/packages/5b7901a109d345e29603d6909c7852f5/9ac83a556b444f5aa3a449a1849e0960.jpg	Zanzibar Solo Sea View Escape2	\N	\N	\N	\N	\N	f	1	2026-11-04 14:05:42.580412+01
06915bed-27ca-4081-a239-d0863d5bdcd8	d84ad498-15ae-4835-9269-fd60883a88ea	Gallery	/media/packages/d84ad49815ae48359269fd60883a88ea/71de86744a42411db6e00df814269bdc.jpg	Zanzibar Solo Extended Escape1	\N	\N	\N	\N	\N	f	4	2026-11-04 14:10:05.26948+01
79ecf1bc-276a-4e38-b143-96069c7aad1f	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Gallery	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/44cb6fe89d004b34a295601a5888d4a5.jpg	sala mara escape	\N	\N	\N	\N	\N	f	1	2026-11-04 13:23:41.528846+01
a6dab3c5-fb41-47bc-b916-72a3ae8b12f9	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Gallery	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/eed77cabd1004c12ba538563368483cb.jpg	sala mara escape jpg4	\N	\N	\N	\N	\N	f	2	2026-11-04 13:23:41.507151+01
d9ada3fd-da37-42cd-b5c6-07d5fabf45f4	76d3ed1d-0d97-46e5-96b8-365498c4f85b	Hero	/media/packages/76d3ed1d0d9746e596b8365498c4f85b/e9aa0df5754f43598587fcfe0fce71df.jpg	sala mara escape jpg1	\N	\N	\N	\N	\N	f	0	2026-11-04 13:23:41.524504+01
e9b09c2f-9d6d-43d8-870d-be4320e9ed73	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Gallery	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/d97dc4cee6fa46ffa157a6140d179394.jpg	ultimate safari1	\N	\N	\N	\N	\N	f	2	2026-11-04 13:26:55.173474+01
b6a5db73-f128-47e7-a22f-8534e6c407d5	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Hero	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/0c16a8ee4bee4ea89a1099ec2af524e2.jpg	ultimatesafari3	\N	\N	\N	\N	\N	f	0	2026-11-04 13:26:55.161854+01
272d36d0-7403-444b-84b2-79da788e9c4d	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Gallery	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/e5bc533abf634f12aa729ac5fbb858bf.jpg	ultimate safari	\N	\N	\N	\N	\N	f	3	2026-11-04 13:26:55.178899+01
2097bf84-d240-47b8-92d3-66af7250f5bd	79054381-312c-4e5f-aba3-dbfdffcf2d9a	Gallery	/media/packages/79054381312c4e5faba3dbfdffcf2d9a/cdc44858036344f087f5f3f9f8b8aa67.jpg	ultimatesafari2	\N	\N	\N	\N	\N	f	1	2026-11-04 13:26:55.168018+01
b411c7d7-4adf-4c21-ae21-648605f2918b	695be048-ccc7-4aa5-aa00-46e16d238edf	Gallery	/media/packages/695be048ccc74aa5aa0046e16d238edf/f8763fdc66d2460ca2a8c925c333f4ac.jpg	girrafe and nairobi1	\N	\N	\N	\N	\N	f	2	2026-11-04 13:33:09.844576+01
7db563c9-6cff-41d3-a73e-1b3f1283fa4e	695be048-ccc7-4aa5-aa00-46e16d238edf	Gallery	/media/packages/695be048ccc74aa5aa0046e16d238edf/20ff26fca05e4ce6aa98ead823212158.jpg	girrafe and nairobi	\N	\N	\N	\N	\N	f	3	2026-11-04 13:33:09.849283+01
b22c7b41-f719-4621-b499-7cc26c3b0798	695be048-ccc7-4aa5-aa00-46e16d238edf	Hero	/media/packages/695be048ccc74aa5aa0046e16d238edf/7c3304c0b99c49dc872dfb947e783adc.jpg	girrafe and nairobi3	\N	\N	\N	\N	\N	f	0	2026-11-04 13:33:09.82593+01
1e04e421-9883-43c5-abe9-a9bedd5a0ff3	695be048-ccc7-4aa5-aa00-46e16d238edf	Gallery	/media/packages/695be048ccc74aa5aa0046e16d238edf/de08a663bf31415385c6c68392b81535.jpg	girrafe and nairobi2	\N	\N	\N	\N	\N	f	1	2026-11-04 13:33:09.837315+01
17d8db49-647f-4c5b-9aba-264e129309d7	96225bea-1bb5-4992-a7e4-c9e595dc261b	Hero	/media/packages/96225bea1bb54992a7e4c9e595dc261b/52c1ffd119fc45f4bc9b82e84ec31cd3.jpg	Zanzibar Mini Escape4	\N	\N	\N	\N	\N	f	0	2026-11-04 13:41:16.367487+01
e1dc8bc4-402d-4813-9fa7-d22d97a5c6cf	96225bea-1bb5-4992-a7e4-c9e595dc261b	Gallery	/media/packages/96225bea1bb54992a7e4c9e595dc261b/b29b465bca554b46bdd77140ea69c9a9.jpg	Zanzibar Mini Escape	\N	\N	\N	\N	\N	f	3	2026-11-04 13:41:16.379839+01
5c562197-d2cc-41b4-838f-6c936a2db90e	96225bea-1bb5-4992-a7e4-c9e595dc261b	Gallery	/media/packages/96225bea1bb54992a7e4c9e595dc261b/f4ddb21251b74f52934d1ec75ed745e3.jpg	Zanzibar Mini Escape2	\N	\N	\N	\N	\N	f	1	2026-11-04 13:41:16.373491+01
e3f5d404-2c31-4b35-a925-183afc044d67	96225bea-1bb5-4992-a7e4-c9e595dc261b	Gallery	/media/packages/96225bea1bb54992a7e4c9e595dc261b/3cc4f683c45d4c86b3f674c2faef8178.jpg	Zanzibar Mini Escape1	\N	\N	\N	\N	\N	f	2	2026-11-04 13:41:16.376791+01
9f18cbc4-92f6-4b36-9d87-78785ad25378	0b2a1680-e2f8-4ea4-b777-7484839428f9	Gallery	/media/packages/0b2a1680e2f84ea4b7777484839428f9/bbc5d5d024604502bf47b952f869fa2c.jpg	Zanzibar Group Escape0	\N	\N	\N	\N	\N	f	1	2026-11-04 13:47:09.661667+01
61b37fea-17ec-44ad-9536-ee451d44a8fb	0b2a1680-e2f8-4ea4-b777-7484839428f9	Gallery	/media/packages/0b2a1680e2f84ea4b7777484839428f9/b1ba4979dc21498d9a66e27440d4b3ef.jpg	Zanzibar Group Escape1	\N	\N	\N	\N	\N	f	3	2026-11-04 13:47:09.66953+01
189e05e7-9800-418a-b3fc-8894c3bf5112	0b2a1680-e2f8-4ea4-b777-7484839428f9	Gallery	/media/packages/0b2a1680e2f84ea4b7777484839428f9/73a7b705d3ae43b4a08bc67abf7a149f.jpg	Zanzibar Group Escape2	\N	\N	\N	\N	\N	f	2	2026-11-04 13:47:09.664483+01
3e05c73a-fed8-4ba2-beb0-860f71197e1d	0b2a1680-e2f8-4ea4-b777-7484839428f9	Gallery	/media/packages/0b2a1680e2f84ea4b7777484839428f9/3405dbf5daed42df9cd69e14218e8348.jpg	Zanzibar Group Escape	\N	\N	\N	\N	\N	f	4	2026-11-04 13:47:09.673597+01
46a2c11b-0177-4bd2-982c-da058f2b29a6	0b2a1680-e2f8-4ea4-b777-7484839428f9	Hero	/media/packages/0b2a1680e2f84ea4b7777484839428f9/ecea8f5c3fd942c7949de5dc4003c5e5.jpg	Zanzibar Group Escape00	\N	\N	\N	\N	\N	f	0	2026-11-04 13:47:09.650613+01
15a2a455-e69b-4b4f-ba71-062589309d1d	904a68f3-bac6-4076-b404-b8cf418cb4ce	Gallery	/media/packages/904a68f3bac64076b404b8cf418cb4ce/2c8e80c419c244da9b3b8ea967e97629.jpg	Zanzibar Royal Escape4	\N	\N	\N	\N	\N	f	1	2026-11-04 13:55:09.415837+01
a20c4af9-5eed-4e98-9e09-bc17d7de0538	904a68f3-bac6-4076-b404-b8cf418cb4ce	Gallery	/media/packages/904a68f3bac64076b404b8cf418cb4ce/ad643b2e212246c7a5d8838dabc246a2.jpg	Zanzibar Royal Escape1	\N	\N	\N	\N	\N	f	4	2026-11-04 13:55:09.425683+01
17a55070-52dc-483d-b352-e739dc36b22f	904a68f3-bac6-4076-b404-b8cf418cb4ce	Hero	/media/packages/904a68f3bac64076b404b8cf418cb4ce/01a73a010519483185d98ea10a803659.jpg	Zanzibar Royal Escape0	\N	\N	\N	\N	\N	f	0	2026-11-04 13:55:09.405687+01
3391c992-3b66-485e-8749-cffb7721c30f	904a68f3-bac6-4076-b404-b8cf418cb4ce	Gallery	/media/packages/904a68f3bac64076b404b8cf418cb4ce/894f7ee2195f41b6b5d334de4f80c519.jpg	Zanzibar Royal Escape	\N	\N	\N	\N	\N	f	5	2026-11-04 13:55:09.428791+01
1f52043a-f6a0-450a-9637-e7a84eab9716	904a68f3-bac6-4076-b404-b8cf418cb4ce	Gallery	/media/packages/904a68f3bac64076b404b8cf418cb4ce/96ad71a9f6fd4195bd22e8afe7b2e783.jpg	Zanzibar Royal Escape3	\N	\N	\N	\N	\N	f	2	2026-11-04 13:55:09.41866+01
a4b8fdf6-3350-41de-9120-5c16b29879f9	904a68f3-bac6-4076-b404-b8cf418cb4ce	Gallery	/media/packages/904a68f3bac64076b404b8cf418cb4ce/41794b2f5def4b65ae43ab3711d9899a.jpg	Zanzibar Royal Escape2	\N	\N	\N	\N	\N	f	3	2026-11-04 13:55:09.422574+01
14e2ed95-dfa3-4509-8ff0-c06f3a1fd2bc	4d05e06f-86f1-4e81-a921-feb8de65b121	Gallery	/media/packages/4d05e06f86f14e81a921feb8de65b121/4a6070bd08a146f299fc5cae74d3ed94.jpg	Zanzibar Solo Escape3	\N	\N	\N	\N	\N	f	1	2026-11-04 14:00:51.819012+01
b14d3fa9-fbbe-4aab-a75f-8fc8f0a49b72	4d05e06f-86f1-4e81-a921-feb8de65b121	Gallery	/media/packages/4d05e06f86f14e81a921feb8de65b121/4ec77e4bdc69465ca314198b5816f89a.jpg	Zanzibar Solo Escape2	\N	\N	\N	\N	\N	f	2	2026-11-04 14:00:51.823672+01
e9165306-67e7-4bde-9974-8989b2ff9ac4	4d05e06f-86f1-4e81-a921-feb8de65b121	Gallery	/media/packages/4d05e06f86f14e81a921feb8de65b121/75a7491a816e4ef2b4d174c404a6f927.jpg	Zanzibar Solo Escape	\N	\N	\N	\N	\N	f	4	2026-11-04 14:00:51.834145+01
93f567bd-9856-4328-b7b2-4d4cf9d000f7	4d05e06f-86f1-4e81-a921-feb8de65b121	Gallery	/media/packages/4d05e06f86f14e81a921feb8de65b121/b4f674d6b30c4550818c6e8b480d4b08.jpg	Zanzibar Solo Escape0	\N	\N	\N	\N	\N	f	3	2026-11-04 14:00:51.831097+01
043ed160-c44e-49ca-9326-afb8a20ca713	4d05e06f-86f1-4e81-a921-feb8de65b121	Hero	/media/packages/4d05e06f86f14e81a921feb8de65b121/d6d3ebbe13f8451b8816ff8ec46d2ca8.jpg	Zanzibar Solo Escape4	\N	\N	\N	\N	\N	f	0	2026-11-04 14:00:51.812829+01
576c0d6c-abcd-4a62-84ee-0cbda4cf3150	d84ad498-15ae-4835-9269-fd60883a88ea	Gallery	/media/packages/d84ad49815ae48359269fd60883a88ea/6533c252b8ab4e71884586bd10766ef3.jpg	Zanzibar Solo Extended Escape2	\N	\N	\N	\N	\N	f	3	2026-11-04 14:10:05.266849+01
6d09296a-5608-431f-889a-938bb85f5f92	d84ad498-15ae-4835-9269-fd60883a88ea	Gallery	/media/packages/d84ad49815ae48359269fd60883a88ea/e5dd5131ee9d48e390c50157199ab421.jpg	Zanzibar Solo Extended Escape3	\N	\N	\N	\N	\N	f	2	2026-11-04 14:10:05.264387+01
b47e2a89-6240-48d7-b4fa-254a61d3c571	d84ad498-15ae-4835-9269-fd60883a88ea	Gallery	/media/packages/d84ad49815ae48359269fd60883a88ea/4225213994574ac7973eb1d5517acd1f.jpg	Zanzibar Solo Extended Escape6	\N	\N	\N	\N	\N	f	1	2026-11-04 14:10:05.262901+01
f6464e05-56aa-4316-8a33-bc81e48d0b34	d84ad498-15ae-4835-9269-fd60883a88ea	Hero	/media/packages/d84ad49815ae48359269fd60883a88ea/626604e52d5d460cb0e5efd074e8de66.jpg	Zanzibar Solo Extended Escape	\N	\N	\N	\N	\N	f	0	2026-11-04 14:10:05.261062+01
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
f8270ec9-08b0-4514-b36c-40d7e45527f0	0eb3e4e4-40e7-41f9-8ffb-6f83552ed290	e4e42114-65d5-4f36-b922-581a56d4d537	USD	64900	\N
3e558df1-58cb-489e-b984-26884f62da58	3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	e4e42114-65d5-4f36-b922-581a56d4d537	USD	44900	\N
632312b3-60ef-4231-a051-517e9a69d177	6e6117f8-3b1c-411e-9bea-e58e302c8751	e4e42114-65d5-4f36-b922-581a56d4d537	USD	149900	\N
a523bee9-fe42-4542-ab25-63cdb3ac4122	3de13ea3-67d6-47f1-abd0-d4df4106333f	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	3088900	\N
a1d82857-e420-45db-8065-0c4cca637e4c	dd2a894c-406c-4749-a3ac-9fc75ef98476	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	747200	\N
347ac446-a380-46da-9cd2-c66e6f7d4a95	60c8085a-40fc-4924-8761-510541786917	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	2688400	\N
c6253827-f6c3-4dd6-baa3-a7406a1f2e3a	c785217e-c83f-4a5c-92c8-fe04be1777eb	e4e42114-65d5-4f36-b922-581a56d4d537	USD	1459900	\N
5eaab516-6dc4-4003-912c-5753246d02bb	a6d5a198-7be4-44fe-8a4b-e16afcd8af25	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	1494400	\N
3906c25c-f702-44e8-ae1f-70ff53b5c6f5	5851c539-085a-4136-b48f-4cbaa381c97a	e4e42114-65d5-4f36-b922-581a56d4d537	USD	848800	\N
17fd4bea-db04-43a3-b53f-95a18312ea18	2a3ead31-d5d3-4828-902d-62830a221dc4	e4e42114-65d5-4f36-b922-581a56d4d537	USD	3398500	\N
fcec18d6-9bcf-406d-b737-07123e097d35	203427b1-0e3d-43a3-a274-d7247284fbb8	e4e42114-65d5-4f36-b922-581a56d4d537	USD	1136800	\N
8d4d2ecb-a421-4b68-b8bb-e3f2b5bb1a9e	032d070d-1470-4067-8405-69add602c27f	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	771600	\N
cb009fbb-8210-4614-a1ba-aed9e6f5dfd4	1ed61be3-6527-4962-90b9-4cdded3f6395	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	4484800	\N
e70b4989-cb08-44cc-9b47-a3ea3a58e63a	77bb9837-129a-48bd-a38a-d3f1c7e239d1	e4e42114-65d5-4f36-b922-581a56d4d537	USD	4154220	\N
2e975ca9-e48f-4fc1-8f1a-8e80f85163f5	d23065b8-67e5-4b53-9d62-98b13e764580	e4e42114-65d5-4f36-b922-581a56d4d537	USD	1279320	\N
475396d5-3529-49c7-9e04-70c39a0adb14	cfbaf17e-44fb-43fa-86cd-f60946243f01	e4e42114-65d5-4f36-b922-581a56d4d537	USD	567000	\N
6b4ddd2e-1ed1-4947-9e88-ea0f57d76737	5675c10b-efe3-4b81-bbef-58887a70d72c	9d0143d1-3afe-4f1d-8e5f-e444067a87bf	USD	340200	\N
86f431c5-f2c4-4648-a8ec-b1a13a311492	038d47c1-b03c-4eab-a9e6-f6e7b37a5699	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	377280	\N
6065a6b7-64cd-4e2c-97f1-3002881a0cb5	6142a357-faeb-4c78-b7b4-4c2a1ae5a3a4	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	1360632	\N
06466f91-6615-45a1-8a82-f10298e69efe	b8a18ecb-ed12-4444-bd94-694a5c607cce	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	628800	\N
ff1bdbce-0057-40e3-a332-24b8d74ab84b	b3e46c78-9eed-4aa1-abc8-337a462bcbb0	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	1465296	\N
fe89796c-c8f8-45e2-8e61-1d69611a411d	36c61c62-83f7-41bf-a605-9521abd2e931	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	747600	\N
2678ab78-99e6-42d0-ae0b-aad4d18d06c5	96225bea-1bb5-4992-a7e4-c9e595dc261b	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	44900	\N
6717f09a-38e5-4c6f-9daa-64de48396af2	0b2a1680-e2f8-4ea4-b777-7484839428f9	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	139900	\N
da1117ee-8042-474c-87a0-6d3a6868919b	904a68f3-bac6-4076-b404-b8cf418cb4ce	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	309900	\N
13a3af7c-8fa7-4d9d-93f3-1372f405831f	4d05e06f-86f1-4e81-a921-feb8de65b121	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	36900	\N
afd9191b-eca9-4b18-9fef-ff519d85475e	5b7901a1-09d3-45e2-9603-d6909c7852f5	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	42900	\N
53df4c4b-6c67-43d5-825b-46736ac0c441	d84ad498-15ae-4835-9269-fd60883a88ea	2fab7c39-088e-4a6e-b2f2-f3c341b91e18	USD	46900	\N
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
d95bdc84-4798-4d1e-8971-686cc0cf117e	0eb3e4e4-40e7-41f9-8ffb-6f83552ed290	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	4	Premium Sea View Room	0
41f6272e-1977-4f9c-9b65-92a893269e15	3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	3	\N	0
83872db2-e5bc-46e8-b453-4d5dfbf7e35e	6e6117f8-3b1c-411e-9bea-e58e302c8751	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	2	\N	0
eaf4396e-c26b-47cc-be21-893d737ea3a9	3de13ea3-67d6-47f1-abd0-d4df4106333f	c1630f23-bb5f-43fe-9fb6-b72812fa5354	5	\N	1
332304b9-8ae4-444f-b089-37d65502b5d2	3de13ea3-67d6-47f1-abd0-d4df4106333f	260b8c6b-d0b4-4534-9833-9fc93fc80494	5	\N	0
ed86b4af-8dd0-44e4-a404-1b2d21fa2789	dd2a894c-406c-4749-a3ac-9fc75ef98476	260b8c6b-d0b4-4534-9833-9fc93fc80494	2	luxury tent	0
77548e17-6719-486f-b0b1-507cc4373c79	60c8085a-40fc-4924-8761-510541786917	260b8c6b-d0b4-4534-9833-9fc93fc80494	2	\N	0
aee788fb-cc30-433f-abf2-2e3980ffc350	c785217e-c83f-4a5c-92c8-fe04be1777eb	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	3	\N	0
aeed63c4-91a6-47aa-a39e-d190141ac495	a6d5a198-7be4-44fe-8a4b-e16afcd8af25	260b8c6b-d0b4-4534-9833-9fc93fc80494	4	\N	0
1b1957f2-7858-46e3-b1a0-e37697c3d254	5851c539-085a-4136-b48f-4cbaa381c97a	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	3	\N	0
faa79c6e-35ee-4be6-ab75-c47522837f32	2a3ead31-d5d3-4828-902d-62830a221dc4	c1630f23-bb5f-43fe-9fb6-b72812fa5354	3	\N	1
d0a2b1d0-db92-4ada-9a97-d64d3cd0cbb9	2a3ead31-d5d3-4828-902d-62830a221dc4	260b8c6b-d0b4-4534-9833-9fc93fc80494	4	\N	0
f4cf130b-0116-4b9c-88d0-4228de968453	203427b1-0e3d-43a3-a274-d7247284fbb8	df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	4	\N	0
ddc58868-76cb-4233-81d0-0dada4451df9	032d070d-1470-4067-8405-69add602c27f	1edccded-3b1f-4297-a4d9-fc190864b1bc	5	Seafront Luxury Villa	0
3f1e686b-5fe1-4df6-bcd9-7d6b369c6c3e	1ed61be3-6527-4962-90b9-4cdded3f6395	c1630f23-bb5f-43fe-9fb6-b72812fa5354	5	\N	1
2efceb60-71d3-4731-a665-43d9a45f52bb	1ed61be3-6527-4962-90b9-4cdded3f6395	260b8c6b-d0b4-4534-9833-9fc93fc80494	5	\N	0
23f688ea-230a-4952-8dcf-978c601cedd7	d23065b8-67e5-4b53-9d62-98b13e764580	cfc53b5b-11ba-4b40-a930-e2a66918eddf	7	\N	0
fac8e192-23d6-47ca-99c2-dda408f71457	77bb9837-129a-48bd-a38a-d3f1c7e239d1	cfc53b5b-11ba-4b40-a930-e2a66918eddf	5	\N	0
09121d39-18e1-4cbf-85e8-efecbaa7ed96	cfbaf17e-44fb-43fa-86cd-f60946243f01	cfc53b5b-11ba-4b40-a930-e2a66918eddf	5	Deluxe Garden Bungalow	0
262b2728-239f-4034-8579-4dd4bf9765ef	5675c10b-efe3-4b81-bbef-58887a70d72c	cfc53b5b-11ba-4b40-a930-e2a66918eddf	3	\N	0
0b90d7a7-c533-44e2-8b64-1af3f64f31e1	038d47c1-b03c-4eab-a9e6-f6e7b37a5699	cfc53b5b-11ba-4b40-a930-e2a66918eddf	3	\N	0
b339f1dd-a4a4-4346-8fab-583f0ddd43e4	6142a357-faeb-4c78-b7b4-4c2a1ae5a3a4	cfc53b5b-11ba-4b40-a930-e2a66918eddf	7	\N	0
701765b4-be2d-476a-b0e8-db1a9b3b2319	b8a18ecb-ed12-4444-bd94-694a5c607cce	cfc53b5b-11ba-4b40-a930-e2a66918eddf	5	\N	0
3324b106-f22e-4c57-8b34-51c11686a385	b3e46c78-9eed-4aa1-abc8-337a462bcbb0	cfc53b5b-11ba-4b40-a930-e2a66918eddf	7	\N	0
283ba3d3-c8e9-415b-b0eb-c0367872bf99	36c61c62-83f7-41bf-a605-9521abd2e931	cfc53b5b-11ba-4b40-a930-e2a66918eddf	2	\N	0
f95494fa-7482-4eff-bae5-79f4bf2c86a3	96225bea-1bb5-4992-a7e4-c9e595dc261b	1edccded-3b1f-4297-a4d9-fc190864b1bc	3	\N	0
3241e419-dbcd-4b68-acf5-54f499a8942e	0b2a1680-e2f8-4ea4-b777-7484839428f9	1edccded-3b1f-4297-a4d9-fc190864b1bc	4	\N	0
7f62163d-280f-45f2-a431-1beb8b99690e	904a68f3-bac6-4076-b404-b8cf418cb4ce	1edccded-3b1f-4297-a4d9-fc190864b1bc	4	\N	0
ec4ae337-1e62-4947-9591-828d8ac54db1	4d05e06f-86f1-4e81-a921-feb8de65b121	1edccded-3b1f-4297-a4d9-fc190864b1bc	3	\N	0
87d4baef-805e-42ff-bd39-c67b9db897ff	5b7901a1-09d3-45e2-9603-d6909c7852f5	1edccded-3b1f-4297-a4d9-fc190864b1bc	3	\N	0
76fff8d7-e3d2-4a6c-817c-73f418e48661	d84ad498-15ae-4835-9269-fd60883a88ea	1edccded-3b1f-4297-a4d9-fc190864b1bc	4	\N	0
\.


--
-- Data for Name: Packages; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Packages" ("Id", "Slug", "ProductType", "Details", "Status", "Title", "Subtitle", "Summary", "Description", "Category", "DestinationId", "Nights", "MinNights", "Adults", "Children", "PricingBasis", "BaseCurrency", "FromPriceMinor", "Featured", "SortOrder", "SeoTitle", "SeoDescription", "Version", "PublishedAt", "CreatedAt", "UpdatedAt") FROM stdin;
46a039e6-d50d-4f47-ac0e-30ab22d97535	giraffe-manor-solo-escape	HolidayPackage	\N	Published	Giraffe Manor Solo Escape	3 Nights / 4 Days for One Adult	An intimate, fully inclusive Giraffe Manor stay with meals, selected house drinks, Giraffe Centre access and qualifying transfers.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	3	3	1	0	PerParty	USD	698670	t	100	\N	\N	2	2026-10-16 03:13:59.79865+01	2026-10-16 03:13:59.79865+01	2026-10-16 04:06:40.798023+01
b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	giraffe-manor-signature-escape	HolidayPackage	\N	Published	Giraffe Manor Signature Escape	5 Nights / 6 Days for Two Adults	A fully inclusive stay for two with meals, selected house drinks, Giraffe Centre access and qualifying transfers.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	5	5	2	0	PerParty	USD	1413000	t	110	\N	\N	2	2026-10-16 03:13:59.79865+01	2026-10-16 03:13:59.79865+01	2026-10-16 04:06:40.798023+01
d4d1b4e2-95d8-41fc-88a7-a25103292e81	giraffe-manor-family-and-friends-retreat-3-adults	HolidayPackage	\N	Published	Giraffe Manor Family and Friends Retreat (3 Adults)	7 Nights / 8 Days for Three Adults	A shared two-bedroom suite stay for three adults with the Giraffe Manor fully inclusive experience.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	7	7	3	0	PerParty	USD	3720640	t	140	\N	\N	2	2026-10-16 03:13:59.79865+01	2026-10-16 03:13:59.79865+01	2026-10-16 04:06:40.798023+01
cbcb141f-458b-45b5-8d16-d1d4a883bbb8	giraffe-manor-family-and-friends-retreat-4-adults	HolidayPackage	\N	Published	Giraffe Manor Family and Friends Retreat (4 Adults)	7 Nights / 8 Days for Four Adults	A shared two-bedroom suite stay for four adults with the Giraffe Manor fully inclusive experience.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	7	7	4	0	PerParty	USD	4154220	t	150	\N	\N	2	2026-10-16 03:13:59.79865+01	2026-10-16 03:13:59.79865+01	2026-10-16 04:06:40.798023+01
3fbc4d93-c09c-4403-932a-c7ff79b2d2b6	zanzibar-mini-escape	HolidayPackage	\N	Published	Zanzibar Mini Escape	Enjoy a short Zanzibar break with coastal comfort, style and warm island hospitality.	Premium Partial Sea View Room	\N	LODGE	77b58b85-aea3-423a-85e5-ec35d76be58f	3	3	2	0	PerParty	USD	44900	f	0	\N	\N	6	2026-11-03 11:56:57.604073+01	2026-11-03 11:55:34.16795+01	2026-11-03 11:56:57.615584+01
3de13ea3-67d6-47f1-abd0-d4df4106333f	ultimate-safari-collection-journey-savings-season	HolidayPackage	\N	Published	Ultimate Safari Collection Journey (savings season)	\N	Luxury multi-destination travel with curated safari inclusions and added premium ARLink28 travel services	\N	SAFARI	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	10	2	2	0	PerParty	USD	3088900	f	0	\N	\N	7	2026-11-03 13:24:02.036618+01	2026-11-03 13:22:59.095842+01	2026-11-03 13:24:02.037214+01
6e6117f8-3b1c-411e-9bea-e58e302c8751	zanzibar-family-friends-escape	HolidayPackage	\N	Published	Zanzibar Family & Friends Escape	\N	Enjoy a spacious Zanzibar getaway with comfort, relaxation and unforgettable island moments for family and friends.	\N	SAFARI	77b58b85-aea3-423a-85e5-ec35d76be58f	2	2	2	0	PerParty	USD	149900	f	0	\N	\N	5	2026-11-03 12:47:35.77824+01	2026-11-03 12:09:07.165238+01	2026-11-03 12:47:35.778708+01
dd2a894c-406c-4749-a3ac-9fc75ef98476	2-night-fully-inclusive-luxury-masai-mara-safari-experience-for-two-adults	HolidayPackage	\N	Published	2-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	\N	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services	\N	SAFARI	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	2	2	2	0	PerParty	USD	747200	f	0	\N	\N	5	2026-11-03 13:36:42.17287+01	2026-11-03 13:36:36.616829+01	2026-11-03 13:36:42.173528+01
60c8085a-40fc-4924-8761-510541786917	sala-s-family-safari	HolidayPackage	\N	Published	Sala’s Family Safari	\N	4-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults & Two Children\nat Sala’s Camp, Masai Mara	\N	SAFARI	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	2	2	2	2	PerParty	USD	2688400	f	0	\N	\N	5	2026-11-03 13:45:37.828447+01	2026-11-03 13:45:27.873599+01	2026-11-03 13:47:03.944902+01
f415c589-bdfc-4fd1-804d-ffa5fff66ac6	safari-collection-explorer	HolidayPackage	\N	Published	Safari Collection Explorer	7-Night Luxury Multi-Destination Safari for Two Adults	Luxury multi-destination travel with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	7	7	2	0	PerParty	USD	1936900	f	50	\N	\N	1	2026-10-16 04:41:21.670404+01	2026-10-16 04:06:40.798023+01	2026-11-03 14:03:42.283034+01
12f4b08b-286b-4f7a-b05a-3c6e14edd43c	salas-extended-mara-experience	HolidayPackage	\N	Published	Sala's Extended Mara Experience	4-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	4	4	2	0	PerParty	USD	1494400	f	30	\N	\N	1	2026-10-16 04:41:26.959689+01	2026-10-16 04:06:40.798023+01	2026-11-03 14:14:02.235327+01
0ae7b7eb-acae-481d-9606-b99cdb5af83e	salas-classic-safari	HolidayPackage	\N	Published	Sala's Classic Safari	3-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	3	3	2	0	PerParty	USD	1775000	f	20	\N	\N	0	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01	2026-11-03 14:11:03.068779+01
5daabefd-e115-48ab-a84e-33e6eb68f7f9	giraffe-manor-family-experience	HolidayPackage	\N	Published	Giraffe Manor Family Experience	5 Nights / 6 Days for Two Adults + Up to Two Children	A family stay in a two-bedroom suite with the Giraffe Manor fully inclusive experience.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	5	5	2	2	PerParty	USD	2657600	t	120	\N	\N	15	2026-10-16 03:13:59.79865+01	2026-10-16 03:13:59.79865+01	2026-11-03 14:19:24.068387+01
3becabc0-2844-47e8-a330-f83a44db48cc	salas-family-safari	HolidayPackage	\N	Published	Sala's Family Safari	4-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults & Two Children	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	4	4	2	2	PerParty	USD	2688400	f	40	\N	\N	1	2026-10-16 04:41:31.662808+01	2026-10-16 04:06:40.798023+01	2026-11-03 14:32:22.613328+01
a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	giraffe-manor-extended-family-package	HolidayPackage	\N	Published	Giraffe Manor Extended Family Package	5 Nights / 6 Days for Two Adults + Three Children	A family suite experience for a larger family, with a third child charged in addition to the suite minimum.	\N	LODGE	f1da7e79-5a02-49b0-902e-68145c23d5e3	5	5	2	3	PerParty	USD	2863350	t	130	\N	\N	2	2026-10-16 03:13:59.79865+01	2026-10-16 03:13:59.79865+01	2026-11-04 13:29:26.282225+01
76d3ed1d-0d97-46e5-96b8-365498c4f85b	sala-mara-escape	HolidayPackage	\N	Published	Sala Mara Escape	2-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	Luxury tent stay with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	2	2	2	0	PerParty	USD	747200	f	10	\N	\N	0	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01	2026-11-04 13:23:49.404268+01
79054381-312c-4e5f-aba3-dbfdffcf2d9a	ultimate-safari-collection-journey	HolidayPackage	\N	Published	Ultimate Safari Collection Journey	10-Night Premium Long-Stay Safari for Two Adults	Luxury multi-destination travel with curated safari inclusions and added premium ARLink28 travel services.	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	10	10	2	0	PerParty	USD	3088900	f	60	\N	\N	0	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01	2026-11-04 13:26:55.179421+01
695be048-ccc7-4aa5-aa00-46e16d238edf	giraffe-and-nairobi-wildlife-escape	HolidayPackage	\N	Published	Giraffe and Nairobi Wildlife Escape	2 Nights / 3 Days for Two Adults	Experience the best of Nairobi's wildlife and iconic landscapes.	\N	SAFARI	f1da7e79-5a02-49b0-902e-68145c23d5e3	2	2	2	0	PerParty	USD	658900	f	170	\N	\N	1	2026-10-16 04:41:17.317107+01	2026-10-16 04:06:40.798023+01	2026-11-04 13:33:09.849859+01
d23065b8-67e5-4b53-9d62-98b13e764580	tulia-ultimate-private-pool-escape	HolidayPackage	\N	Published	Tulia Ultimate Private Pool Escape	\N	A 7 night premium all inclusive Zanzibar experience combining seafront accommodation with a private pool for a top-tier stay.	\N	SAFARI	77b58b85-aea3-423a-85e5-ec35d76be58f	7	1	2	0	PerParty	USD	1279320	f	0	\N	\N	6	2026-11-03 21:05:58.488543+01	2026-11-03 21:03:56.714784+01	2026-11-03 21:12:22.990874+01
77bb9837-129a-48bd-a38a-d3f1c7e239d1	tulia-extended-stay	HolidayPackage	\N	Published	Tulia Extended Stay	\N	A five-night Zanzibar stay with breakfast, offering extra time to enjoy the resort while retaining flexibility for dining and excursions.	\N	SAFARI	2f114f3d-7af7-4bd0-ae19-055b80f69d26	5	4	4	0	PerParty	USD	4154220	f	0	\N	\N	6	2026-11-03 20:40:04.875188+01	2026-11-03 20:39:58.733763+01	2026-11-03 21:12:51.15075+01
5851c539-085a-4136-b48f-4cbaa381c97a	giraffe-manor-grand-escape	HolidayPackage	\N	Published	Giraffe Manor Grand Escape	\N	Step into elegance, where heritage, wildlife and warm hospitality create unforgettable moments\nBOOK YOUR GRAND ESCAPE TODAY! EXPERIENCE GIRAFFE MANOR. CREATE MEMORIES THAT LAST A LIFETIME.	\N	SAFARI	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	3	2	2	0	PerParty	USD	848800	f	0	\N	\N	6	2026-11-03 14:27:49.041738+01	2026-11-03 14:27:21.432104+01	2026-11-03 14:27:49.042149+01
c785217e-c83f-4a5c-92c8-fe04be1777eb	giraffe-manor-family-celebration	HolidayPackage	\N	Published	Giraffe Manor Family Celebration	\N	Create unforgettable family memories with extraordinary experiences at Giraffe Manor.	\N	SAFARI	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	3	2	2	2	PerParty	USD	1459900	f	0	\N	\N	6	2026-11-03 13:56:10.524676+01	2026-11-03 13:55:35.46257+01	2026-11-03 13:56:10.525123+01
032d070d-1470-4067-8405-69add602c27f	tulia-seafront-luxury-escape	HolidayPackage	\N	Published	Tulia Seafront Luxury Escape	\N	A premium 5 night all inclusive beachfront experience for travelers seeking seafront accommodation and a higher-end stay.	\N	SAFARI	77b58b85-aea3-423a-85e5-ec35d76be58f	5	5	2	2	PerParty	USD	771600	f	0	\N	\N	5	2026-11-03 20:13:17.341284+01	2026-11-03 20:12:58.367878+01	2026-11-03 20:23:28.35255+01
2a3ead31-d5d3-4828-902d-62830a221dc4	safari-collection-explorer-sala-s-first	HolidayPackage	\N	Published	Safari Collection Explorer (Sala’s first)	\N	7Night Luxury Multi-Destination Safari for Two Adults	\N	SAFARI	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	7	2	2	0	PerParty	USD	3398500	f	0	\N	\N	5	2026-11-03 14:50:22.2332+01	2026-11-03 14:50:18.247012+01	2026-11-03 14:50:22.233239+01
a6d5a198-7be4-44fe-8a4b-e16afcd8af25	masai-mara-safari-experience	HolidayPackage	\N	Published	Masai Mara Safari Experience	\N	4-Night Fully Inclusive Luxury Masai Mara Safari Experience for Two Adults	\N	SAFARI	2031dab8-2aca-402c-8fed-083dbe481884	4	4	2	0	PerParty	USD	1494400	f	0	\N	\N	5	2026-11-03 14:10:24.121841+01	2026-11-03 14:10:18.535721+01	2026-11-03 14:10:24.122164+01
6142a357-faeb-4c78-b7b4-4c2a1ae5a3a4	tulia-family-private-pool-escape-1-child	HolidayPackage	\N	Published	Tulia Family Private Pool Escape (1 child	\N	A seven-night all-inclusive family villa stay with a private pool, designed for families wanting additional space and a premium resort experience.	\N	SAFARI	77b58b85-aea3-423a-85e5-ec35d76be58f	7	6	2	1	PerParty	USD	1360632	f	0	\N	\N	5	2026-11-03 21:36:41.917975+01	2026-11-03 21:36:37.919782+01	2026-11-03 21:36:41.91798+01
038d47c1-b03c-4eab-a9e6-f6e7b37a5699	tulia-romantic-sea-view-escape	HolidayPackage	\N	Published	Tulia Romantic Sea View Escape	\N	A short romantic all-inclusive escape with upgraded partial sea view accommodation, suited to couples and special occasions.	\N	SAFARI	77b58b85-aea3-423a-85e5-ec35d76be58f	3	1	2	0	PerParty	USD	377280	f	0	\N	\N	5	2026-11-03 21:29:54.052812+01	2026-11-03 21:29:02.195272+01	2026-11-03 21:29:54.052817+01
5675c10b-efe3-4b81-bbef-58887a70d72c	tulia-all-inclusive-short-escape	HolidayPackage	\N	Published	Tulia All-Inclusive Short Escape	\N	A convenient 3 night all-inclusive Zanzibar getaway for guests who prefer meals and drinks included during their stay.	\N	SAFARI	77b58b85-aea3-423a-85e5-ec35d76be58f	3	3	2	0	PerParty	USD	340200	f	0	\N	\N	5	2026-11-03 21:22:41.692516+01	2026-11-03 21:22:37.549546+01	2026-11-03 21:22:41.692519+01
cfbaf17e-44fb-43fa-86cd-f60946243f01	tulia-all-inclusive-escape	HolidayPackage	\N	Published	Tulia All-Inclusive Escape	\N	A 5-night all-inclusive resort experience for guests seeking a convenient and more complete Tulia stay.	\N	LODGE	77b58b85-aea3-423a-85e5-ec35d76be58f	5	4	2	0	PerParty	USD	567000	f	0	\N	\N	5	2026-11-03 21:17:18.124939+01	2026-11-03 21:16:48.924365+01	2026-11-03 21:17:18.124945+01
203427b1-0e3d-43a3-a274-d7247284fbb8	giraffe-manor-luxury-escape	HolidayPackage	\N	Published	Giraffe Manor Luxury Escape	\N	Indulge in sophisticated comfort, exceptional service and extraordinary moments at Giraffe Manor	\N	SAFARI	f1da7e79-5a02-49b0-902e-68145c23d5e3	4	4	2	0	PerParty	USD	1136800	f	0	\N	\N	5	2026-11-03 14:59:08.198854+01	2026-11-03 14:58:54.316676+01	2026-11-03 14:59:08.201448+01
1ed61be3-6527-4962-90b9-4cdded3f6395	ultimate-safari-collection-journey-2	HolidayPackage	\N	Published	Ultimate Safari Collection Journey	\N	10-Night Premium Long-Stay Safari for Two Adults	\N	SAFARI	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	10	10	2	0	PerParty	USD	4484800	f	0	\N	\N	5	2026-11-03 20:32:00.46012+01	2026-11-03 20:31:52.018602+01	2026-11-03 20:32:00.460127+01
b8a18ecb-ed12-4444-bd94-694a5c607cce	tulia-honeymoon-escape	HolidayPackage	\N	Published	Tulia Honeymoon Escape	\N	A romantic 5-night all-inclusive escape with upgraded accommodation, designed for honeymooners and anniversary travellers.	\N	SAFARI	02ee1ddf-a393-492a-a78d-ccb4b4d18629	5	4	2	0	PerParty	USD	628800	f	0	\N	\N	5	2026-11-04 10:03:45.059808+01	2026-11-04 10:02:36.373753+01	2026-11-04 10:03:45.060051+01
36c61c62-83f7-41bf-a605-9521abd2e931	tulia-zanzibar-escape	HolidayPackage	\N	Published	Tulia Zanzibar Escape	\N	A short luxury escape with breakfast, ideal for couples or leisure travellers seeking a relaxed resort stay.	\N	LODGE	02ee1ddf-a393-492a-a78d-ccb4b4d18629	2	2	2	0	PerParty	USD	747600	f	0	\N	\N	5	2026-11-04 10:38:18.001921+01	2026-11-04 10:38:14.774037+01	2026-11-04 10:38:18.001925+01
b3e46c78-9eed-4aa1-abc8-337a462bcbb0	tulia-family-private-pool-escape-2-children	HolidayPackage	\N	Published	Tulia Family Private Pool Escape (2 children)	\N	A seven-night all-inclusive family villa stay with a private pool, designed for families wanting additional space and a premium resort experience	\N	SAFARI	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	7	1	2	2	PerParty	USD	1465296	f	0	\N	\N	5	2026-11-04 10:07:03.554539+01	2026-11-04 10:07:00.781287+01	2026-11-04 10:07:03.554542+01
22222222-2222-2222-2222-222222222222	arlink28-elite-signature	PrivateCharter	{"tier": "Signature", "basedOn": "arlink28-elite", "tagline": "A more personalised and elevated private aviation experience.", "audience": "For clients who want their journey to feel more personal, premium and thoughtfully curated.", "includes": ["Premium in-flight catering", "Personalised cabin preferences", "Welcome gift for the client", "Enhanced guest-experience coordination", "Special dietary and hospitality requirements where available"]}	Published	ARLink28 Elite Signature	\N	A more personalised and elevated private aviation experience.	For clients who want their journey to feel more personal, premium and thoughtfully curated.	PrivateCharter	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	0	0	1	0	PerParty	USD	\N	t	2	\N	\N	1	2026-11-04 12:09:06.716945+01	2026-11-04 12:09:06.716945+01	2026-11-04 12:57:44.64919+01
e39e7ba5-f2e4-4931-88ac-4db2aa647c1e	a	PrivateCharter	{"tier": "cvb", "includes": ["g"]}	Archived	a	\N	fghj	\N	PRIVATECHARTER	2031dab8-2aca-402c-8fed-083dbe481884	0	0	0	0	PerParty	USD	\N	f	0	\N	\N	1	\N	2026-11-04 11:51:04.420575+01	2026-11-04 11:51:26.140851+01
96225bea-1bb5-4992-a7e4-c9e595dc261b	zanzibar-mini-escape-2	HolidayPackage	\N	Published	Zanzibar Mini Escape	\N	Enjoy a short Zanzibar break with coastal comfort, style and warm island hospitality.	\N	SAFARI	02ee1ddf-a393-492a-a78d-ccb4b4d18629	3	3	2	0	PerParty	USD	44900	f	0	\N	\N	5	2026-11-04 13:41:25.38447+01	2026-11-04 13:41:13.919202+01	2026-11-04 13:41:25.38463+01
11111111-1111-1111-1111-111111111111	arlink28-elite	PrivateCharter	{"tier": "Elite", "tagline": "Private aviation essentials, professionally coordinated.", "audience": "The core private aviation package for clients who want a seamless charter journey without extensive personalisation.", "includes": ["Private aircraft charter", "VIP ground transfer", "Airport meet and greet", "Pre-flight travel coordination", "Dedicated booking support"]}	Published	ARLink28 Elite	\N	Private aviation essentials, professionally coordinated.	The core private aviation package for clients who want a seamless charter journey without extensive personalisation.	PrivateCharter	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	0	0	1	0	PerParty	USD	\N	t	1	\N	\N	1	2026-11-04 12:09:06.716945+01	2026-11-04 12:09:06.716945+01	2026-11-04 12:28:11.019208+01
33333333-3333-3333-3333-333333333333	arlink28-bespoke	PrivateCharter	{"tier": "Bespoke", "tagline": "A completely customised private aviation journey.", "audience": "A fully tailored combination of services, built around the client's needs.", "includes": ["Private aircraft charter", "VIP ground transfers", "Meet and greet", "Bespoke cabin styling and décor", "Specialised catering", "Personalised guest amenities", "Security arrangements", "Destination concierge", "Celebration arrangements", "Special occasions and welcome setups", "Custom gifts and hospitality requirements", "Other tailored travel requests based on the client's needs"]}	Published	ARLink28 Bespoke	\N	A completely customised private aviation journey.	A fully tailored combination of services, built around the client's needs.	PrivateCharter	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	0	0	1	0	PerParty	USD	\N	t	3	\N	\N	1	2026-11-04 12:09:06.716945+01	2026-11-04 12:09:06.716945+01	2026-11-04 13:03:11.873676+01
0eb3e4e4-40e7-41f9-8ffb-6f83552ed290	zanzibar-escape	HolidayPackage	\N	Published	Zanzibar Escape	4 Nights Accommodation, Premium Sea View Room Daily Breakfast for 2 Adults Return Airport/Port Transfers (Up to 4 pax) Complimentary Wi-Fi Access to Resort Facilities ARLINK28 Booking Support	Unwind in Zanzibar’s coastal paradise with comfort, style and warm island hospitality.	\N	LODGE	2f114f3d-7af7-4bd0-ae19-055b80f69d26	4	4	2	0	PerParty	USD	64900	f	0	\N	\N	7	2026-11-03 11:30:57.172734+01	2026-11-03 11:27:38.218043+01	2026-11-04 13:33:43.661989+01
904a68f3-bac6-4076-b404-b8cf418cb4ce	zanzibar-royal-escape	HolidayPackage	\N	Published	Zanzibar Royal Escape	\N	Experience Blue Ocean’s most exclusive Zanzibar stay with private-pool luxury, sea views and premium comfort for groups.	\N	SAFARI	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	4	4	6	0	PerParty	USD	309900	f	0	\N	\N	5	2026-11-04 13:57:01.187687+01	2026-11-04 13:55:08.491701+01	2026-11-04 13:57:01.187693+01
5b7901a1-09d3-45e2-9603-d6909c7852f5	zanzibar-solo-sea-view-escape	HolidayPackage	\N	Published	Zanzibar Solo Sea View Escape	\N	Enjoy a refreshing solo getaway in Zanzibar with ocean views, comfort, and effortless island hospitality.	\N	SAFARI	77b58b85-aea3-423a-85e5-ec35d76be58f	3	3	1	0	PerParty	USD	42900	f	0	\N	\N	5	2026-11-04 14:05:44.302703+01	2026-11-04 14:05:42.142922+01	2026-11-04 14:05:44.302707+01
0b2a1680-e2f8-4ea4-b777-7484839428f9	zanzibar-group-escape	HolidayPackage	\N	Published	Zanzibar Group Escape	\N	Enjoy Zanzibar together with comfort, space and warm island hospitality.	\N	SAFARI	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	4	4	6	0	PerParty	USD	139900	f	0	\N	\N	5	2026-11-04 13:47:16.336566+01	2026-11-04 13:47:08.990891+01	2026-11-04 13:47:16.336585+01
4d05e06f-86f1-4e81-a921-feb8de65b121	zanzibar-solo-escape	HolidayPackage	\N	Published	Zanzibar Solo Escape	\N	A stylish solo Zanzibar getaway with comfort, breakfast, transfers and resort access included.	\N	SAFARI	db21e135-cd2c-454a-aef6-bccffc43ff43	3	3	1	0	PerParty	USD	36900	f	0	\N	\N	5	2026-11-04 14:00:53.82736+01	2026-11-04 14:00:51.328731+01	2026-11-04 14:00:53.827364+01
d84ad498-15ae-4835-9269-fd60883a88ea	zanzibar-solo-extended-escape	HolidayPackage	\N	Published	Zanzibar Solo Extended Escape	\N	Enjoy a longer solo island getaway in Zanzibar with comfort, breakfast, transfers and seamless booking support.	\N	SAFARI	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	4	4	1	0	PerParty	USD	46900	f	0	\N	\N	5	2026-11-04 14:10:07.443444+01	2026-11-04 14:10:04.854085+01	2026-11-04 14:10:07.443449+01
\.


--
-- Data for Name: Partners; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Partners" ("Id", "Slug", "Name", "Tagline", "LogoPath", "CreatedAt", "UpdatedAt") FROM stdin;
544979d3-cbf6-4ed4-95cf-c8138a167259	giraffe-manor	Giraffe Manor	An exclusive partnership. Extraordinary experiences.	\N	2026-10-16 03:13:59.79865+01	2026-10-16 04:06:40.798023+01
d793c981-583e-49f8-95aa-f4cbdbf251a3	the-safari-collection	The Safari Collection	\N	\N	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01
\.


--
-- Data for Name: Properties; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Properties" ("Id", "Slug", "Name", "PartnerId", "DestinationId", "CreatedAt", "UpdatedAt") FROM stdin;
df9c91e4-8a9c-4e0e-835b-a0d421fbe0a3	giraffe-manor	Giraffe Manor	544979d3-cbf6-4ed4-95cf-c8138a167259	f1da7e79-5a02-49b0-902e-68145c23d5e3	2026-10-16 03:13:59.79865+01	2026-10-16 04:06:40.798023+01
260b8c6b-d0b4-4534-9833-9fc93fc80494	salas-camp	Sala's Camp	d793c981-583e-49f8-95aa-f4cbdbf251a3	2031dab8-2aca-402c-8fed-083dbe481884	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01
c1630f23-bb5f-43fe-9fb6-b72812fa5354	sasaab	Sasaab	d793c981-583e-49f8-95aa-f4cbdbf251a3	f44e0c8f-b08a-4d8d-9ce2-69c97f310917	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01
1edccded-3b1f-4297-a4d9-fc190864b1bc	zanzibar-escape	Zanzibar Escape	\N	02ee1ddf-a393-492a-a78d-ccb4b4d18629	2026-11-03 19:35:13.254932+01	2026-11-03 19:35:13.254932+01
cfc53b5b-11ba-4b40-a930-e2a66918eddf	tulia	Tulia	\N	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	2026-11-03 21:11:57.739172+01	2026-11-03 21:11:57.739172+01
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
2fab7c39-088e-4a6e-b2f2-f3c341b91e18	giraffe-manor-2026	2026	544979d3-cbf6-4ed4-95cf-c8138a167259	2026-10-16 03:13:59.79865+01	2026-10-16 04:06:40.798023+01
9d0143d1-3afe-4f1d-8e5f-e444067a87bf	safari-collection-savings-2026	Savings Season 2026	d793c981-583e-49f8-95aa-f4cbdbf251a3	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01
e4e42114-65d5-4f36-b922-581a56d4d537	safari-collection-peak-2026	Peak Season 2026	d793c981-583e-49f8-95aa-f4cbdbf251a3	2026-10-16 04:06:40.798023+01	2026-10-16 04:06:40.798023+01
\.


--
-- Data for Name: Staff; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."Staff" ("Id", "Username", "Email", "PasswordHash", "Role", "IsActive", "FailedLoginAttempts", "LockedUntil", "LastLoginAt", "InvitedById", "CreatedAt", "UpdatedAt") FROM stdin;
e9705320-15ae-4dc4-acca-7a9e0872bd64	developers	developers@arlink28.com	AQAAAAIAAYagAAAAEOKdmtOTvgi//9aM0Rac+64xZ9zHJlTj/mJZC4ON4rJhXK6a7yl8iOeIDawzARxcfA==	SuperAdmin	t	0	\N	2026-11-04 12:09:16.353404+01	\N	2026-10-14 23:50:48.990239+01	2026-11-04 12:09:16.353404+01
\.


--
-- Data for Name: StaffTokens; Type: TABLE DATA; Schema: public; Owner: arlink28
--

COPY public."StaffTokens" ("Id", "Type", "TokenHash", "Email", "RoleToAssign", "StaffId", "ExpiresAt", "UsedAt", "CreatedAt") FROM stdin;
c0633fc9-dede-4494-bf8f-39978b65806e	PasswordReset	daec6dde218404ae4200169908a68493e7f1f5b4cf6023afdd10901d017f86fc	developers@arlink28.com	\N	e9705320-15ae-4dc4-acca-7a9e0872bd64	2026-10-30 14:50:43.32803+01	\N	2026-10-30 13:50:43.328054+01
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
9bb50cd7-bdf4-4250-b51c-3a699d5153a2	\N	Enquiry.Created	Enquiry	42638c3b-72ce-49d8-934b-b5237a420af4	\N	\N	2026-10-16 00:23:47.775762+01
2d3537d1-5efa-47fe-a83a-d4121d9f49bc	\N	Enquiry.Created	Enquiry	84c66f82-a9de-44b3-b72b-b8a5949891eb	\N	\N	2026-10-16 00:23:57.506447+01
2871d057-692e-4bf2-b21b-de97468f61c9	\N	Enquiry.Created	Enquiry	664f8419-53ce-4f70-8ef4-94b4c00a34b8	\N	\N	2026-10-16 00:27:48.92886+01
1c968bd3-6662-4c08-9970-d14e77d39d05	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 01:32:18.822304+01
db8a8988-8b4e-4bc6-9d6d-db91e78dc172	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 01:33:36.314447+01
2867a8a0-e03f-4ed1-84ec-4900b45e34f6	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 01:43:41.994324+01
b3b9f430-1b3a-430b-a00c-bb96cbddf48e	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 01:44:19.36717+01
acd034b8-1fad-4b97-bf51-104cf1e2ac91	\N	Enquiry.Created	Enquiry	dfa8b115-ea99-4bfe-b1db-cf397c311a66	\N	\N	2026-10-16 02:04:13.259535+01
c8e06ed8-94af-43fc-8625-f5f7ba42f6b8	\N	Enquiry.Created	Enquiry	3965844a-abd7-4635-b4a3-0909e29ff40f	\N	\N	2026-10-16 02:18:10.009061+01
a0ad905d-bb27-4046-9b6f-dd2e9f58d0f5	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 03:01:07.415804+01
0ee73261-a226-42e5-9403-8062e73dcf64	\N	seed.package.create	package	5daabefd-e115-48ab-a84e-33e6eb68f7f9	\N	{"Slug":"giraffe-manor-family-experience","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2657600}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (2).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:13:59.79865+01
1b9bdbea-569d-482b-a051-c5a47817ff2f	\N	seed.package.create	package	d4d1b4e2-95d8-41fc-88a7-a25103292e81	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-3-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":3720640}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (4).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:13:59.79865+01
1d707fb6-2b77-4878-b495-cbcda3730307	\N	seed.package.create	package	46a039e6-d50d-4f47-ac0e-30ab22d97535	\N	{"Slug":"giraffe-manor-solo-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":698670}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:13:59.79865+01
c451fec6-365f-44e7-a4f9-95ac883935dc	\N	seed.package.create	package	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	\N	{"Slug":"giraffe-manor-signature-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":1413000}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (1).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:13:59.79865+01
d785f746-f30f-4f27-ab80-5aa9b25d1b67	\N	seed.package.create	package	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-4-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":4154220}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.46.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:13:59.79865+01
e66b5211-87c4-44e4-a107-4dd818b2c67b	\N	seed.package.create	package	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	\N	{"Slug":"giraffe-manor-extended-family-package","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2863350}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (3).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:13:59.79865+01
d71cf39a-6d76-490d-850e-f7318fdf1eb6	\N	Enquiry.Created	Enquiry	098ba038-42e1-4ef6-9a97-3d200c911146	\N	\N	2026-10-16 03:19:08.923976+01
587d659b-e88c-48da-b98d-996fb703e2eb	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 03:24:16.271649+01
14c58c9f-7652-4d2e-bc25-f5608cfbae71	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 03:29:12.121145+01
1ca58955-0f6d-4b2f-b140-ceb00b557703	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 03:31:46.509528+01
777abeaa-cd34-489a-8ed7-2eb2a340aaa8	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 03:31:52.471984+01
d8cfb16c-e391-4f9d-9404-a26e5992096d	\N	seed.package.update	package	46a039e6-d50d-4f47-ac0e-30ab22d97535	\N	{"Slug":"giraffe-manor-solo-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":698670}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:33:07.577045+01
cdab79e1-fcd6-4510-a69f-791b55a97d43	\N	seed.package.update	package	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	\N	{"Slug":"giraffe-manor-signature-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":1413000}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (1).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:33:07.577045+01
ddb10f1d-bde6-4f41-af28-38d476b257b0	\N	seed.package.update	package	5daabefd-e115-48ab-a84e-33e6eb68f7f9	\N	{"Slug":"giraffe-manor-family-experience","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2657600}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (2).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:33:07.577045+01
18f0f208-c051-4932-8e9b-e8ff9402ec67	\N	seed.package.update	package	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	\N	{"Slug":"giraffe-manor-extended-family-package","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2863350}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (3).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:33:07.577045+01
0fba4c16-fb17-497f-a004-ea1ed3c2cccb	\N	seed.package.update	package	d4d1b4e2-95d8-41fc-88a7-a25103292e81	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-3-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":3720640}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (4).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:33:07.577045+01
c24930a9-6b8d-491b-9a76-ade49a7b7bd6	\N	seed.package.update	package	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-4-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":4154220}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.46.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 03:33:07.577045+01
13d1a5d0-5a27-4701-95e3-73be65f3f302	\N	seed.package.create	package	79054381-312c-4e5f-aba3-dbfdffcf2d9a	\N	{"Slug":"ultimate-safari-collection-journey","Status":"Published","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":3088900},{"Season":"safari-collection-peak-2026","PriceMinor":4484800}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.34.jpeg","WhatsApp Image 2026-09-25 at 02.19.34 (1).jpeg"]}	2026-10-16 04:06:40.798023+01
7cd59574-a8f2-457c-86b4-ca40249885e0	\N	seed.package.create	package	f415c589-bdfc-4fd1-804d-ffa5fff66ac6	\N	{"Slug":"safari-collection-explorer","Status":"Draft","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":1936900},{"Season":"safari-collection-peak-2026","PriceMinor":3398500}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.34 (2).jpeg","WhatsApp Image 2026-09-25 at 02.19.34 (3).jpeg"]}	2026-10-16 04:06:40.798023+01
c0589362-b6cc-45c5-a846-49545845fb05	\N	seed.package.create	package	76d3ed1d-0d97-46e5-96b8-365498c4f85b	\N	{"Slug":"sala-mara-escape","Status":"Published","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":747200}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.33.jpeg"]}	2026-10-16 04:06:40.798023+01
c0ec95c7-ef24-428c-bc51-10de5f9171dd	\N	seed.package.create	package	12f4b08b-286b-4f7a-b05a-3c6e14edd43c	\N	{"Slug":"salas-extended-mara-experience","Status":"Draft","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":1494400},{"Season":"safari-collection-peak-2026","PriceMinor":2366600}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.33 (2).jpeg","WhatsApp Image 2026-09-25 at 02.19.33 (3).jpeg"]}	2026-10-16 04:06:40.798023+01
cba46fc3-61cd-477d-a241-7a09d06280c4	\N	seed.package.create	package	3becabc0-2844-47e8-a330-f83a44db48cc	\N	{"Slug":"salas-family-safari","Status":"Draft","Rates":[{"Season":"safari-collection-savings-2026","PriceMinor":2688400},{"Season":"safari-collection-peak-2026","PriceMinor":3788200}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.33 (4).jpeg","WhatsApp Image 2026-09-25 at 02.19.34 (4).jpeg"]}	2026-10-16 04:06:40.798023+01
e81f4fd7-e54a-4fa9-8104-5a0e2ef429cf	\N	seed.package.create	package	0ae7b7eb-acae-481d-9606-b99cdb5af83e	\N	{"Slug":"salas-classic-safari","Status":"Published","Rates":[{"Season":"safari-collection-peak-2026","PriceMinor":1775000}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.33 (1).jpeg"]}	2026-10-16 04:06:40.798023+01
791b634d-3c61-4af2-b2e3-a590ec8dc0a4	\N	seed.package.update	package	46a039e6-d50d-4f47-ac0e-30ab22d97535	\N	{"Slug":"giraffe-manor-solo-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":698670}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 04:06:40.798023+01
b67245c2-862f-4076-bfaa-a865e7a91dbf	\N	seed.package.update	package	b0373e99-b0cb-4a15-bfb9-82f8ef6e75a6	\N	{"Slug":"giraffe-manor-signature-escape","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":1413000}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (1).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 04:06:40.798023+01
af949bb2-c604-4e0e-97f0-41466e72e6ed	\N	seed.package.update	package	5daabefd-e115-48ab-a84e-33e6eb68f7f9	\N	{"Slug":"giraffe-manor-family-experience","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2657600}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (2).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 04:06:40.798023+01
e4ee3dcd-3bde-404a-98ce-277f72f97bde	\N	seed.package.update	package	a324c89d-1ba6-46e2-89dd-4cdf0d314a0e	\N	{"Slug":"giraffe-manor-extended-family-package","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":2863350}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (3).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 04:06:40.798023+01
21b15173-3e88-43fb-ab06-4cee2462a76b	\N	seed.package.update	package	d4d1b4e2-95d8-41fc-88a7-a25103292e81	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-3-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":3720640}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.45 (4).jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 04:06:40.798023+01
99c85ec0-5f23-4001-8472-8feece5e6a00	\N	seed.package.create	package	695be048-ccc7-4aa5-aa00-46e16d238edf	\N	{"Slug":"giraffe-and-nairobi-wildlife-escape","Status":"Draft","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":658900}],"Sources":["WhatsApp Image 2026-09-25 at 02.19.37.jpeg"]}	2026-10-16 04:06:40.798023+01
be234468-5e12-4772-b0eb-71b3df4ab7ce	\N	seed.package.update	package	cbcb141f-458b-45b5-8d16-d1d4a883bbb8	\N	{"Slug":"giraffe-manor-family-and-friends-retreat-4-adults","Status":"Published","Rates":[{"Season":"giraffe-manor-2026","PriceMinor":4154220}],"Sources":["WhatsApp Image 2026-10-08 at 15.36.46.jpeg","WhatsApp Image 2026-10-08 at 15.36.46 (1).jpeg"]}	2026-10-16 04:06:40.798023+01
32c94313-ae67-4e90-85a4-cd2c92ee2f51	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 04:10:12.608689+01
d7223b77-9e73-4895-b925-9ed0ead3d91f	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-16 04:40:27.683257+01
79906d1a-0ce3-4bf4-813c-c173b1aeea44	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 08:54:07.512359+01
42730ee2-334f-464d-81fa-9826d189401d	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 08:54:45.212418+01
b515bf72-a14d-48eb-a81b-9cbdad653db8	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 13:26:21.858673+01
c42ea26b-b7a8-4f18-820d-df3bdb8629eb	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	098ba038-42e1-4ef6-9a97-3d200c911146	New	Contacted	2026-10-26 14:54:14.16149+01
0d1a47d9-1b12-4747-9caa-f61ef56b3db2	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	098ba038-42e1-4ef6-9a97-3d200c911146	Contacted	Closed	2026-10-26 14:56:37.765822+01
87dd3ec4-7c67-4cf7-b841-e3addf820fcb	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 17:30:46.288287+01
8506873c-55f7-4808-8bcf-fdacc65c14ab	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-26 17:31:21.597044+01
0453565a-5c1c-48c2-82fe-830abe5ce529	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-27 07:25:50.859904+01
613808bd-0c13-41e9-8bc9-aef4ed7aaac7	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	eb2d59e3-ac54-4d93-b88c-3da09d04c9d2	\N	{"path":"/media/destinations/eb2d59e3ac544d93b88c3da09d04c9d2/45d8d198ba48430ea1018b83a880e68d.jpg"}	2026-10-27 08:48:01.894489+01
65f27546-dd6f-4128-8861-e6833a47830f	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	2031dab8-2aca-402c-8fed-083dbe481884	\N	{"path":"/media/destinations/2031dab82aca402c8fed083dbe481884/c0f9acda04fe4915ae1df23aba508586.jpg"}	2026-10-27 08:50:01.565357+01
56524308-9de0-45c8-b003-17a7057cc8d5	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	f1da7e79-5a02-49b0-902e-68145c23d5e3	\N	{"path":"/media/destinations/f1da7e795a0249b0902e68145c23d5e3/30cd8ed8cac54ec088314784597c28da.jpg"}	2026-10-27 08:51:17.111816+01
3c46b959-7588-41ba-87dd-c49d17c6c9c4	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	f44e0c8f-b08a-4d8d-9ce2-69c97f310917	\N	{"path":"/media/destinations/f44e0c8fb08a4d8d9ce269c97f310917/6c486b08aebf40a9bdb4f4085657acc3.jpg"}	2026-10-27 08:52:14.985469+01
2f25addd-eb98-4f31-b30c-19385a340525	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 19:25:32.664471+01
e379f44e-6d3a-48ea-832b-ab44c98ce45a	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	3965844a-abd7-4635-b4a3-0909e29ff40f	New	Closed	2026-10-28 19:26:45.703461+01
e88cc096-a88c-4c36-beed-951409e53c1e	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	dfa8b115-ea99-4bfe-b1db-cf397c311a66	New	Closed	2026-10-28 19:26:47.702635+01
e590edd3-7fc5-4fca-9004-319f13fd64bb	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	664f8419-53ce-4f70-8ef4-94b4c00a34b8	New	Closed	2026-10-28 19:26:48.494782+01
51f22578-d18b-4491-a763-bad515fa81a9	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	84c66f82-a9de-44b3-b72b-b8a5949891eb	New	Closed	2026-10-28 19:26:49.105801+01
b5df4770-40a0-4f9f-8ed5-ddadd97c1612	e9705320-15ae-4dc4-acca-7a9e0872bd64	Enquiry.StatusChanged	Enquiry	42638c3b-72ce-49d8-934b-b5237a420af4	New	Closed	2026-10-28 19:26:49.780148+01
e36fc8f2-6709-4544-9d37-6d2f4c646c18	e9705320-15ae-4dc4-acca-7a9e0872bd64	PasswordChanged	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 19:34:59.47142+01
220ae846-3942-4698-9349-a76f23bbd3e2	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 19:35:33.399901+01
8d427a89-8ce8-4706-8f04-ac08acc27a01	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 19:35:38.15587+01
024c755e-ba63-4fd7-956a-52c8c8c10875	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-28 19:35:51.515785+01
9e7e7aad-716e-4dc5-985e-9012ba55d640	\N	Enquiry.Created	Enquiry	aa03554e-32a1-48b9-a07c-5a1608b5d8e0	\N	\N	2026-10-30 12:23:56.822264+01
a4b1b3e5-6000-443e-b51e-abd238e58c20	\N	AccountLocked	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 12:27:56.449185+01
eb0618d7-de2d-4cdd-9929-90c4f97d89cc	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 17:21:22.014247+01
fcba569d-2422-4243-8a4d-c0276a9c8a55	e9705320-15ae-4dc4-acca-7a9e0872bd64	PasswordChanged	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 17:21:54.409665+01
6eac1254-00e3-458e-aeb7-2e7f36874676	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 17:22:02.770092+01
8e70ccfe-dd60-4f74-8a02-2fcb6c2b53e8	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 17:22:07.214964+01
84b9fd6c-5f54-4d16-a5da-7610c76efc6d	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 17:34:50.40948+01
aaea1061-a4bc-4be5-995b-e5d02cfda681	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 17:46:46.143687+01
1f34d661-ac7e-44a0-82a1-9f961e328fc0	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogout	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-10-30 17:52:28.152323+01
0e93a97e-ea4e-40b0-8b0b-e116a2eb27d5	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-02 20:43:40.953951+01
ce408d0d-35dd-4792-aea7-f3d60028c451	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-02 20:44:46.745624+01
208c6bba-f554-45bc-881a-f0c544674915	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-03 06:37:10.445724+01
d8b0dfdc-15d5-441a-859e-ab5f95fbeea8	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-03 06:38:03.477182+01
9a555d32-57ab-4c31-9bcb-9c0920831b84	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationCreated	Destination	2f114f3d-7af7-4bd0-ae19-055b80f69d26	\N	{"Slug":"zanzibar","Name":"Zanzibar","Kind":0}	2026-11-03 11:40:53.809648+01
258498e5-bda7-4100-a37a-58e1bfc1bab6	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	2f114f3d-7af7-4bd0-ae19-055b80f69d26	\N	{"path":"/media/destinations/2f114f3d7af74bd0ae19055b80f69d26/3b3ce6f3f6d44b96b7c3e405190eee62.jpg"}	2026-11-03 11:42:32.600537+01
88977b5d-ab17-409b-989c-194f3d1c195a	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationUpdated	Destination	2f114f3d-7af7-4bd0-ae19-055b80f69d26	\N	{"fields":["summary"]}	2026-11-03 11:43:01.577289+01
5ca64745-3f2c-40bc-9039-d5972c2f5c13	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationCreated	Destination	77b58b85-aea3-423a-85e5-ec35d76be58f	\N	{"Slug":"zanzibar-2","Name":"Zanzibar","Kind":1}	2026-11-03 11:43:15.308636+01
4f042dcb-09ba-4467-87f7-57e87c38475b	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationCreated	Destination	02ee1ddf-a393-492a-a78d-ccb4b4d18629	\N	{"Slug":"zanzibar-3","Name":"Zanzibar","Kind":1}	2026-11-03 11:43:46.864455+01
5b58ced0-015a-4629-b4b2-86a8b7bd8627	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationCreated	Destination	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	\N	{"Slug":"zanzibar-4","Name":"Zanzibar","Kind":1}	2026-11-03 11:45:13.439682+01
e7829df5-3eb0-4dc3-b7d7-1b583d6095fc	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	\N	{"path":"/media/destinations/f7b4e7c47e1843d6a6378aa7de0af193/90a83a5070a54189b2174f92b5120cb9.jpg"}	2026-11-03 11:46:06.241765+01
52858512-b265-4287-83ce-bcdac5395c31	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationUpdated	Destination	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	\N	{"fields":["summary"]}	2026-11-03 11:46:22.511135+01
f81211fe-cfce-4cc6-af6f-90eedcdc3e37	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationAttractionsReplaced	Destination	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	\N	{"count":1}	2026-11-03 11:46:41.406071+01
fdcd47b1-69cd-499c-b962-6827cb409e8c	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationPublished	Destination	f7b4e7c4-7e18-43d6-a637-8aa7de0af193	\N	{"Slug":"zanzibar-4"}	2026-11-03 11:46:43.801053+01
e82c0a95-ed0c-4a85-bd32-5325b8e6a000	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationPublished	Destination	2f114f3d-7af7-4bd0-ae19-055b80f69d26	\N	{"Slug":"zanzibar"}	2026-11-03 11:46:54.813743+01
f813ae6b-298a-47e2-a098-492170494557	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-03 14:44:16.473264+01
c1bca9c7-4bae-4209-8b08-6a27d0f25a02	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-03 16:16:43.022098+01
eb897e75-829d-4727-894d-cbb9a201001c	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-03 16:17:03.663241+01
2adda86e-fcd2-45c1-8eb7-e0f2b64cc901	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationCreated	Destination	db21e135-cd2c-454a-aef6-bccffc43ff43	\N	{"Slug":"zanzibar-5","Name":"Zanzibar","Kind":1}	2026-11-03 16:31:34.341486+01
824a774a-9f4f-4f82-b9a0-5c784bc4c3f3	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationUpdated	Destination	db21e135-cd2c-454a-aef6-bccffc43ff43	\N	{"fields":["summary"]}	2026-11-03 16:32:01.685861+01
e55c6a03-852d-41da-b7c3-b5334a599b4f	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationHeroChanged	Destination	db21e135-cd2c-454a-aef6-bccffc43ff43	\N	{"path":"/media/destinations/db21e135cd2c454aaef6bccffc43ff43/3e4bc4dc76fd4310bcb7ad0bed9d3ac5.jpg"}	2026-11-03 16:32:31.080791+01
34f84e06-d6a5-433a-bb82-72e363bbb866	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationAttractionsReplaced	Destination	db21e135-cd2c-454a-aef6-bccffc43ff43	\N	{"count":1}	2026-11-03 16:33:13.82973+01
472ee987-f386-43d1-a7df-ef8452b4937a	e9705320-15ae-4dc4-acca-7a9e0872bd64	DestinationPublished	Destination	db21e135-cd2c-454a-aef6-bccffc43ff43	\N	{"Slug":"zanzibar-5"}	2026-11-03 16:33:16.455326+01
b4c20697-c427-4acc-9e3f-92ad36651778	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-03 16:49:37.853898+01
be8ae604-619f-402f-8d1b-dcc7de229b1e	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-03 16:49:54.548787+01
d8bd3b07-50ae-4c81-8a5b-ff8fb440692e	e9705320-15ae-4dc4-acca-7a9e0872bd64	PropertyCreated	Property	b827c428-c526-4500-81c2-5e81525df91a	\N	{"Slug":"test-lodge","Name":"Test Lodge","DestinationId":"2031dab8-2aca-402c-8fed-083dbe481884"}	2026-11-03 16:49:54.667976+01
5e432f69-956f-4485-b0c0-50557fc815e5	e9705320-15ae-4dc4-acca-7a9e0872bd64	PropertyDeleted	Property	b827c428-c526-4500-81c2-5e81525df91a	\N	{"Slug":"test-lodge","Name":"Test Lodge"}	2026-11-03 16:49:54.813709+01
94774e75-eb57-4181-a020-745aa69a0e95	e9705320-15ae-4dc4-acca-7a9e0872bd64	PropertyCreated	Property	bab7ded0-2e7b-4e36-bdad-a76396ce8501	\N	{"Slug":"zanzibar-escape","Name":"Zanzibar Escape","DestinationId":"eb2d59e3-ac54-4d93-b88c-3da09d04c9d2"}	2026-11-03 19:34:49.244112+01
9a066d72-7f84-4aa2-8a1c-93b4e2d86f75	e9705320-15ae-4dc4-acca-7a9e0872bd64	PropertyDeleted	Property	bab7ded0-2e7b-4e36-bdad-a76396ce8501	\N	{"Slug":"zanzibar-escape","Name":"Zanzibar Escape"}	2026-11-03 19:34:55.801332+01
4a492884-2a7c-4e47-ba18-409ec97eaf2d	e9705320-15ae-4dc4-acca-7a9e0872bd64	PropertyCreated	Property	1edccded-3b1f-4297-a4d9-fc190864b1bc	\N	{"Slug":"zanzibar-escape","Name":"Zanzibar Escape","DestinationId":"02ee1ddf-a393-492a-a78d-ccb4b4d18629"}	2026-11-03 19:35:13.254932+01
ab17c96e-7c20-4eea-833f-b6913778f888	e9705320-15ae-4dc4-acca-7a9e0872bd64	PropertyCreated	Property	cfc53b5b-11ba-4b40-a930-e2a66918eddf	\N	{"Slug":"tulia","Name":"Tulia","DestinationId":"f7b4e7c4-7e18-43d6-a637-8aa7de0af193"}	2026-11-03 21:11:57.739172+01
72b3ebe8-d5d1-407d-a798-ad68224d01f4	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-04 09:40:13.38629+01
1d6adcb8-d47f-42b2-a9df-47e3cb34bd13	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-04 09:44:45.643897+01
e607379c-477c-40f9-8eba-0fa7db920558	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-04 11:44:37.164225+01
ac1f0988-4e3a-4088-81e1-d0913c6dbb7a	e9705320-15ae-4dc4-acca-7a9e0872bd64	StaffLogin	Staff	e9705320-15ae-4dc4-acca-7a9e0872bd64	\N	\N	2026-11-04 12:09:16.354019+01
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

\unrestrict CXaoZWFOSy8N9rQNE7hoYLHm15uHb8OMV25BRPQtPU4AgokzbHfKG9hGnRzyrk5

