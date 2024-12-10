<%@ page import="com.klef.jfsd.springboot.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminsessionfail");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Error</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            margin: 0;
            background-color: #f5f7fa;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #004b8d;
            height: 100vh;
            padding: 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
            position: fixed;
            color: #fff;
        }

        .sidebar h2 {
            margin-bottom: 20px;
            font-size: 1.6em;
            text-align: center;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin: 10px 0;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #007bff;
            transform: translateX(5px);
        }

        .logout {
            background-color: #d9534f;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            display: block;
        }

        .logout:hover {
            background-color: #c9302c;
        }

        /* Main Content Styles */
        .main {
            margin-left: 270px;
            padding: 40px;
            flex-grow: 1;
        }

        .main h1 {
            font-size: 2.2em;
            color: #d9534f;
            text-align: center;
            margin-bottom: 20px;
        }

        .error-message {
            font-size: 1.2em;
            color: #d9534f;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        /* Small Back Button with reduced width */
        .btn-back {
            display: block;
            margin-top: 20px;
            text-align: center;
            background-color: #007bff;
            color: white;
            padding: 15px 40px;  /* Adjusted padding */
            font-size: 15px;    /* Reduced font size */
            width: 150px;       /* Reduced width */
            border-radius: 5px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .main {
                margin-left: 0;
                padding: 20px;
            }

            .sidebar {
                width: 200px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Menu</h2>
        <a href="home2">Home</a>
        <a href="dashboard1">Dashboard</a>
        <a href="viewStudents">Student Information</a>
        <a href="courses">Courses</a>
        <a href="profile1">Profile</a>
        <a href="logout1" class="logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h1>Course Error</h1>
        <div class="error-message">
            An error occurred while processing your request. Please try again later.
        </div>

        <!-- Back Button -->
        <a href="dashboard1" class="btn-back">Go Back to Courses</a>
    </div>
</body>
</html>
