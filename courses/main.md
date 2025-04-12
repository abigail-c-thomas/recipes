---
layout: default
title: Main Courses
---

# Main Courses

These are hearty main dishes that would typically be served as the centerpiece of a meal.

## Recipes

{% assign main_recipes = site.pages | where: "layout", "recipe" | where: "modern_course", "main" %}
<ul>
  {% for recipe in main_recipes %}
    <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
  {% endfor %}
</ul>