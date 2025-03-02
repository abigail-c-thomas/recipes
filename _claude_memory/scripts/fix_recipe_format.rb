#!/usr/bin/env ruby

# Script to fix common formatting issues in recipe files
# Usage: ruby fix_recipe_format.rb [options] file1 file2 ...
# Options:
#   --permalink-format: Fix permalinks to use /recipe-index/name format
#   --date-format: Fix date formats to use "c. 4th century CE" for Apicius, etc.
#   --add-claude-intro: Add bold to "Claude's intro:" markers
#   --remove-de-re: Remove incorrect "De Re Coquinaria" references
#   --fix-headings: Fix section headings to use proper ### format

require 'optparse'

options = {
  permalink_format: false,
  date_format: false, 
  add_claude_intro: false,
  remove_de_re: false,
  fix_headings: false
}

parser = OptionParser.new do |opts|
  opts.banner = "Usage: fix_recipe_format.rb [options] file1 file2 ..."

  opts.on("--permalink-format", "Fix permalinks to use /recipe-index/name format") do
    options[:permalink_format] = true
  end

  opts.on("--date-format", "Fix date formats to use 'c. 4th century CE' for Apicius, etc.") do 
    options[:date_format] = true
  end

  opts.on("--add-claude-intro", "Add bold to 'Claude's intro:' markers") do
    options[:add_claude_intro] = true
  end

  opts.on("--remove-de-re", "Remove incorrect 'De Re Coquinaria' references") do
    options[:remove_de_re] = true
  end

  opts.on("--fix-headings", "Fix section headings to use proper ### format") do
    options[:fix_headings] = true
  end

  opts.on("-a", "--all", "Apply all fixes") do
    options[:permalink_format] = true
    options[:date_format] = true
    options[:add_claude_intro] = true
    options[:remove_de_re] = true
    options[:fix_headings] = true
  end
end

parser.parse!

if ARGV.empty?
  puts "Error: No files specified"
  puts parser.help
  exit 1
end

ARGV.each do |filename|
  begin
    content = File.read(filename)
    original_content = content.dup
    
    # Fix date format
    if options[:date_format]
      # Update Apicius date format to "c. 4th century CE"
      content.gsub!(/—\*Apicius\*,\s+([^,]+),\s+c\.\s+350/, '—*Apicius*, \1, c. 4th century CE')
      content.gsub!(/—\*Apicius\*,\s+([^,]+),\s+350/, '—*Apicius*, \1, c. 4th century CE')
      content.gsub!(/—\*Apicius\*,\s+([^,]+),\s+4th-5th century CE/, '—*Apicius*, \1, c. 4th century CE')
    end
    
    # Add bold to "Claude's intro:" markers
    if options[:add_claude_intro]
      content.gsub!(/Claude's intro:/, '**Claude\'s intro:**')
      # Fix double-bolded intros (in case already bolded)
      content.gsub!(/\*\*\*\*Claude's intro:\*\*\*\*/, '**Claude\'s intro:**')
    end
    
    # Remove "De Re Coquinaria" references
    if options[:remove_de_re]
      content.gsub!(/—\*Apicius\*,\s+\*De Re Coquinaria\*\s+([^,]+),/, '—*Apicius*, \1,')
    end
    
    # Fix permalink format
    if options[:permalink_format]
      # Extract the filename without path and extension
      base_filename = File.basename(filename, ".md")
      
      # Update permalink to /recipe-index/name format without .html extension
      if content =~ /permalink: .*recipes.*\/+$/
        content.gsub!(/permalink: \/recipes\/[^\/]*\/$/m, "permalink: /recipe-index/#{base_filename}")
      elsif content =~ /permalink: .*recipes.*/
        content.gsub!(/permalink: \/recipes\/[^\/\n]*/m, "permalink: /recipe-index/#{base_filename}")
      elsif content =~ /permalink: .*recipe-index.*\.html/
        content.gsub!(/permalink: \/recipe-index\/[^\.]*\.html/m, "permalink: /recipe-index/#{base_filename}")
      end
    end
    
    # Fix section headings to use proper ### format
    if options[:fix_headings]
      content.gsub!(/\*\*Ingredients\*\*\s*\n/, "### Ingredients\n")
      content.gsub!(/\*\*Method\*\*\s*\n/, "### Method\n")
      content.gsub!(/\*\*Notes\*\*\s*\n/, "### Notes\n")
    end
    
    # Only write back if changes were made
    if content != original_content
      File.write(filename, content)
      puts "Fixed: #{filename}"
    else
      puts "No changes needed for: #{filename}"
    end
  rescue => e
    puts "Error processing #{filename}: #{e.message}"
  end
end

puts "Done!"