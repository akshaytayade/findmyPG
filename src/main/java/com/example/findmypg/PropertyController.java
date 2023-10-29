package com.example.findmypg;

import com.mysql.jdbc.Driver;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "PropertyController", value = "/PropertyController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5,    // 5MB
        maxRequestSize = 1024 * 1024 * 5) // 5MB
public class PropertyController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        //Fetching DB Details from web.xml
        ServletContext servletContext = getServletContext();
        String DB_URL = servletContext.getInitParameter("DB_URL");
        String DB_USER = servletContext.getInitParameter("DB_USER");
        String DB_PASS = servletContext.getInitParameter("DB_PASS");

        //Getting fields from HTML form
        String name = request.getParameter("prop_name");
        String price = request.getParameter("prop_price");
        String img_name = request.getParameter("img");

        //Parsing the file
        String uploadPath = "/Users/akshaytayade/IdeaProjects/findmyPG/src/main/webapp/uploaded_prop_images"+"/"+name;
        System.out.println(uploadPath);
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        Collection<Part> fileParts = request.getParts();

        for (Part part : fileParts) {
            String fileName = getFileName(part);

            if (fileName != null && !fileName.isEmpty()) {
                String filePath = uploadPath + File.separator + fileName;
                part.write(filePath);
            }
        }
        out.println("Image uploaded and saved successfully.");


        //Connecting to the Database
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//        } catch (ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        }
//        try {
//            Connection con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASS);
//            Statement stmt=con.createStatement();
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }

    }
    private String getFileName(Part part) {
        String contentDispositionHeader = part.getHeader("content-disposition");
        String[] elements = contentDispositionHeader.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}