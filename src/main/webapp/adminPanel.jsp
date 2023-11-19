<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Console | findmyPG</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .property {
            margin-bottom: 30px; /* Add margin-bottom for space between property divs */
            border: 1px solid #ddd; /* Add border for better visibility */
            padding: 10px; /* Add padding for better spacing inside each property div */
        }
    </style>
</head>
<body>

<%
    ServletContext sc = request.getServletContext();

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
        String DB_URL = sc.getInitParameter("DB_URL");
        String DB_USER = sc.getInitParameter("DB_USER");
        String DB_PASS = sc.getInitParameter("DB_PASS");

        Class.forName(DB_DRIVER);
        connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

        // Execute a query
        String query = "SELECT * FROM property_bk";
        statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        resultSet = statement.executeQuery(query);
%>

<h1>Admin Console</h1>

<%
    while (resultSet.next()) {
        int propertyId = resultSet.getInt("pid");
%>
<div class="property">
    <p><strong>Property Name:</strong> <%= resultSet.getString("pname") %></p>
    <p><strong>Property ID:</strong> <%= propertyId %></p>
    <p><strong>Address:</strong> <%= resultSet.getString("address") %></p>
    <p><strong>Sharing Type:</strong> <%= resultSet.getString("ptype") %></p>
    <p><strong>Facilities Provided:</strong> <%= resultSet.getString("details") %></p>
    <p><strong>Nearby College:</strong> <%= resultSet.getString("college") %></p>
    <p><strong>Is Available:</strong> <%= resultSet.getString("status") %></p>
    <p><strong>Owner Name:</strong> <%= resultSet.getString("name") %></p>
    <p><strong>Image Name:</strong> <%= resultSet.getString("imgfilename") %></p>

    <!-- Update and Delete buttons with links to perform actions -->
    <form action="updateProperty.jsp" method="post">
        <input type="hidden" name="propertyId" value="<%= propertyId %>">
        <input type="submit" value="Update">
    </form>

    <form action="DeleteProperty" method="post" onsubmit="return confirm('Are you sure you want to delete this property?');">
        <input type="hidden" name="propertyId" value="<%= propertyId %>">
        <input type="submit" value="Delete">
    </form>
</div>
<%
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
        if (statement != null) {
            try {
                statement.close();
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
