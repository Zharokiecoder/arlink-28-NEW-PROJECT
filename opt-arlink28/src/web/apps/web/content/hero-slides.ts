import type { HeroSlide } from "@/components/home/HeroSlides";

/**
 * The home hero slideshow. TRIAL: these photos were supplied for a layout test. Confirm the business holds the rights
 * to each (they look like lodge or operator photography) before launch, and credit them in public/images/home/CREDITS.md.
 *
 * Each picture is exported at its own native width as well as smaller ones, never stretched. The Namibia photo is only
 * 1920 px wide, so on very wide or high-density screens it will look softer than the other two: ask for a larger original.
 */
export const HERO_SLIDES: HeroSlide[] = [
  {
    region: "Africa",
    place: "Morocco",
    blurb: "Luxury poolside retreats framed by palms and golden stone.",
    sizes: [
      { src: "/images/home/slide-serengeti-1280.webp", w: 1280 },
      { src: "/images/home/slide-serengeti-1920.webp", w: 1920 },
    ],
    thumb: "/images/home/slide-serengeti-thumb.webp",
    focus: "50% 50%",
  },
  {
    region: "Africa",
    place: "Private Aviation",
    blurb: "Fly private across Africa with ARLink28 Elite.",
    sizes: [
      { src: "/images/home/slide-namibia-1280.webp", w: 1280 },
      { src: "/images/home/slide-namibia-1920.webp", w: 1920 },
    ],
    thumb: "/images/home/slide-namibia-thumb.webp",
    focus: "50% 55%",
  },
  {
    region: "Africa",
    place: "Zanzibar",
    blurb: "Beachfront pools and palm-shaded lounges on the Indian Ocean.",
    sizes: [
      { src: "/images/home/slide-knysna-1280.webp", w: 1280 },
      { src: "/images/home/slide-knysna-1920.webp", w: 1920 },
      { src: "/images/home/slide-knysna-2048.webp", w: 2048 },
    ],
    thumb: "/images/home/slide-knysna-thumb.webp",
    focus: "50% 40%",
  },
];
