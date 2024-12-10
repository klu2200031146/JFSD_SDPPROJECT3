<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Failed</title>
    <style>
        /* Overall page styling */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f2f4f7;
        }

        /* Styling for message container */
        .message-container {
            text-align: center;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 320px;
            animation: fadeIn 0.6s ease-in-out;
        }

        /* Error message styling */
        .message {
            color: #d9534f;
            font-size: 20px;
            margin-bottom: 25px;
            font-weight: 600;
        }

        /* Styling for the button-style link */
        .back-to-login {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        /* Hover effect for button */
        .back-to-login:hover {
            background-color: #0056b3;
        }

        /* Fade-in animation for smooth entrance */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <!-- Message container -->
    <div class="message-container">
        <p class="message">Login Failed. Please try again.</p>
        <a href="${pageContext.request.contextPath}/loginS" class="back-to-login">Login Here</a>
    </div>
</body>
</html>
