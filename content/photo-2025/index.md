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