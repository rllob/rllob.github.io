---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
redirect_from:
  - /publications/
---

{% include base_path %}

My dissertation, *Essays in Methodology and Political Economy*, develops two connected strands of research. Substantively, I study how labor market institutions and economic insecurity shape support for redistribution and political behavior. Methodologically, I develop statistical methods and research designs for settings in which observed data imperfectly measure theoretical quantities or provide no obvious counterfactual comparison. The papers below introduce these strands.

My work on **coarsening-induced measurement error** is developing into a series on reconstructing bracketed predictors, interpreting interactions, and comparing relationships across heterogeneous populations. The first paper develops a theoretical framework connecting the reconstruction of bracketed variables to measurement error and its implications for regression estimation and statistical inference.

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}
