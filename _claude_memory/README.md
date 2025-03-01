# Claude Memory System

This directory contains structured memory files to help maintain consistency across recipe files.

## Directory Structure

- `templates/`: Contains templates for creating new files
- `tags/`: Contains information about known tags
- `ingredients/`: Contains information about known ingredients

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
  -e "s/{{SOURCE_DATE}}/350/g" \
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