// Main JavaScript file

document.addEventListener('DOMContentLoaded', function() {
    console.log('Recipe website loaded!');
    
    // Initialize collapsible components
    initCollapsibles();
});

function initCollapsibles() {
    try {
        console.log('Starting to initialize collapsibles...');
        
        // Get all collapsible headers
        const headers = document.querySelectorAll('.collapsible-header');
        console.log(`Found ${headers.length} collapsible headers`);
        
        if (headers.length === 0) {
            console.warn('No collapsible headers found!');
            return;
        }
        
        // Log information about each header for debugging
        headers.forEach((header, index) => {
            console.log(`Header #${index}:`, {
                text: header.innerText,
                parent: header.parentElement.tagName,
                nextSibling: header.nextElementSibling ? header.nextElementSibling.className : 'none'
            });
        });
        
        // Add click listeners to each header
        headers.forEach((header, index) => {
            // First, forcibly make it look clickable
            header.style.cursor = 'pointer';
            
            // Add a visual indicator that this is clickable
            if (!header.querySelector('.click-indicator')) {
                const indicator = document.createElement('span');
                indicator.className = 'click-indicator';
                indicator.innerHTML = '▼';
                indicator.style.marginLeft = '8px';
                indicator.style.fontSize = '0.8em';
                header.appendChild(indicator);
            }
            
            // Remove any existing listeners to avoid duplication
            const newHeader = header.cloneNode(true);
            header.parentNode.replaceChild(newHeader, header);
            
            // Add new click listener
            newHeader.addEventListener('click', function() {
                console.log(`Header #${index} clicked!`);
                
                // Find the parent container
                const container = this.parentElement;
                // Find the content panel (next sibling element)
                const content = this.nextElementSibling;
                
                if (!content) {
                    console.error('No content element found for this header!');
                    return;
                }
                
                console.log('Content before toggle:', {
                    display: window.getComputedStyle(content).display,
                    height: content.offsetHeight
                });
                
                // Toggle the active class
                container.classList.toggle('active');
                
                // Show/hide the content based on current state
                if (container.classList.contains('active')) {
                    content.style.display = 'block';
                    this.querySelector('.click-indicator').innerHTML = '▲';
                } else {
                    content.style.display = 'none';
                    this.querySelector('.click-indicator').innerHTML = '▼';
                }
                
                console.log('Content after toggle:', {
                    display: window.getComputedStyle(content).display,
                    height: content.offsetHeight
                });
            });
            
            console.log(`Click listener added to header #${index}`);
        });
        
        // Initially close all sections
        const contents = document.querySelectorAll('.collapsible-content');
        console.log(`Found ${contents.length} content sections to initialize`);
        
        contents.forEach((content, i) => {
            content.style.display = 'none';
            console.log(`Set content #${i} display to none`);
        });
        
        // Open the first section by default
        if (headers.length > 0 && contents.length > 0) {
            const firstContainer = headers[0].parentElement;
            const firstContent = headers[0].nextElementSibling;
            
            if (firstContent) {
                firstContainer.classList.add('active');
                firstContent.style.display = 'block';
                headers[0].querySelector('.click-indicator').innerHTML = '▲';
                console.log('First section opened successfully');
            } else {
                console.error('Could not find content for first header!');
            }
        }
        
        console.log('Collapsible initialization complete');
    } catch (err) {
        console.error('Error initializing collapsibles:', err);
        console.error(err.stack);
    }
}