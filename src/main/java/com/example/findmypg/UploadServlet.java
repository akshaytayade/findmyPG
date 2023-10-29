package com.example.findmypg;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.nio.file.Paths;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet(name = "UploadServlet", value = "/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        String prop_name = request.getParameter("prop_name");
        List<Part> fileParts = request.getParts().stream().filter(part -> "files".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList()); // Retrieves <input type="file" name="files" multiple="true">
        for (Part filePart : fileParts) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();// MSIE fix.
            System.out.println(fileName);
            InputStream fileContent = filePart.getInputStream();
            // ... (do your job here)
            String uploadDirectory = "/Users/akshaytayade/IdeaProjects/findmyPG/src/main/webapp/uploaded_prop_images/" + File.separator + prop_name + fileName;
            try (OutputStream output = new FileOutputStream(uploadDirectory)) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }
                out.println("<h3>File uploaded successfully!!</h3>");
            } catch (IOException e) {
                // Handle the exception
                System.out.println(e);
            }

        }
    }
}