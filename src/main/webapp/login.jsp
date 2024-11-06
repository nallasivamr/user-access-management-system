<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, rgba(10, 10, 10, 0.9), rgba(0, 0, 0, 0.8)), url('https://images.unsplash.com/photo-1497056513270-d9cf4caa8c74?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDh8fGJhdGtncm91bmR8ZW58MHx8fHwxNjA4NjQ3ODg3&ixlib=rb-1.2.1&q=80&w=1080') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
        }
        .login-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
            width: 400px;
            text-align: center;
        }
        h2 {
            margin-bottom: 30px;
            color: #333;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #4facfe;
            outline: none;
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
        .link {
            margin-top: 15px;
            display: block;
            color: #4facfe;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .link:hover {
            color: #00f2fe;
            text-decoration: underline;
        }
        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        <a class="link" href="signup.jsp">Create an Account</a>
        <div class="footer">© 2024 Your Company Name</div>
    </div>
</body>
</html>
