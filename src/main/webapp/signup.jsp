<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create an Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #42acfe, #1111);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            max-width: 400px; /* Set maximum width */
            width: 100%; /* Make it responsive */
            text-align: left;
        }
        label {
            margin-top: 10px;
            display: block;
        }
        input[type="text"], input[type="password"], select {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4facfe;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #00f2fe;
        }
        p {
            margin-top: 20px;
            text-align: center; /* Center the paragraph */
        }
        .error-message {
            color: red;
            margin: 10px 0;
            text-align: center; /* Center the error message */
        }
    </style>
</head>
<body>
    <form action="SignUpServlet" method="post">
        <h2>Create an Account</h2>
        
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="Employee">Employee</option>
            <option value="Admin">Admin</option>
            <option value="Manager">Manager</option>
            <!-- Add other roles as needed -->
        </select>
        
        <input type="submit" value="Sign Up">
        
        <%
            // Display error message if it exists
            String errorMessage = request.getParameter("error");
            if (errorMessage != null) {
        %>
            <p class="error-message"><%= errorMessage %></p>
        <%
            }
        %>
        
        <p>Already have an account? <a href="login.jsp" style="color: #fff; text-decoration: underline;">Log in here</a>.</p>
    </form>
</body>
</html>
