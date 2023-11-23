<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Property | findmyPG</title>

    <!-- Homepage link css -->
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <link rel="stylesheet" type="text/css" href="css/showProperty.css">
    <link rel="stylesheet" href="/Design/boxicons-2.1.4/css/boxicons.min.css">
    <link rel="preconnect" href="/Design/fonts/Poppins-Bold.ttf">
    <link rel="preconnect" href="/Design/fonts/Poppins-SemiBold.ttf">
    <script src="script.js"></script>
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
        <li><a href="main.jsp">Logout</a></li>
    </ul>
</header>
<%
    ServletContext sc = request.getServletContext();

    String search_keyword_attribute = request.getAttribute("search_keyword").toString().trim();
    System.out.println("Search Keyword: " + search_keyword_attribute);
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String query;

    try {
        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
        String DB_URL = sc.getInitParameter("DB_URL");
        String DB_USER = sc.getInitParameter("DB_USER");
        String DB_PASS = sc.getInitParameter("DB_PASS");
        String IMG_PATH = "http://localhost:8080/findmyPG_war_exploded/uploaded_prop_images/";

        Class.forName(DB_DRIVER);
        connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

        // Execute a query
        if (search_keyword_attribute.isEmpty()){
            query = "SELECT * FROM property where status = 1";
            preparedStatement = connection.prepareStatement(query);
        } else {
            query = "SELECT * FROM property where status = 1 and lower(college) LIKE ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, "%" + search_keyword_attribute.toLowerCase() + "%");
        }

        resultSet = preparedStatement.executeQuery();
%>


<div class="box">
</div>
<main class="main">
    <%
        int carouselIndex = 0; // Initialize carousel index
        while (resultSet.next()) {
            int propertyId = resultSet.getInt("pid");
    %>
    <div class="card">
        <div class="image">
            <%
                // Split the comma-separated image URLs
                String[] imageUrls = resultSet.getString("imgfilename").split(",");
                System.out.println("Inside Image Loop");
                for (String imageUrl : imageUrls) {
            %>
            <img  src="<%= IMG_PATH+resultSet.getString("pname")+"/"+ imageUrl.trim() %>" alt="image" height="235px" width="235px">
            <% } %>
        </div>
        <%--    <h2>class="img"alt="Image" width="50px"<%= search_keyword%></h2>--%>
        <div class="caption">
            <!-- <p class="rate">
                 <box-icon name='star' ></box-icon>
                 <box-icon name='star' ></box-icon>
                 <box-icon name='star' ></box-icon>
                 <box-icon name='star' ></box-icon>
                 <box-icon type='solid' name='star'></box-icon>

             </p>-->
            <p class="price"><box-icon class="money"name='money-withdraw'></box-icon> <%= resultSet.getString("price") %></p>
            <p class="slish">|</p>
            <h2 class="name1"><%= resultSet.getString("pname") %></h2>
            <h4 class="addr"><box-icon name='location-plus'></box-icon> <%= resultSet.getString("address") %></h4>
            <h4 class="sharing"><box-icon name='share'></box-icon> Sharing Type :<span class="color"> <%= resultSet.getString("ptype") %></span></h4>
            <h4 class="Facilit"><box-icon name='building-house' ></box-icon> Facilities Provided :<span class="color"><%= resultSet.getString("details") %></span></h4>
            <h4 class="clg"><box-icon type='solid' name='map-pin'></box-icon> Nearby College :<span class="color"> <%= resultSet.getString("college") %></span></h4>
            <form action="viewDetails.jsp" method="post">
                <input type="hidden" name="propertyId" value="<%= propertyId %>">
                <input type="submit" value="View Details">
            </form>
        </div>
    </div>
    <%--    <p><strong>Is Available?</strong> <%= resultSet.getString("status") %></p>--%>




    <!-- <div class="carousel-container"></div>
        <%--        <div class="carousel" data-current-slide="0"><!-- Add data-current-slide attribute -->--%>
        <div class="carousel">

         <!-- </div>
        <div class="prev" onclick="changeSlide(this.parentElement, -1)">&#10094;</div>
        <div class="next" onclick="changeSlide(this.parentElement, 1)">&#10095;</div>
    </div>
</div>-->
    <%
            carouselIndex++;
        }

    %>

    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources in the reverse order of their creation
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</main>
</body>
</html>