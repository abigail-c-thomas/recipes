---
layout: default
title: Garum and Liquamen
---

# *Garum* and *Liquamen*

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## *Garum*

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## *Liquamen*

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Modern Substitutes

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Recipes Using This Ingredient

{% assign garum_recipes = site.pages | where: "layout", "recipe" %}
<ul>
  {% for recipe in garum_recipes %}
    {% if recipe.content contains "garum" or recipe.content contains "liquamen" or recipe.content contains "fish sauce" %}
      <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
    {% endif %}
  {% endfor %}
</ul>