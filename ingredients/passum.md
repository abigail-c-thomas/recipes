---
layout: default
title: Passum
---

# *Passum*

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Historical Context

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Modern Equivalents

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Recipes Using This Ingredient

{% assign passum_recipes = site.pages | where: "layout", "recipe" %}
<ul>
  {% for recipe in passum_recipes %}
    {% if recipe.content contains "passum" or recipe.content contains "raisin wine" %}
      <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
    {% endif %}
  {% endfor %}
</ul>