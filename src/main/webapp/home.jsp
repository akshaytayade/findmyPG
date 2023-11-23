<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>findmyPG | Login</title>
  <!-- Homepage link css -->
  <link rel="stylesheet" type="text/css" href="css/home.css">
  <link rel="stylesheet" href="Design/boxicons-2.1.4/css/boxicons.min.css">
  <link rel="preconnect" href="Design/fonts/Poppins-Bold.ttf">
  <link rel="preconnect" href="Design/fonts/Poppins-SemiBold.ttf">
</head>
<body>
<header>
  <a href="#" class="logo">findmy<span class="span">PG</span></a>
  <ul class="navlist">
    <li><a href="main.jsp"class="active">Home</a></li>
    <li><a href="index.jsp">Login</a></li>
    <li><a href="signup.jsp">Signup</a></li>
    <!-- <li><a href="/html/admin.html">Admin Login</a></li>-->
    <li><a href="about_us.html">About Us</a></li>
    <li><a href="main.jsp">logout</a></li>
  </ul>
</header>

<main>
  <section class="search">
    <h1>Find Your Dream Stay</h1>
    <form action="SearchServlet" method="post">
      <input type="text" placeholder="Search by locality or institute" name="search_query">
      <button type="submit">Search</button>
    </form>
  </section>
</main>


</body>
</html>
