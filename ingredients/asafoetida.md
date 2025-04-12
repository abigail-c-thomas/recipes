---
layout: default
title: Asafoetida, Silphium, and Laser
---

# Asafoetida, *Silphium*, and *Laser*

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## *Silphium*

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## *Laser*

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Asafoetida

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nisl eget ultricies tincidunt, nisl nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.

## Recipes Using This Ingredient

{% assign asafoetida_recipes = site.pages | where: "layout", "recipe" %}
<ul>
  {% for recipe in asafoetida_recipes %}
    {% if recipe.content contains "asafoetida" or recipe.content contains "laser" or recipe.content contains "silphium" %}
      <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
    {% endif %}
  {% endfor %}
</ul>