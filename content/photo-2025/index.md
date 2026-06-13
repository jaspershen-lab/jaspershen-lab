---
date: "2025-01-01"
sections:
  - block: markdown
    id: photo
    content:
      title: 📸 Lab Photos 2025
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
          <img src="lab/2025-8-5-lab-photo.jpg" alt="2025 Shen Lab featured moment">
          <div class="photo-spotlight__content">
            <p class="photo-spotlight__eyebrow">Featured Moment</p>
            <h2>2025 Lab Life</h2>
            <p>Lab milestones, conferences, dinners, visitors, farewells, and the daily life behind the science.</p>
          </div>
        </section>

        <!-- December -->
        <div class="month-block">
          <div class="month-title">December 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-12-20-lab dinner.jpg" alt="2025/12/19 lab dinner"><div class="caption">2025/12/19 lab dinner</div></div>
            <div class="image-container"><img src="lab/2025-12-8-conference-yifei.jpg" alt="2025/12/8 Singapore Science Conference Yifei"><div class="caption">2025/12/8 Singapore Science Conference Yifei</div></div>
            <div class="image-container"><img src="lab/2025-12-8-conference-yijiang.jpg" alt="2025/12/8 Singapore Science Conference Yijiang"><div class="caption">2025/12/8 Singapore Science Conference Yijiang</div></div>
            <div class="image-container"><img src="lab/2025-12-8-conference-yijiang-yifei-jingxiang.jpg" alt="2025/12/8 Singapore Science Conference Shen lab"><div class="caption">2025/12/8 Singapore Science Conference Shen lab</div></div>
          </div>
        </div>
        
        <!-- November -->
        <div class="month-block">
          <div class="month-title">November 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-11-29-yifei and chloe.jpg" alt="2025/11/29 Yifei and Chloe"><div class="caption">2025/11/29 Yifei and Chloe</div></div>
          </div>
        </div>
        
        <!-- October -->
        <div class="month-block">
          <div class="month-title">October 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-10-1-jian xu.jpg" alt="2025/10/1 Prof. Jian XU visited SPC"><div class="caption">2025/10/1 Prof. Jian XU visited SPC</div></div>
          </div>
        </div>

        <!-- September -->
        <div class="month-block">
          <div class="month-title">September 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-9-27-shenyang-xiaotao.jpg" alt="2025/9/27 Xiaotao Presentation in Shenyang"><div class="caption">2025/9/27 Xiaotao Presentation in Shenyang</div></div>
            <div class="image-container"><img src="lab/2025-9-25-toiber.jpg" alt="2025/9/25 Prof. Debra Toiber from Ben-Gurion University"><div class="caption">2025/9/25 Prof. Debra Toiber from Ben-Gurion University</div></div>
            <div class="image-container"><img src="lab/2025-9-19-lab-dinner.jpg" alt="2025/9/19 lab dinner"><div class="caption">2025/9/19 lab dinner</div></div>
            <div class="image-container"><img src="lab/2025-9-12-hkbu.jpeg" alt="2025/9/12 Xiaotao gave a invited talk at HKBU"><div class="caption">2025/9/12 Xiaotao gave a invited talk at HKBU</div></div>
            <div class="image-container"><img src="lab/2025-9-8-DISCOVERY & DEVELOPMENT SUMMIT ASIA1.jpg" alt="2025/9/9 Shen lab at DISCOVERY & DEVELOPMENT SUMMIT ASIA"><div class="caption">2025/9/9 Shen lab at DISCOVERY & DEVELOPMENT SUMMIT ASIA</div></div>
            <div class="image-container"><img src="lab/2025-9-8-DISCOVERY & DEVELOPMENT SUMMIT ASIA2.jpg" alt="2025/9/10 Xiaotao's presentation at DISCOVERY & DEVELOPMENT SUMMIT ASIA"><div class="caption">2025/9/10 Xiaotao's presentation at DISCOVERY & DEVELOPMENT SUMMIT ASIA</div></div>
            <div class="image-container"><img src="lab/2025-9-8-DISCOVERY & DEVELOPMENT SUMMIT ASIA3.jpg" alt="2025/9/10 Yifei's presentation at DISCOVERY & DEVELOPMENT SUMMIT ASIA"><div class="caption">2025/9/10 Yifei's presentation at DISCOVERY & DEVELOPMENT SUMMIT ASIA</div></div>
          </div>
        </div>

        <!-- 8月 -->
        <div class="month-block">
          <div class="month-title">August 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-8-shenyu-farewell2.jpg" alt="2025/8 Shenyu Wang farewell"><div class="caption">2025/8 Shenyu Wang farewell</div></div>
            <div class="image-container"><img src="lab/2025-8-zijing-farewell2.jpg" alt="2025/8 Zjing Du farewell"><div class="caption">2025/8 Zjing Du farewell</div></div>
            <div class="image-container"><img src="lab/2025-8-ke-farewell.jpg" alt="2025/8 Ke Pang farewell"><div class="caption">2025/8 Ke Pang farewell</div></div>
            <div class="image-container"><img src="lab/2025-8-15-lab-dinner.jpg" alt="2025/8/15 Lab dinner"><div class="caption">2025/8/15 Lab dinner</div></div>
            <div class="image-container"><img src="lab/2025-8-5-lab-photo.jpg" alt="2025/8/5 Lab group photo"><div class="caption">2025/8/5 Lab group photo</div></div>
            <div class="image-container"><img src="lab/2025-8-3-yifei-yuting.jpg" alt="2025/8/3 Dinner with lab members"><div class="caption">2025/8/3 Dinner with lab members</div></div>
          </div>
        </div>

        <!-- June - July -->
        <div class="month-block">
          <div class="month-title">June - July 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-7-22-sundara.jpg" alt="2025/7/22 Sundara received the Koh Boon Hwee Scholars Award"><div class="caption">2025/7/22 Sundara received the Koh Boon Hwee Scholars Award</div></div>
            <div class="image-container"><img src="lab/2025-7-11-guiyang.jpg" alt="2025/7/11 Xiaotao presented at the 5th Environmental Exposure and Health International Symposium"><div class="caption">2025/7/11 Xiaotao presented at the 5th Environmental Exposure and Health International Symposium</div></div>
            <div class="image-container"><img src="lab/2025-7-2-yijiang-presentation.jpg" alt="2025/7/2 Yijiang's presentation"><div class="caption">2025/7/2 Yijiang's presentation</div></div>
            <div class="image-container"><img src="lab/2025-7-2-xiaotao-fudan.jpg" alt="2025/7/2 Visiting Fudan University"><div class="caption">2025/7/2 Visiting Fudan University</div></div>
            <div class="image-container"><img src="lab/2025-6-5-ASMS1.jpeg" alt="2025/6/5 Dr. Xiaotao Shen presented at ASMS2025 USA"><div class="caption">2025/6/5 Dr. Xiaotao Shen presented at ASMS2025 USA</div></div>
          </div>
        </div>

        <!-- 5月 -->
        <div class="month-block">
          <div class="month-title">May 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-5-19-new member Chloe.jpeg" alt="2025/5/19 New member Chloe"><div class="caption">2025/5/19 New member Chloe</div></div>
            <div class="image-container"><img src="lab/2025-5-14-Sundara.jpg" alt="2025/5/14 Sundara presentation"><div class="caption">2025/5/14 Sundara presentation</div></div>
            <div class="image-container"><img src="lab/2025-5-11-Jingxiang presentation1.jpg" alt="2025/5/11 Jingxiang presentation"><div class="caption">2025/5/11 Jingxiang presentation</div></div>
            <div class="image-container"><img src="lab/2025-5-11-Jingxiang presentation2.jpg" alt="2025/5/11 Jingxiang presentation"><div class="caption">2025/5/11 Jingxiang presentation</div></div>
            <div class="image-container"><img src="lab/2025-5-11-Jingxiang presentation3.jpg" alt="2025/5/11 Jingxiang presentation"><div class="caption">2025/5/11 Jingxiang presentation</div></div>
            <div class="image-container"><img src="lab/2025-5-10-lab-lunch.jpeg" alt="2025/5/10 Lab lunch for Dr. Fen Pan"><div class="caption">2025/5/10 Lab lunch for Dr. Fen Pan</div></div>
            <div class="image-container"><img src="lab/2025-5-8-Yifei-presentation.jpg" alt="2025/5/8 Yifei presentation"><div class="caption">2025/5/8 Yifei presentation</div></div>
          </div>
        </div>

        <!-- 4月 -->
        <div class="month-block">
          <div class="month-title">April 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-4-30-jinzhuo-wang-visit-ntu-2.jpeg" alt="2025/4/30 Dr. Jinzhuo Wang from PKU visited NTU"><div class="caption">2025/4/30 Dr. Jinzhuo Wang from PKU visited NTU</div></div>
            <div class="image-container"><img src="lab/2025-4-30-jinzhuo-wang-visit-ntu-1.jpeg" alt="2025/4/30 Dr. Jinzhuo Wang from PKU visited NTU"><div class="caption">2025/4/30 Dr. Jinzhuo Wang from PKU visited NTU</div></div>
            <div class="image-container"><img src="lab/2025-4-24-xiaotao-visit-sjtu-fudan-2.jpeg" alt="2025/4/24 Xiaotao visited Fudan University"><div class="caption">2025/4/24 Xiaotao visited Fudan University</div></div>
            <div class="image-container"><img src="lab/2025-4-24-xiaotao-visit-sjtu-fudan-1.jpeg" alt="2025/4/24 Xiaotao visited Shanghai Jiaotong University"><div class="caption">2025/4/24 Xiaotao visited Shanghai Jiaotong University</div></div>
          </div>
        </div>

        <!-- 3月 -->
        <div class="month-block">
          <div class="month-title">March 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-3-27-mike-spc.jpg" alt="2025/3/27 Mike visited SPC"><div class="caption">2025/3/27 Mike visited SPC</div></div>
            <div class="image-container"><img src="lab/2025-3-27-mike-shen-lab.jpg" alt="2025/3/27 Mike visited Shen lab"><div class="caption">2025/3/27 Mike visited Shen lab</div></div>
            <div class="image-container"><img src="lab/2025-3-26-fireside chat with mike.jpg" alt="2025/3/26 Fireside chat with Mike"><div class="caption">2025/3/26 Fireside chat with Mike</div></div>
            <div class="image-container"><img src="lab/2025-3-21-SPC.jpeg" alt="2025/3/21 SPC"><div class="caption">2025/3/21 SPC</div></div>
            <div class="image-container"><img src="lab/2025-3-19-metanotitia-visited-spc.jpeg" alt="2025/3/19 Metanotitia visited SPC"><div class="caption">2025/3/19 Metanotitia visited SPC</div></div>
            <div class="image-container"><img src="lab/2025-3-7-Dr. Fen Pan-arrival.jpeg" alt="2025/3/7 Dr. Fen Pan arrival"><div class="caption">2025/3/7 Dr. Fen Pan arrival</div></div>
          </div>
        </div>

        <!-- 1月 -->
        <div class="month-block">
          <div class="month-title">January- February 2025</div>
          <div class="gallery">
            <div class="image-container"><img src="lab/2025-2-14-welcome-dr.shaoguang-li.jpg" alt="2025/2/14 Lab dinner for Prof. Shaoguang Li"><div class="caption">2025/2/14 Lab dinner for Prof. Shaoguang Li</div></div>
            <div class="image-container"><img src="lab/2025-1-24-lab-lunch.jpg" alt="2025/1/24 Lab lunch for Chinese New Year"><div class="caption">2025/1/24 Lab lunch for Chinese New Year</div></div>
            <div class="image-container"><img src="lab/2025-1-14-first-lab-meeting.jpeg" alt="2025/1/15 First lab meeting"><div class="caption">2025/1/15 First lab meeting</div></div>
            <div class="image-container"><img src="lab/2025-1-14-lab.jpeg" alt="2025/1/15 First lab photo"><div class="caption">2025/1/15 First lab photo</div></div>
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
