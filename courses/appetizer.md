---
layout: default
title: Appetizers
---

# Appetizers

These are smaller dishes that would typically be served at the beginning of a meal or as part of a larger spread.

## Recipes

{% assign appetizer_recipes = site.pages | where: "layout", "recipe" | where: "modern_course", "appetizer" %}
<ul>
  {% for recipe in appetizer_recipes %}
    <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
  {% endfor %}
</ul>