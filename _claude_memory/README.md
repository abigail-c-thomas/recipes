# Claude Memory System

This directory contains structured memory files to help maintain consistency across recipe files.

## Important Guidelines

- When writing introductory text for recipes, always mark it as "**Claude's intro:**" 
- Always use British English for recipe content
- Maintain consistent dating format: "c. 4th century CE" for Apicius recipes
- IMPORTANT: Always keep the original recipe names exactly as they appear in classical_recipes_raw.md

## Directory Structure

- `templates/`: Contains templates for creating new files
- `tags/`: Contains information about known tags
- `ingredients/`: Contains information about known ingredients

## Recipe Processing

When adding recipes from classical sources:
1. Check if the source already exists in the _recipes folder
2. Use the template in templates/recipe_template.md
3. Include original text when available from original source files
4. For recipes not from Apicius, Heidelberg, or Vinidarius, leave original text section blank
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