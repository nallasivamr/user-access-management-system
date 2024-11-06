package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // Check if the username is present
        if (username == null) {
            response.sendRedirect("login.jsp?error=You must be logged in to request access.");
            return;
        }

        String softwareId = request.getParameter("softwareId");
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO requests (user_id, software_id, access_type, reason) VALUES ((SELECT id FROM users WHERE username=?), ?, ?, ?)")) {

            stmt.setString(1, username);
            stmt.setInt(2, Integer.parseInt(softwareId));
            stmt.setString(3, accessType);
            stmt.setString(4, reason);
            stmt.executeUpdate();

            response.sendRedirect("requestAccess.jsp?success=Request submitted");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("requestAccess.jsp?error=Failed to submit request: " + e.getMessage());
        }
    }
}
