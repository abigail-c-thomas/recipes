---
layout: recipe
title: {{TITLE}}
tags: [{{TAGS}}]
ingredients: [{{INGREDIENTS}}]
permalink: /recipes/{{PERMALINK}}
---

{% capture recipe_content %}
# {{DISPLAY_TITLE}}

### Original Text
<!-- TODO: Add original {{LANGUAGE}} text from {{SOURCE}} -->

<!-- TODO: Add English translation -->

—*{{SOURCE_AUTHOR}}*, {{SOURCE_REFERENCE}}, c. {{SOURCE_DATE}}

___

<!-- TODO: Add description paragraph about this dish -->

### Ingredients
{{INGREDIENTS_LIST}}

### Method
{{METHOD}}

{{NOTES_SECTION}}
{% endcapture %}

{{ recipe_content | markdownify }}