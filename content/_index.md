---
date: "2023-11-01"
title: null
type: landing
sections:
- block: slider
  content:
    slides:
    - align: center
      background:
        color: '#666'
        image:
          filename: multi-omics4.jpg
          filters:
            brightness: 0.7
        position: right
      content: Multi-Omics for Health
      link:
        icon: flask
        icon_pack: fas
        text: Our Research
        url: ../research/
      title: "👋 Welcome to Shen's group@NTU Singapore 👋"
    - align: center
      background:
        color: '#333'
        image:
          filename: group_photo2.jpg
          filters:
            brightness: 0.8
        position: center
      content: We Welcome You to Join Us!
      link:
        icon: graduation-cap
        icon_pack: fas
        text: Meet Our Team
        url: ../team/
      title: 🌍 Meet Our Group Members 🌍
    - align: center
      background:
        color: '#555'
        image:
          filename: contact2.jpg
          filters:
            brightness: 0.8
        position: center
      content: Please Reach Out Us!
      link:
        # icon: graduation-cap
        # icon_pack: fas
        text: 📨 Contact Us
        url: ../contact/
      title: ☕️ Talking and Collaboration ☕️
      
  design:
    interval: 5000
    is_fullscreen: true
    loop: true
    slide_height: ""

- block: hero
  content:
    title: Opportunities
    image:
      filename: join_us2.jpg
    text: |
      <br>

      We are excited to announce multiple openings at Shen Lab, Nanyang Technological University, for passionate and dedicated researchers. Our team is at the forefront of multi-omics research, focusing on innovative algorithm and method development for the integration of multi-omics data, particularly in the areas of microbiome and metabolome, and their impact on human health. 
      Positions Available are PhD Students, Postdoctoral Researchers, Research Assistants, and Lab Manager.
      {{% cta cta_link="./news/2023-11-23-recruitment/" cta_text="More information →" %}}

# - block: about.avatar
#   id: about
#   content:
#     # Choose a user profile to display (a folder name within `content/authors/`)
#     username: admin
#     # Override your profile text from `authors/admin/_index.md`?
#     text: The **Shen Lab** has been a center of excellence for Artificial Intelligence research, teaching, and practice since its founding in 2024.

# - block: features
#   id: research
#   content:
#     title: 🔬 Research 
#     # text: |-
#     #   {{% callout note %}}
#     #   [Detailed Research](./research/).
#     #   {{% /callout %}}
#     align: left
#     items:
#       - name: "[Metabolomics](https://en.wikipedia.org/wiki/Metabolomics)"
#         description: 
#         icon: ":computer:"
#         icon_pack: emoji
#       - name: "[Microbiome](https://en.wikipedia.org/wiki/Microbiome)"
#         description: 
#         icon: ":microbe:"
#         icon_pack: emoji
#       - name: "[Wearable](https://pubmed.ncbi.nlm.nih.gov/31021744/)"
#         description: 
#         icon: ":watch:"
#         icon_pack: emoji
#       - name: '[Precision medicine](https://snyderlab.stanford.edu/)'
#         description: 
#         icon: ":dna:"
#         icon_pack: emoji
#       - name: "[Aging](https://en.wikipedia.org/wiki/Ageing)"
#         description: 
#         icon: ":person_white_hair:"
#         icon_pack: emoji
#       - name: "[Pregnancy](https://pubmed.ncbi.nlm.nih.gov/31969484/)"
#         description:
#         icon: ":pregnant_woman:"
#         icon_pack: emoji
#     filters:
#       folders:
#         - research
#     subtitle: ":point_right: [Detailed Research](./research/)"
#   design:
#     # Choose how many columns the section has. Valid values: '1' or '2'.
#     columns: '1'
#     background:
#       image:
#         filename: research.jpg
#         filters:
#           brightness: 0.4
#       #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
#       size: cover
#       # Image focal point. Options include `left`, `center` (default), or `right`.
#       position: center
#       # Use a fun parallax-like fixed background effect on desktop? true/false
#       parallax: true
#       # Text color (true=light, false=dark, or remove for the dynamic theme color).
#       text_color_light: true

- block: collection
  id: research
  content:
    title: 🔬 Research
    subtitle: ":point_right: [Detailed Research](./research/)"
    text: "Our research is focused on the development of computational methods for the analysis of multi-omics data, with a particular emphasis on metabolomics and microbiome data. We are also interested in the application of these methods to precision medicine, aging, pregnancy, and other health-related areas."
    count: 100
    filters:
      author: ""
      category: ""
      exclude_featured: false
      publication_type: ""
      tag: ""
    offset: 0
    order: desc
    filters:
      folders:
        - research_brief
  design:
    columns: "1"
    view: community/showcase2
    
- block: portfolio
  id: software
  content:
    title: 🖥️ Software
    # subtitle: ":point_right: [All Software](./all_software/)"
    text: ""
    buttons:
    - name: All
      tag: '*'
    - name: Metabolomics
      tag: Metabolomics
    - name: Multi-omics
      tag: Multi-omics
    - name: Others
      tag: Others
    default_button_index: 0
    filters:
      folders:
        - software
  design:
    columns: "2"
    flip_alt_rows: false
    view: community/compact4
    background:
      video:
      # Name of video in `assets/media/`.
        # filename: pexels_videos_2699 (1080p).mp4
        filters:
          # brightness: 0.5
      # image: 
      #   filename: coding.mp4
      #   filters:
      #     brightness: 0.5
      #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
      # size: cover
      # Image focal point. Options include `left`, `center` (default), or `right`.
      # position: center
      # Use a fun parallax-like fixed background effect on desktop? true/false
      parallax: true
      # Text color (true=light, false=dark, or remove for the dynamic theme color).
      # text_color_light: false
    
- block: collection
  id: publication
  content:
    count: 5
    title: 📃 Recent Publications 
    subtitle: ":point_right: [All Publications](./publication/)"
    text: 
    filters:
      folders:
        - publication
      exclude_featured: false
  design:
    columns: '1'
    view: compact
    
- block: collection
  id: news
  content:
    count: 10
    filters:
      folders:
        - news
      exclude_featured: false
    offset: 0
    order: desc
    subtitle: ":point_right: [All News](./news/)"
    title: 📰 Latest News
    text: 
  design:
    columns: "2"
    view: list
    background:
      image:
        filename: news.jpg
        filters:
          brightness: 0.5
      #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
      size: cover
      # Image focal point. Options include `left`, `center` (default), or `right`.
      position: center
      # Use a fun parallax-like fixed background effect on desktop? true/false
      parallax: true
      # Text color (true=light, false=dark, or remove for the dynamic theme color).
      text_color_light: true

- block: people
  id: team
  content:
    sort_ascending: true
    sort_by: Params.last_name
    title: 👥 Team
    subtitle: ":point_right: [All Team Members](./team/)"
    # text: |-
    #   {{% callout note %}}
    #   [All team members](./team/).
    #   {{% /callout %}}
    user_groups:
    - Principal Investigator
    - Researchers
    - Students
  design:
    show_interests: false
    show_role: true
    show_social: true
    
- block: collection
  id: event
  content:
    count: 3
    title: 🎫 Recent Events
    subtitle: ":point_right: [All Events](./event/)"
    text: 
    filters:
      folders:
        - event
      exclude_featured: false
  design:
    columns: '2'
    view: compact
    background:
      image:
        filename: events.jpg
        filters:
          brightness: 0.55
      #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
      size: cover
      # Image focal point. Options include `left`, `center` (default), or `right`.
      position: center
      # Use a fun parallax-like fixed background effect on desktop? true/false
      parallax: true
      # Text color (true=light, false=dark, or remove for the dynamic theme color).
      text_color_light: true

- block: contact
  id: contact
  content:
    title: 📨 Contact
    # subtitle: ":point_right: [More social media](./contact/)"
    text: 
    # Contact (add or remove contact options as necessary)
    email: shenxt1990@outlook.com
    phone: +1 571-267-9283
    # appointment_url: 'https://calendly.com'
    address:
      street: 3165 Porter Drive
      city: Stanford
      region: CA
      postcode: '94304'
      country: United States
      country_code: US
    # office_hours:
    #   - 'Weekdays 9:00 to 18:00'
    contact_links:
      # - icon: video
      #   icon_pack: fas
      #   name: Zoom Me
      #   link: 'https://zoom.com'
      - icon: weixin
        icon_pack: fab
        name: Follow us on WeChat
        link: 'https://jaspershen.github.io/image/wechat_QR.jpg'
      - icon: twitter
        icon_pack: fab
        name: Follow us on Twitter
        link: https://twitter.com/xiaotaoshen1990
      - icon: github
        icon_pack: fab
        name: Follow us on Github
        link: https://github.com/jaspershen-lab
    # Automatically link email and phone or display as text?
    autolink: true
    # Email form provider
    form:
      formspree:
        id: xpzgpjby
      netlify:
        captcha: false
      provider: formspree
      netlify:
        # Enable CAPTCHA challenge to reduce spam?
        captcha: false
      # Coordinates to display a map - set your map provider in `params.yaml`
      coordinates:
        latitude: '37.4275'
        longitude: '-122.1697'
  design:
    columns: '2'

# - block: markdown
#   content:
#     title: 🌍 Address
#     subtitle: 👉 450 Serra Mall, CA 94304, USA
#     text: |-
#       <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3169.204215852551!2d-122.15243152416453!3d37.408647733166056!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fba9668905241%3A0x12fb78358a01dfe9!2s3165%20Porter%20Dr%2C%20Palo%20Alto%2C%20CA%2094304!5e0!3m2!1sen!2sus!4v1691293034620!5m2!1sen!2sus" width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
#   design:
#     columns: '2'

# - block: markdown
#   id: github
#   content:
#     title: 😺 GitHub
#     subtitle: ":point_right: [GitHub Link](https://github.com/jaspershen-lab2)"
#     text: |-
#       <img src="http://ghchart.rshah.org/jaspershen" alt="jaspershen-lab" width = "100%"/>
#   design:
#     columns: '2'
#     background:
#       image: 
#         filename: github.jpg
#         filters:
#           brightness: 1
#       #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
#       size: cover
#       # Image focal point. Options include `left`, `center` (default), or `right`.
#       position: center
#       # Use a fun parallax-like fixed background effect on desktop? true/false
#       parallax: true
#       # Text color (true=light, false=dark, or remove for the dynamic theme color).
#       text_color_light: true

# - block: markdown
#   id: twitter
#   content:
#     title: 🐦 Twitter
#     subtitle: ''
#     text: |-
#       <a class="twitter-timeline" data-height="800" href="https://twitter.com/elonmusk?ref_src=twsrc%5Etfw">Tweets by elonmusk</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
#   design:
#     columns: '2'

- block: markdown
  id: photo
  content:
    title: 📸 Lab Photos
    subtitle: ':point_right: [More Photos](./photo/)'
    text: |-
      <script src="https://cdn.jsdelivr.net/npm/publicalbum@latest/embed-ui.min.js" async></script>
      <div class="pa-carousel-widget" style="width:100%; height:480px; display:none;"
      data-link="https://photos.app.goo.gl/1cFFZCA5wH4xzbTN8"
      data-title="Lab Photos"
      data-description="7 new items added to shared album"
      data-delay="2">
      <object data="https://lh3.googleusercontent.com/pw/AIL4fc9AuciX07C5ZrdmrGK6U1aDCox1BVvbgRrZuQxvG6Wuq4mlEDKnQrUnWaXElgZpnApWze97-fQWZoTMhXhXw3u8f3oTeU72IgzcrOgOelhLw1_-dok=w1920-h1080"></object>
      <object data="https://lh3.googleusercontent.com/pw/AIL4fc9Z5PSe4PWAGbmVLY3cqf9qeEsmK89Hfrh6q9spaCh36OJbAmqucLv3Jed1t3axEbMky6Ya1lbxRjUt2vDZZo7CDaJn-8IBYr5IlVcPWaM8yszyCB4=w1920-h1080"></object>
      <object data="https://lh3.googleusercontent.com/pw/AIL4fc_UUcx9DBLYnuBE7nkJijtBNdQxZoDWgPofSnGKhZ8GV1kpMdyhMz1o6I7dMwNIdOrMRNQ9bXeb-qP0BctZYABIRkr_6JR2vPhhlr4CBxuSyz_UFJ8=w1920-h1080"></object>
      <object data="https://lh3.googleusercontent.com/pw/AIL4fc8Pufc0dixWvcKANuGXRd-fAmaLKx3bI_u6FinktowRQKYrQDvvw4lDarWJmGW0FEZixX5GGSHZwZkMHM-WbUca1TEq_him1qtgGD--DgDj-q5Xysw=w1920-h1080"></object>
      <object data="https://lh3.googleusercontent.com/pw/AIL4fc92I-weyQms7TxE0v0n-UnSBMBPjMJOoLbrN_1_BhoPiUuH-6GN5hg1rgNdy7jWFHn9gUQEcYbfiA0y7NQzjCQfnCBCjKSuVOPejKqELkTdfhPeoX0=w1920-h1080"></object>
      <object data="https://lh3.googleusercontent.com/pw/AIL4fc-m-RnvEYxhusGLkJ7SisSL06Z_knrqOSWiIC-16rhwdbENyIYfX_jRYrVBz1E7iX1j-UlST5wRdHjzJXioa7DPkCJbCqr--fiZYU659gEGquDMvHI=w1920-h1080"></object>
      <object data="https://lh3.googleusercontent.com/pw/AIL4fc__Vz74-iENbiuia2rVFypIYHR02nx0L9fpn1QsZ4LIlKv-1o1aSdA4KE2NnLiubSmdpOf1qtjt7jKuAGClbTkazddSK3aWTS36JAN7HEijs_Un_NY=w1920-h1080"></object>
      </div>
#     # text: '{{< gallery album="lab" >}}'
#     text: '<iframe src="https://photos.app.goo.gl/1cFFZCA5wH4xzbTN8" width="100%" height="500" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
# '
#   design:
#     columns: '1'


- block: tag_cloud
  content:
    title: ""
  design:
    columns: '1'
    background:
      video:
        filename: tags_background.mp4
        filters:
          brightness: 1
      #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
      size: cover
      # Image focal point. Options include `left`, `center` (default), or `right`.
      position: center
      # Use a fun parallax-like fixed background effect on desktop? true/false
      parallax: true
      # Text color (true=light, false=dark, or remove for the dynamic theme color).
      text_color_light: true
---
