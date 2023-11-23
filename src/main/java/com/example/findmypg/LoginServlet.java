package com.example.findmypg;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        //Fetching details from Form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        out.println(username + " " +password);

        //DB Connection
        ServletContext sc = request.getServletContext();
        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
        String DB_URL = sc.getInitParameter("DB_URL");
        String DB_USER = sc.getInitParameter("DB_USER");
        String DB_PASS = sc.getInitParameter("DB_PASS");

        try {
            Class.forName(DB_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            PreparedStatement stmt = conn.prepareStatement("select * from user_master where name = ? and pass = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
//            out.println(stmt);
            String isLoggedIn = null;
            String user_role = null;
            ResultSet rs = stmt.executeQuery();

            //Updating the login_flag to 'Y'
            //Creating a session
            HttpSession session = request.getSession();
            session.setAttribute("name", username);
            String session_id = session.getId();

            while (rs.next()) {
                isLoggedIn = rs.getString("login_flag");
                user_role = rs.getString("user_role");
            }
            out.println(isLoggedIn + user_role);

            String destination = "ownerPanel.jsp";
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(destination);
            request.setAttribute("username",username);

//                PreparedStatement stmt2 = conn.prepareStatement("update user_master set login_flag = ? and session_id = ? where name = ?");
//                stmt2.setString(1, "Y");
//                stmt2.setString(2, session_id);
//                stmt2.setString(3, username);
//
//                ResultSet rs1 = stmt2.executeQuery();
//                if (rowsAffected > 0){
//                    System.out.println("Login flag updated successfully for the user!");
//                }
//                else {
//                    System.out.println("Something went wrong!");
//                }
//            }
//                String isLoggedIn = null;
//                String user_role = null;
//                while (rs.next()) {
//                    isLoggedIn = rs.getString("login_flag");
//                    user_role = rs.getString("user_role");
//                }

            conn.close();

            //Validation for Login
            if (isLoggedIn.isEmpty() || user_role.isEmpty()) {
                response.sendRedirect("loginError.jsp");
            }

            if (user_role.equals("normal")) {
                response.sendRedirect("home.jsp");
            } else if (user_role.equals("admin")) {
                response.sendRedirect("adminPanel.jsp");
            } else {
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}