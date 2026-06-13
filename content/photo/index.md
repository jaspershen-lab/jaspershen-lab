---
date: "2026-06-13"
sections:
  - block: markdown
    id: photo_albums
    content:
      title: Photos
      subtitle: ''
      text: |
        <style>
        .photo-album-hero {
          margin: 0 auto 34px;
          max-width: 1180px;
        }

        .photo-album-hero__eyebrow {
          margin: 0 0 10px;
          color: #14b8a6;
          font-size: 0.86rem;
          font-weight: 900;
          letter-spacing: 0.08em;
          text-transform: uppercase;
        }

        .photo-album-hero h2 {
          margin: 0 0 12px;
          font-size: clamp(2.4rem, 6vw, 5.2rem);
          line-height: 0.98;
          font-weight: 850;
        }

        .photo-album-hero p {
          max-width: 760px;
          margin: 0;
          color: rgba(148, 163, 184, 0.94);
          font-size: clamp(1rem, 1.7vw, 1.2rem);
          line-height: 1.65;
        }

        .photo-album-grid {
          display: grid;
          grid-template-columns: repeat(3, minmax(0, 1fr));
          gap: 22px;
          max-width: 1180px;
          margin: 0 auto;
        }

        .photo-album-card {
          position: relative;
          min-height: 500px;
          overflow: hidden;
          border: 1px solid rgba(148, 163, 184, 0.18);
          border-radius: 28px;
          background: #0b1220;
          box-shadow: 0 24px 70px rgba(2, 6, 23, 0.24);
          color: #fff !important;
          text-decoration: none !important;
          isolation: isolate;
        }

        .photo-album-card img {
          position: absolute;
          inset: 0;
          width: 100%;
          height: 100%;
          object-fit: cover;
          opacity: 0.82;
          transform: scale(1.01);
          transition: transform 0.48s ease, opacity 0.48s ease, filter 0.48s ease;
        }

        .photo-album-card::after {
          position: absolute;
          inset: 0;
          z-index: 1;
          content: "";
          background:
            linear-gradient(180deg, rgba(2, 6, 23, 0.08), rgba(2, 6, 23, 0.84)),
            radial-gradient(circle at top left, rgba(20, 184, 166, 0.34), transparent 38%);
        }

        .photo-album-card__content {
          position: absolute;
          right: 0;
          bottom: 0;
          left: 0;
          z-index: 2;
          padding: 24px;
        }

        .photo-album-card__year {
          display: block;
          margin-bottom: 8px;
          color: #fff;
          font-size: clamp(3.2rem, 7vw, 5.4rem);
          line-height: 0.88;
          font-weight: 900;
        }

        .photo-album-card__meta {
          display: inline-flex;
          margin-bottom: 14px;
          padding: 6px 10px;
          border: 1px solid rgba(255, 255, 255, 0.2);
          border-radius: 999px;
          background: rgba(15, 23, 42, 0.52);
          color: #99f6e4;
          font-size: 0.8rem;
          font-weight: 900;
          backdrop-filter: blur(12px);
        }

        .photo-album-card h3 {
          margin: 0 0 8px;
          color: #fff;
          font-size: 1.35rem;
          line-height: 1.15;
        }

        .photo-album-card p {
          margin: 0;
          color: rgba(226, 232, 240, 0.9);
          font-size: 0.95rem;
          line-height: 1.5;
        }

        .photo-album-card:hover img,
        .photo-album-card:focus img {
          opacity: 0.96;
          transform: scale(1.07);
          filter: saturate(1.08) contrast(1.04);
        }

        @media (max-width: 991.98px) {
          .photo-album-grid {
            grid-template-columns: 1fr;
          }

          .photo-album-card {
            min-height: 360px;
          }
        }
        </style>

        <section class="photo-album-hero">
          <p class="photo-album-hero__eyebrow">Shen Lab Albums</p>
          <h2>Life in Pictures</h2>
          <p>Conference moments, lab dinners, visits, presentations, and everyday memories from Shen Lab.</p>
        </section>

        <section class="photo-album-grid">
          <a class="photo-album-card" href="/photo-2026/">
            <img src="/photo-2026/lab/2026-6-1-xiaotao-present-asms.jpeg" alt="Shen Lab photos 2026">
            <div class="photo-album-card__content">
              <span class="photo-album-card__year">2026</span>
              <span class="photo-album-card__meta">11 photos</span>
              <h3>Research in Motion</h3>
              <p>ASMS, research visits, lab milestones, and early-year moments.</p>
            </div>
          </a>

          <a class="photo-album-card" href="/photo-2025/">
            <img src="/photo-2025/lab/2025-8-5-lab-photo.jpg" alt="Shen Lab photos 2025">
            <div class="photo-album-card__content">
              <span class="photo-album-card__year">2025</span>
              <span class="photo-album-card__meta">45 photos</span>
              <h3>Lab Life Expanded</h3>
              <p>Group photos, conferences, visitors, farewells, and team meals.</p>
            </div>
          </a>

          <a class="photo-album-card" href="/photo-2024/">
            <img src="/photo-2024/lab/lab-2024-12-19.jpg" alt="Shen Lab photos 2024">
            <div class="photo-album-card__content">
              <span class="photo-album-card__year">2024</span>
              <span class="photo-album-card__meta">9 photos</span>
              <h3>NTU Beginnings</h3>
              <p>The first office days, meetings, visitors, and lab gatherings.</p>
            </div>
          </a>
        </section>
    design:
      columns: '1'
title: Photos
type: landing
---
