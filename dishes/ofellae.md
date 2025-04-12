---
layout: default
title: Ofellae Dishes
---

# Ofellae Dishes

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## History of Ofellae

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Recipes

{% assign ofellae_recipes = site.pages | where: "layout", "recipe" | where: "dish_type", "ofellae" %}
<ul>
  {% for recipe in ofellae_recipes %}
    <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
  {% endfor %}
</ul>