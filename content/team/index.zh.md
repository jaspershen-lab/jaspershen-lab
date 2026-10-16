---
section_header: false
date: "2022-10-24"
image:
  placement: 1
  caption: ""
  focal_point: "Center"
  preview_only: false
  alt_text:
  filename: coders.jpg
sections:
- block: about.biography
  content:
    title: 课题组负责人
    username: admin

- block: people
  content:
    sort_ascending: true
    sort_by: Params.last_name
    title: 团队成员
    user_groups:
    - Postdocs
    - Research Scientist
    - PhD Students
    - Co-supervised Students
    - Visiting PhD Students
    - Master Students
    - Undergraduate Students
    - Visiting Scholar
    - Intern
    - Administration
    - Alumni
  design:
    show_interests: true
    show_role: true
    show_social: true
    show_organizations: true

- block: markdown
  content:
    title: Alumni Timeline
    text: |-
      {{< alumni_gantt >}}
  design:
    columns: '1'

- block: markdown
  content:
    title: Lab Collaboration Network
    text: |-
      {{< team_collaboration_network >}}
  design:
    columns: '1'

title: 团队成员
type: landing
---
