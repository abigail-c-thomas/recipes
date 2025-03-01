---
layout: default
title: Lamb
tag: lamb
permalink: /tags/lamb/
---

# Lamb in Classical Cuisine

Lamb was a highly valued meat in classical Mediterranean cuisine, especially for festive occasions. While beef cattle were primarily used as working animals in ancient Rome, sheep were raised specifically for their meat, milk, and wool, making lamb a more common meat on Roman tables.

Roman cuisine made use of all parts of the lamb, from roasted legs for special occasions to offal and other less desirable cuts for everyday meals. Lamb was often paired with strong flavors like wine, herbs, fruit (particularly prunes and dates), and spices to complement its distinctive taste.

Apicius, the most famous Roman cookbook, contains numerous lamb recipes, ranging from simple stews with legumes to elaborate roasted dishes with complex sauces. Many of these recipes reflect the Roman preference for sweet-savory flavor combinations.

<!-- TODO: Add more historical context about lamb consumption in the classical world -->

## Recipes with lamb

{% for recipe in site.recipes %}
  {% if recipe.tags contains 'lamb' %}
  * [{{ recipe.title }}]({{ recipe.url | relative_url }})
  {% endif %}
{% endfor %}