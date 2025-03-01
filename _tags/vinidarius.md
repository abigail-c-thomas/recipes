---
layout: default
title: Vinidarius
tag: source:vinidarius
permalink: /tags/source-vinidarius/
---

# Vinidarius

*Vinidarius* was a late 5th-century Goth who compiled a collection of recipes known as the "*Apici excerpta a Vinidario viro inlustri*" ("Excerpts of Apicius by Vinidarius, an Illustrious Man"). This collection preserved simplified versions of earlier Roman recipes during the transition from the Western Roman Empire to Gothic rule.

The text consists of 31 recipes and begins with lists of necessary spices, seeds, dried ingredients, liquids, nuts, and dried fruits that should be kept in the household. The recipes themselves cover a range of dishes including:

1. Vegetables and pot dishes (*caccabina*)
2. Various cuts of meat (*ofellae*) 
3. Fish preparations and sauces
4. Pork dishes (several variants)
5. Lamb and kid preparations
6. Poultry and game birds

Vinidarius' collection is particularly valuable as it represents a bridge between classical Roman cuisine and early medieval cooking practices. The recipes generally feature simpler methods than those found in the Apicius collection, while still maintaining the distinctive Mediterranean flavor profiles centered around fish sauce, wine, olive oil, and aromatic herbs and spices.

## Recipes from this source

{% for recipe in site.recipes %}
  {% if recipe.tags contains 'source:vinidarius' %}
  * [{{ recipe.title }}]({{ recipe.url | relative_url }})
  {% endif %}
{% endfor %}