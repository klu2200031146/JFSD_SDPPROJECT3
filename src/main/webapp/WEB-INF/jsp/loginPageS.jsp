<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <style>
        /* Page background and layout */
        body {
            font-family: 'Arial', sans-serif;
            background: url("${pageContext.request.contextPath}/loginbg.jpg") no-repeat center 5%;
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

        .navbar a {
            color: #007bff;
            text-decoration: none;
            margin: 0 20px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .navbar a:hover {
            text-decoration: underline;
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
            margin-top: 10px;
        }

        /* Admin login button with gradient and glow effect */
        .admin-button {
            display: inline-block;
            padding: 12px 24px;
            background: linear-gradient(135deg, #28a745, #218838); /* Gradient background */
            color: #fff; /* White text */
            text-decoration: none;
            border: none;
            border-radius: 50px; /* Rounded corners */
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px rgba(40, 167, 69, 0.3); /* Initial shadow */
            transition: all 0.3s ease-in-out;
            margin-top: 15px;
        }

        .admin-button:hover {
            background: linear-gradient(135deg, #218838, #1e7e34); /* Slightly darker gradient */
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.5); /* Stronger shadow */
            transform: translateY(-3px); /* Lift effect */
        }

        .admin-button:active {
            transform: translateY(0); /* Reset lift effect when clicked */
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3); /* Soft shadow */
        }

        .login-link {
            margin-top: 15px;
        }

        .login-link p {
            margin-bottom: 5px;
            color: #333;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="http://localhost:2025/signup">Sign Up</a>
        <a href="http://localhost:2025/loginS">Login</a>
    </div>

    <!-- Login Form Container -->
    <div class="container">
        <h2>Student Login</h2>
        <form action="${pageContext.request.contextPath}/checkStudentlogin" method="POST">
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="semail" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="spwd" required>
            </div>
            <button type="submit">Login</button>
        </form>

        <!-- Display login failure message if login fails -->
        <c:if test="${not empty message}">
            <p class="error">${message}</p>
        </c:if>

        <!-- Admin Login Button -->
        <div class="login-link">
            <p>Are you an Admin?</p>
            <a href="http://localhost:2025/loginA" class="admin-button">Admin Login</a>
        </div>
    </div>
</body>
</html>
