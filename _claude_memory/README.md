# Recipe Collection Memory

This directory contains tracking information, templates, and tools for managing the Roman and Greek recipe collection.

## Status Summary (March 2, 2025)

We've completed a thorough review of all recipes from A through Z, documenting their status in [recipe_tracking.md](recipe_tracking.md). All recipes have been evaluated against the standard format criteria defined in [recipe_workflow.md](recipe_workflow.md).

### Key Findings

- Most recipes need minor formatting adjustments
- Common issues include:
  - Missing or improperly formatted "**Claude's intro:**" markers
  - Incorrect date formats (need "c. 4th century CE" for Apicius, etc.)
  - Old permalink formats (need to update to "/recipe-index/recipe-name" without .html)
  - Incorrect section headings ("Original Latin" instead of "Original Text")
  - References to "De Re Coquinaria" for Apicius (incorrect)
  - Missing ingredient links

### Tools Created

We've created a Ruby script to help automate common fixes:
- [fix_recipe_format.rb](scripts/fix_recipe_format.rb): Script to fix date formats, add bold to intros, fix permalinks, etc.

## Next Steps

1. Run the `fix_recipe_format.rb` script on all recipe files to fix common issues automatically
   ```bash
   find _recipes -type f -name "*.md" -exec _claude_memory/scripts/fix_recipe_format.rb --all {} \;
   ```

2. Manually fix remaining issues:
   - Add missing "**Claude's intro:**" sections to recipes that lack them
   - Add missing original text where available
   - Fix recipes with major structural issues
   - Resolve duplicate recipes (particularly the oxyporium versions)

3. Process new recipes from the `_recipes_to_add` folder
   - Focus first on completing recipes with TODOs

4. Once all recipes are fixed, update the ingredients and tags lists:
   ```bash
   find _recipes -type f -name "*.md" | xargs grep -h "^tags:" | sort | uniq > _claude_memory/tags/known_tags.txt
   find _recipes -type f -name "*.md" | xargs grep -h "^ingredients:" | sort | uniq > _claude_memory/ingredients/known_ingredients.txt
   ```

## Recipe Status Statistics

- Total recipes reviewed: 140+
- Recipes with correct formatting: ~40 (29%)
- Recipes with minor formatting issues: ~80 (57%)
- Recipes needing major revision: ~20 (14%)
- Potential duplicates identified: 1 pair
- Most common issue: Missing "**Claude's intro:**" markers

## Important Guidelines

- When writing introductory text for recipes, always mark it as "**Claude's intro:**" 
- Always use British English for recipe content
- Maintain consistent dating format: "c. 4th century CE" for Apicius recipes
- IMPORTANT: Always keep the original recipe names exactly as they appear in classical_recipes_raw.md
- CRITICAL: Always check if a recipe already exists before creating it

## Recipe Creation Guidelines

Use recipe_template.md to structure recipes.
0. Use the glossary in translation_glossary.md and update it if necessary
1. Always use the exact text from recipes_raw_pt2 without making any changes
2. For Latin text: use the precise Latin wording from Apicius_raw_text.md when available
3. For translations: use accurate translations that match the Latin, don't embellish
4. Always keep the template structure intact, including the proper frontmatter
5. Make sure ingredient links are properly formatted with {% include ingredient_link.html name="ingredient" %}
6. Check if recipes already exist before creating new ones - ALWAYS use GlobTool first with patterns like "*recipe-name*.md" to check
7. Be consistent with formatting across all recipes
8. Don't assume information not in the original text
9. Include appropriate tags for era, source, and ingredients
10. When Latin text is unavailable, clearly note this fact rather than leaving it blank
11. Stick strictly to notes from recipes_raw_pt2 - do not add historical information unless it appears in the source file

### Template Structure Important Notes

1. CRITICAL: The correct recipe structure follows this EXACT ordering pattern:
   - YAML frontmatter (with layout, title, tags, ingredients, permalink)
   - Single {% capture recipe_content %} tag
   - Recipe title (# Title)
   - Original Text section with Latin/Greek and translation (MUST come before description)
   - Source attribution line (—*Author*, Reference, Date)
   - Horizontal rule (___) 
   - Introductory paragraph
   - Ingredients section
   - Method section
   - Notes section (if applicable)
   - Single {% endcapture %} tag
   - {{ recipe_content | markdownify }} statement
   
   This ordering is critical - the original text ALWAYS comes immediately after the title and BEFORE the description paragraph. This maintains the website's visual layout and consistency.

2. IMPORTANT TEMPLATE ERRORS TO AVOID:
   - Never include multiple {% capture recipe_content %} or {% endcapture %} tags
   - Never nest captures within each other
   - Follow the exact order from recipe_template.md
   - Don't add extra sections not in the template
   - Verify your template structure by comparing to recipe_template.md before saving

3. Format Check: Before finalizing any recipe, manually verify:
   - Only ONE {% capture recipe_content %} tag exists
   - Only ONE {% endcapture %} tag exists
   - The {{ recipe_content | markdownify }} appears exactly once, after the endcapture

### Source-Specific Guidelines

For Apicius recipes:
- Check book and chapter numbers in Apicius_raw_text.md to ensure accuracy
- Make sure to correctly date Apicius to 4th century CE per the glossary

For Columella recipes:
- Date to 1st century CE
- Note if original Latin is unavailable

For recipes from Heidelberg papyrus:
- Use the Greek text when available
- Be careful with translations as these can be more fragmentary

For all recipes:
- Maintain the exact measurements and ingredients from recipes_raw_pt2
- Keep the method steps verbatim from the source

## Directory Structure

- `templates/`: Contains templates for creating new files
- `tags/`: Contains information about known tags
- `ingredients/`: Contains information about known ingredients

## Recipe Processing

When adding recipes from classical sources:
1. Check if the source already exists in the _recipes folder
2. Use the template in templates/recipe_template.md
3. Include original text when available from original source files
4. For recipes not from Apicius, Cato, Heidelberg, or Vinidarius, leave original text section blank
5. Label all introductory text with "Claude's intro:" prefix
6. When a recipe refers to another recipe (e.g., "iure supra scripto"), include both the Latin and English of BOTH recipes
7. When a recipe has multiple parts (e.g., 6.8.1-2), include ALL parts in both Latin and English

## Usage

### Templates

Use the recipe template with:
```bash
cat _claude_memory/templates/recipe_template.md | sed \
  -e "s/{{TITLE}}/Recipe Title/g" \
  -e "s/{{TAGS}}/era:roman_empire, source:apicius, meat/g" \
  -e "s/{{INGREDIENTS}}/ingredient1, ingredient2/g" \
  -e "s/{{PERMALINK}}/recipe-name/g" \
  -e "s/{{DISPLAY_TITLE}}/Recipe Title/g" \
  -e "s/{{LANGUAGE}}/Latin/g" \
  -e "s/{{SOURCE}}/Apicius/g" \
  -e "s/{{SOURCE_AUTHOR}}/Apicius/g" \
  -e "s/{{SOURCE_REFERENCE}}/X.Y.Z/g" \
  -e "s/{{SOURCE_DATE}}/4th century CE/g" \
  > _recipes/recipe-name.md
```

### Updating Memory

After adding new recipes, update the memory files:

```bash
# Update known tags
find _recipes -type f -name "*.md" | xargs grep -h "^tags:" | sort | uniq > _claude_memory/tags/known_tags.txt

# Update known ingredients
find _recipes -type f -name "*.md" | xargs grep -h "^ingredients:" | sort | uniq > _claude_memory/ingredients/known_ingredients.txt
```

### Checking For Existing Elements

To check if a tag exists:
```bash
grep -i "tag_name" _claude_memory/tags/known_tags.txt
```

To check if an ingredient exists:
```bash
grep -i "ingredient_name" _claude_memory/ingredients/known_ingredients.txt
```

### Validating Recipe Format

To check for recipes with duplicate/improper capture tags:
```bash
grep -c "capture recipe_content" _recipes/*.md | grep -v ":1$"
grep -c "endcapture" _recipes/*.md | grep -v ":1$"
```

To verify that recipes follow the proper structure:
```bash
# Check that original text section appears before ingredients section
for f in _recipes/*.md; do 
  if grep -q "### Original Text" "$f" && grep -q "### Ingredients" "$f"; then
    if grep -n "### Original Text" "$f" | cut -d: -f1 > grep -n "### Ingredients" "$f" | cut -d: -f1; then
      echo "$f has correct ordering";
    else
      echo "$f has INCORRECT ordering";
    fi
  fi
done
```