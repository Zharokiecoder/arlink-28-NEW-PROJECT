using System.Text.Json;
using Arlink28.Api.Data.Entities;
using Arlink28.Api.Helpers.Settings;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace Arlink28.Api.Data;

public class DataContextInitializer(
    ApplicationDbContext db,
    IPasswordHasher<Staff> passwordHasher,
    IOptions<AdminBootstrapSettings> bootstrap,
    ILogger<DataContextInitializer> logger)
{
    public async Task SeedSuperAdminAsync()
    {
        var settings = bootstrap.Value;
        if (!settings.Enabled) return;

        if (string.IsNullOrWhiteSpace(settings.Password) || settings.Password.StartsWith("PLACEHOLDER"))
        {
            logger.LogWarning("AdminBootstrap:Password is not set — skipping seed.");
            return;
        }

        var strategy = db.Database.CreateExecutionStrategy();
        await strategy.ExecuteAsync(async () =>
        {
            if (await db.Staff.AnyAsync())
            {
                logger.LogInformation("SuperAdmin seed skipped — staff records already exist.");
                return;
            }

            var admin = new Staff
            {
                Id = Guid.NewGuid(),
                Username = settings.Username,
                Email = settings.Email,
                Role = StaffRole.SuperAdmin,
                IsActive = true,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow,
            };
            admin.PasswordHash = passwordHasher.HashPassword(admin, settings.Password);

            db.Staff.Add(admin);
            await db.SaveChangesAsync();
            logger.LogInformation("SuperAdmin '{Username}' seeded.", settings.Username);
        });
    }

    public async Task EnsureTeamMembersAsync()
    {
        var strategy = db.Database.CreateExecutionStrategy();
        await strategy.ExecuteAsync(async () =>
        {
            await db.Database.ExecuteSqlRawAsync(@"
                ALTER TABLE ""Packages"" ALTER COLUMN ""Summary"" TYPE text;
                ALTER TABLE ""Packages"" ALTER COLUMN ""Subtitle"" TYPE text;
                ALTER TABLE ""Packages"" ALTER COLUMN ""SeoDescription"" TYPE character varying(300);
            ");

            await db.Database.ExecuteSqlRawAsync(@"
                CREATE TABLE IF NOT EXISTS ""TeamMembers"" (
                    ""Id"" uuid NOT NULL PRIMARY KEY,
                    ""Name"" character varying(120) NOT NULL,
                    ""Role"" character varying(120) NOT NULL,
                    ""Group"" character varying(120) NOT NULL,
                    ""PhotoPath"" character varying(255),
                    ""Alt"" character varying(250),
                    ""Bio"" text,
                    ""SortOrder"" integer NOT NULL,
                    ""IsLeadership"" boolean NOT NULL DEFAULT false,
                    ""CreatedAt"" timestamp with time zone NOT NULL,
                    ""UpdatedAt"" timestamp with time zone NOT NULL
                );
            ");

            if (await db.TeamMembers.AnyAsync()) return;

            var now = DateTime.UtcNow;
            var seedMembers = new List<TeamMember>
            {
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Dr. Richard O. Aisuebeogun",
                    Role = "Advisory Founding Chairman",
                    Group = "Advisory Chairman",
                    PhotoPath = "/images/team/richard-aisuebeogun.webp",
                    Alt = "Dr. Richard O. Aisuebeogun",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Dr. Richard O. Aisuebeogun is a highly respected aviation executive, scholar and leadership consultant with more than 30 years of experience across Nigeria’s aviation industry. He has held several senior leadership positions, including Managing Director and Chief Executive Officer of the Federal Airports Authority of Nigeria, Pioneer Chief Operating Officer of Overland Airways, and Executive Director/COO for International Operations at Air Nigeria.",
                        "He holds advanced qualifications in transportation and aviation and has contributed extensively to aviation policy, airport management, operational strategy and industry development. As Advisory Founding Chairman of ARLink28, Dr. Aisuebeogun provides strategic guidance, regulatory insight and high-level industry counsel, supporting the organisation’s long-term vision to strengthen connectivity, operational excellence and sustainable aviation development across Africa."
                    }),
                    SortOrder = 1,
                    IsLeadership = true,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Abdullahi Mohammed Sulaiman",
                    Role = "Finance & Administration Coordinator",
                    Group = "Finance & Admin",
                    PhotoPath = "/images/team/abdullahi-sulaiman.webp",
                    Alt = "Abdullahi Mohammed Sulaiman",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Abdullahi Mohammed Sulaiman is a results-driven finance and administration professional with more than 10 years of progressive experience in financial management, budgeting, compliance and organisational administration across the development and humanitarian sectors. He has worked with respected organisations including Search for Common Ground, the Centre for Community Development & Research Network, AS & Co Chartered Accountants and the Rural Women Development Initiative.",
                        "He holds a Master’s degree in Accounting and Financial Management, an MBA in Finance and Investment, and is an Associate Chartered Accountant of ICAN. At ARLink28, Abdullahi oversees financial planning, reporting, cost control, compliance and administrative systems, helping ensure that the organisation maintains strong financial governance, operational discipline and accurate decision-making as it continues to grow across Africa."
                    }),
                    SortOrder = 2,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Paul Damilola Agboola",
                    Role = "Digital Systems & Technology Coordinator",
                    Group = "Digital & Tech",
                    PhotoPath = "/images/team/paul-agboola.webp",
                    Alt = "Paul Damilola Agboola",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Paul Damilola Agboola is a results-driven technology professional with more than five years of experience across digital systems, IT operations, executive support and process improvement. He holds a B.Sc. in Computer Science and has built a strong track record of using technology, automation and digital infrastructure to improve efficiency, accuracy and organisational performance.",
                        "His professional experience includes work with organisations such as Bank of America, the Nigerian Army and Benue TV Station, where he supported digital systems, administrative operations and technology-enabled workflow improvements. At ARLink28, Paul oversees the organisation’s digital platforms, website infrastructure, systems security, integrations and technical operations. He plays a key role in strengthening ARLink28’s digital capabilities and supporting the organisation’s continued growth and operational development across Africa."
                    }),
                    SortOrder = 3,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Delroy Clyde Mahove",
                    Role = "Strategic Partnerships & Business Development Coordinator",
                    Group = "Partnerships & BD",
                    PhotoPath = "/images/team/delroy-mahove.webp",
                    Alt = "Delroy Clyde Mahove",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Delroy Clyde Mahove is a strategic partnerships and business development professional with close to eight years of experience in partnership development, stakeholder engagement, programme coordination, fundraising and organisational management. His career includes roles with organisations such as Uncommon.org, Fruition Consulting, Lungowe Mukaro Foundation, Dzikwa Trust Fund and the National Union of Metal and Allied Industries in Zimbabwe.",
                        "At ARLink28, Delroy leads the development of strategic relationships with airlines, hotels, tourism organisations, corporate partners and other key stakeholders across Africa. He supports business expansion by identifying commercial opportunities, coordinating partnership proposals and agreements, and strengthening long-term relationships that contribute to ARLink28’s growth. His ability to connect people, build trust and develop sustainable collaborations plays an important role in expanding our footprint."
                    }),
                    SortOrder = 4,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Ezra Asanyo Rasugu",
                    Role = "Human Resources & Workforce Planning Coordinator",
                    Group = "Human Resources",
                    PhotoPath = "/images/team/ezra-rasugu.webp",
                    Alt = "Ezra Asanyo Rasugu",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Ezra Asanyo Rasugu is a results-driven and detail-oriented professional with more than seven years of experience across corporate operations, administration, human resources support and records management. His background includes experience with organisations such as the United Nations, Rebbs Ventures and the Insurance Company of East Africa, where he developed strong capabilities in HR operations, compliance, documentation and process improvement.",
                        "At ARLink28, Ezra supports recruitment, candidate screening, onboarding, workforce planning, staff documentation and internal HR coordination. He also contributes to maintaining employee records, strengthening internal procedures, supporting performance tracking and improving workforce readiness across the organisation. His organised, proactive approach helps ARLink28 build a structured, accountable and effective people-management foundation as the company continues to grow across Africa."
                    }),
                    SortOrder = 5,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Feysel Mussema Fereja",
                    Role = "Aviation Research & Operational Planning Coordinator",
                    Group = "Aviation Planning",
                    PhotoPath = "/images/team/feysel-fereja.webp",
                    Alt = "Feysel Mussema Fereja",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Feysel Mussema Fereja is an aviation professional based in Addis Ababa, Ethiopia, with a BSc in Aviation Management from National Aviation College. His professional background includes serving as a Flight Operations Team Leader at Krimson Aviation, where he has supported aviation permits, regulatory compliance, ground-handling supervision and the coordination required for safe and timely flight operations. He previously worked as a Ground Handling Agent with ICAS Ethiopia, supporting airline operations involving Flynas, Saudia Airlines and Qatar Airways.",
                        "At ARLink28, Feysel serves as Aviation Research & Operational Planning Coordinator. His responsibilities include aviation research, route and airport intelligence, regulatory and operational planning, and supporting ARLink28 Elite through the assessment of licensed private aviation and charter operators. He also contributes to operational-readiness planning as ARLink28 develops its wider Pan-African aviation ecosystem."
                    }),
                    SortOrder = 6,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Afomiya Tamer",
                    Role = "Aviation Operations & Readiness Coordinator",
                    Group = "Flight Operations",
                    PhotoPath = "/images/team/afomiya-tamer.webp",
                    Alt = "Afomiya Tamer",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Afomiya Tamer is an aviation professional based in Addis Ababa, Ethiopia, with training in flight operations, flight planning, dispatch procedures, aviation regulations and airline operations. She completed flight-operations training at National Aviation College and is also pursuing a Bachelor’s degree in Management at Jimma University. Her additional training includes an Airline Flight Planning Certificate from TBO Academy and First Aid certification. Her experience has strengthened her analytical thinking, operational awareness, communication, leadership and ability to work accurately under pressure.",
                        "At ARLink28, Afomiya serves as Aviation Operations & Readiness Coordinator. Her responsibilities include supporting pre-operational aviation research, route and airport intelligence, regulatory awareness, operational-readiness planning and documentation. She also helps monitor aviation developments in Ethiopia and approved East African markets, prepares readiness materials and checklists, and contributes practical recommendations that support ARLink28’s future aviation operations and wider Pan-African development strategy."
                    }),
                    SortOrder = 7,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Yonatan Ayalew",
                    Role = "Customer Experience & Market Relations Coordinator",
                    Group = "Customer Experience",
                    PhotoPath = "/images/team/yonatan-ayalew.webp",
                    Alt = "Yonatan Ayalew",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Yonatan Ayalew is an Ethiopian customer-service, hospitality, sales and marketing professional with a Bachelor’s degree in Hospitality Management from National Aviation College. His experience includes working as a Customer Service Agent with Ethiopian Airlines, supporting international flight departures and passenger handling, as well as previous work in marketing, sales and customer relations. He has also served as a Sales and Marketing Manager, developing sales strategies, identifying business opportunities, maintaining customer relationships and monitoring market trends.",
                        "At ARLink28, Yonatan serves as Customer Experience & Market Relations Coordinator. His responsibilities include monitoring the customer journey, identifying service gaps, gathering traveller and market feedback, researching customer expectations and supporting customer-facing communication. He also helps translate market intelligence and customer observations into practical recommendations that strengthen ARLink28’s services, packages and overall traveller experience across approved African markets."
                    }),
                    SortOrder = 8,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Prosper Tinarwo",
                    Role = "Software Engineering & Systems Architecture Coordinator",
                    Group = "Software Engineering",
                    PhotoPath = "/images/team/prosper-tinarwo.webp",
                    Alt = "Prosper Tinarwo",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Prosper Tinarwo is a senior software engineer, technical lead and solutions architect with more than eight years of experience delivering production-grade systems across healthcare, fintech, logistics and SaaS. His background includes leading engineering teams, designing scalable software architecture, managing CI/CD pipelines, APIs, databases, cloud environments and complex system integrations. He currently serves as a Senior Software Engineer and Technical Lead at Western Cape Blood Services and is also the Founder & CTO of ShiftTech Global Solutions.",
                        "At ARLink28, Prosper serves as Software Engineering & Systems Architecture Coordinator. He supports the architecture and development of ARLink28’s websites, backend services, APIs, integrations and digital infrastructure. His role also covers system scalability, performance, cybersecurity, deployment processes, technical documentation and troubleshooting. Prosper works closely with Damilola, Brendon and other team members to ensure ARLink28’s technology infrastructure can support future booking systems, partner integrations and continued business growth."
                    }),
                    SortOrder = 9,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Elizabeth Nabankema",
                    Role = "Sales & Administrative Support Coordinator",
                    Group = "Sales & Administration",
                    PhotoPath = "/images/team/elizabeth-nabankema.webp",
                    Alt = "Elizabeth Nabankema",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Elizabeth Nabankema is a Ugandan finance and accounting professional currently pursuing ACCA certification, with experience in partnership analysis, stakeholder reporting, budgeting, documentation and administrative coordination. She previously worked as a Partnerships & Administrative Support Officer at MobiKlinic Uganda, where she supported partnership development, maintained compliance records and coordinated stakeholder activities. She also worked as a Marketing Manager & Specialist at BEBE Solutions East Africa, managing client relationships, event logistics, budgeting and reporting for corporate clients including Shell Uganda and MultiChoice.",
                        "At ARLink28, Elizabeth serves as Sales & Administrative Support Coordinator. Her responsibilities include supporting customer and sales enquiries, booking-related communication, follow-ups, quotations, administrative documentation and records management. She also supports partnership coordination, reporting and internal organisation, helping ensure that customer interactions, sales activities and administrative processes are handled accurately, professionally and efficiently as ARLink28 continues to expand its travel and hospitality services."
                    }),
                    SortOrder = 10,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                },
                new()
                {
                    Id = Guid.NewGuid(),
                    Name = "Brendon Sanyahawa",
                    Role = "Technology & Creative Design Coordinator",
                    Group = "Tech & Design",
                    PhotoPath = "/images/team/brendon-sanyahawa.webp",
                    Alt = "Brendon Sanyahawa",
                    Bio = JsonSerializer.Serialize(new[]
                    {
                        "Brendon Sanyahawa is a Zimbabwean technology and digital-design professional with experience in software engineering, web development, technical support, SEO and digital infrastructure. His background includes freelance technical support and web management, as well as a Software Engineering Internship with Runhare House, where he developed responsive websites, improved website performance, resolved technical issues and supported SEO optimisation. His technical skills include HTML, CSS, JavaScript, React, Node.js, WordPress, Python, Django, API integration, Git/GitHub and creative tools such as Figma, Canva, Photoshop and Illustrator.",
                        "At ARLink28, Brendon serves as Technology & Creative Design Coordinator. He supports creative production, social-media materials, website updates, user-experience checks, technical troubleshooting and brand consistency. He also works closely with Damilola and the wider technology team to ensure ARLink28’s digital content, design assets and customer-facing platforms remain professional, accurate, functional and aligned with the company’s brand standards."
                    }),
                    SortOrder = 11,
                    IsLeadership = false,
                    CreatedAt = now,
                    UpdatedAt = now
                }
            };

            db.TeamMembers.AddRange(seedMembers);
            await db.SaveChangesAsync();
            logger.LogInformation("Default team members seeded ({Count} records).", seedMembers.Count);
        });
    }
}
