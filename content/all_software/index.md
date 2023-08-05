---
date: "2023-08-01"
title: Software
type: landing

sections:
- block: portfolio
  id: software
  content:
    title: 🖥️ Software
    text: ""
    filters:
      folders:
        - software2
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
    view: community/compact2
    # For Showcase view, flip alternate rows?
    flip_alt_rows: true

- block: markdown
  content:
    title:
    subtitle: ''
    text:
  design:
    columns: '1'
    background:
      image: 
        filename: code.jpg
        filters:
          brightness: 1
        parallax: false
        position: center
        size: cover
        text_color_light: true
    spacing:
      padding: ['20px', '0', '20px', '0']
    css_class: fullscreen
---

