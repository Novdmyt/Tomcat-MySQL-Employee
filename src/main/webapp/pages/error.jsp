<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
        }

        .error-container {
            text-align: center;
            margin: 100px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .error-heading {
            color: #e74c3c;
            font-size: 36px;
            margin-bottom: 20px;
        }

        .error-message {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .back-link {
            text-decoration: none;
            background-color: #3498db;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        .back-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="error-heading">Error</h1>
        <p class="error-message"><%=exception.getMessage() %></p>
        <a href="javascript:history.back()" class="back-link">Return back</a>
    </div>
</body>
</html>
