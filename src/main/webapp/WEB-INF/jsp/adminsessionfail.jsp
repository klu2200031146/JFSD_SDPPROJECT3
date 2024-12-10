<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Failed</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #f8f9fa, #e9ecef);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            text-align: center;
            background: #fff;
            border-radius: 15px;
            padding: 30px 40px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-in-out;
        }

        h3 {
            font-size: 2em;
            color: #d9534f;
            margin-bottom: 20px;
            text-shadow: 1px 1px #f8d7da;
        }

        a {
            text-decoration: none;
            font-size: 1.2em;
            color: #fff;
            background: #007bff;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s, transform 0.2s;
            display: inline-block;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
        }

        a:hover {
            background: #0056b3;
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0, 123, 255, 0.5);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            h3 {
                font-size: 1.8em;
            }

            a {
                font-size: 1em;
                padding: 8px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Session Expired</h3>
        <a href="loginA">Back to Login</a>
    </div>
</body>
</html>
