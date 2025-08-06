---
date: "2024-12-22"
sections:
  - block: markdown
    id: photo
    content:
      title: 📸 Lab Photos 2025
      subtitle: ''
      text: |
        <style>
        .gallery {
          display: grid;
          grid-template-columns: repeat(2, 1fr); /* 两列 */
          gap: 10px; /* 图片之间的间距 */
        }

        .image-container {
          position: relative;
          display: block;
        }

        .image-container img {
          width: 100%;
          height: auto;
          cursor: pointer;
          border: 1px solid #ddd;
          border-radius: 4px;
          transition: transform 0.3s ease;
          display: block;
        }

        .image-container:hover img {
          border: 1px solid #000;
        }

        .image-container.zoomed img {
          transform: scale(2);
          z-index: 1000;
          position: relative;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .caption {
          display: none;
          position: absolute;
          bottom: 0;
          left: 0;
          right: 0;
          background: rgba(0, 0, 0, 0.7);
          color: white;
          padding: 8px;
          text-align: center;
          border-bottom-left-radius: 4px;
          border-bottom-right-radius: 4px;
        }

        .image-container:hover .caption {
          display: block;
        }

        .image-container.zoomed .caption {
          display: none;
        }

        @media (max-width: 768px) {
          .gallery {
            columns: 1;
          }
        }
        </style>

        <div class="gallery">

        <div class="image-container">
            <img src="lab/2025-8-5-lab-photo.jpg" alt="2025/8/5 Lab group photo" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/8/5 Lab group photo</div>
          </div>


        <div class="image-container">
            <img src="lab/2025-8-3-yifei-yuting.jpg" alt="2025/8/3 Dinner with lab members" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/8/3 Dinner with lab members</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-7-22-sundara.jpg" alt="2025/7/22 Sundara received the Koh Boon Hwee Scholars Award" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/7/22 Sundara received the Koh Boon Hwee Scholars Award</div>
          </div>


        <div class="image-container">
            <img src="lab/2025-7-11-guiyang.jpg" alt="2025/7/11 Xiaotao Presented at the 5th Environmental Exposure and Health International Symposium" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/7/11 Xiaotao Presented at the 5th Environmental Exposure and Health International Symposium</div>
          </div>


        <div class="image-container">
            <img src="lab/2025-7-2-xiaotao-fudan.jpg" alt="2025/7/2 Visiting Fudan University" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/7/2 Visiting Fudan University</div>
          </div>


        <div class="image-container">
            <img src="lab/2025-6-5-ASMS2.jpeg" alt="2025/6/5 Dr. Xiaota Shen presented at ASMS2025 USA" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/6/5 Dr. Xiaota Shen presented at ASMS2025 USA</div>
          </div>
        
        <div class="image-container">
            <img src="lab/2025-6-5-ASMS1.jpeg" alt="2025/6/5 Dr. Xiaota Shen presented at ASMS2025 USA" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/6/5 Dr. Xiaota Shen presented at ASMS2025 USA</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-5-19-new member Chloe.jpeg" alt="2025/5/19 new member Chloe" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/5/19 new member Chloe</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-5-14-Sundara.jpg" alt="2025/5/14 Sundara presentation" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/5/14 Sundara presentation</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-5-11-Jingxiang presentation1.jpg" alt="2025/5/11 Jingxiang presentation" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/5/11 Jingxiang presentation</div>
          </div>
          
        <div class="image-container">
            <img src="lab/2025-5-11-Jingxiang presentation2.jpg" alt="2025/5/11 Jingxiang presentation" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/5/11 Jingxiang presentation</div>
          </div>
          
        <div class="image-container">
            <img src="lab/2025-5-11-Jingxiang presentation3.jpg" alt="2025/5/11 Jingxiang presentation" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/5/11 Jingxiang presentation</div>
          </div>
          
        <div class="image-container">
            <img src="lab/2025-5-10-lab-lunch.jpeg" alt="2025/5/10 lab lunch for Dr. Fen Pan" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/5/10 lab lunch for Dr. Fen Pan</div>
          </div>
          
        <div class="image-container">
            <img src="lab/2025-5-8-Yifei-presentation.jpg" alt="2025/5/18 Yifei presentation" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025-5-8-Yifei-presentation.jpg</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-4-30-jinzhuo-wang-visit-ntu-2.jpeg" alt="2025/4/30 Dr. Jinzhuo Wang from PKU visited NTU" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/4/30 Dr. Jinzhuo Wang from PKU visited NTU</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-4-30-jinzhuo-wang-visit-ntu-1.jpeg" alt="2025/4/30 Dr. Jinzhuo Wang from PKU visited NTU" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/4/30 Dr. Jinzhuo Wang from PKU visited NTU</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-4-24-xiaotao-visit-sjtu-fudan-2.jpeg" alt="2025/4/24 Xiaotao visited Fudan University" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/4/24 Xiaotao visited Fudan University</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-4-24-xiaotao-visit-sjtu-fudan-1.jpeg" alt="2025/4/24 Xiaotao visited Shanghai Jiaotong University" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/4/24 Xiaotao visited Shanghai Jiaotong University</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-3-27-mike-spc.jpg" alt="2025/3/27 Mike visited SPC" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/3/27 Mike visited SPC</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-3-27-mike-shen-lab.jpg" alt="2025/3/27 Mike visited Shen lab" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/3/27 Mike visited Shen lab</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-3-26-fireside chat with mike.jpg" alt="2025/3/26 Fireside chat with Mike" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/3/26 Fireside chat with Mike</div>
          </div>

        <div class="image-container">
            <img src="lab/2025-3-21-SPC.jpeg" alt="2025/3/21 SPC" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/3/21 SPC</div>
          </div>
          
        <div class="image-container">
            <img src="lab/2025-3-19-metanotitia-visited-spc.jpeg" alt="2025/3/19 Metanotitia visited SPC" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/3/19 Metanotitia visited SPC</div>
          </div>
          
        
        <div class="image-container">
            <img src="lab/2025-3-7-Dr. Fen Pan-arrival.jpeg" alt="2025/3/7 Dr. Fen Pan arrival" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/3/7 Dr. Fen Pan arrival</div>
          </div>
        
        <div class="image-container">
            <img src="lab/2024-2-14-welcome-dr.shaoguang-li.jpg" alt="2025/2/14 Lab dinner for Prof. Shaoguang Li" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/2/14 Lab dinner for Prof. Shaoguang Li</div>
          </div>
        
          <div class="image-container">
            <img src="lab/2025-1-24-lab-lunch.jpg" alt="2025/1/24 Lab lunch for Chinese New Year" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/1/24 Lab lunch for Chinese New Year</div>
          </div>
        
          <div class="image-container">
            <img src="lab/2025-1-14-first-lab-meeting.jpeg" alt="2025/1/15 First lab meeting" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/1/15 First lab meeting</div>
          </div>
        
          <div class="image-container">
            <img src="lab/2025-1-14-lab.jpeg" alt="2025/1/15 First lab photo" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2025/1/15 First lab photo</div>
          </div>
          
        </div>

        <script>
        // Keep track of currently zoomed container
        let zoomedContainer = null;

        function toggleZoom(container) {
          // If this container is already zoomed, unzoom it
          if (container.classList.contains('zoomed')) {
            container.classList.remove('zoomed');
            zoomedContainer = null;
          } else {
            // If another container is zoomed, unzoom it first
            if (zoomedContainer) {
              zoomedContainer.classList.remove('zoomed');
            }
            // Zoom this container
            container.classList.add('zoomed');
            zoomedContainer = container;
          }
        }

        // Add ESC key listener
        document.addEventListener('keydown', function(event) {
          if (event.key === 'Escape' && zoomedContainer) {
            zoomedContainer.classList.remove('zoomed');
            zoomedContainer = null;
          }
        });
        </script>
    design:
      columns: '1'
title: Photos
type: landing
---

