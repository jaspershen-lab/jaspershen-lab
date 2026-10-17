---
date: "2023-11-01"
title: null
type: landing
sections:
- block: markdown
  id: lab_hero
  content:
    title: ""
    text: |-
      <section class="lab-hero" aria-label="Shen Lab at NTU">
        <img class="lab-hero__photo" src="/media/group_photo4.jpg" alt="" aria-hidden="true">
        <div class="lab-hero__shade" aria-hidden="true"></div>
        <div class="lab-hero__content">
          <p class="lab-hero__eyebrow">
            <span class="lab-hero__eyebrow-line" aria-hidden="true"></span>
            <span class="lab-hero__split lab-hero__split--eyebrow">计算多组学实验室</span>
          </p>
          <h1 class="lab-hero__split lab-hero__split--title">Shen Lab @ NTU</h1>
          <p class="lab-hero__subtitle lab-hero__split lab-hero__split--subtitle">面向人类健康的多组学研究</p>
          <div class="lab-hero__actions">
            <a class="lab-hero__button" href="./research/" title="研究方向" aria-label="研究方向">
              <i class="fas fa-flask" aria-hidden="true"></i>
            </a>
            <a class="lab-hero__button" href="./software/" title="软件工具" aria-label="软件工具">
              <i class="fas fa-code" aria-hidden="true"></i>
            </a>
            <a class="lab-hero__button" href="./publication/" title="论文发表" aria-label="论文发表">
              <i class="fas fa-file-alt" aria-hidden="true"></i>
            </a>
          </div>
        </div>
      </section>
  design:
    columns: "1"
    spacing:
      padding: ["0", "0", "0", "0"]

- block: slider
  id: latest_highlights
  content:
    slides:
    - align: center
      video_id: eS3hR8jROdA
      background:
        color: '#000'
      content:
      link:
        icon: video
        icon_pack: fas
        label: "观看视频"
        url: https://youtu.be/eS3hR8jROdA?si=AksPmU4fR9oIJHoR
      title: "MAPA 视频介绍"
    - align: center
      background:
        color: '#666'
        image:
          filename: mapa-advanced-science-2026.png
          filters:
            brightness: 0.62
        position: right
      content:
      link:
        icon: link
        icon_pack: fas
        text: Link
        url: ../publication/mapa-a-semantic-network-framework-for-functional-module-discovery-and-interpretation-in-multi-omics-data/
      title: "最新论文"
    - align: center
      background:
        color: '#666'
        image:
          filename: bib-2026-lagci.png
          filters:
            brightness: 0.62
        position: right
      content:
      link:
        icon: link
        icon_pack: fas
        text: Link
        url: ../publication/lagci-enables-inference-of-temporal-causal-relationships-from-dense-multi-omic-time-series/
      title: "最新论文"
    - align: center
      background:
        color: '#666'
        image:
          filename: microbiome-2026.png
          filters:
            brightness: 0.62
        position: right
      content:
      link:
        icon: link
        icon_pack: fas
        text: Link
        url: ../publication/cross-body-site-microbial-interactions-influence-the-human-plasma-metabolome/
      title: "最新论文"
    - align: center
      background:
        color: '#666'
        image:
          filename: nc-2026-tidymass2.png
          filters:
            brightness: 0.62
        position: right
      content:
      link:
        icon: link
        icon_pack: fas
        text: Link
        url: ../publication/tidymass2-advancing-lc-ms-untargeted-metabolomics-through-metabolite-origin-inference-and-metabolic-feature-based-functional-module-analysis/
      title: "最新论文"
  design:
    interval: "false"
    is_fullscreen: true
    loop: false
    slide_height: ""
    spacing:
      padding: ["0", "0", "0", "0"]

- block: collection
  id: research
  content:
    title: 研究方向
    subtitle: ":point_right: [查看详细研究方向](./research/)"
    text: "我们的研究聚焦于面向 <u>多组学数据</u> 的计算方法开发，特别关注 <u>代谢组学和微生物组数据</u>，并将这些方法应用于 <u>精准医学、衰老、妊娠和其他健康相关问题</u>。"
    count: 3
    filters:
      folders:
        - research_brief
  design:
    columns: "1"
    view: community/research_cards

- block: collection
  id: software
  content:
    title: 软件工具
    text: ""
    count: 5
    offset: 0
    order: desc
    filters:
      folders:
        - software
    archive:
      enable: true
      text: 查看全部
      link: ./software/
  design:
    columns: "1"
    flip_alt_rows: false
    view: community/software_cards

- block: collection
  id: publication
  content:
    count: 6
    title: 论文发表
    text:
    filters:
      folders:
        - publication
      featured_only: true
    archive:
      enable: true
      text: 查看全部
      link: ./publication/
  design:
    columns: '1'
    view: community/publication_cards

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
    title: 新闻
    text:
  design:
    columns: "2"
    view: list

- block: people
  id: team
  content:
    sort_ascending: true
    sort_by: Params.last_name
    title: 团队成员
    subtitle: ":point_right: [查看全部成员](./team/)"
    user_groups:
    - Principal Investigator
    - Researchers
    - Students
    - Co-supervised Students
    - Intern
    - Join US
  design:
    show_interests: false
    show_role: true
    show_social: true

- block: markdown
  id: team_snapshot
  content:
    title: ""
    subtitle: ""
    text: |-
      {{< team_membership_stats >}}
  design:
    columns: "1"

- block: markdown
  id: photo
  content:
    title: 实验室生活
    text: |-
      {{< life_in_lab >}}
      <div class="see-all">
        <a href="./photo/">
          查看全部
          <i class="fas fa-angle-right"></i>
        </a>
      </div>
  design:
    columns: "1"

- block: markdown
  id: molecular_network
  content:
    title: ""
    text: |-
      {{< publication_wordcloud >}}
  design:
    columns: '1'
    background:
      color: '#20141b'
      size: cover
      position: center
      parallax: true
      text_color_light: true
---
