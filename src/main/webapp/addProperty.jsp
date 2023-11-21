<html>
<head>
    <title>File Uploading Form</title>
</head>

<body>
<h3>File Upload:</h3>
<form action = "UploadServlet" method = "post" enctype = "multipart/form-data">
    <%--Basic Details--%>
        <fieldset>
        Property Name: <input type="text" name="prop_name" required>
        Property Price: (Per Month) <input type="text" name="prop_price" required>
        Property Address: <input type="text" name="prop_address" required>
        Pincode: <input type="text" name="pincode">
        Nearby Institute: <input type="text" name="nearby_institute">
        </fieldset>
        <%--Amenities Provided--%>
        <fieldset>
            <legend>Amenities:</legend>
                <input type="checkbox" name="amenities" value="cleaning" /> Cleaning Services
                <input type="checkbox" name="amenities" value="fridge" /> Fridge
                <input type="checkbox" name="amenities" value="ac"/> Air Conditioning
                <input type="checkbox" name="amenities" value="furnishing" /> Furnishing
                <input type="checkbox" name="amenities" value="food"/> Food
        </fieldset>

        <%--Sharing type--%>
        <fieldset>
        <label for="sharing_type">Choose room sharing type:</label>
        <select name="sharing_type" id="sharing_type">
            <option value="single">Single Sharing</option>
            <option value="double">Double Sharing</option>
            <option value="triple">Triple Sharing</option>
        </select>
        </fieldset>
        <%--Image Uploading--%>
        <br>
        <br>
        Upload Property images: <input type = "file" name = "files" accept="image/*"  multiple/>
        Owner Name: <input type="text" name="owner_name">
        Owner Contact: <input type="text" name="owner_contact">


        <input type = "submit" value = "Post Property" />
</form>
</body>

</html>