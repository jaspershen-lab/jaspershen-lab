---
date: "2023-08-01"
sections:
- block: slider
  content:
    slides:
    - align: center
      background:
        color: '#666'
        image:
          filename: coders.jpg
          filters:
            brightness: 0.7
        position: right
      content: Take a look at what we're working on...
      title: "\U0001F44B Welcome to the group"
    - align: left
      background:
        color: '#555'
        image:
          filename: contact.jpg
          filters:
            brightness: 0.7
        position: center
      content: Share your knowledge with the group and explore exciting new topics
        together!
      title: Lunch & Learn ☕️
    - align: right
      background:
        color: '#333'
        image:
          filename: welcome.jpg
          filters:
            brightness: 0.5
        position: center
      content: Just opened last month!
      link:
        icon: graduation-cap
        icon_pack: fas
        text: Join Us
        url: ../contact/
      title: World-Class Semiconductor Lab
  design:
    interval: 2000
    is_fullscreen: true
    loop: true
    slide_height: ""

# - block: hero
#   content:
#     image:
#       filename: welcome.jpg
#     text: |
#       <br>
# 
#       The **Jasper Shen Lab** has been a center of excellence for Artificial Intelligence research, teaching, and practice since its founding in 2024.
#     title: |
#       Jasper Shen Lab

- block: features
  id: research
  content:
    title: Research
    items:
      - name: Microbiome
        description: 
        icon: bacterium
        icon_pack: fas
      - name: Metabolomics
        description: 
        icon: dataverse
        icon_pack: ai
      - name: Wearable
        description: 
        icon: digital-ocean
        icon_pack: fab
      - name: Precision medicine
        description: 
        icon: dna
        icon_pack: fas
      - name: Aging
        description: 
        icon: person-cane
        icon_pack: fas
      - name: Pregnancy
        description:
        icon: person-pregnant
        icon_pack: fas
    text: |-
      {{% callout note %}}
      [Detailed research can be found here](./research/).
      {{% /callout %}}
    align: left
    filters:
      folders:
        - research
    subtitle: 
  design:
    # Choose how many columns the section has. Valid values: '1' or '2'.
    columns: '1'

# - block: portfolio
#   id: research
#   content:
#     title: Research
#     filters:
#       folders:
#         - research
#     # Default filter index (e.g. 0 corresponds to the first `filter_button` instance below).
#     default_button_index: 0
#     # Filter toolbar (optional).
#     # Add or remove as many filters (`filter_button` instances) as you like.
#     # To show all items, set `tag` to "*".
#     # To filter by a specific tag, set `tag` to an existing tag name.
#     # To remove the toolbar, delete the entire `filter_button` block.
#     buttons:
#       - name: All
#         tag: '*'
#       - name: Deep Learning
#         tag: Deep Learning
#       - name: Other
#         tag: Demo
#   design:
#     # Choose how many columns the section has. Valid values: '1' or '2'.
#     columns: '1'
#     view: showcase
#     # For Showcase view, flip alternate rows?
#     flip_alt_rows: false
    
- block: portfolio
  id: software
  content:
    title: Software
    filters:
      folders:
        - software
    # Default filter index (e.g. 0 corresponds to the first `filter_button` instance below).
    default_button_index: 0
    # Filter toolbar (optional).
    # Add or remove as many filters (`filter_button` instances) as you like.
    # To show all items, set `tag` to "*".
    # To filter by a specific tag, set `tag` to an existing tag name.
    # To remove the toolbar, delete the entire `filter_button` block.
    buttons:
      - name: All
        tag: '*'
      - name: Deep Learning
        tag: Deep Learning
      - name: Other
        tag: Demo
  design:
    # Choose how many columns the section has. Valid values: '1' or '2'.
    columns: '1'
    view: showcase
    # For Showcase view, flip alternate rows?
    flip_alt_rows: false
    

- block: collection
  id: publication
  content:
    count: 3
    title: Recent Publications
    text: |-
      {{% callout note %}}
      [All Publications can be found here](./publication/).
      {{% /callout %}}
    filters:
      folders:
        - publication
      exclude_featured: false
  design:
    columns: '1'
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
    subtitle: null
    title: Latest News
    text: |-
      {{% callout note %}}
      [All News can be found here](./post/).
      {{% /callout %}}
  design:
    columns: "1"
    view: compact

- block: people
  id: people
  content:
    sort_ascending: true
    sort_by: Params.last_name
    title: Team
    text: |-
      {{% callout note %}}
      [All team member can be found here](./people/).
      {{% /callout %}}
    user_groups:
    - Principal Investigators
    - Researchers
    - Grad Students
    - Administration
  design:
    show_interests: false
    show_role: true
    show_social: true
    
- block: collection
  id: event
  content:
    count: 5
    title: Recent Events
    text: |-
      {{% callout note %}}
      [All Events can be found here](./event/).
      {{% /callout %}}
    filters:
      folders:
        - event
      exclude_featured: false
  design:
    columns: '1'
    view: compact

- block: tag_cloud
  content:
    title: Popular Topics
  design:
    columns: '1'

- block: contact
  id: contact
  content:
    title: Contact
    subtitle:
    text: |-
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mi diam, venenatis ut magna et, vehicula efficitur enim.
    # Contact (add or remove contact options as necessary)
    email: test@example.org
    phone: 888 888 88 88
    appointment_url: 'https://calendly.com'
    address:
      street: 450 Serra Mall
      city: Stanford
      region: CA
      postcode: '94305'
      country: United States
      country_code: US
    directions: Enter Building 1 and take the stairs to Office 200 on Floor 2
    office_hours:
      - 'Monday 10:00 to 13:00'
      - 'Wednesday 09:00 to 10:00'
    contact_links:
      - icon: twitter
        icon_pack: fab
        name: DM Me
        link: 'https://twitter.com/Twitter'
      - icon: skype
        icon_pack: fab
        name: Skype Me
        link: 'skype:echo123?call'
      - icon: video
        icon_pack: fas
        name: Zoom Me
        link: 'https://zoom.com'
    # Automatically link email and phone or display as text?
    autolink: true
    # Email form provider
    form:
      provider: netlify
      formspree:
        id:
      netlify:
        # Enable CAPTCHA challenge to reduce spam?
        captcha: false
  design:
    columns: '1'

title: null
type: landing
---
