---
date: "2026-01-01"
sections:
  - block: markdown
    id: photo
    content:
      title: 📸 Lab Photos 2026
      subtitle: ''
      text: |
        <style>
        .month-block {
          margin-bottom: 40px;
        }

        .month-title {
          font-size: 20px;
          font-weight: bold;
          margin: 20px 0 10px 0;
          border-bottom: 2px solid #ccc;
          padding-bottom: 5px;
          text-align: center;   /* ✅ 居中 */
        }

        .gallery {
          column-count: 3;
          column-gap: 10px;
          column-fill: balance;
        }

        .image-container {
          position: relative;
          display: inline-block;
          margin-bottom: 10px;
          width: 100%;
          break-inside: avoid;
          -webkit-column-break-inside: avoid;
          page-break-inside: avoid;
        }

        .image-container img {
          width: 100%;
          height: auto;
          border-radius: 6px;
          cursor: pointer;
          transition: transform 0.3s ease;
        }

        .image-container:hover img {
          transform: scale(1.02);
        }

        .caption {
          position: absolute;
          bottom: 0;
          left: 0;
          right: 0;
          background: rgba(0,0,0,0.6);
          color: #fff;
          padding: 6px;
          text-align: center;
          font-size: 14px;
          display: none;
        }

        .image-container:hover .caption {
          display: block;
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
          .gallery {
            column-count: 1; /* 手机端单列 */
          }
        }
        </style>


        <!-- 1月 -->
        <div class="month-block">
          <div class="month-title">January- February 2026</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2026-1-22-Prof. Jun Xia.jpeg" alt="2026/1/22 Prof. Jun Xia (HKUST Guangzhou) visit lab"><div class="caption">2026/1/22 Prof. Jun Xia (HKUST Guangzhou) visit lab</div></div>
            <div class="image-container"><img src="lab/2026-1-13-Neena Modi.jpeg" alt="2026/1/13 Prof. Neena Modi (Imperial) visit lab"><div class="caption">2026/1/13 Prof. Neena Modi (Imperial) visit lab</div></div>
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
