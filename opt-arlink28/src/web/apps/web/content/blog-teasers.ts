// The guides planned for the blog. There are no published posts yet, so these are shown as "Coming soon" on the
// homepage and on the blog page. Replace an entry with a real link when its post is written.

export type BlogTeaser = { title: string; image: string; alt: string };

export const BLOG_TEASERS: BlogTeaser[] = [
  {
    title: "Dakar to Marrakesh: a plain checklist for visas and flights",
    image: "/images/home/route-dkr.webp",
    alt: "The African Renaissance Monument in Dakar under a blue sky",
  },
  {
    title: "Zanzibar for first-timers: when to go and where to stay",
    image: "/images/home/hero-zanzibar-900.webp",
    alt: "A sandbar surrounded by turquoise water in Zanzibar",
  },
];
