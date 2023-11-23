<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width " initial-scale=1.0>
    <title>findmyPG | Login</title>
    <!-- Homepage link css -->
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" href="Design/boxicons-2.1.4/css/boxicons.min.css">
    <link rel="preconnect" href="Design/fonts/Poppins-Bold.ttf">
    <link rel="preconnect" href="Design/fonts/Poppins-SemiBold.ttf">
</head>

<body>
<!-- Header link css -->
<header>
    <a href="#" class="logo">findmy<span class="span">PG</span></a>

    <ul class="navlist">
        <li><a href="main.jsp">Home</a></li>
        <li><a href="login.jsp"class="active">Login</a></li>
        <li><a href="signup.jsp">Signup</a></li>
        <!-- <li><a href="/html/admin.html">Admin Login</a></li>-->
        <li><a href="about_us.html">About Us</a></li>
        <li><a href="help.html">Contact us</a></li>
    </ul>
</header>
<div class="container">
    <img src="./image/rocket.png" alt="rocket" class="rocket">
    <div class="text">
        <h1>LOGIN</h1>
        <p>LANDING PAGE</p>
    </div>
    <form action="LoginServlet" class="form" method="post">
        <div class="animated-input">
            <input type="text" placeholder="Username" name="username">
            <input type="password" placeholder="Password" name="password">
        </div>
        <button class="btn" type="submit">LOGIN</button>
    </form>
    <p class="account"><a href="signup.jsp">Create Account ?</a></p>
</div>
</body>
</html>