# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands
- Start development server: `bundle exec jekyll serve`
- Build site: `bundle exec jekyll build`
- Auto-rebuild with live reload: `bundle exec jekyll serve --livereload`

## Style Guidelines
- **Markup**: Follow Jekyll Liquid template syntax
- **CSS**: Use BEM methodology for component classes
- **JS**: Vanilla JavaScript with camelCase naming
- **Markdown**: Use front matter for Jekyll metadata
- **Recipe Format**: 
  - Use metric units in recipe content
  - Follow template-recipe.md structure
  - Use recipe-card.html include for rendering recipes

## Content Guidelines
- Preserve existing text content exactly when formatting or editing
- Do not modify recipe translations or add notes to recipe content
- Unit conversion is handled in JS, always use metric in source files

## Conventions
- Recipe files: Placed in `/recipes/` with hyphenated lowercase names
- Always use relative URLs with `{{ "/path" | relative_url }}`
- Component JavaScript: Place in `/js/` folder
- Component CSS: Place in `/css/` folder
- Use HTML comments for template documentation

## Recipe Organization
- **Recipe Tags**:
  - `source`: Historical source of the recipe (apicius, vinidarius, etc.)
  - `dish_type`: Ancient categorization (poultry, ofellae, eggs, etc.)
  - `modern_course`: Modern meal categorization (appetizer, main, dessert, etc.)
- **Organization Structure**:
  - `/sources/`: Pages for historical sources
  - `/dishes/`: Pages for ancient dish types
  - `/courses/`: Pages for modern meal courses
  - `/ingredients/`: Pages for key ingredients
  - `/_data/sources.yml`: Data file for source categories
  - `/_data/courses.yml`: Data file for modern course categories
- **Components**:
  - `category-nav.html`: Used for expandable category navigation on the home page

## Project Context
- Working towards MVP with focus on simple content organization
- Optimize for easy recipe input with metric units and automated conversion
- User is a professional OCaml/Mercurial developer learning Jekyll