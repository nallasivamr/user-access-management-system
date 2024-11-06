<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Requests</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e1e1e, #3a3a3a);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h2 {
            margin-bottom: 20px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            border: 1px solid #fff;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4facfe;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.2);
        }
        tr:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }
        button {
            background-color: #4facfe;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #00f2fe;
        }
    </style>
</head>
<body>
    <div>
        <h2>Pending Access Requests</h2>
        <table>
            <tr>
                <th>Request ID</th>
                <th>User</th>
                <th>Software</th>
                <th>Access Type</th>
                <th>Reason</th>
                <th>Action</th>
            </tr>
            <%
                try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "SERVLET", "TIGER");
                     PreparedStatement stmt = conn.prepareStatement("SELECT r.id, u.username, s.name AS software_name, r.access_type, r.reason FROM requests r JOIN users u ON r.user_id = u.id JOIN software s ON r.software_id = s.id WHERE r.STATUS = 'Pending'")) {
                     
                    ResultSet rs = stmt.executeQuery();
                    boolean hasRequests = false;

                    while (rs.next()) {
                        hasRequests = true;
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("software_name") %></td>
                <td><%= rs.getString("access_type") %></td>
                <td><%= rs.getString("reason") %></td>
                <td>
                    <form action="ApprovalServlet" method="post">
                        <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                        <button type="submit" name="action" value="approve">Approve</button>
                        <button type="submit" name="action" value="reject">Reject</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    if (!hasRequests) {
            %>
            <tr>
                <td colspan="6">No pending requests available.</td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
            %>
            <tr>
                <td colspan="6">Error loading requests. Please try again later.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
