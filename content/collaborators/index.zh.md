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
    title: 合作者
    user_groups:
    - Academia
    - Industry
  design:
    show_interests: false
    show_role: true
    show_social: true
    show_organizations: true

- block: markdown
  content:
    title: 合作者地图
    text: |-
      {{< collaborator_map >}}
  design:
    columns: '1'

- block: markdown
  content:
    title:
    text: |-
      {{< collaborator_logo_wall >}}
  design:
    columns: '1'

title: 合作者
type: landing
---
