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

## Memory System
- Location: `_claude_memory/` directory
- Contains: templates, tag lists, ingredient lists
- Template usage: See `_claude_memory/README.md` for sed commands
- Update memory: Run `find _recipes -type f -name "*.md" | xargs grep -h "^tags:" | sort | uniq > _claude_memory/tags/known_tags.txt`
- Check for existing elements: `grep -i "keyword" _claude_memory/tags/known_tags.txt`

## Recipe Format Guidelines
- YAML frontmatter required: layout, title, tags, ingredients, permalink
- Tags should use established prefixes: era:, source:, technique:
- Important tag categories:
  - Source tags: `source:apicius`, `source:vinidarius`, `source:athenaeus`, `source:cato`, etc.
  - Era tags: `era:roman_empire`, `era:greek`, etc.
  - Category tags: `meat`, `lamb`, `sauce`, `ofellae`, etc.
- Always wrap ingredients in `{% include ingredient_link.html name="ingredient" %}` tags
- Use semantic Markdown headings (# for title, ### for sections)
- Wrap recipe content in `{% capture recipe_content %}` and `{% endcapture %}` tags
- End with `{{ recipe_content | markdownify }}`
- When adding a new ingredient, also add an entry to ingredients.md
- When adding multiple recipes of a specific category, consider creating a tag file in _tags/

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