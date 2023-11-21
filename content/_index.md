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
          filename: multi-omics.jpg
          filters:
            brightness: 0.8
        position: right
      content: Learn more about what we're working on...
      link:
        icon: flask
        icon_pack: fas
        text: Our research
        url: ../research/
      title: "👋 Welcome to Shen's group@NTU 👋"
    - align: left
      background:
        color: '#333'
        image:
          filename: group_photo.jpg
          filters:
            brightness: 0.8
        position: center
      content: Omics and Health!
      link:
        icon: graduation-cap
        icon_pack: fas
        text: Join us
        url: ../contact/
      title: The Omics for Health
    - align: left
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
        text: 📨 Contact us
        url: ../contact/
      title: ☕️ Talking and Learning ☕️
      
  design:
    interval: 5000
    is_fullscreen: true
    loop: true
    slide_height: ""

- block: hero
  content:
    image:
      filename: join_us.jpg
    text: |
      <br>

      Dr. Jasper Shen is eager to recruit several Ph.D. students and postdocs who share her enthusiasm for advancing the frontiers of knowledge. 
      {{% cta cta_link="./people/" cta_text="Join US →" %}}
    title: |
      Opportunities

# - block: about.avatar
#   id: about
#   content:
#     # Choose a user profile to display (a folder name within `content/authors/`)
#     username: admin
#     # Override your profile text from `authors/admin/_index.md`?
#     text: The **Shen Lab** has been a center of excellence for Artificial Intelligence research, teaching, and practice since its founding in 2024.

- block: features
  id: research
  content:
    title: 🔬 Research 
    # text: |-
    #   {{% callout note %}}
    #   [Detailed Research](./research/).
    #   {{% /callout %}}
    align: left
    items:
      - name: "[Metabolomics](https://en.wikipedia.org/wiki/Metabolomics)"
        description: 
        icon: ":computer:"
        icon_pack: emoji
      - name: "[Microbiome](https://en.wikipedia.org/wiki/Microbiome)"
        description: 
        icon: ":microbe:"
        icon_pack: emoji
      - name: "[Wearable](https://pubmed.ncbi.nlm.nih.gov/31021744/)"
        description: 
        icon: ":watch:"
        icon_pack: emoji
      - name: '[Precision medicine](https://snyderlab.stanford.edu/)'
        description: 
        icon: ":dna:"
        icon_pack: emoji
      - name: "[Aging](https://en.wikipedia.org/wiki/Ageing)"
        description: 
        icon: ":person_white_hair:"
        icon_pack: emoji
      - name: "[Pregnancy](https://pubmed.ncbi.nlm.nih.gov/31969484/)"
        description:
        icon: ":pregnant_woman:"
        icon_pack: emoji
    filters:
      folders:
        - research
    subtitle: ":point_right: [Detailed Research](./research/)"
  design:
    # Choose how many columns the section has. Valid values: '1' or '2'.
    columns: '1'
    background:
      image:
        filename: research.jpg
        filters:
          brightness: 0.4
      #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
      size: cover
      # Image focal point. Options include `left`, `center` (default), or `right`.
      position: center
      # Use a fun parallax-like fixed background effect on desktop? true/false
      parallax: true
      # Text color (true=light, false=dark, or remove for the dynamic theme color).
      text_color_light: true

- block: collection
  id: research_brief
  content:
    count: 100
    filters:
      author: ""
      category: ""
      exclude_featured: false
      publication_type: ""
      tag: ""
    offset: 0
    order: desc
    subtitle: ""
    title: ""
    text: 
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
        filename: pexels_videos_2699 (1080p).mp4
        filters:
          brightness: 0.5
      # image: 
      #   filename: coding.mp4
      #   filters:
      #     brightness: 0.5
      #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
      size: cover
      # Image focal point. Options include `left`, `center` (default), or `right`.
      position: center
      # Use a fun parallax-like fixed background effect on desktop? true/false
      parallax: true
      # Text color (true=light, false=dark, or remove for the dynamic theme color).
      text_color_light: true
    
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
    columns: '2'
    view: card
    
- block: collection
  id: news
  content:
    count: 5
    filters:
      author: ""
      category: ""
      exclude_featured: false
      publication_type: ""
      tag: ""
    offset: 0
    order: desc
    page_type: post
    subtitle: ":point_right: [All News](./post/)"
    title: 📰 Latest News
    text: 
  design:
    columns: "2"
    view: list
    background:
      video:
        filename: news-background.mp4
        filters:
          brightness: 0.8
      #  Image fit. Options are `cover` (default), `contain`, or `actual` size.
      size: cover
      # Image focal point. Options include `left`, `center` (default), or `right`.
      position: center
      # Use a fun parallax-like fixed background effect on desktop? true/false
      parallax: true
      # Text color (true=light, false=dark, or remove for the dynamic theme color).
      text_color_light: true

- block: people
  id: people
  content:
    sort_ascending: true
    sort_by: Params.last_name
    title: 👥 Team
    subtitle: ":point_right: [All Team Members](./people/)"
    # text: |-
    #   {{% callout note %}}
    #   [All team members](./people/).
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
          brightness: 0.15
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
    subtitle: ":point_right: [More social media](./contact/)"
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
    subtitle: ''
    text: '{{< gallery album="lab2" >}}'
  design:
    columns: '1'

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
