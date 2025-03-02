# CLAUDE.md - Guidelines for Classical Recipes Jekyll Website

## Development Commands
- Run local server: `bundle exec jekyll serve`
- Build site: `bundle exec jekyll build`
- Clean build: `bundle exec jekyll clean`
- Update dependencies: `bundle update github-pages`

## File Management
- For large file processing: `sed -n '[START_LINE],$p' file > newfile` to extract remaining lines
- For batch recipe processing: `mv newfile oldfile` to replace with processed version
- Delete processed content with: `head -n [LINE_NUMBER] file | grep -v "pattern" > newfile`

## Recipe Management System
- Location: `_claude_memory/` directory
- Key files:
  - [`_claude_memory/recipe_tracking.md`](/_claude_memory/recipe_tracking.md): Status tracking for all recipes
  - [`_claude_memory/recipe_workflow.md`](/_claude_memory/recipe_workflow.md): Step-by-step processing instructions
  - [`_claude_memory/recipe_database.json`](/_claude_memory/recipe_database.json): Structured data for recipes
  - [`_claude_memory/translation_glossary.md`](/_claude_memory/translation_glossary.md): Standard translations for Latin terms
  - [`_claude_memory/templates/recipe_template.md`](/_claude_memory/templates/recipe_template.md): Standard recipe template

### Recipe Processing Workflow
1. **Check for Duplicates**: Always verify if recipe already exists
   ```bash
   find _recipes -type f -name "*.md" | grep -i "recipe-name"
   ```
2. **Find Source Recipe**: Locate in _recipes_to_add directory
   ```bash
   grep -r "Recipe Name" _recipes_to_add/
   ```
3. **Check Original Text**: Look for source text in appropriate file
   ```bash
   grep -r "reference number" _sources_original/
   ```
4. **Create and Format File**: Create from template and follow [status checklist](/_claude_memory/recipe_workflow.md#recipe-verification)
5. **Update Tracking**: Add the recipe to [recipe_tracking.md](/_claude_memory/recipe_tracking.md) with appropriate status codes and notes about changes made

### Recipe Tracking and Updates
- ALWAYS update _claude_memory/recipe_tracking.md after making changes to a recipe
- Use the established status codes:
  - **[F]** - Format correct (follows template structure)
  - **[T]** - Text matches raw recipe exactly
  - **[O]** - Original source text included (when available)
  - **[TR]** - Translation included (when available)
  - **[I]** - Introduction added (with "Claude's intro:" marker)
  - **[D]** - Duplicate check performed
- Document all changes made in the "Issues/Notes" column
- When fixing recipes, proceed alphabetically for systematic progress
- Append newly processed recipes to the tracking table in alphabetical order

### Memory Management
- Update tags list: `find _recipes -type f -name "*.md" | xargs grep -h "^tags:" | sort | uniq > _claude_memory/tags/known_tags.txt`
- Check existing tags: `grep -i "keyword" _claude_memory/tags/known_tags.txt`
- Update ingredients list: `find _recipes -type f -name "*.md" | xargs grep -h "^ingredients:" | sort | uniq > _claude_memory/ingredients/known_ingredients.txt`

## Recipe Format Guidelines
- YAML frontmatter required: layout, title, tags, ingredients, permalink
- Title format:
  - Use EXACTLY the title as shown in _recipes_to_add files
  - Match the title precisely as it appears in the raw recipe file
  - Don't modify titles by adding or removing words
- Tags should use established prefixes: era:, source:, technique:
- Important tag categories:
  - Source tags: `source:apicius`, `source:vinidarius`, `source:athenaeus`, `source:cato`, etc.
  - Era tags: `era:roman_empire`, `era:greek`, etc.
  - Category tags: `meat`, `lamb`, `sauce`, `ofellae`, etc.
- Source attribution:
  - NEVER refer to Apicius as "De Re Coquinaria" - this is not its real name
  - Use just "Apicius" without additional titles
  - The standard format is: —*Apicius*, 3.19.3, c. 4th century CE
- Always wrap ingredients in `{% include ingredient_link.html name="ingredient" %}` tags
- Permalink and filename requirements:
  - Filenames should include the source for specificity (e.g., "apicius-lentils.md" not just "lentils.md")
  - Permalink MUST match the filename (e.g., "/recipe-index/apicius-lentils.html")
  - Even if the title is simple (e.g., "Lentils"), keep the filename and permalink specific
  - This prevents clashes when multiple sources have recipes with the same basic name
- Format structure:
  1. Title (# Heading)
  2. Original Text section (with Latin/Greek and translation)
  3. Source attribution line with author, reference, and date
  4. Horizontal rule (`___`)
  5. Intro paragraph with "**Claude's intro:**" marker
  6. Ingredients section (### Ingredients)
  7. Method section (### Method)
  8. Optional Notes section (### Notes)
- Always mark your introductions with "**Claude's intro:**" to distinguish them from human-written content
- COPY RECIPE CONTENT EXACTLY from the raw recipes in _recipes_to_add
- Use semantic Markdown headings (# for title, ### for sections)
- Wrap recipe content in `{% capture recipe_content %}` and `{% endcapture %}` tags
- End with `{{ recipe_content | markdownify }}`
- When adding a new ingredient, also add an entry to ingredients.md
- When adding multiple recipes of a specific category, consider creating a tag file in _tags/
- For Latin text translations, maintain consistent translation style using _claude_memory/translation_glossary.md
- Always ask about unfamiliar technical terms when adding original Latin text
- Always verify if original source text is available before attempting translation

## Original Text Guidelines
- ONLY add original language text for recipes from:
  - Apicius (check _sources_original/Apicius_text.md)
  - Cato (check _sources_original/Cato_text.md)
  - Heidelberg papyrus (check _sources_original/Heidelberg_text.txt)
  - Vinidarius (check _sources_original/Vinidarius_text.md)
- DO NOT attempt to reconstruct original text for Athenaeus or other sources not in the _sources_original directory
- Use "Original Latin" or "Original Greek" as the heading, as appropriate
- Follow with "English Translation" heading for the translated text
- When original text is not available, note this under the appropriate heading
- Format original text in italics, but not the translation
- For Apicius, include book number, chapter, and recipe (e.g., Apicius 7.1.5)
- For Vinidarius, include recipe number (e.g., Vinidarius 8)

## Code Style
- Use consistent 2-space indentation for all files
- Maintain blank line between YAML frontmatter and content
- Use British English for recipe content
- Comment placeholders with <!-- TODO: notes -->
- Organize recipes in _recipes/ directory with kebab-case filenames
- Place new recipes to process in _recipes_to_add/ directory

## Site Features
- Recipe filtering: The recipes.html page filters by source, era, category, and ingredients
- Tag format helper: The format_tag.html include removes prefixes and formats tag display
- Ingredients page: Each ingredient has an anchor link (#ingredient-name) and description
- Tag pages: Tag-specific pages can be created in _tags/ directory