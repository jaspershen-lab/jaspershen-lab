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
          column-count: 2;
          column-gap: 10px;
          column-fill: balance;  /* ✅ 尽量平衡两列 */
        }

        .image-container {
          position: relative;
          display: inline-block;
          margin-bottom: 10px;
          width: 100%;
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
        }

        .lightbox .close,
        .lightbox .prev,
        .lightbox .next {
          position: absolute;
          color: white;
          font-size: 30px;
          padding: 10px;
          cursor: pointer;
          user-select: none;
          z-index: 10000;
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

        <!-- Lightbox -->
        <div class="lightbox" id="lightbox">
          <span class="close" onclick="closeLightbox()">&times;</span>
          <span class="prev" onclick="changeImage(-1)">&#10094;</span>
          <img id="lightbox-img" src="">
          <div class="lightbox-caption" id="lightbox-caption"></div>
          <span class="next" onclick="changeImage(1)">&#10095;</span>
        </div>

        <script>
        document.addEventListener("DOMContentLoaded", function() {
          const images = document.querySelectorAll('.gallery img');
          const lightbox = document.getElementById('lightbox');
          const lightboxImg = document.getElementById('lightbox-img');
          const lightboxCaption = document.getElementById('lightbox-caption');
          let currentIndex = 0;

          images.forEach((img, index) => {
            img.addEventListener('click', () => {
              currentIndex = index;
              showImage();
              lightbox.style.display = 'flex';
            });
          });

          function showImage() {
            lightboxImg.src = images[currentIndex].src;
            lightboxCaption.textContent = images[currentIndex].alt;
          }

          window.closeLightbox = function() {
            lightbox.style.display = 'none';
          }

          window.changeImage = function(direction) {
            currentIndex += direction;
            if (currentIndex < 0) currentIndex = images.length - 1;
            if (currentIndex >= images.length) currentIndex = 0;
            showImage();
          }

          document.addEventListener('keydown', (e) => {
            if (lightbox.style.display === 'flex') {
              if (e.key === 'ArrowLeft') changeImage(-1);
              if (e.key === 'ArrowRight') changeImage(1);
              if (e.key === 'Escape') closeLightbox();
            }
          });
        });
        </script>
    design:
      columns: '1'
title: Photos
type: landing
---