package com.example.findmypg;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        //Fetching fields from Form
        String name = request.getParameter("name");
        String pass = request.getParameter("password");
        Integer contact = Integer.valueOf(request.getParameter("phoneno"));
        String email = request.getParameter("email");
        String location = request.getParameter("location");
        String user_role = request.getParameter("user_role");


        //Writing Validations for the fields
        boolean isPasswordValid = isPasswordValid(pass);
        if (isPasswordValid) {
//            out.println("Password is valid.");
        } else {
            out.println("Password is not valid.");
        }
        //DB Connection
        ServletContext sc = request.getServletContext();
        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
        String DB_URL = sc.getInitParameter("DB_URL");
        String DB_USER = sc.getInitParameter("DB_USER");
        String DB_PASS = sc.getInitParameter("DB_PASS");

        try {
            Class.forName(DB_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            PreparedStatement stmt = conn.prepareStatement("insert into user_master (name,pass,contact,user_email,user_role) values (?,?,?,?,?)");
            stmt.setString(1, name);
            stmt.setString(2, pass);
            stmt.setInt(3, contact);
            stmt.setString(4,email);
            stmt.setString(5,user_role);
//            out.println(stmt);

            //Executing the Query
            int rowsAffected = stmt.executeUpdate();
            conn.close();

            //Validating if the query has been executed or not
            if (rowsAffected > 0){
                out.println("User has been created");
            }
            else {
                out.println(stmt);
                out.println("Something went wrong...");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private boolean isPasswordValid(String pass) {
        if (pass.length() < 8) {
            return false;
        }
        // Check if the password contains at least one digit, one letter, and one special character
        if (!pass.matches(".*\\d.*") || !pass.matches(".*[a-zA-Z].*") || !pass.matches(".*[^a-zA-Z0-9].*")) {
            return false;
        }
        return true; // Password is valid
    }
}