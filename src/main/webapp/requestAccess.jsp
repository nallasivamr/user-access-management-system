<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*, jakarta.servlet.annotation.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Access</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.8), rgba(10, 10, 10, 0.9)), 
                        url('https://images.unsplash.com/photo-1497056513270-d9cf4caa8c74?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDh8fGJhdGtncm91bmR8ZW58MHx8fHwxNjA4NjQ3ODg3&ixlib=rb-1.2.1&q=80&w=1080') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
        }
        .request-container {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
            width: 400px;
            text-align: center;
        }
        h2 {
            margin-bottom: 30px;
        }
        select,
        textarea {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        input[type="submit"] {
            background-color: #4facfe;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #00f2fe;
        }
    </style>
</head>
<body>
    <div class="request-container">
        <h2>Request Access</h2>
        <form action="RequestAccessServlet" method="post">
            <select name="softwareId" required>
                <option value="" disabled selected>Select Software</option>
                <%
                    try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "SERVLET", "TIGER");
                         PreparedStatement stmt = conn.prepareStatement("SELECT id, name FROM software");
                         ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            <select name="accessType" required>
                <option value="" disabled selected>Select Access Type</option>
                <option value="view">View</option>
                <option value="edit">Edit</option>
                <option value="admin">Admin</option>
            </select>
            <textarea name="reason" rows="4" placeholder="Reason for Access" required></textarea>
            <input type="submit" value="Submit Request">
        </form>
    </div>
</body>
</html>
