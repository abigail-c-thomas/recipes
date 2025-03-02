#!/usr/bin/env ruby

# Function to standardize permalinks to /recipes/recipe-name (no trailing slash)
def fix_permalink(file_path)
  content = File.read(file_path)
  filename = File.basename(file_path, ".md")
  
  # Skip files that don't have frontmatter
  return false unless content.start_with?("---")
  
  # Check if there's a permalink
  if content =~ /permalink:\s*([^\n]+)/
    current_permalink = $1.strip
    
    # Extract the recipe name part - we'll use the filename as it's more reliable
    recipe_name = filename
    
    # Create new permalink format
    new_permalink = "/recipes/#{recipe_name}"
    
    # Only update if it's different
    if new_permalink != current_permalink
      puts "#{filename}: Changing permalink from '#{current_permalink}' to '#{new_permalink}'"
      
      # Replace the permalink
      new_content = content.gsub(/permalink:\s*[^\n]+/, "permalink: #{new_permalink}")
      
      # Write updated content back to file
      File.write(file_path, new_content)
      return true
    end
  else
    puts "#{filename}: No permalink found!"
  end
  
  return false
end

# Process all recipe files
recipe_dir = "/Users/damonbinder/Documents/Coding/recipes/_recipes"
count = 0

Dir.glob("#{recipe_dir}/*.md").each do |file|
  # Skip backup files
  next if file.end_with?(".bak")
  count += 1 if fix_permalink(file)
end

puts "Updated #{count} files"