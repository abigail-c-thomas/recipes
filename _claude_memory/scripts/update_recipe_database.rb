#!/usr/bin/env ruby

require 'json'
require 'yaml'
require 'fileutils'

# Paths
RECIPES_DIR = File.expand_path('../../_recipes', __dir__)
RECIPES_TO_ADD_DIR = File.expand_path('../../_recipes_to_add', __dir__)
SOURCES_DIR = File.expand_path('../../_sources_original', __dir__)
DB_PATH = File.expand_path('../../_claude_memory/recipe_database.json', __dir__)

# Load existing database or create a new one
def load_database
  if File.exist?(DB_PATH)
    JSON.parse(File.read(DB_PATH))
  else
    {
      "schema_version" => "1.0",
      "last_updated" => Time.now.strftime("%Y-%m-%d"),
      "recipes" => []
    }
  end
end

# Extract frontmatter from a markdown file
def extract_frontmatter(file_path)
  content = File.read(file_path)
  if content =~ /\A---\s*\n(.*?)\n---\s*\n/m
    YAML.safe_load($1)
  else
    {}
  end
end

# Check if a recipe has original text
def has_original_text(file_path)
  content = File.read(file_path)
  # Look for content between "### Original Text" and the next section, excluding TODO comments
  if content =~ /### Original Text\s*\n(.*?)(?=\n###|\n---|\n\{\%)/m
    text = $1.strip
    return !text.empty? && !text.include?('TODO') && !text.match?(/<!--.*-->/)
  end
  false
end

# Check if a recipe has a translation
def has_translation(file_path)
  content = File.read(file_path)
  # Check if there's content after "### Original Text" that appears to be a translation
  if content =~ /### Original Text\s*\n.*?\n\n(.*?)(?=\n###|\n---|\n\{\%)/m
    translation = $1.strip
    return !translation.empty? && !translation.include?('TODO') && !translation.match?(/<!--.*-->/)
  end
  false
end

# Check if a recipe has a Claude intro
def has_claude_intro(file_path)
  content = File.read(file_path)
  content.include?("Claude's intro:")
end

# Check if a recipe has a human intro
def has_human_intro(file_path)
  content = File.read(file_path)
  # If there's content between horizontal rule and ingredients section, and it's not Claude's intro
  if content =~ /___\s*\n\s*(.*?)(?=\n### Ingredients)/m
    intro = $1.strip
    return !intro.empty? && !intro.include?('TODO') && !intro.match?(/<!--.*-->/) && !intro.include?("Claude's intro:")
  end
  false
end

# Determine source information
def determine_source(file_path)
  content = File.read(file_path)
  source = { "text_available" => false }
  
  # Extract source attribution
  if content =~ /—\*(.*?)\*,\s*(.*?)(?:,\s*c\.\s*(.*?))?(?:\n|$)/
    source["author"] = $1.strip
    source["reference"] = $2.strip
    source["date"] = "c. #{$3.strip}" if $3
    
    # Determine if source text is available
    case source["author"].downcase
    when "apicius"
      source["text_available"] = true
      source["text_location"] = "_sources_original/Apicius_text.md"
    when "cato"
      source["text_available"] = true
      source["text_location"] = "_sources_original/Cato_text.md"
    when "athenaeus"
      source["text_available"] = true
      source["text_location"] = "_sources_original/Athenaeus_text.txt"
    when "vinidarius"
      source["text_available"] = true
      source["text_location"] = "_sources_original/Vinidarius_text.md"
    when "heidelberg"
      source["text_available"] = true
      source["text_location"] = "_sources_original/Heidelberg_text.txt"
    end
  end
  
  source
end

# Create a recipe entry for the database
def create_recipe_entry(file_path)
  basename = File.basename(file_path, '.md')
  frontmatter = extract_frontmatter(file_path)
  
  entry = {
    "id" => basename,
    "title" => frontmatter["title"] || basename.tr('-', ' ').capitalize,
    "file_path" => file_path.sub(File.expand_path('../..', __dir__) + '/', ''),
    "permalink" => frontmatter["permalink"] || "/recipe-index/#{basename}.html",
    "source" => determine_source(file_path),
    "status" => {
      "has_original_text" => has_original_text(file_path),
      "has_translation" => has_translation(file_path),
      "has_modernized_recipe" => true, # Assume existing recipes have modernized recipes
      "has_claude_intro" => has_claude_intro(file_path),
      "has_human_intro" => has_human_intro(file_path),
      "complete" => false # Will update this later
    },
    "tags" => frontmatter["tags"] || [],
    "ingredients" => frontmatter["ingredients"] || []
  }
  
  # Determine if recipe is complete (has all necessary components)
  if entry["source"]["text_available"]
    entry["status"]["complete"] = entry["status"]["has_original_text"] && 
                                 entry["status"]["has_translation"] && 
                                 entry["status"]["has_modernized_recipe"] && 
                                 (entry["status"]["has_claude_intro"] || entry["status"]["has_human_intro"])
  else
    entry["status"]["complete"] = entry["status"]["has_modernized_recipe"] && 
                                 (entry["status"]["has_claude_intro"] || entry["status"]["has_human_intro"])
  end
  
  entry
end

# Scan all recipe files and update the database
def update_database
  db = load_database
  existing_ids = db["recipes"].map { |r| r["id"] }
  
  # Scan existing recipes directory
  Dir.glob(File.join(RECIPES_DIR, '*.md')).each do |file_path|
    basename = File.basename(file_path, '.md')
    
    if existing_ids.include?(basename)
      # Update existing entry
      index = db["recipes"].find_index { |r| r["id"] == basename }
      db["recipes"][index] = create_recipe_entry(file_path)
    else
      # Add new entry
      db["recipes"] << create_recipe_entry(file_path)
    end
  end
  
  # Update last_updated timestamp
  db["last_updated"] = Time.now.strftime("%Y-%m-%d")
  
  # Write updated database
  FileUtils.mkdir_p(File.dirname(DB_PATH))
  File.write(DB_PATH, JSON.pretty_generate(db))
  
  puts "Recipe database updated successfully with #{db['recipes'].size} recipes."
  puts "Complete recipes: #{db['recipes'].count { |r| r['status']['complete'] }}"
  puts "Incomplete recipes: #{db['recipes'].count { |r| !r['status']['complete'] }}"
end

# Run the update
update_database