---
layout: default
title: Desserts
---

# Desserts

These are sweet dishes that would typically be served at the end of a meal.

## Recipes

{% assign dessert_recipes = site.pages | where: "layout", "recipe" | where: "modern_course", "dessert" %}
<ul>
  {% for recipe in dessert_recipes %}
    <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
  {% endfor %}
</ul>