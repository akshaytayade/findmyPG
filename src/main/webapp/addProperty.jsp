<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        h3 {
            color: #333;
        }

        form {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        fieldset {
            border: none;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        legend {
            font-weight: bold;
            color: #333;
        }

        input[type="checkbox"] {
            margin-right: 5px;
        }
    </style>
    <title>File Uploading Form</title>
</head>

<body>
<h3>File Upload:</h3>
<form action="UploadServlet" method="post" enctype="multipart/form-data">
    <!-- Basic Details -->
    <fieldset>
        <label for="prop_name">Property Name:</label>
        <input type="text" name="prop_name" required>

        <label for="prop_price">Property Price (Per Month):</label>
        <input type="text" name="prop_price" required>

        <label for="prop_address">Property Address:</label>
        <input type="text" name="prop_address" required>

        <label for="pincode">Pincode:</label>
        <input type="text" name="pincode">

        <label for="nearby_institute">Nearby Institute:</label>
        <input type="text" name="nearby_institute">
    </fieldset>

    <!-- Amenities Provided -->
    <fieldset>
        <legend>Amenities:</legend>
        <input type="checkbox" name="cleaning" value="cleaning" /> Cleaning Services
        <input type="checkbox" name="fridge" value="fridge" /> Fridge
        <input type="checkbox" name="ac" value="ac"/> Air Conditioning
        <input type="checkbox" name="furnishing" value="furnishing" /> Furnishing
        <input type="checkbox" name="food" value="food"/> Food
    </fieldset>

    <!-- Sharing type -->
    <fieldset>
        <label for="sharing_type">Choose room sharing type:</label>
        <select name="sharing_type" id="sharing_type">
            <option value="single">Single Sharing</option>
            <option value="double">Double Sharing</option>
            <option value="triple">Triple Sharing</option>
        </select>
    </fieldset>

    <!-- Image Uploading -->
    <br>
    <br>
    <label for="file">Upload Property images:</label>
    <input type="file" name="file" accept="image/*" multiple/>

    <label for="owner_name">Owner Name:</label>
    <input type="text" name="owner_name">

    <label for="owner_contact">Owner Contact:</label>
    <input type="text" name="owner_contact">

    <input type="submit" value="Post Property" />
</form>
</body>

</html>
