<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
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
    }

    nav a.logo {
      font-size: 24px;
      display: flex;
      align-items: center;
    }

    nav a.logo span {
      color: #ff9900;
      margin-left: 5px;
    }

    nav a.active {
      border-bottom: 2px solid #ff9900;
    }

    main {
      text-align: center;
      padding: 50px;
    }

    .search {
      background-color: #f2f2f2;
      padding: 20px;
    }

    .search h1 {
      font-size: 28px;
      margin-bottom: 20px;
    }

    .search form {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .search input[type="text"] {
      padding: 10px;
      width: 300px;
      border: none;
      border-radius: 5px 0 0 5px;
    }

    .search button {
      background-color: #ff9900;
      color: white;
      border: none;
      padding: 10px 15px;
      border-radius: 0 5px 5px 0;
      cursor: pointer;
    }

    footer {
      background-color: #333;
      color: white;
      text-align: center;
      padding: 10px;
      position: absolute;
      width: 100%;
      bottom: 0;
    }
  </style>
  <title>findmyPG | Home</title>
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
      <li><a href="/html/about_us.html" class="active">About Us</a></li>
      <li><a href="#help">Contact</a></li>
    </ul>
  </nav>
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

<footer>
  <p>&copy; 2023 findmyPG</p>
</footer>
</body>
</html>
