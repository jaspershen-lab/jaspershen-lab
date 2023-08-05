---
date: "2022-10-24"
image:
  placement: 1
  caption: ""
  focal_point: "Center"
  preview_only: false
  alt_text: 
  filename: coders.jpg
sections:
- block: people
  content:
    sort_ascending: true
    sort_by: Params.last_name
    title: 👥 Meet the Team
    user_groups:
    - Principal Investigators
    - Researchers
    - Grad Students
    - Administration
    - Visitors
    - Alumni
  design:
    show_interests: true
    show_role: true
    show_social: true
    show_organizations: true
    
- block: markdown
  content:
    title: Alumni Summary
    text: |-
      <iframe width='100%' height='700' src="https://docs.google.com/spreadsheets/d/1SdmT8HUF7bNdddzfAxXsrrzuBBv8nMmyn15Hm-3d650/edit?usp=sharing"></iframe>
      
  design:
    columns: '1'
    
- block: markdown
  content:
    title:
    subtitle: ''
    text:
  design:
    columns: '1'
    background:
      image: 
        filename: team.jpg
        filters:
          brightness: 1
        parallax: false
        position: center
        size: cover
        text_color_light: true
    spacing:
      padding: ['20px', '0', '20px', '0']
    css_class: fullscreen
    
title: People
type: landing
---
