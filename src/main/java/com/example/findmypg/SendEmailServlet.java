package com.example.findmypg;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.mail.*;
import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "SendEmailServlet", value = "/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Loaded into Email Servlet");

        ServletContext sc = request.getServletContext();

        //Setting Properties
        String from = sc.getInitParameter("FROM_EMAIL");
        final String username = sc.getInitParameter("FROM_EMAIL");
        final String password = sc.getInitParameter("EMAIL_PASSWORD");
        String host = sc.getInitParameter("EMAIL_SMTP");

        String to = "iamakshay938@gmail.com";

        //configure Mailtrap's SMTP server details
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        //create the Session object
        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };
        Session session = Session.getInstance(props, authenticator);
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject("findmyPG | Property Details for: ");
            message.setContent("Just discovered that Jakarta Mail is fun and easy to use", "text/html");
            Transport.send(message);
            System.out.println("Email Message Sent Successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}