<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
<%--  <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--  <link rel="stylesheet" href="styles.css">--%>
  <title>findmyPG | Home</title>
</head>
<body>
<header>
  <div class="logo">
    <img src="logo.png" alt="NoBroker Logo">
  </div>
  <nav>
    <ul>
      <a href="#" class="logo">findmy<span class="span">PG</span></a>
      <ul class="navlist">
        <li><a href="/html/home.html">Home</a></li>
        <li><a href="/html/Owner Login.html">Owner Login</a></li>
        <li><a href="/html/customer.html">Customer Login</a></li>
        <li><a href="/html/admin.html">Admin Login</a></li>
        <li><a href="/html/about_us.html"class="active">About Us</a></li>
        <li><a href="#help">Contact</a></li>
      </ul>
  </nav>
</header>

<main>
  <section class="search">
    <h1>Find Your Dream Home</h1>
    <form action="SearchServlet" method="post">
      <input type="text" placeholder="Search by locality or institute" name="search_query">
      <button type="submit">Search</button>
    </form>
  </section>
</main>

<footer>
  <p>&copy; 2023 findmyPG</p>
</footer>
</body>
</html>
