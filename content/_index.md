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

- block: hero
  content:
    image:
      filename: join_us.jpg
    text: |
      <br>

      Dr. Emily Carter is eager to recruit several Ph.D. students and postdocs who share her enthusiasm for advancing the frontiers of knowledge. 
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
    title: Research `:microscope:`
    # text: |-
    #   {{% callout note %}}
    #   [Detailed research can be found here](./research/).
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
    subtitle: ":point_right: [Detailed research can be found here](./research/)"
  design:
    # Choose how many columns the section has. Valid values: '1' or '2'.
    columns: '1'

# - block: portfolio
#   id: research_brief
#   content:
#     title:
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
    title: Software `:desktop_computer:`
    subtitle: ":point_right: [All software can be found here](./all_software/)"
    text: ""
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
      - name: Microbiome
        tag: Microbiome
      - name: Mass Spectrometry
        tag: Mass Spectrometry
      - name: Wearable
        tag: Wearable
      - name: Multi-omics
        tag: Multi-omics
      - name: Other
        tag: Other
  design:
    # Choose how many columns the section has. Valid values: '1' or '2'.
    columns: '1'
    view: community/showcase3
    # For Showcase view, flip alternate rows?
    flip_alt_rows: true
    

- block: collection
  id: publication
  content:
    count: 5
    title: Recent Publications `:page_with_curl:`
    subtitle: ":point_right: [All publication can be found here](./publication/)"
    text: 
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
    count: 2
    filters:
      author: ""
      category: ""
      exclude_featured: false
      publication_type: ""
      tag: ""
    offset: 0
    order: desc
    page_type: post
    subtitle: ":point_right: [All news can be found here](./post/)"
    title: Latest News `:newspaper:`
    text: 
  design:
    columns: "1"
    view: compact

- block: people
  id: people
  content:
    sort_ascending: true
    sort_by: Params.last_name
    title: Team `:busts_in_silhouette:`
    subtitle: ":point_right: [All team member can be found here](./people/)"
    # text: |-
    #   {{% callout note %}}
    #   [All team member can be found here](./people/).
    #   {{% /callout %}}
    user_groups:
    - Principal Investigators
    - Researchers
    - Grad Students
  design:
    show_interests: false
    show_role: true
    show_social: true
    
- block: collection
  id: event
  content:
    count: 3
    title: Recent Events `:ticket:`
    subtitle: ":point_right: [All events can be found here](./event/)"
    text: 
    filters:
      folders:
        - event
      exclude_featured: false
  design:
    columns: '1'
    view: compact

# - block: markdown
#   content:
#     title: Gallery
#     subtitle: ''
#     text: |-
#       {{< gallery album="lab" >}}
#   design:
#     columns: '1'
    
- block: tag_cloud
  content:
    title: Popular Topics `:whale:`
  design:
    columns: '1'

- block: contact
  id: contact
  content:
    title: Contact `:incoming_envelope:`
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
    office_hours:
      - 'Monday 10:00 to 13:00'
      - 'Wednesday 09:00 to 10:00'
    contact_links:
      - icon: twitter
        icon_pack: fab
        name: DM Me
        link: 'https://twitter.com/Twitter'
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
