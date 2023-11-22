<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Details | findmyPG</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            max-width: 400px;
            margin: auto;
        }
        .form-container input {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
        }
        .form-container button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<%
    ServletContext sc = request.getServletContext();

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
        String DB_URL = sc.getInitParameter("DB_URL");
        String DB_USER = sc.getInitParameter("DB_USER");
        String DB_PASS = sc.getInitParameter("DB_PASS");

        Class.forName(DB_DRIVER);
        connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

        // Retrieve property ID from the request
        int propertyId = Integer.parseInt(request.getParameter("propertyId"));

        // Execute a query to get the current details of the property
        String query = "SELECT * FROM property WHERE pid = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, propertyId);
        resultSet = preparedStatement.executeQuery();

        // Check if the property exists
        if (resultSet.next()) {
%>

<div class="property">
    <p><strong>Property Name:</strong> <%= resultSet.getString("pname") %></p>
    <p><strong>Address:</strong> <%= resultSet.getString("address") %></p>
    <p><strong>Pincode:</strong> <%= resultSet.getString("pincode") %></p>
    <p><strong>Owner Name:</strong> <%= resultSet.getString("name") %></p>
    <p><strong>Owner Contact:</strong> <%= resultSet.getString("contact") %></p>
    <form action="SendEmailServlet" method="post">
        <input type="hidden" name="pname" value="<%= resultSet.getString("pname") %>">
        <input type="hidden" name="owner_name" value="<%= resultSet.getString("name") %>">
        <input type="hidden" name="owner_contact" value="<%= resultSet.getString("contact") %>">
        <input type="hidden" name="address" value="<%= resultSet.getString("address") %>">
        <input type="email" name="user_email">
        <input type="submit" value="Send Details via Email">
    </form>
</div>

<%
} else {
    // Property not found
%>

<div>
    <p>Property not found.</p>
</div>

<%
        }
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