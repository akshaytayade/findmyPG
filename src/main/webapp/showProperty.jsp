<!DOCTYPE html>
<html>
<head>
    <title>Property Listings</title>
</head>
<body>
<h1>Property Listings</h1>
<div id="property-listings"></div>

<script>
    const propertyListings = document.getElementById('property-listings');

    // Fetch property listings from the servlet
    fetch('SearchServlet')
        .then(response => response.json())
        .then(data => {
            data.forEach(property => {
                const propertyDiv = document.createElement('div');
                propertyDiv.className = 'property';
                propertyDiv.innerHTML = `
                        <h2>${property.name}</h2>
                        <p>${property.type}</p>
                        <p>Name: $${property.name}</p>
                        <p>Type: ${property.type}</p>
                    `;
                propertyListings.appendChild(propertyDiv);
            });
        })
        .catch(error => console.error('Error fetching property listings:', error));
</script>
</body>
</html>
