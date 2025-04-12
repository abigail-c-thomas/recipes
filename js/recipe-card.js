// Recipe Card JavaScript

document.addEventListener('DOMContentLoaded', function() {
  // Initialize each recipe card
  const recipeCards = document.querySelectorAll('.recipe-card');
  
  recipeCards.forEach(recipeCard => {
    // Handle unit toggle
    const unitToggleButtons = recipeCard.querySelectorAll('.unit-button');
    const ingredientsContent = recipeCard.querySelector('.ingredients-content');
    const instructionsContent = recipeCard.querySelector('.instructions-content');
    
    // Keep a backup of the original metric content
    const originalIngredientsHtml = ingredientsContent.innerHTML;
    const originalInstructionsHtml = instructionsContent.innerHTML;
    
    // Make sure initial state matches the active button
    const activeButton = recipeCard.querySelector('.unit-button.active');
    if (activeButton && activeButton.getAttribute('data-unit') === 'us') {
      // If US is the active button, convert to US right away
      convertToUS(recipeCard, ingredientsContent, instructionsContent);
    }
    
    unitToggleButtons.forEach(button => {
      button.addEventListener('click', function() {
        const unitType = this.getAttribute('data-unit');
        
        // Update active button
        recipeCard.querySelectorAll('.unit-button').forEach(btn => {
          btn.classList.remove('active');
        });
        this.classList.add('active');
        
        // Toggle between metric and US units
        if (unitType === 'us') {
          // Convert from metric to US
          convertToUS(recipeCard, ingredientsContent, instructionsContent);
        } else {
          // Restore original metric content
          ingredientsContent.innerHTML = originalIngredientsHtml;
          instructionsContent.innerHTML = originalInstructionsHtml;
        }
      });
    });
    
    // Handle print button
    const printButton = recipeCard.querySelector('.print-button');
    if (printButton) {
      printButton.addEventListener('click', function() {
        window.print();
      });
    }
  });
  
  // Conversion functions
  function convertToUS(recipeCard, ingredientsContent, instructionsContent) {
    // Convert ingredients
    const ingredientItems = ingredientsContent.querySelectorAll('li');
    
    ingredientItems.forEach(item => {
      const text = item.textContent.trim();
      item.innerHTML = convertIngredient(text);
    });
    
    // Convert instructions
    const instructionText = instructionsContent.innerHTML;
    instructionsContent.innerHTML = convertInstructions(instructionText);
  }
  
  function convertIngredient(text) {
    // Match pattern like "240g flour" or "240ml milk"
    const metricPattern = /(\d+(?:\.\d+)?)\s*([a-z]+)(\s+.*)/i;
    const match = text.match(metricPattern);
    
    if (!match) return text;  // Return unchanged if no match
    
    const value = parseFloat(match[1]);
    const unit = match[2].toLowerCase();
    const ingredient = match[3];
    
    let usValue, usUnit;
    
    switch (unit) {
      case 'g':
        // Convert grams to ounces (if less than 453.6g) or pounds
        if (value < 453.6) {
          usValue = (value / 28.35).toFixed(1);
          usValue = cleanNumber(usValue);
          usUnit = usValue == 1 ? 'oz' : 'oz';
        } else {
          usValue = (value / 453.6).toFixed(1);
          usValue = cleanNumber(usValue);
          usUnit = usValue == 1 ? 'lb' : 'lb';
        }
        break;
        
      case 'ml':
        // Convert milliliters to cups, tablespoons, or teaspoons
        if (value >= 240) {
          // 1 cup = 240ml
          usValue = (value / 240).toFixed(1);
          usValue = cleanNumber(usValue);
          usUnit = usValue == 1 ? 'cup' : 'cups';
        } else if (value >= 15) {
          // 1 tbsp = 15ml
          usValue = (value / 15).toFixed(0);
          usUnit = usValue == 1 ? 'tbsp' : 'tbsp';
        } else {
          // 1 tsp = 5ml
          usValue = (value / 5).toFixed(0);
          usUnit = usValue == 1 ? 'tsp' : 'tsp';
        }
        break;
        
      case 'cm':
        // Convert centimeters to inches
        usValue = (value / 2.54).toFixed(1);
        usValue = cleanNumber(usValue);
        usUnit = 'inch' + (usValue == 1 ? '' : 'es');
        break;
        
      default:
        // No conversion needed for other units
        return text;
    }
    
    return `${usValue} ${usUnit}${ingredient}`;
  }
  
  function convertInstructions(text) {
    // Create a temporary container to properly handle HTML tags
    const tempDiv = document.createElement('div');
    tempDiv.innerHTML = text;
    
    // Process text nodes without breaking list structure
    const processParagraph = (element) => {
      if (element.nodeType === Node.TEXT_NODE) {
        // Convert temperatures (°C to °F)
        let content = element.textContent.replace(/(\d+)°C/g, function(match, celsius) {
          const fahrenheit = Math.round(celsius * 9/5 + 32);
          return `${fahrenheit}°F`;
        });
        
        // Convert measurements in the form "Xcm"
        content = content.replace(/(\d+)cm/g, function(match, cm) {
          const inches = (parseFloat(cm) / 2.54).toFixed(1);
          return `${cleanNumber(inches)}-inch`;
        });
        
        element.textContent = content;
      } else if (element.nodeType === Node.ELEMENT_NODE) {
        Array.from(element.childNodes).forEach(processParagraph);
      }
    };
    
    Array.from(tempDiv.childNodes).forEach(processParagraph);
    return tempDiv.innerHTML;
  }
  
  function cleanNumber(num) {
    // Remove trailing .0
    return num.toString().replace(/\.0$/, '');
  }
});