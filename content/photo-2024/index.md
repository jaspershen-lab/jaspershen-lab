---
date: "2025-01-01"
sections:
  - block: markdown
    id: photo
    content:
      title: 📸 Lab Photos 2024
      subtitle: ''
      text: |
        <style>
        .photo-spotlight {
          position: relative;
          min-height: 440px;
          margin: 0 auto 42px;
          overflow: hidden;
          border-radius: 28px;
          border: 1px solid rgba(148, 163, 184, 0.18);
          background: #0b1220;
          box-shadow: 0 26px 70px rgba(2, 6, 23, 0.22);
          isolation: isolate;
        }

        .photo-spotlight img {
          position: absolute;
          inset: 0;
          width: 100%;
          height: 100%;
          object-fit: cover;
          opacity: 0.82;
        }

        .photo-spotlight::after {
          position: absolute;
          inset: 0;
          content: "";
          background:
            linear-gradient(90deg, rgba(2, 6, 23, 0.86), rgba(2, 6, 23, 0.28) 58%, rgba(2, 6, 23, 0.08)),
            linear-gradient(180deg, transparent, rgba(2, 6, 23, 0.58));
          z-index: 1;
        }

        .photo-spotlight__content {
          position: relative;
          z-index: 2;
          max-width: 720px;
          padding: clamp(34px, 7vw, 74px);
          color: #f8fafc;
        }

        .photo-spotlight__eyebrow {
          margin: 0 0 12px;
          color: #8ef3df;
          font-size: 0.85rem;
          font-weight: 900;
          letter-spacing: 0.08em;
          text-transform: uppercase;
        }

        .photo-spotlight h2 {
          margin: 0 0 14px;
          color: #fff;
          font-size: clamp(2.4rem, 6vw, 5rem);
          line-height: 0.98;
          font-weight: 850;
        }

        .photo-spotlight p {
          max-width: 600px;
          margin: 0;
          color: rgba(226, 232, 240, 0.9);
          font-size: clamp(1rem, 1.8vw, 1.25rem);
          line-height: 1.55;
        }

        .month-block {
          margin: 0 auto 44px;
        }

        .month-title {
          display: flex;
          align-items: center;
          gap: 14px;
          margin: 22px 0 18px;
          color: inherit;
          font-size: clamp(1.35rem, 2.6vw, 2.15rem);
          font-weight: 850;
          line-height: 1.1;
        }

        .month-title::before {
          width: 42px;
          height: 3px;
          border-radius: 999px;
          background: linear-gradient(90deg, #14b8a6, #3b82f6);
          content: "";
        }

        .gallery {
          column-count: 3;
          column-gap: 18px;
          column-fill: balance;
        }

        .image-container {
          position: relative;
          display: inline-block;
          width: 100%;
          margin-bottom: 18px;
          overflow: hidden;
          break-inside: avoid;
          -webkit-column-break-inside: avoid;
          page-break-inside: avoid;
          border: 1px solid rgba(148, 163, 184, 0.18);
          border-radius: 20px;
          background: rgba(15, 23, 42, 0.08);
          box-shadow: 0 18px 42px rgba(15, 23, 42, 0.12);
        }

        .image-container img {
          display: block;
          width: 100%;
          height: auto;
          cursor: pointer;
          transition: transform 0.35s ease, filter 0.35s ease;
        }

        .image-container::after {
          position: absolute;
          inset: 45% 0 0;
          content: "";
          background: linear-gradient(180deg, transparent, rgba(2, 6, 23, 0.74));
          opacity: 0;
          pointer-events: none;
          transition: opacity 0.25s ease;
        }

        .image-container:hover img {
          transform: scale(1.055);
          filter: saturate(1.08) contrast(1.04);
        }

        .image-container:hover::after {
          opacity: 1;
        }

        .caption {
          position: absolute;
          right: 0.9rem;
          bottom: 0.75rem;
          left: 0.9rem;
          z-index: 1;
          color: #fff;
          font-size: 0.92rem;
          font-weight: 800;
          line-height: 1.28;
          opacity: 0;
          transform: translateY(8px);
          transition: opacity 0.22s ease, transform 0.22s ease;
          text-shadow: 0 2px 16px rgba(0, 0, 0, 0.52);
        }

        .image-container:hover .caption {
          opacity: 1;
          transform: translateY(0);
        }

        /* Lightbox 样式 */
        .lightbox {
          display: none;
          position: fixed;
          z-index: 9999;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0,0,0,0.9);
          justify-content: center;
          align-items: center;
          flex-direction: column;
        }

        .lightbox img {
          max-width: 90%;
          max-height: 75%;
          border-radius: 6px;
          transition: transform 0.2s ease;
          transform-origin: center center;
        }

        .lightbox .close,
        .lightbox .prev,
        .lightbox .next,
        .lightbox-toolbar button {
          position: absolute;
          color: white;
          font-size: 28px;
          padding: 8px 10px;
          cursor: pointer;
          user-select: none;
          z-index: 10000;
          background: transparent;
          border: 0;
          line-height: 1;
        }

        .lightbox-toolbar {
          position: absolute;
          top: 20px;
          right: 72px;
          display: flex;
          gap: 8px;
          z-index: 10000;
        }

        .lightbox-toolbar button {
          position: static;
        }

        .lightbox .close {
          top: 20px;
          right: 30px;
        }

        .lightbox .prev {
          top: 50%;
          left: 30px;
          transform: translateY(-50%);
        }

        .lightbox .next {
          top: 50%;
          right: 30px;
          transform: translateY(-50%);
        }

        .lightbox-caption {
          margin-top: 15px;
          color: #fff;
          font-size: 16px;
          text-align: center;
          max-width: 80%;
        }

        @media (max-width: 768px) {
          .photo-spotlight {
            min-height: 380px;
            border-radius: 22px;
          }

          .gallery {
            column-count: 1;
          }

          .caption {
            opacity: 1;
            transform: none;
          }
        }
        </style>

        <section class="photo-spotlight">
          <img src="lab/lab-2024-12-19.jpg" alt="2024 Shen Lab featured moment">
          <div class="photo-spotlight__content">
            <p class="photo-spotlight__eyebrow">Featured Moment</p>
            <h2>2024 Beginnings</h2>
            <p>The first office days, first lab moments, visitors, meetings, and dinners as Shen Lab started at NTU.</p>
          </div>
        </section>

        <!-- November - Decmber -->
        <div class="month-block">
          <div class="month-title">November - Decmber 2024</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/lab-2024-12-19.jpg" alt="2024/12/19 Dinner gathering with lab members"><div class="caption">2024/12/19 Dinner gathering with lab members</div></div>
            <div class="image-container"><img src="lab/2024-12-4-xiaotao.jpeg" alt="2024/12/4 Xiaotao presenting research"><div class="caption">2024/12/4 Xiaotao presenting research</div></div>
            <div class="image-container"><img src="lab/2024-11-19-editor-visiting.jpg" alt="2024/11/19 Editor visiting our lab"><div class="caption">2024/11/19 Editor visiting our lab</div></div>
          </div>
        </div>

        <!-- May - October -->
        <div class="month-block">
          <div class="month-title">May - October 2024</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2024-10-14-jingxiang-arrival.jpg" alt="2024/10/14 Jingxiang's arrival at the lab"><div class="caption">2024/10/14 Jingxiang's arrival at the lab</div></div>
            <div class="image-container"><img src="lab/2024-10-31-visiting westlake university.jpeg" alt="2024/10/31 Visiting Westlake University"><div class="caption">2024/10/31 Visiting Westlake University</div></div>
            <div class="image-container"><img src="lab/2024-9-21-bar.jpeg" alt="2024/09/21 Bar"><div class="caption">2024/09/21 Bar</div></div>
            <div class="image-container"><img src="lab/2024-9-17-lab-dinner.jpg" alt="2024/09/17 Dinner gathering with lab members"><div class="caption">2024/09/17 Dinner gathering with lab members</div></div>
            <div class="image-container"><img src="lab/2024-5-21-first-day-in-office.jpg" alt="2024/5/21 First day in the new office"><div class="caption">2024/5/21 First day in the new office</div></div>
          </div>
        </div>


        <script>
        document.addEventListener("DOMContentLoaded", function() {
          const images = document.querySelectorAll(".gallery img");

          const lightbox = document.createElement("div");
          lightbox.className = "lightbox";
          lightbox.id = "lightbox";
          lightbox.innerHTML = `
            <div class="lightbox-toolbar">
              <button type="button" class="autoplay" aria-label="Toggle autoplay">▶</button>
              <button type="button" class="zoom-in" aria-label="Zoom in">+</button>
              <button type="button" class="zoom-out" aria-label="Zoom out">-</button>
            </div>
            <button type="button" class="close" aria-label="Close">&times;</button>
            <button type="button" class="prev" aria-label="Previous image">&#10094;</button>
            <img id="lightbox-img" src="" alt="">
            <div class="lightbox-caption" id="lightbox-caption"></div>
            <button type="button" class="next" aria-label="Next image">&#10095;</button>
          `;
          document.body.appendChild(lightbox);

          const lightboxImg = lightbox.querySelector("#lightbox-img");
          const lightboxCaption = lightbox.querySelector("#lightbox-caption");
          const closeBtn = lightbox.querySelector(".close");
          const prevBtn = lightbox.querySelector(".prev");
          const nextBtn = lightbox.querySelector(".next");
          const zoomInBtn = lightbox.querySelector(".zoom-in");
          const zoomOutBtn = lightbox.querySelector(".zoom-out");
          const autoplayBtn = lightbox.querySelector(".autoplay");

          let currentIndex = 0;
          let zoomScale = 1;
          let autoplayTimer = null;

          function applyZoom() {
            lightboxImg.style.transform = `scale(${zoomScale})`;
          }

          function resetZoom() {
            zoomScale = 1;
            applyZoom();
          }

          function showImage() {
            lightboxImg.src = images[currentIndex].src;
            lightboxCaption.textContent = images[currentIndex].alt;
            resetZoom();
          }

          function openLightbox(index) {
            currentIndex = index;
            showImage();
            lightbox.style.display = "flex";
          }

          function stopAutoplay() {
            if (autoplayTimer) {
              clearInterval(autoplayTimer);
              autoplayTimer = null;
            }
            autoplayBtn.textContent = "▶";
          }

          function startAutoplay() {
            stopAutoplay();
            autoplayTimer = setInterval(() => {
              changeImage(1);
            }, 2500);
            autoplayBtn.textContent = "||";
          }

          function toggleAutoplay() {
            if (autoplayTimer) {
              stopAutoplay();
            } else {
              startAutoplay();
            }
          }

          function closeLightbox() {
            stopAutoplay();
            resetZoom();
            lightbox.style.display = "none";
          }

          function changeImage(direction) {
            currentIndex += direction;
            if (currentIndex < 0) currentIndex = images.length - 1;
            if (currentIndex >= images.length) currentIndex = 0;
            showImage();
          }

          function zoomIn() {
            zoomScale = Math.min(3, zoomScale + 0.25);
            applyZoom();
          }

          function zoomOut() {
            zoomScale = Math.max(0.5, zoomScale - 0.25);
            applyZoom();
          }

          images.forEach((img, index) => {
            img.addEventListener("click", () => openLightbox(index));
          });

          closeBtn.addEventListener("click", closeLightbox);
          prevBtn.addEventListener("click", () => changeImage(-1));
          nextBtn.addEventListener("click", () => changeImage(1));
          zoomInBtn.addEventListener("click", zoomIn);
          zoomOutBtn.addEventListener("click", zoomOut);
          autoplayBtn.addEventListener("click", toggleAutoplay);

          lightbox.addEventListener("click", (e) => {
            if (e.target === lightbox) {
              closeLightbox();
            }
          });

          document.addEventListener("keydown", (e) => {
            if (lightbox.style.display === "flex") {
              if (e.key === "ArrowLeft") changeImage(-1);
              if (e.key === "ArrowRight") changeImage(1);
              if (e.key === "Escape") closeLightbox();
              if (e.key === "+" || e.key === "=") zoomIn();
              if (e.key === "-" || e.key === "_") zoomOut();
              if (e.key === "a" || e.key === "A") toggleAutoplay();
            }
          });
        });
        </script>
    design:
      columns: '1'
title: Photos
type: landing
---
