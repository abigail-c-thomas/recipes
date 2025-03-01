---
layout: default
title: Ofellae
tag: ofellae
permalink: /tags/ofellae/
---

# Ofellae

*Ofellae* is a Latin word referring to marinated bite-sized pieces of meat that have been cooked in a richly-flavoured sauce. We have ten surviving recipes for *ofellae*—six from Apicius, Book 7, and a further four from Vinidarius.

The dish involves a two-step cooking process. The meat is first slowly roasted or boiled, and then afterwards quickly "fried" in a flavorful sauce. The final dish should be succulent and tender, somewhat similar to modern BBQ or braised dishes.

*Ofellae* were a staple of taverns, and the Emperor Claudius even rhetorically asked "Who can life without *offulae*?" in a Senate discussion on cookshops.

<!-- TODO: Add more historical context and details about ofellae -->

## Recipes with this tag

{% for recipe in site.recipes %}
  {% if recipe.tags contains 'ofellae' %}
  * [{{ recipe.title }}]({{ recipe.url | relative_url }})
  {% endif %}
{% endfor %}