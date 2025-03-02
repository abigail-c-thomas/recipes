# Recipe Standardization - March 2, 2025 Update

## Permalink Standardization Complete

Today I successfully standardized all recipe permalinks in the collection to follow a consistent format:

```
/recipes/recipe-name
```

This update:

1. Changed 118 files total
2. Converted three different formats to a single standard:
   - From `/recipe-index/recipe-name/` (with trailing slash) - 1 file
   - From `/recipe-index/recipe-name` (no trailing slash) - 106 files
   - From `/recipes/recipe-name/` (with trailing slash) - 12 files

3. Fixed two recipes with corrupt permalinks containing partial ingredient tags:
   - varros-beets.md - Added missing structure (title, intro, ingredients)
   - whitebait-patina.md - Added missing structure and intro

## Documentation Updates

1. Updated `CLAUDE.md` with the new permalink standard
2. Updated `recipe_improvements.md` to mark permalink standardization as complete
3. Added script `fix_permalinks.rb` to the codebase for future use

## Next Priority Tasks

1. Add or fix "**Claude's intro:**" markers on all recipes
2. Update date formats to the standard for each source (e.g., "c. 4th century CE" for Apicius)
3. Add missing introductions for recipes that lack them

## Benefits of Standardization

The consistent permalink structure will:
- Improve site navigation 
- Make URL patterns more predictable for users
- Simplify linking between recipes
- Prepare for any future site reorganization

All these changes are part of the ongoing effort to ensure the historical recipe collection maintains professional quality and consistency across all entries.