<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findmyPG | Sign Up</title>
    <link rel="stylesheet" type="text/css" href="css/singup.css">
    <link rel="stylesheet" href="/Design/boxicons-2.1.4/css/boxicons.min.css">
    <link rel="preconnect" href="/Design/fonts/Poppins-Bold.ttf">
    <link rel="preconnect" href="/Design/fonts/Poppins-SemiBold.ttf">
</head>

<body>
<header>
    <a href="#" class="logo">findmy<span class="span">PG</span></a>
    <ul class="navlist">
        <li><a href="main.jsp">Home</a></li>
        <li><a href="index.jsp">Login</a></li>
        <li><a href="signup.jsp"class="active">Signup</a></li>
        <!-- <li><a href="/html/admin.html">Admin Login</a></li>-->

        <li><a href="about_us.html">About Us</a></li>
    </ul>
</header>

<form action="SignUpServlet" method="post">
    <!-- Basic Details -->
    <fieldset>
        <input type="text" placeholder="Username" name="name" required>
        <input type="password" placeholder="Password" name="password" required>
        <input type="text" placeholder="Contact Number" name="phoneno" required>
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
