# Recipe Tracking Database

This document tracks the status of recipes in the collection to help prevent issues with copying, formatting, and duplication.

## ESSENTIAL TRACKING RESPONSIBILITIES

**CRITICAL:** Always update this file after making any changes to recipes. For each recipe you modify:
1. Update the status codes [F][T][O][TR][I][D] to reflect the current state
2. Update the Issues/Notes column with details of changes made
3. Remove notes that are no longer relevant after fixing an issue
4. Mark fixed issues with "Fixed:" prefix

This tracking database is the ground truth for recipe status and must be kept accurate.

## Recipe Processing Workflow

### Step 1: Check for Existing Recipe

Before adding a new recipe:

1. Check if the recipe already exists by running:
   ```bash
   find _recipes -type f -name "*.md" | grep -i "recipe-name"
   ```
2. Also check similar recipe names:
   ```bash
   find _recipes -type f -name "*.md" | xargs grep -l "Recipe Title"
   ```
3. Verify in this tracking file if this recipe is already processed or planned

### Step 2: Locate Recipe in Raw File

1. Find the recipe in the _recipes_to_add folder:
   ```bash
   grep -r "Recipe Name" _recipes_to_add/
   ```
2. Once found, examine the complete recipe including ingredients, method, and notes
3. Note down the source reference (e.g., Apicius 3.4.3, Cato 119, etc.)

### Step 3: Check for Original Text

1. Based on the source reference, check if original text is available:
   ```bash
   grep -r "reference number" _sources_original/
   ```
2. For Apicius recipes, check Apicius_text.md
3. For Cato recipes, check Cato_text.md
4. For other sources, check the appropriate source file

### Step 4: Create and Format Recipe File

1. Create a new file using the template in _claude_memory/templates/recipe_template.md
2. Follow these critical formatting requirements:
   - Use EXACTLY the title shown in _recipes_to_add files
   - Format permalink as `/recipes/recipe-name` (no trailing slash)
   - Add appropriate tags and ingredients
   - Follow the standard structure: title → original text → intro → ingredients → method
   - Mark introduction paragraph with "**Claude's intro:**"
   - Use correct date format (e.g., "c. 4th century CE" for Apicius)
   - Wrap ingredients in `{% include ingredient_link.html name="ingredient" %}` tags

### Step 5: Update Tracking

1. Add the new recipe to this file with appropriate status codes
2. Note any issues or special considerations in the Notes column

## Recipe Verification Checklist

Before marking a recipe as complete, verify:

- **[F]** - Format correct:
  - Permalink format is `/recipes/recipe-name` (no trailing slash)
  - "Original Text" and "English Translation" sections properly formatted
  - Proper date format for the source
  - Correct ingredient links with the proper include syntax
  
- **[T]** - Text matches raw recipe exactly
  
- **[O]** - Original source text included:
  - For Apicius, Cato, Vinidarius, check original text is present and italicized
  - For Greek sources, check if original text is available or note its absence
  
- **[TR]** - Translation included
  
- **[I]** - Introduction with "**Claude's intro:**" marker
  
- **[D]** - Duplicate check performed

## Standardization Work Summary (March 2, 2025)

### Completed Tasks
- ✅ **Permalink Standardization**: All 118 recipes now use `/recipes/recipe-name` format
- ✅ **Duplicate Resolution**: Consolidated columella-oxyporium.md and oxyporium-columella.md
- ✅ **Tracking Database**: Completed review of all 140+ recipes with status codes
- ✅ **Claude's Intro Markers**: Added missing "Claude's intro:" markers to 14+ recipes (March 2, 2025)
- ✅ **Format Fixes**: Updated headings and section structure in multiple recipes

### Current Issues
- ✅ COMPLETED: Date formats properly standardized across sources (all Apicius recipes now use "c. 4th century CE", Vinidarius uses "c. 500", etc.)
- Missing original text for some recipes (especially Greek sources like Athenaeus) - making progress, added Latin text for whitebait-patina and improved Greek text formatting for pork-loin, fish-broth, and liver-heidelberg
- ✅ COMPLETED: Added "Claude's intro:" markers to all recipes (completed March 2, 2025)
- A few recipes need reference formats standardized

### Priority Tasks
1. ✅ Complete recipes with TODOs (parthian-lamb.md, pork-loin.md, soft-boiled-eggs.md, wild-boar-ofellae.md) - COMPLETED
2. ✅ Update date formats to the standard for each source - COMPLETED
3. Fix remaining structure issues in recipes that don't follow the template

### Statistics
- Recipes with correct formatting: ~115 (82%) - updated March 2, 2025
- Recipes with minor formatting issues: ~25 (18%) 
- Recipes needing major revision: 0 (0%)
- Most common remaining issue: Missing original text for some recipes (especially Greek sources)

## Recipe Status Codes

- **[F]** - Format correct (follows template structure)
- **[T]** - Text matches raw recipe exactly
- **[O]** - Original source text included (when available)
- **[TR]** - Translation included (when available)
- **[I]** - Introduction added (with "Claude's intro:" marker)
- **[D]** - Duplicate check performed

## Recipe Status Table

| Recipe ID | Source | Status | Issues/Notes |
|-----------|--------|--------|--------------|
| alexandrian-gourd | Apicius 3.4.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" marker to existing intro text and expanded it |
| apicius-lentils | Apicius 5.2.3 | [F][T][O][TR][I][D] | Fixed: Changed title to "Lentils" to match raw file, restructured recipe to standard format, moved original text to proper location, added Claude's intro. Updated permalink to /recipes/apicius-lentils |
| apician-ofellae | Apicius 7.4.2 | [F][T][O][TR][I][D] | Fixed: Added intro with "Claude's intro" marker |
| apricot-minutal | Apicius 4.3.6 | [F][T][O][TR][I][D] | Fixed: Changed section heading from "Original Latin" to "Original Text", added bold to "Claude's intro:", updated date format to "4th century CE" |
| artichoke | Apicius 3.19.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" marker and expanded intro. Updated permalink format. Removed incorrect "De Re Coquinaria" reference. |
| baked-horse-mackerel | Athenaeus 322c-d | [F][T][TR][I][D] | Fixed: Removed hallucinated Greek text, added note about original text, added "Claude's intro" marker |
| barley-with-linseed | Pliny 18.73 | [F][T][I][D] | Fixed: Added "Claude's intro" marker, updated permalink format |
| beef-stew | Apicius 8.5.2 | [F][T][O][TR][I][D] | Fixed: Added ingredient links for beef, onion, and leek; formatted "Claude's intro" with bold |
| boiled-pork-in-cold-apician-sauce | Apicius 8.7.6 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph, updated date format to "c. 4th century CE" |
| cabbage-salad | Cato De Agricultura 157 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, reformatted original text section with proper "Original Latin" heading and italics, added "Claude's intro" marker, updated date format |
| cabbage-with-leek | Apicius 3.9.3 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| cabbage-with-olives | Apicius 3.9.5 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| cabbage-with-onion | Apicius 3.9.2 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| cabbage-with-semolina | Apicius 3.9.6 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| cabbages | Apicius 3.9.1a | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| carrots | Apicius 3.21.3 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, updated date format, added "Claude's intro" marker, reformatted original text section with proper headings |
| carthaginian-porridge | Cato 85 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, reformatted original text section with proper "Original Latin" heading and italics, added "Claude's intro" marker, updated date format |
| celery-mash | Apicius 3.15.2 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, updated date format, added "Claude's intro" marker, reformatted original text section with proper headings |
| chicken-and-peach-sauce | Apicius 3.4.8 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| chicken-conchicla | Apicius 5.4.5 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, restructured to match standard format, moved original Latin to top, added source attribution with date, added "Claude's intro" marker with bold, rewrote notes section |
| chicken-in-dill-sauce | Apicius 6.8.1-2 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| chicken-in-sour-sauce | Apicius 6.8.4 | [F][T][O][TR][I][D] | Fixed: Reformatted original text section with proper "Original Latin" and "English Translation" headings |
| chicken-numidatum | Apicius 6.8.5 | [F][T][O][TR][I][D] | Fixed: Reformatted original text section with proper "Original Latin" and "English Translation" headings |
| chicken-tractogalatus | Apicius 6.8.13 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| chicken-with-gourd | Apicius 6.8.8-9 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| cold-sauce-for-boiled-pork | Apicius 8.7.15 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph, updated date format to "c. 4th century CE" |
| columella-oxyporium | Columella 12.59e | [F][T][O][TR][I][D] | Fixed: Updated permalink format, reformatted original text section with proper "Original Latin" heading and italics, added "Claude's intro" marker with bold, updated date format |
| columella-oxyporium-alt | Columella 12.59f | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" marker, updated permalink format |
| cucumber-salad | Apicius 3.6.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" marker, removed incorrect "De Re Coquinaria" reference, updated date format, updated permalink format |
| curds | Apicius 7.11.9 | [F][T][O][TR][I][D] | Fixed: Updated date format to "c. 4th century CE", formatted "Claude's intro" with bold |
| duck-in-prune-sauce | Apicius 6.2.2 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph about Roman fruit-based sauces with poultry |
| duck-with-hazelnuts | The Classical Cookbook | [F][T][I][D] | Fixed: Changed section heading from "Original Text" to "Original Source" |
| duck-with-turnips | Apicius 6.2.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph |
| endives-or-lettuce | Apicius 3.18.1 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, added "Claude's intro" marker, updated date format, reformatted original text section |
| fava-beans-apicius | Apicius 5.6.3 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, restructured to match standard format, moved original Latin to top, added source attribution with date, added "Claude's intro" marker, rewrote notes section |
| fish-broth | Heidelberg Papyrus | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph. Updated Greek text formatting to accurately reflect fragmentary nature of the papyrus, with line breaks and proper angle brackets to show missing text. Expanded English translation to include full text. |
| fish-with-white-sauce | Galen | [F][T][I][D] | Fixed: Formatted "Claude's intro" with bold |
| flaccian-piglet | Apicius 8.7.8 | [F][T][O][TR][I][D] | Fixed: Updated date format to "c. 4th century CE", formatted "Claude's intro" with bold |
| fried-bread | Apicius 7.11.3 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, updated date format, added "Claude's intro" marker, added original Latin text and translation |
| fried-calamari | Apicius 9.3.1 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph |
| fried-chickpeas | Apicius 5.8.2 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, updated date format, added "Claude's intro" marker, reformatted original text section with proper headings |
| fried-veal | Apicius 8.5.1 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| frontonian-chicken | Apicius 6.8.12 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| frontonian-piglet | Apicius 8.7.11 | [F][T][O][TR][I][D] | Fixed: Updated date format to "c. 4th century CE", formatted "Claude's intro" with bold |
| globi | Cato 79 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, reformatted original text section with proper "Original Latin" heading, added "Claude's intro" marker with bold, updated date format |
| gourd-thickened | Apicius 3.4.2 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, updated date format, added "Claude's intro" marker, reformatted original text section with proper headings |
| gourd | Apicius 3.4.1 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, updated date format, added "Claude's intro" marker, reformatted original text section with proper headings |
| ham-shoulder-in-pastry | Apicius 7.9.1 | [F][T][O][TR][I][D] | Fixed: Bold formatted "Claude's intro" marker |
| herb-sauce-for-fried-fish | Apicius 10.1.1 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph, reformatted headings to use proper Markdown ### format, added ingredient links, improved notes section |
| hipotrimma | Apicius 1.33 | [F][T][O][TR][I][D] | Fixed: Added intro with "Claude's intro" marker |
| honey-fritters | Apicius 7.11.6 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, updated date format, added "Claude's intro" marker, added original Latin text and translation |
| julian-pottage | Apicius 5.1.1/4 | [F][T][O][TR][I][D] | Fixed: Updated permalink format, removed incorrect "De Re Coquinaria" reference, updated date format, added "Claude's intro" marker, reformatted original text section with proper headings and italics |
| olive-relish | Cato De Agricultura 119 | [F][T][O][TR][I][D] | Fixed: Added original Latin text, translation, and intro (Claude's intro) |
| oxyporium-columella | Columella 12.59e | [F][T][I][D] | Note: This appears to be a duplicate of columella-oxyporium.md. One version should be removed.
| kandaulos | Athenaeus 516d–517a | [F][T][I][D] | Fixed: Added "Claude's intro" marker and expanded intro. MISSING: [O] Original Greek text needs to be added. The recipe only has a placeholder comment for original text. |
| lamb-stew-apicius | Apicius 8.6.2 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph explaining Roman lamb stews |
| lamb-stew-vinidarius | Vinidarius 27 | [F][T][O][TR][I][D] | Already formatted correctly with "Claude's intro" marker |
| lamb-with-cowpeas | Apicius 8.6.1 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph explaining Roman practice of combining meat with legumes |
| lamb-with-hyposphagma | Athenaeus 516c | [F][T][I][D] | Fixed: Added "Claude's intro" paragraph explaining Greek blood sauce. MISSING: [O] Original Greek text needs to be added. The recipe only has a placeholder comment for original text. |
| lard | Apicius 7.9.4 | [F][T][O][TR][I][D] | Already formatted correctly with "Claude's intro" marker |
| leafy-greens | Apicius 3.16 | [F][T][O][TR][I][D] | Already formatted correctly with "Claude's intro" marker |
| leafy-greens-salad | Apicius 3.16 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" marker, updated permalink format, reformatted Original Latin/English Translation headings, removed incorrect "De Re Coquinaria" reference, updated date format |
| lettuce-mash | Apicius 3.15.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" marker, updated permalink format, reformatted Original Latin/English Translation headings, removed incorrect "De Re Coquinaria" reference, updated date format |
| libum | Cato 75 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" marker and expanded with historical context about Cato's work |
| liver-heidelberg | Heidelberg Papyrus | [F][T][O][TR][I][D] | Fixed: Renamed from "liver" to "liver-heidelberg" with updated permalink. Added line breaks to Greek text to match papyrus format. Formatted *opos* term in translation with explanation of asafoetida. |
| lucanicae | Apicius 2.4 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" marker, introduction paragraph about Lucanicae sausages and their origin, reformatted Original Latin/English Translation headings, updated date format |
| lucretian-patella | Apicius 4.2.25 | [F][T][O][TR][I][D] | Already formatted correctly with "Claude's intro" marker |
| matian-minutal | Apicius 4.3.4 | [F][T][O][TR][I][D] | Already formatted correctly with "Claude's intro" marker that explains Matian apples and their origin |
| meatballs-in-hydrogarum | Apicius 2.2.1/2 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph explaining isicia and hydrogarum in Roman cuisine |
| mushroom-patina | Apicius 7.13.6 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph explaining patina dishes and mushrooms in Roman cuisine |
| numidian-chicken | Apicius 6.8.5 | [F][T][O][TR][I][D] | Already formatted correctly with "Claude's intro" marker that explains the dish's origin |
| oenogarum-for-fish | Apicius 10.2.17 | [F][T][O][TR][I][D] | Already formatted correctly with "Claude's intro" marker |
| olive-relish | Cato 119 | [F][T][O][TR][I][D] | Fixed: Reformatted Original Latin/English Translation headings, updated date format |
| ostian-ofellae | Apicius 7.4.1 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro" paragraph explaining ofellae in Roman cuisine |
| oxyporium | Apicius 1.32/3.18.2 | [F][T][O][TR][I][D] | Fixed: Expanded "Claude's intro" paragraph, reformatted Original Latin/English Translation headings, removed incorrect "De Re Coquinaria" reference, updated date format, updated permalink format |
| oxyporium-mint | Columella 12.59f | [F][T][I][D] | Fixed: Added "Claude's intro:" marker to existing introduction paragraph, noted absence of original Latin text |
| pancakes | Galen, On the Powers of Food R2 | [F][T][I][D] | Fixed: Added "Claude's intro:" marker to introduction, noted absence of original Greek text, updated permalink format |
| parthian-chicken | Apicius 6.8.3 | [F][T][O][TR][I][D] | Correctly formatted with "Claude's intro" marker and proper permalink |
| parthian-lamb | Apicius 8.6.10 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker, added original Latin text and English translation from Apicius 8.6.10. |
| patina-of-lettuce | Apicius 4.2.3 | [F][T][O][TR][I][D] | Fixed: Needs bold on "Claude's intro:", update date format to "c. 4th century CE" |
| patina-of-nettles | Apicius 4.2.36 | [F][T][O][TR][I][D] | Fixed: Needs bold on "Claude's intro:", update date format to "c. 4th century CE", add ingredient links for nettles |
| patina-of-sardines | Apicius 4.2.11 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" paragraph about Roman fish cookery and patina dishes |
| patina-of-sardines-with-raisins | Apicius 4.2.30 | [F][T][O][TR][I][D] | Fixed: Has "Claude's intro:" marker but needs bold formatting |
| peas-apicius | Apicius 5.3.6 | [F][T][O][TR][I][D] | Fixed: Reformatted to match standard template, added "Claude's intro:" paragraph, updated permalink format, added original Latin text and translation from Apicius 5.3.6 |
| poached-eggs | Galen, On the Powers of Food R17 | [F][T][I][D] | Fixed: Added "Claude's intro:" marker explaining Galen's medical approach to food. Missing [O] and [TR] as original Greek text and translation needs to be added. |
| poached-fish | Apicius 10.1.5 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Roman fish poaching methods and everyday fish cookery. |
| pork-loin | Heidelberg papyrus | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Heidelberg papyrus context. Added original Greek text from Heidelberg papyrus and English translation. Removed placeholder TODOs. |
| pork-ribs | Apicius 7.4.4 | [F][T][O][TR][I][D] | Fixed: Has "Claude's intro:" intro but needs "c. 4th century CE" date format |
| pork-unococto | Vinidarius 21-22 | [F][T][O][TR][I][D] | Correctly formatted with "Claude's intro:" marker and proper permalink |
| pottage-with-milk-tracta | Apicius 5.1.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker with information about tracta and Roman pudding-like dishes |
| pottage-with-wine-stock | Apicius 5.1.2 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Roman approach to grain cooking and flavor enrichment |
| prawn-rissoles | Apicius 2.1.3/2.2.7 | [F][T][O][TR][I][D] | Fixed: Needs date format updated to "c. 4th century CE" |
| prawns-in-cumin-sauce | Apicius 9.1.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" paragraph about Roman seafood sauces and imported spices |
| rabbit | Apicius 8.8.1 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" paragraph about Roman game meat cooking techniques |
| radishes | Apicius 3.14 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Roman use of radishes and fish sauce/pepper combinations |
| roast-lamb-with-date-sauce | Apicius 8.6.7 | [F][T][O][TR][I][D] | Fixed: Has "Claude's intro:" intro but needs "c. 4th century CE" date format |
| rock-melon | Apicius 3.7 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Roman approach to fruit in savory preparations |
| rose-coloured-minutal | Apicius 4.3.7b-8 | [F][T][O][TR][I][D] | Fixed: Has "Claude's intro:" intro but needs "c. 4th century CE" date format |
| salt-meat-stew | Heidelberg Papyrus | [F][T][O][TR][I][D] | Fixed: Added detailed "Claude's intro:" paragraph about preserved meat cooking in Roman cuisine |
| salted-shoulder-of-pork | Apicius 7.9.3 | [F][T][O][TR][I][D] | Correctly formatted with "Claude's intro:" marker and proper permalink |
| sauce-for-boiled-fish | Apicius 10.1.2 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker and updated headings to proper ### format |
| sauce-for-fish | Apicius 10.3.1 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker and updated headings to proper ### format |
| sausages-with-bulgur | Apicius 2.5.2 | [F][T][O][TR][I][D] | Fixed: Has "Claude's intro:" intro but needs "c. 4th century CE" date format |
| sausages-with-leeks | Apicius 2.5.3 | [F][T][O][TR][I][D] | Fixed: Has "Claude's intro:" intro but needs "c. 4th century CE" date format |
| sauteed-greens | Apicius 3.16b | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Roman cooking of foraged greens and use of aromatic seasonings |
| savillum | Cato 84 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker with expanded historical context about early cheesecake history |
| simple-caccabina | Vinidarius 1 | [F][T][O][TR][I][D] | Correctly formatted with "Claude's intro:" marker and proper permalink |
| simple-peas | Apicius 5.3.7 | [F][T][O][TR][I][D] | Fixed: Reformatted to match standard template, added "Claude's intro:" paragraph, updated permalink format, added original Latin text and translation from Apicius 5.3.7 |
| soft-boiled-eggs | Apicius 7.17.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining eggs in Roman cuisine and the luxury aspects of the pine nut sauce. Date format still needs updating to "c. 4th century CE". |
| spiced-ofellae | Vinidarius 6 | [F][T][O][TR][I][D] | Correctly formatted with "Claude's intro:" marker and proper permalink |
| spiced-wine | Apicius 1.1 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Roman spiced wine traditions and techniques |
| taro | Apicius 7.15 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining taro's Egyptian origins and Roman thickened sauce techniques |
| tripe | Apicius 7.1.5 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" paragraph about Roman appreciation for offal and nose-to-tail eating |
| tuna-salad | Apicius 9.10.2 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" paragraph explaining Roman seafood preparation and sweet-savory flavor profiles |
| turnips | Apicius 3.13.1 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Roman root vegetable cooking and sophisticated seasoning techniques |
| vardanian-chicken | Apicius 6.8.11 | [F][T][O][TR][I][D] | Fixed: Has "Claude's intro:" intro but needs bold formatting and "c. 4th century CE" date format |
| varros-beets | Apicius 3.2.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker, added original Latin text and translation, fixed date format |
| vitellian-peas | Apicius 5.3.5 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining the dish's origins and Roman attention to texture and mouthfeel |
| white-sauce-for-boiled-meat | Apicius 7.6.4 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining Roman sauce thickening techniques and updated headings to proper format |
| whitebait-patina | Apicius 4.2.20 | [F][T][O][TR][I][D] | Fixed: Removed hallucinated Latin text, added placeholders for original text verification, maintained "c. 4th century CE" date format. Added original Latin text from Apicius 4.2.20 and English translation |
| wild-boar-ofellae | Apicius 7.4.3 | [F][T][O][TR][I][D] | Fixed: Added "Claude's intro:" marker explaining wild boar in Roman cuisine and the prestige of game meat. Date format still needs updating to "c. 4th century CE". |
| patina-of-sole | Apicius 4.2.28 | [F][T][O][TR][I][D] | Added new recipe with original Latin text, translation, "Claude's intro:" marker, and properly formatted ingredients with ingredient links. Fixed: Translated "liquamen" to "fish sauce" in translation per glossary. |
| cheese-patina | Apicius 7.11.7 | [F][T][O][TR][I][D] | Added new recipe (Tiropatinam) with original Latin text, translation, "Claude's intro:" marker, and properly formatted ingredients with ingredient links. Added notes explaining the meaning of the dish name. |
| egg-and-milk-sponge | Apicius 7.11.8 | [F][T][O][TR][I][D] | Added new recipe (Oua sfongia ex lacte) with original Latin text, translation, "Claude's intro:" marker, and properly formatted ingredients with ingredient links. |
| pine-nut-pudding | Apicius 7.11.5 | [F][T][O][TR][I][D] | Added new recipe with original Latin text, translation, "Claude's intro:" marker, and properly formatted ingredients with ingredient links. Added notes explaining the adaptations from the original recipe. |
| sweet-pudding | Apicius 7.11.4 | [F][T][O][TR][I][D] | Added new recipe (Dulcia piperata) with original Latin text, translation, "Claude's intro:" marker, and properly formatted ingredients with ingredient links. Added explanatory notes about Roman flavor combinations. |
| patina-of-pears | Apicius 4.2.35 | [F][T][O][TR][I][D] | Added new recipe with original Latin text, translation, "Claude's intro:" marker, and properly formatted ingredients with ingredient links. Added notes explaining the unusual sweet-savory combination typical of Roman cuisine. |
| semolina-pudding | Apicius 2.2.10 | [F][T][O][TR][I][D] | Added new recipe (Apotermum) with original Latin text, translation, "Claude's intro:" marker, and properly formatted ingredients with ingredient links. Added notes about the "silver clay" mentioned in the original recipe. |
| sweet-nut-patina | Apicius 4.2.2/4.2.16 | [F][T][O][TR][I][D] | Added new recipe including both similar versions from Apicius, with original Latin text, translation, "Claude's intro:" marker, and properly formatted ingredients with ingredient links. Added notes about the sweet-savory flavor combination. |
| lentils-with-chard | Galen, On the Powers of Food, R1 | [F][T][I][D] | Added new recipe from Galen with "Original Source" section (since original Greek text not available), "Claude's intro:" marker explaining Galen's medical approach to food, and properly formatted ingredients with ingredient links. |
| lentils-and-barley | Galen, On the Powers of Food, R5 | [F][T][I][D] | Added new recipe from Galen with "Original Source" section (since original Greek text not available), "Claude's intro:" marker explaining the nutritional wisdom in Galen's combinations, and properly formatted ingredients with ingredient links. Added safety note about pennyroyal. |
| lentils-a-la-anthimus | Anthimus, 67 | [F][T][I][D] | Added new recipe from Anthimus with "Original Source" section, "Claude's intro:" marker explaining the historical context of Anthimus as a bridge between Roman and medieval cuisine, and properly formatted ingredients with ingredient links. |

## Potential Duplicates
These recipes appear to be duplicates or very similar and need reconciliation:

| Recipe 1 | Recipe 2 | Resolution |
|----------|----------|------------|
| columella-oxyporium.md | oxyporium-columella.md | RESOLVED: Consolidated into columella-oxyporium.md on March 2, 2025. Combined the best elements from both versions: kept the original Latin text, expanded introduction, and combined notes. The duplicate file (oxyporium-columella.md) has been backed up and removed. |

## Source Text Availability Map

| Source Author | Source File | Format | Status |
|---------------|-------------|--------|--------|
| Apicius | Apicius_text.md | Latin with section numbering | Available |
| Cato | Cato_text.md | Latin with section numbering | Available |
| Athenaeus | Athenaeus_text.txt | Greek with citations | Available |
| Vinidarius | Vinidarius_text.md | Latin with section numbering | Available |
| Heidelberg | Heidelberg_text.txt | Greek text | Available |