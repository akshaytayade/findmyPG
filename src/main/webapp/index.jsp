<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width " initial-scale=1.0>
    <title>findmyPG | Login</title>
    <!-- Homepage link css -->
    <link rel="stylesheet" type="text/css" href="css/customer.css">
    <link rel="stylesheet" href="Design/boxicons-2.1.4/css/boxicons.min.css">
    <link rel="preconnect" href="Design/fonts/Poppins-Bold.ttf">
    <link rel="preconnect" href="Design/fonts/Poppins-SemiBold.ttf">0px
</head>

<body>
<!-- Header link css -->
<header>
    <a href="#" class="logo">findmy<span class="span">PG</span></a>
    <ul class="navlist">
        <li><a href="home.html"class="active">Home</a></li>
        <li><a href="html/owner_login.html">Owner Login</a></li>
        <li><a href="html/customer.html">Customer Login</a></li>
        <li><a href="about_us.jsp">About Us</a></li>
        <li><a href="#help">Contact Us</a></li>
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
        <div class="check">
            <div>
                <input type="checkbox" id="check">
                <label for="check" class="disc"></label>
                <label for="check" class="remember">Remember</label>
            </div>
            <p class="forget"><a href="#">Forget Password ?</a></p>
        </div>
        <button class="btn" type="submit">LOGIN</button>
    </form>
    <p class="account"><a href="#">Create Account ?</a></p>
</div>
</body>
</html>