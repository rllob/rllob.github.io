---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
redirect_from:
  - /publications/
---

{% include base_path %}

My dissertation, *Essays in Methodology and Political Economy*, develops two connected strands of research. Substantively, I study how labor market institutions and economic insecurity shape support for redistribution and political behavior. Methodologically, I develop statistical methods and research designs for settings in which observed data imperfectly measure theoretical quantities or provide no obvious counterfactual comparison. The dissertation consists of the three essays below.

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}
