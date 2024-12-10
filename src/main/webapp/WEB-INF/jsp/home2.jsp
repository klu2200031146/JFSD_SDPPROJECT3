<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("adminsessionfail");
        return;
    }
    Admin a = (Admin) session.getAttribute("admin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Available Courses</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: linear-gradient(45deg, #004b8d, #007bff);
            height: 100vh;
            padding: 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
            position: fixed;
            color: #fff;
        }

        .sidebar h2 {
            margin-bottom: 20px;
            font-size: 1.8em;
            text-align: center;
            font-weight: bold;
            text-shadow: 2px 2px #003366;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 12px;
            margin: 10px 0;
            font-weight: bold;
            font-size: 1.1em;
            transition: background-color 0.3s, transform 0.2s;
            border-radius: 8px;
            text-shadow: 1px 1px #003366;
        }

        .sidebar a:hover {
            background-color: #0056b3;
            transform: translateX(8px);
        }

        .logout {
            background-color: #d9534f;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            margin-top: 30px;
            display: block;
            transition: background-color 0.3s;
            text-shadow: 1px 1px #c9302c;
        }

        .logout:hover {
            background-color: #c9302c;
        }

        /* Main Content */
        .main {
            margin-left: 270px; /* Space for sidebar */
            padding: 20px;
        }

        .main h1 {
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
        }

        /* Courses Section */
        .courses {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .course {
            width: 300px;
            background: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 20px;
            transition: transform 0.3s;
        }

        .course:hover {
            transform: scale(1.05);
        }

        .course img {
            max-width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .course h3 {
            margin-top: 15px;
            font-size: 1.5em;
            color: #333;
        }

        .course p {
            font-size: 1.1em;
            color: #555;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Menu</h2>
        <a href="home2">Home</a>
        <a href="dashboard1" class="active">Dashboard</a>
        <a href="viewStudents">Student Information</a>
        <a href="courses">Courses</a>
         <a href="viewfeedback">View Feedbacks</a>
        <a href="profile1">Profile</a>
        <a href="logout1" class="logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h1>Available Courses</h1>
        <div class="courses">
            <c:forEach var="course" items="${courses}">
                <div class="course">
                    <img src="data:image/jpeg;base64,${course.base64Image}" alt="${course.name}" />
                    <h3>${course.name}</h3>
                    
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
