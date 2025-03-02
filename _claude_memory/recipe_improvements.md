# Recipe Improvements

## Summary of Work Completed (March 2, 2025)

Completed thorough review and tracking of all recipes from A through Z, documenting their status in recipe_tracking.md. The main issues identified and standardization needed:

## Common Issues Found
- Missing "Claude's intro:" marker (or missing bold formatting on it)
- Incorrect date formats (need "c. 4th century CE" for Apicius, etc.)
- ✅ Inconsistent permalink formats (standardized to "/recipes/recipe-name" without trailing slash)
- Incorrect section headings ("Original Latin" instead of "Original Text")
- Missing original text for some recipes (especially Greek sources)
- References to "De Re Coquinaria" for Apicius (incorrect)
- Missing ingredient links or improperly formatted links
- ✅ Duplicated recipes (oxyporium variants resolved)

## Priority Tasks
1. ✅ Fix permalinks on all recipes to follow "/recipes/recipe-name" format (completed March 2, 2025)
2. Add or fix "**Claude's intro:**" markers on all recipes
3. Update date formats to the standard for each source
4. Add missing introductions for recipes that lack them
5. Fix the structure of recipes that don't follow the template
6. ✅ Resolve duplicate recipes (particularly the oxyporium versions)

## Automation Support
Created Ruby scripts to automate fixing common issues:

### Recipe Format Fixer
```ruby
# Run script on a single file
_claude_memory/scripts/fix_recipe_format.rb --date-format _recipes/sample-recipe.md

# Or run on all recipes
find _recipes -type f -name "*.md" -exec _claude_memory/scripts/fix_recipe_format.rb --all {} \;
```

The script can fix:
- Date formats for Apicius and other sources
- Add bold to "Claude's intro:" markers
- Remove incorrect "De Re Coquinaria" references
- Fix section heading formats

### Permalink Standardizer
```ruby
# Standardize all permalinks to /recipes/recipe-name format
_claude_memory/scripts/fix_permalinks.rb
```

This script successfully updated all 118 recipe permalinks to use the consistent format `/recipes/recipe-name` without trailing slashes.

## Special Cases to Handle Manually
1. Recipes with TODO comments need particular attention:
   - parthian-lamb.md
   - pork-loin.md
   - soft-boiled-eggs.md
   - wild-boar-ofellae.md

2. Recipes completely missing introductions need new "**Claude's intro:**" paragraphs written:
   - rabbit.md
   - tripe.md
   - tuna-salad.md
   - salt-meat-stew.md

3. Duplicate recipes need consolidation:
   - columella-oxyporium.md and oxyporium-columella.md

## Statistics
- Recipes reviewed and tracked: ~140
- Recipes needing major revision: ~20
- Recipes with minor formatting issues: ~80
- Recipes with correct formatting: ~40
- Main issues: Missing "Claude's intro:" markers and incorrect date formats

The systematic review and consistent tracking will ensure all recipes eventually conform to the established standards while maintaining the historical accuracy and educational value of the collection.