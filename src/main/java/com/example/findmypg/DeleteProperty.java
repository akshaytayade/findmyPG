package com.example.findmypg;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteProperty", value = "/DeleteProperty")
public class DeleteProperty extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        Integer pid = Integer.valueOf(request.getParameter("propertyId"));
//        out.println(pid);

        //DB Connection
        ServletContext sc = request.getServletContext();
        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
        String DB_URL = sc.getInitParameter("DB_URL");
        String DB_USER = sc.getInitParameter("DB_USER");
        String DB_PASS = sc.getInitParameter("DB_PASS");

        try {
            Class.forName(DB_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            PreparedStatement stmt = conn.prepareStatement("delete from property where pid = ?");
            stmt.setInt(1, pid);

            int rowsAffected = stmt.executeUpdate();
            conn.close();

            //Validating if the query has been executed or not
            if (rowsAffected > 0){
                out.println("Record Deleted Successfully");
                response.sendRedirect("adminPanel.jsp");
            }
            else {
                out.println("Something went wrong... "+ stmt);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    }
}