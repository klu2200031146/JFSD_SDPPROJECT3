<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%
    if (session == null || session.getAttribute("student") == null) {
        response.sendRedirect("studentsessionfail");
        return;
    }
    Student s = (Student) session.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Courses</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            background-color: #f5f7fa;
            color: #333;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #004b8d;
            height: 100vh;
            padding: 20px;
            position: fixed;
            color: #fff;
        }

        .sidebar h2 {
            color: #fff;
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
            border-radius: 5px;
        }

        .sidebar a.active {
            background-color: #007bff;
        }

        .sidebar a:hover {
            background-color: #007bff;
        }

        .logout {
            background-color: #d9534f;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            display: block;
            font-weight: bold;
        }

        .logout:hover {
            background-color: #c9302c;
        }

        /* Main Content Styles */
        .main {
            margin-left: 270px;
            padding: 40px;
        }

        .main h1 {
            color: #003366;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table Styles */
        .course-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
        }

        .course-table th, .course-table td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .course-table th {
            background-color: #004b8d;
            color: white;
        }

        .course-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Responsive */
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
        <h2>Student Menu</h2>
        <a href="home1">Home</a>
        <a href="dashboard">Registration</a>
        <a href="mycourses" class="active">My Courses</a>
        <a href="studfeedback">Feedback</a>
        <a href="profile">Profile</a>
        <a href="settings">Update Profile</a>
        <a href="logout" class="logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h1>My Registered Courses</h1>

        <!-- Success Message -->
        <c:if test="${not empty successMessage}">
            <div style="color: green;">${successMessage}</div>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty errorMessage}">
            <div style="color: red;">${errorMessage}</div>
        </c:if>

        <!-- Course Table -->
        <table class="course-table">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Course Description</th>
                    <th>Course Image</th>
                     <th>Course Material</th> 
                </tr>
            </thead>
            <tbody>
    <c:forEach var="course" items="${registeredCourses}">
        <tr>
            <td>${course.name}</td>
            <td>${course.description}</td>
            <td>
                <img src='/courses/displaycourseimage?id=${course.id}' 
                     alt="${course.name} Image" width="100px" height="100px" 
                     onerror="this.src='/images/default-image.jpg'" />
            </td>
 
<td>
    <a href="/courses/downloadmaterial?id=${course.id}" 
       style="color: blue; text-decoration: underline;">
        Download Material
    </a>
</td>

        </tr>
    </c:forEach>
</tbody>

        </table>
    </div>
</body>
</html>
