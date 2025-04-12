---
layout: recipe
title: Recipe Title
source: sourcename
dish_type: poultry  # Options: poultry, ofellae, eggs, etc.
modern_course: main  # Options: appetizer, main, dessert, etc.
---

Brief description of the recipe (1-2 sentences).

{% capture ingredients %}
* 000g ingredient one
* 000g ingredient two
* 000ml liquid ingredient
* 0 eggs
* 00g spice or small quantity ingredient
* 00ml extract or small liquid ingredient
{% endcapture %}

{% capture instructions %}
1. First step of the recipe. Remember to use metric units (°C for temperature, cm for sizes).
2. Second step with more detailed instructions.
3. Third step with even more instructions about what to do.
4. Final instructions for completing the recipe.
{% endcapture %}

{% include recipe-card.html 
  title="Recipe Title"
  summary="A more detailed description of the recipe that will appear at the top of the recipe card. Mention what makes this recipe special or any important notes about it."
  prep_time="00 minutes"
  prep_time_mins="00"
  cook_time="00 minutes"
  cook_time_mins="00"
  servings="4"
  ingredients=ingredients
  instructions=instructions
  notes="Optional notes about the recipe, such as storage instructions, variations, or tips for success."
%}
