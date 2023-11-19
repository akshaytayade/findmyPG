package com.example.findmypg;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.*;
import java.io.IOException;
import java.util.stream.Collectors;
import org.apache.commons.lang3.StringUtils;

@WebServlet(name = "UploadServlet", value = "/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        PrintWriter out = response.getWriter();

        //Fetching all the data from the form
        String prop_name = request.getParameter("prop_name");
        String prop_address = request.getParameter("prop_address");
        Integer price = Integer.valueOf(request.getParameter("prop_price"));
        String nearby_institute = request.getParameter("nearby_institute");
        String [] selectedOptions = request.getParameterValues("amenities");
        String selectedOptions_string = String.join(",", selectedOptions);
        String room_type = request.getParameter("sharing_type");
        String owner_name = request.getParameter("owner_name");

//        out.println(Arrays.toString(selectedOptions));
//        out.println(room_type);

        //DB Connection
        ServletContext sc = request.getServletContext();
        String DB_DRIVER = sc.getInitParameter("DB_DRIVER");
        String DB_URL = sc.getInitParameter("DB_URL");
        String DB_USER = sc.getInitParameter("DB_USER");
        String DB_PASS = sc.getInitParameter("DB_PASS");

        //Image Upload Logic
        String uploadPath =  "/Users/akshaytayade/IdeaProjects/findmyPG/src/main/webapp/uploaded_prop_images" + "/" + prop_name;
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        ArrayList<String> imgName = new ArrayList<String>();
        List<Part> fileParts = request.getParts().stream().filter(part -> "files".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList()); // Retrieves <input type="file" name="files" multiple="true">
        for (Part filePart : fileParts) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();// MSIE fix.
            imgName.add(fileName);
            InputStream fileContent = filePart.getInputStream();
            // ... (do your job here)
            String uploadDirectory = uploadPath + "/"+ fileName;
            try (OutputStream output = new FileOutputStream(uploadDirectory)) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }
                //After saving file
            } catch (IOException e) {
                // Handle the exception
                System.out.println(e);
            }
        }

        try {
            String imgName_string = StringUtils.join(imgName.iterator(),",");

            Class.forName(DB_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            PreparedStatement stmt = conn.prepareStatement("insert into property(pname,ptype,details,price,address,college,imgfilename,status,name) values (?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,prop_name);
            stmt.setString(2,room_type);
            stmt.setString(3,selectedOptions_string);
            stmt.setInt(4,price);
            stmt.setString(5,prop_address);
            stmt.setString(6, nearby_institute);
            stmt.setString(7,imgName_string);
            stmt.setInt(8,1);
            stmt.setString(9, owner_name);

            //Executing the Query
            int rowsAffected = stmt.executeUpdate();
            conn.close();

            //Validating if the query has been executed or not
            if (rowsAffected > 0){
                out.println(rowsAffected+" records inserted");
            }
            else {
                out.println(stmt);
                out.println("No records inserted");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}