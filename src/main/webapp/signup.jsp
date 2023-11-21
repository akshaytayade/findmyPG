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

        header {
            background-color: #333;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav {
            display: flex;
            align-items: center;
        }

        nav ul {
            list-style: none;
            display: flex;
            margin-left: auto;
        }

        nav a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            margin-right: 20px;
            transition: color 0.3s;
        }

        nav a.logo {
            font-size: 24px;
            display: flex;
            align-items: center;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: bold;
            color: #ff9900;
        }

        form {
            text-align: center;
            padding: 50px;
            background-color: #fff;
            max-width: 600px;
            margin: 50px auto;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        fieldset {
            border: none;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"],
        input[type="number"],
        input[type="email"],
        select {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #333;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
    <title>findmyPG | Sign Up</title>
</head>

<body>
<header>
    <nav>
        <a href="#" class="logo">findmy<span class="span">PG</span></a>
        <ul class="navlist">
            <li><a href="/html/home.html">Home</a></li>
            <li><a href="/html/Owner Login.html">Owner Login</a></li>
            <li><a href="/html/customer.html">Customer Login</a></li>
            <li><a href="/html/admin.html">Admin Login</a></li>
            <li><a href="/html/about_us.html">About Us</a></li>
            <li><a href="#help">Contact</a></li>
        </ul>
    </nav>
</header>

<form action="SignUpServlet" method="post">
    <!-- Basic Details -->
    <fieldset>
        <input type="text" placeholder="Full Name" name="name" required>
        <input type="password" placeholder="Password" name="password" required>
        <input type="number" placeholder="Contact Number" name="phoneno" required>
        <input type="email" placeholder="Email" name="email" required>
        <input type="text" placeholder="Address/Location" name="location" required>
    </fieldset>

    <!-- User Role -->
    <fieldset>
        <label for="user_role">Choose account type:</label>
        <select name="user_role" id="user_role" required>
            <option value="owner">Property Owner</option>
            <option value="normal">Student</option>
        </select>
    </fieldset>
    <input type="submit" value="Sign Up" />
</form>
</body>
</html>
