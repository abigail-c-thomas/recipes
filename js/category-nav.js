/**
 * Category Navigation - Simple state-based approach
 * - Only one category can be open at a time
 * - First one opens by default
 * - Clicking an open category closes it
 * - Clicking a closed category opens it and closes others
 */
document.addEventListener('DOMContentLoaded', function() {
  // State tracking
  let currentlyOpen = null;
  
  // Find all category containers
  const categories = document.querySelectorAll('.collapsible-category');
  if (categories.length === 0) return;
  
  console.log(`Found ${categories.length} categories`);
  
  /**
   * Opens a category and closes all others
   */
  function openCategory(category) {
    // If there's already an open category, close it first
    if (currentlyOpen && currentlyOpen !== category) {
      closeCategory(currentlyOpen);
    }
    
    // Get header and content
    const header = category.querySelector('.collapsible-header');
    const content = category.querySelector('.collapsible-content');
    const browseButton = header.querySelector('.browse-button');
    
    // Update state
    category.classList.add('active');
    content.style.display = 'block';
    if (browseButton) browseButton.textContent = 'Close';
    
    // Update tracking
    currentlyOpen = category;
  }
  
  /**
   * Closes a category
   */
  function closeCategory(category) {
    // Get header and content
    const header = category.querySelector('.collapsible-header');
    const content = category.querySelector('.collapsible-content');
    const browseButton = header.querySelector('.browse-button');
    
    // Update state
    category.classList.remove('active');
    content.style.display = 'none';
    if (browseButton) browseButton.textContent = 'Browse';
    
    // Update tracking
    if (currentlyOpen === category) {
      currentlyOpen = null;
    }
  }
  
  /**
   * Toggles a category (open if closed, close if open)
   */
  function toggleCategory(category) {
    if (category.classList.contains('active')) {
      closeCategory(category);
    } else {
      openCategory(category);
    }
  }
  
  // Add click handlers to each category
  categories.forEach(function(category) {
    // Find the header
    const header = category.querySelector('.collapsible-header');
    if (!header) return;
    
    // Make sure it's obviously clickable
    header.style.cursor = 'pointer';
    
    // Add click handler
    header.addEventListener('click', function(e) {
      e.preventDefault();
      toggleCategory(category);
    });
    
    // Remove any existing inline handler to avoid conflicts
    header.removeAttribute('onclick');
  });
  
  // Close all categories initially
  categories.forEach(function(category) {
    const content = category.querySelector('.collapsible-content');
    if (content) content.style.display = 'none';
    category.classList.remove('active');
    
    // Make sure browse buttons show the correct text
    const browseButton = category.querySelector('.browse-button');
    if (browseButton) browseButton.textContent = 'Browse';
  });
  
  // All categories start closed by default
  currentlyOpen = null;
});