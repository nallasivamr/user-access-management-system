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

@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestId = request.getParameter("requestId");
        String action = request.getParameter("action");

        String status = action.equals("approve") ? "Approved" : "Rejected";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE requests SET status=? WHERE id=?")) {

            stmt.setString(1, status);
            stmt.setInt(2, Integer.parseInt(requestId));
            stmt.executeUpdate();

            response.sendRedirect("pendingRequests.jsp?success=Request " + status.toLowerCase());
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("pendingRequests.jsp?error=Failed to update request");
        }
    }
}
