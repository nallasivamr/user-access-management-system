<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Software</title>
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
        form {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            width: 300px;
            text-align: left;
        }
        input[type="text"], select {
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
    </style>
</head>
<body>
    <form action="SoftwareServlet" method="post">
        <h2>Create New Software</h2>
        <label for="name">Software Name:</label>
        <input type="text" name="name" required>
        
        <label for="description">Description:</label>
        <input type="text" name="description" required>
        
        <label for="accessLevels">Default Access Levels:</label>
        <select name="accessLevels" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Execute">Execute</option>
        </select>
        
        <input type="submit" value="Add Software">
    </form>
</body>
</html>
