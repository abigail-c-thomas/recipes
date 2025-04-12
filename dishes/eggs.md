---
layout: default
title: Egg Dishes
---

# Egg Dishes

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Recipes

{% assign egg_recipes = site.pages | where: "layout", "recipe" | where: "dish_type", "eggs" %}
<ul>
  {% for recipe in egg_recipes %}
    <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
  {% endfor %}
</ul>