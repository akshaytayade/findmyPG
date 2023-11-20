package com.example.findmypg;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "UpdateProperty", value = "/UpdateProperty")
public class UpdateProperty extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        Integer pid = Integer.valueOf(request.getParameter("propertyId"));
        String pname = request.getParameter("pname");
        String address = request.getParameter("address");
        String ptype = request.getParameter("ptype");
        String details = request.getParameter("details");
        String college = request.getParameter("college");
        String status = request.getParameter("status");
        String name = request.getParameter("name");

        //Checking if any value is null
        if (pname.equals("null") | address.equals("null") | ptype.equals("null") | details.equals("null") | college.equals("null") | name.equals("null")){
            out.println("Values cannot be null... Try again...");
        }

        //DB Connection
        ServletContext sc = request.getServletContext();
        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
        String DB_URL = sc.getInitParameter("DB_URL");
        String DB_USER = sc.getInitParameter("DB_USER");
        String DB_PASS = sc.getInitParameter("DB_PASS");

        try{
            Class.forName(DB_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            PreparedStatement stmt = conn.prepareStatement("UPDATE property SET pname = ?, address = ?, ptype = ?, details = ?, college = ?, status = ?, name = ? WHERE pid = ?");
            stmt.setString(1, pname);
            stmt.setString(2, address);
            stmt.setString(3, ptype);
            stmt.setString(4, details);
            stmt.setString(5, college);
            stmt.setString(6, status);
            stmt.setString(7, name);
            stmt.setInt(8, pid);

            int rowsAffected = stmt.executeUpdate();
            conn.close();
            if (rowsAffected > 0){
                out.println("Record Updated Successfully");
                response.sendRedirect("adminPanel.jsp");
            }
            else {
                out.println("Something went wrong... "+ stmt);
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
    }
}