<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styling */
        body {
            font-family: 'Helvetica Neue', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            background: url('${pageContext.request.contextPath}/signupbg.jpg') no-repeat center center fixed;
            background-size:123%;
            color: #333;
        }

        /* Overlay for background image */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5); /* Dark overlay */
            z-index: -1;
        }

        /* Navbar styling */
        .navbar {
            width: 100%;
            padding: 10px 0;
            background-color: rgba(255, 255, 255, 0.9);
            position: fixed;
            top: 0;
            display: flex;
            justify-content: center;
            z-index: 1;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .navbar a {
            color: #007bff;
            text-decoration: none;
            margin: 0 20px;
            font-weight: bold;
            font-size: 1.1em;
            transition: color 0.3s;
        }

        .navbar a:hover {
            color: #0056b3;
        }

        /* Container styling */
        .container {
            width: 400px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            z-index: 1;
            text-align: center;
            margin-top: 60px; /* Offset for navbar */
        }

        /* Heading */
        h2 {
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #333;
        }

        /* Form field styling */
        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Button styling */
        button {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Error and success messages */
        .error, .success {
            color: red;
            font-weight: bold;
            opacity: 0;
            transition: opacity 0.5s;
        }

        .error.show, .success.show {
            opacity: 1;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <!-- Overlay for background image -->
    <div class="overlay"></div>

    <!-- Navbar with login and signup links -->
    <div class="navbar">
        <a href="http://localhost:2025/signup">Sign Up</a>
        <a href="http://localhost:2025/loginS">Login</a>
    </div>

    <!-- Signup form container -->
    <div class="container">
        <h2>Student Sign Up</h2>
        <form id="signupForm" action="insertstud" method="POST">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="sname" required>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="semail" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="spwd" required>
            </div>
            <div class="input-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="sdob" required>
            </div>
            <div class="input-group">
                <label for="department">Department</label>
                <select id="department" name="sdepartment" required>
                    <option value="" disabled selected>Select your department</option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Information Technology">Information Technology</option>
                    <option value="Electrical Engineering">Electrical Engineering</option>
                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                </select>
            </div>
            <div class="input-group">
                <label for="gender">Gender</label>
                <select id="gender" name="sgender" required>
                    <option value="" disabled selected>Select your gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="input-group">
                <label for="contact">Contact Number</label>
                <input type="text" id="contact" name="scontact" required>
            </div>
            <button type="submit">Create Account</button>
        </form>

        <!-- Success and error message placeholders -->
        <c:if test="${not empty error}">
            <p class="error show">${error}</p>
        </c:if>
        <c:if test="${not empty success}">
            <p class="success show">${success}</p>
        </c:if>

        <!-- Login link below the form -->
        <div class="login-link">
            <p>Already have an account? <a href="http://localhost:2025/loginS">Login here</a></p>
        </div>
    </div>

    <script>
        const errorMsg = document.querySelector('.error');
        const successMsg = document.querySelector('.success');
        if (errorMsg.textContent) errorMsg.classList.add('show');
        if (successMsg.textContent) successMsg.classList.add('show');
    </script>
</body>
</html>
