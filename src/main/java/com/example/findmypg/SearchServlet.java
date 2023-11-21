package com.example.findmypg;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        //Fetching the user search query
        String search_keyword = request.getParameter("search_query");
        search_keyword = search_keyword.trim().toLowerCase();

        //Sending data to showProperty.jsp
        String destination = "showProperty.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
        request.setAttribute("search_keyword", search_keyword);
        requestDispatcher.forward(request, response);

//        //DB Connection
//        ServletContext sc = request.getServletContext();
//        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
//        String DB_URL = sc.getInitParameter("DB_URL");
//        String DB_USER = sc.getInitParameter("DB_USER");
//        String DB_PASS = sc.getInitParameter("DB_PASS");
//
//        try {
////            out.println("Inside try block");
//            Class.forName(DB_DRIVER);
//            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
//            PreparedStatement stmt = conn.prepareStatement("select * from property where LOWER(college) like ?");
//            stmt.setString(1,"%" + search_query + "%");
////            out.println(stmt);
//            ServletContext servletcontext = getServletContext();
//            servletcontext.setAttribute("search_url", stmt);
//            ResultSet rs = stmt.executeQuery();
//
//            out.println("[");
//            while (rs.next()){
//                out.println("{");
//                out.println("\"id\":\"" + rs.getString("pid") + "\",");
//                out.println("\"name\":\"" + rs.getString("pname") + "\",");
//                out.println("\"type\":\"" + rs.getString("ptype") + "\",");
//                out.println("\"details\":\"" + rs.getString("details") + "\",");
//                out.println("\"price\":\"" + rs.getDouble("price") + "\"");
//                out.println("\"address\":\"" + rs.getString("address") + "\"");
//                out.println("\"college\":\"" + rs.getString("college") + "\"");
//                out.println("\"imgname\":\"" + rs.getString("imgfilename") + "\"");
//                out.println("},");
//            }
//            out.println("]");
//            conn.close();
//            response.sendRedirect("showProperty.jsp");
//        } catch (ClassNotFoundException | SQLException e) {
//            throw new RuntimeException(e);
//        }

    }
}