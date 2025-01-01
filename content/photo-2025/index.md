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
          columns: 2;
          column-gap: 10px;
        }

        .image-container {
          position: relative;
          margin-bottom: 10px;
          break-inside: avoid;
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
            <img src="lab/lab-2024-12-19.jpg" alt="Dinner gathering with lab members" onclick="toggleZoom(this.parentElement)">
            <div class="caption">2024/12/19 Dinner gathering with lab members</div>
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


# ---
# date: "2024-12-22"
# sections:
# - block: markdown
#   id: photo
#   content:
#     title: 📸 Lab Photos 2024
#     subtitle: ''
#     text: |-
#     
#     <style>
#     .gallery {
#     display: flex;
#     flex-wrap: wrap;
#     gap: 10px;
#     }
#     .gallery img {
#     max-width: 48%;
#     cursor: pointer;
#     border: 1px solid #ddd;
#     border-radius: 4px;
#     }
#     .gallery img:hover {
#     border: 1px solid #000;
#     }
#     </style>
# 
#     <div class="gallery">
#     <a href="lab/lab-2024-12-19.jpg" target="_blank"><img src="lab/lab-2024-12-19.jpg" alt="Photo 1"></a>
#     <a href="lab/2024-11-19-editor-visiting.jpg" target="_blank"><img src="lab/2024-11-19-editor-visiting.jpg" alt="Photo 2"></a>
#     <a href="lab/2024-10-14-jingxiang-arrival.jpg" target="_blank"><img src="lab/2024-10-14-jingxiang-arrival.jpg" alt="Photo 3"></a>
#     <a href="lab/2024-5-21-first-day-in-office.jpg" target="_blank"><img src="lab/2024-5-21-first-day-in-office.jpg" alt="Photo 4"></a>
#     </div>
# 
# # 
# #       <hr>
# #       <figure>
# #       <center><img src="lab/lab-2024-12-19.jpg" alt="2024-12-19 lab dinner" width="60%"></center>
# #       <figcaption>12/19/2024: lab dinner</figcaption>
# #       </figure>
# #       
# #       <hr>
# #       <!-- figure2 -->
# #       <figure>
# #       <center><img src="lab/2024-11-19-editor-visiting.jpg" alt="mass-spec" width="60%"></center>
# #       <figcaption>11/19/2024: Editor visiting</figcaption>
# #       </figure>
# #     
# #       <hr>
# #       <!-- figure2 -->
# #       <figure>
# #       <center><img src="lab/2024-10-14-jingxiang-arrival.jpg" alt="mass-spec" width="60%"></center>
# #       <figcaption>10/14/2024: Jingxiang arrival</figcaption>
# #       </figure>
# #       
# #       <hr>
# #       <!-- figure3 -->
# #       <figure>
# #       <center><img src="lab/lab-dinner-2024-9-17.jpg" alt="mass-spec" width="60%"></center>
# #       <figcaption>9/17/2024: lab dinner</figcaption>
# #       </figure>
# #       
# #       <hr>
# #       <!-- figure4 -->
# #       <figure>
# #       <center><img src="lab/2024-5-21-first-day-in-office.jpg" alt="mass-spec" width="60%"></center>
# #       <figcaption>5/21/2024: first day in the office</figcaption>
# #       </figure>
# 
#   design:
#     columns: '1'
#     
# title: Photos
# type: landing
# ##https://www.labnol.org/embed/google/photos/
# ##https://www.publicalbum.org/blog/embedding-google-photos-albums
# ---






