---
layout: default
title: Poultry Dishes
---

# Poultry Dishes

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Recipes

{% assign poultry_recipes = site.pages | where: "layout", "recipe" | where: "dish_type", "poultry" %}
<ul>
  {% for recipe in poultry_recipes %}
    <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
  {% endfor %}
</ul>