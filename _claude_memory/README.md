# Recipe Collection Memory

This directory contains tracking information, templates, and tools for managing the Roman and Greek recipe collection.

## Directory Structure

- `archive/`: Archive of older tracking files (consolidated into recipe_tracking.md)
- `ingredients/`: Contains information about known ingredients
- `scripts/`: Contains Ruby scripts for recipe automation
- `tags/`: Contains information about known tags
- `templates/`: Contains templates for creating new files

## Key Files

- [recipe_tracking.md](recipe_tracking.md): **MAIN FILE** - Comprehensive tracking for all recipes, including workflow, status codes, and standardization progress
- [translation_glossary.md](translation_glossary.md): Standard translations for Latin/Greek terms
- [template/recipe_template.md](templates/recipe_template.md): Template for creating new recipes

## Recent Updates (March 2, 2025)

- Successfully standardized all recipe permalinks to `/recipes/recipe-name` format
- Consolidated tracking information into recipe_tracking.md as single source of truth
- Resolved duplicate recipe issue (columella-oxyporium variants)
- Created automation scripts to streamline recipe fixes

## Status Statistics

- Total recipes reviewed: 140+
- Recipes with correct formatting: ~40 (29%)
- Recipes with minor formatting issues: ~80 (57%)
- Recipes needing major revision: ~20 (14%)
- Most common issue: Missing "**Claude's intro:**" markers

## Important Guidelines

- Always use recipe_tracking.md as the primary reference for all recipe work
- When writing introductory text for recipes, always mark it as "**Claude's intro:**" 
- Always use British English for recipe content
- Maintain consistent date formats (e.g., "c. 4th century CE" for Apicius)
- Format permalink as `/recipes/recipe-name` (no trailing slash)
- Always check if a recipe already exists before creating it

## Recipe Creation Summary

1. Check for duplicates using recipe_tracking.md and file searches
2. Locate source recipe in _recipes_to_add directory
3. Check for original text in _sources_original directory
4. Create new file using template with exact title from source
5. Follow the standard structure: title → original text → intro → ingredients → method
6. Mark introduction paragraph with "**Claude's intro:**"
7. Add to recipe_tracking.md with appropriate status codes

## Useful Commands

```bash
# Update known tags
find _recipes -type f -name "*.md" | xargs grep -h "^tags:" | sort | uniq > _claude_memory/tags/known_tags.txt

# Update known ingredients
find _recipes -type f -name "*.md" | xargs grep -h "^ingredients:" | sort | uniq > _claude_memory/ingredients/known_ingredients.txt

# Run fix script on all recipes
find _recipes -type f -name "*.md" -exec _claude_memory/scripts/fix_recipe_format.rb --all {} \;

# Search for specific recipe
find _recipes -type f -name "*.md" | grep -i "recipe-name"

# Check original sources
grep -r "reference number" _sources_original/
```

## Template Structure Requirements

The correct recipe structure follows this EXACT ordering pattern:
- YAML frontmatter (with layout, title, tags, ingredients, permalink)
- Single {% capture recipe_content %} tag
- Recipe title (# Title)
- Original Text section with Latin/Greek and translation
- Source attribution line (—*Author*, Reference, Date)
- Horizontal rule (___) 
- Introductory paragraph with "**Claude's intro:**" marker
- Ingredients section with proper include links
- Method section
- Notes section (if applicable)
- Single {% endcapture %} tag
- {{ recipe_content | markdownify }} statement

For complete details on recipe processing and standardization, refer to [recipe_tracking.md](recipe_tracking.md).