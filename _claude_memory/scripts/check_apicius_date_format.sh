#!/bin/bash

# Script to check if Apicius recipes have the correct date format "c. 4th century CE"
# Usage: bash check_apicius_date_format.sh
# Run from the root directory of the recipes project

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Ensure we're running from the project root
ROOT_DIR="/Users/damonbinder/Documents/Coding/recipes"
if [ "$(pwd)" != "$ROOT_DIR" ]; then
  cd "$ROOT_DIR" || { echo "Error: Could not change to project root directory"; exit 1; }
fi

echo "=== Checking date format for Apicius recipes ==="
echo "Correct format: —*Apicius*, X.X.X, c. 4th century CE"
echo "====================================="

# Find all Apicius recipe files
apicius_files=$(grep -l "source:apicius" _recipes/*.md)
total_apicius=$(echo "$apicius_files" | wc -l | tr -d ' ')
correct_format=0
incorrect_format=0

echo -e "\n${YELLOW}Recipes with incorrect date format:${NC}"

# Check each Apicius recipe file
for file in $apicius_files; do
  # Extract the filename without path
  filename=$(basename "$file")
  
  # Check if the file contains the correct date format
  if grep -q "c\. 4th century CE" "$file"; then
    ((correct_format++))
  else
    ((incorrect_format++))
    # Get the current date format by extracting the line with "—*Apicius*"
    current_format=$(grep "—\*Apicius\*" "$file" | sed 's/^[ \t]*//;s/[ \t]*$//')
    echo -e "${RED}[$filename]${NC} $current_format"
  fi
done

echo -e "\n===== SUMMARY ====="
echo -e "Total Apicius recipes: $total_apicius"
echo -e "${GREEN}Correct format: $correct_format${NC}"
echo -e "${RED}Incorrect format: $incorrect_format${NC}"
echo -e "Success rate: $(( (correct_format * 100) / total_apicius ))%"

if [ $incorrect_format -eq 0 ]; then
  echo -e "\n${GREEN}✓ All Apicius recipes have the correct date format!${NC}"
else
  echo -e "\n${YELLOW}⚠ Some recipes need to be updated to use the standard format:${NC}"
  echo -e "   —*Apicius*, X.X.X, c. 4th century CE"
fi