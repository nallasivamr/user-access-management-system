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

@WebServlet("/SoftwareServlet")
public class SoftwareServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        if (!"Admin".equals(role)) {
            response.sendRedirect("unauthorized.jsp");
            return;
        }

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String accessLevels = request.getParameter("accessLevels");
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)")) {

            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setString(3, accessLevels);
            stmt.executeUpdate();

            response.sendRedirect("createSoftware.jsp?success=Software added");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("createSoftware.jsp?error=Failed to add software");
        }
    }
}
