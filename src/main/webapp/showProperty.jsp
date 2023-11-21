<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Property | findmyPG</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .property {
            margin-bottom: 30px;
        }
        .carousel-container {
            position: relative;
        }
        .carousel {
            display: flex;
            overflow: hidden;
        }
        .carousel img {
            width: 100%;
            height: auto;
            transition: transform 0.5s ease-in-out;
        }
        .prev, .next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            cursor: pointer;
        }
        .prev {
            left: 10px;
        }
        .next {
            right: 10px;
        }
        .carousel-container.single-image .carousel img {
            max-width: 50%; /* Adjust the width as needed for a single image */
        }
    </style>
    <script src="script.js"></script>
</head>
<body>

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

<h1>Image Carousel</h1>

<%
    int carouselIndex = 0; // Initialize carousel index
    while (resultSet.next()) {
        int propertyId = resultSet.getInt("pid");
%>
<div class="property">
    <h2><%= resultSet.getString("pname") %></h2>
<%--    <p><strong>Address:</strong> <%= resultSet.getString("address") %></p>--%>
    <p><strong>Sharing Type:</strong> <%= resultSet.getString("ptype") %></p>
    <p><strong>Facilities Provided:</strong> <%= resultSet.getString("details") %></p>
    <p><strong>Nearby College:</strong> <%= resultSet.getString("college") %></p>
    <form action="viewDetails.jsp" method="post">
        <input type="hidden" name="propertyId" value="<%= propertyId %>">
        <input type="submit" value="View Details">
    </form>

    <div class="carousel-container">
        <div class="carousel">
            <%
                // Split the comma-separated image URLs
                String[] imageUrls = resultSet.getString("imgfilename").split(",");
                for (String imageUrl : imageUrls) {
            %>
            <img src="<%= IMG_PATH+resultSet.getString("pname")+"/"+ imageUrl.trim() %>" alt="Image" width="100px">
            <% } %>
        </div>
        <div class="prev" onclick="changeSlide(this.parentElement, -1)">&#10094;</div>
        <div class="next" onclick="changeSlide(this.parentElement, 1)">&#10095;</div>
    </div>
</div>
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

</body>
</html>