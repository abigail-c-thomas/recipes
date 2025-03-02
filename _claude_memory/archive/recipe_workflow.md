# Recipe Processing Workflow

This document outlines the structured workflow for adding and updating recipes to ensure consistency, accuracy, and prevent duplication.

## Step 1: Check for Existing Recipe

Before adding a new recipe:

1. Check if the recipe already exists by running:
   ```bash
   find _recipes -type f -name "*.md" | grep -i "recipe-name"
   ```
2. Also check similar recipe names:
   ```bash
   find _recipes -type f -name "*.md" | xargs grep -l "Recipe Title"
   ```
3. Verify in the recipe_tracking.md file if this recipe is already processed or planned

## Step 2: Locate Recipe in Raw File

1. Find the recipe in the _recipes_to_add folder:
   ```bash
   grep -r "Recipe Name" _recipes_to_add/
   ```
2. Once found, examine the complete recipe including ingredients, method, and notes
3. Note down the source reference (e.g., Apicius 3.4.3, Cato 119, etc.)

## Step 3: Check for Original Text

1. Based on the source reference, check if original text is available:
   ```bash
   grep -r "reference number" _sources_original/
   ```
2. For Apicius recipes, check Apicius_text.md
3. For Cato recipes, check Cato_text.md
4. For other sources, check the appropriate source file

## Step 4: Create Recipe File Using Template

1. Create a new file in the _recipes directory using the template:
   ```bash
   cp _claude_memory/templates/recipe_template.md _recipes/recipe-name.md
   ```
2. Replace placeholders in the template:
   - {{TITLE}} - Recipe title EXACTLY as shown in _recipes_to_add (e.g., "Alexandrian Gourd")
     - IMPORTANT: Match the title precisely as it appears in the raw recipe file
     - Don't add or remove words like "Apicius" or "Apician" - copy exactly what's in the source
   - {{TAGS}} - Appropriate tags (e.g., "era:roman_empire, source:apicius, vegetable")
   - {{INGREDIENTS}} - List of main ingredients (e.g., "squash, dates, pine nuts, etc.")
   - {{PERMALINK}} - URL slug that MUST match the filename WITHOUT .html extension (e.g., "/recipe-index/apicius-lentils" for "apicius-lentils.md")
     - IMPORTANT: Even if the title is simple (e.g., "Lentils"), keep the filename and permalink specific (e.g., "apicius-lentils.md" and "/recipe-index/apicius-lentils")
     - This prevents clashes if multiple sources have recipes with the same name
     - NEVER include .html extension in the permalink
   - {{DISPLAY_TITLE}} - Title for display (same as {{TITLE}})
   - {{LANGUAGE}} - Original language ("Latin" or "Greek")
   - {{SOURCE}} - Source name (e.g., "Apicius")
   - {{SOURCE_AUTHOR}} - Author name (e.g., "Apicius")
     - IMPORTANT: Never refer to Apicius as "De Re Coquinaria" - this is not its real name
     - Use just "Apicius" without additional titles
   - {{SOURCE_REFERENCE}} - Reference (e.g., "3.4.3")
   - {{SOURCE_DATE}} - Approximate date (e.g., "4th century CE")
     - For Apicius, always use "c. 4th century CE" (not "350" or "4th-5th century")
     - For Cato, use "2nd century BCE"
     - For Vinidarius, use "c. 500" or "late 5th century CE"
     - For Athenaeus, use "c. 200" or "early 3rd century CE"
     - For Heidelberg Papyrus, use "c. 3rd century CE"

## Step 5: Copy Content EXACTLY

1. Copy the original raw recipe text EXACTLY from _recipes_to_add
2. Format ingredients with ingredient links:
   ```
   - 50g {% include ingredient_link.html name="ingredient" %}
   ```
3. Format method steps as numbered list
4. Include original notes from raw file

## Step 6: Add Original Text and Translation

1. If original text was found in Step 3, add it to the "### Original Text" section
   - Use this heading for all original language texts, whether Latin, Greek, or other
   - Always follow with a separate "### English Translation" heading
2. Format original text in italics by surrounding with asterisks (*text*)
3. Add an English translation underneath (not in italics)
4. Keep special terms like *defrutum* in italics even in the translation
5. Check that the date format matches the standard for the source:
   - For Apicius, always use "—*Apicius*, [reference], c. 4th century CE"
   - For Cato, use "—*Cato*, *De Agricultura* [reference], 2nd century BCE"
   - For other sources, follow the appropriate format with consistent dating

## Step 7: Write an Introduction

1. Add a paragraph starting with "**Claude's intro:**" after the horizontal rule (___) and before the ingredients section
2. Focus on:
   - Historical context of the dish
   - Culinary significance
   - Main flavor profile
   - Interesting cultural notes
3. Keep to 2-4 sentences for brevity

## Step 8: Update Tracking

1. Add the new recipe to recipe_tracking.md with appropriate status codes
2. Note any issues or special considerations

## Step 9: Recipe Verification

Before considering a recipe complete, verify:
- [F] Format is correct (follows template exactly)
  - Correct permalink format (/recipe-index/recipe-name without .html)
  - "Original Text" and "English Translation" with proper headings
  - Proper date format for the source
  - Correct ingredient links with {% include ingredient_link.html name="ingredient" %}
- [T] Text matches raw recipe exactly
- [O] Original source text is included (when available)
  - For Apicius, Cato, Vinidarius, check original text is present and italicized
  - For Greek sources, check if original text is available or note its absence
- [TR] Translation is included (when available)
  - Check that translation is properly formatted under its own heading
- [I] Introduction with "**Claude's intro:**" is added (bold formatting is important)
  - Intro should cover historical context, significance, and interesting aspects of the dish
- [D] Duplicate check was performed
  - Especially important for recipes that might appear in multiple sources

## Recipe Status Codes (for tracking)

- **[F]** - Format correct (follows template structure)
- **[T]** - Text matches raw recipe exactly  
- **[O]** - Original source text included (when available)
- **[TR]** - Translation included (when available)
- **[I]** - Introduction added (with "Claude's intro:" marker)
- **[D]** - Duplicate check performed

Following this structured workflow will help ensure consistency, accuracy, and prevent the common issues encountered previously.