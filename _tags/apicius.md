---
layout: default
title: Apicius
tag: source:apicius
permalink: /tags/source-apicius/
---

# Apicius

*Apicius* is the title of a collection of Roman cookery recipes, usually thought to have been compiled in the late 4th or early 5th century CE. The collection is sometimes attributed to Marcus Gavius Apicius, a Roman gourmet who lived sometime in the 1st century CE.

The text is organized in ten books, each dedicated to different types of dishes:

1. Epimeles — The Careful Housekeeper
2. Sarcoptes — The Meat Mincer
3. Cepuros — The Gardener
4. Pandecter — Various Dishes
5. Ospreon — Vegetables
6. Aeropetes — Birds
7. Polyteles — The Gourmet
8. Tetrapus — Quadrupeds
9. Thalassa — The Sea
10. Halieus — The Fisherman

<!-- TODO: Add more information about Apicius's cookbook, its significance, and historical context -->

## Recipes from this source

{% for recipe in site.recipes %}
  {% if recipe.tags contains 'source:apicius' %}
  * [{{ recipe.title }}]({{ recipe.url | relative_url }})
  {% endif %}
{% endfor %}