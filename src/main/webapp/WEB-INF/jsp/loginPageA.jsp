<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        /* CSS styles for the entire page */
        body {
            font-family: 'Arial', sans-serif;
            background: url("${pageContext.request.contextPath}/loginAbg.jpg") no-repeat center 5%;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            height: 100vh;
            justify-content: center;
        }

        /* Navbar styles */
        .navbar {
            width: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 10px 0;
            position: fixed;
            top: 0;
            text-align: center;
            z-index: 1;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Login form container */
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            margin-top: 60px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #007bff;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
        }

        /* Student Login Button with Gradient and Glow */
        .student-button {
            display: inline-block;
            padding: 12px 24px;
            background: linear-gradient(135deg, #28a745, #218838); /* Gradient background */
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 50px; /* Rounded corners */
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px rgba(40, 167, 69, 0.3);
            transition: all 0.3s ease-in-out;
            margin-top: 15px;
        }

        .student-button:hover {
            background: linear-gradient(135deg, #218838, #1e7e34); /* Slightly darker gradient */
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.5);
            transform: translateY(-3px); /* Lift effect */
        }

        .student-button:active {
            transform: translateY(0); /* Reset lift effect */
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <!-- Navbar with no additional buttons -->
    </div>

    <!-- Login Form Container -->
    <div class="container">
        <h2>Admin Login</h2>
        <form action="${pageContext.request.contextPath}/checkadminlogin" method="POST">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="uname" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="pwd" required>
            </div>
            <button type="submit">Login</button>
        </form>

        <!-- Student Login Button -->
        <div class="login-link">
            <p>Are you a Student?</p>
            <a href="http://localhost:2025/loginS" class="student-button">Student Login</a>
        </div>

        <!-- Display error message if login fails -->
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
    </div>
</body>
</html>
