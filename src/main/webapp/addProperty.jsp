<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findmyPG</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="/Design/boxicons-2.1.4/css/boxicons.min.css">
    <link rel="preconnect" href="/Design/fonts/Poppins-Bold.ttf">
    <link rel="preconnect" href="/Design/fonts/Poppins-SemiBold.ttf">
    <style>
        body {
            margin: 10px;
            top: 100px;
            position: absolute;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            min-height: 100vh;
            overflow-y: auto; /* Enable vertical scrolling if content exceeds viewport height */
        }

        form {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        fieldset {
            flex: 0 0 48%;
            margin-bottom: 20px;
            border: none; /* Remove the border */
        }

        /* Adjusted the flex property for the amenities fieldset */
        fieldset.legend-amenities {
            flex: 0 0 100%;
        }

        input[type="text"],
        input[type="file"],
        select {
            width: calc(100% - 20px);
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

        input[type="checkbox"] {
            margin-right: 5px;
        }
    </style>
    <title>File Uploading Form</title>
</head>

<body>

<header>
    <a href="#" class="logo">findmy<span class="span">PG</span></a>
    <ul class="navlist">
        <li><a href="main.jsp">Home</a></li>
        <li><a href="index.jsp">Logout</a></li>
        <li><a href="ownerPanel.jsp">Owner Panel</a></li>
    </ul>
</header>

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
    <fieldset class="legend-amenities">
        <legend>Amenities:</legend>
        <input type="checkbox" name="amenities" value="cleaning" /> Cleaning Services
        <input type="checkbox" name="amenities" value="fridge" /> Fridge
        <input type="checkbox" name="amenities" value="ac"/> Air Conditioning
        <input type="checkbox" name="amenities" value="furnishing" /> Furnishing
        <input type="checkbox" name="amenities" value="food"/> Food
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
    <fieldset>
        <label for="file">Upload Property images:</label>
        <input type="file" name="file" accept="image/*" multiple/>
    </fieldset>

    <fieldset>
        <label for="owner_name">Owner Name:</label>
        <input type="text" name="owner_name">

        <label for="owner_contact">Owner Contact:</label>
        <input type="text" name="owner_contact">

        <input type="submit" value="Post Property" />
    </fieldset>
</form>

</body>
</html>
