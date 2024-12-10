<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Information</title>
    <style>
        /* General page styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #003366;
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar {
            width: 250px;
            background-color: #004b8d;
            color: white;
            height: 100vh;
            position: fixed;
            padding: 20px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin: 10px 0;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #007bff;
        }

        .logout {
            color: white;
            background-color: #d9534f;
            padding: 10px 20px;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .logout:hover {
            background-color: #c9302c;
        }

        /* Table styling */
        table {
            width: 95%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #004b8d;
            color: white;
            font-size: 1.1rem;
            text-transform: uppercase;
        }

        td {
            background-color: white;
            font-size: 0.95rem;
        }

        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        tr:hover td {
            background-color: #e3f2fd;
        }

        td ul {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        td ul li {
            margin: 5px 0;
        }

        /* Styling for success message */
        .success-message {
            color: green;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Menu</h2>
        <a href="home2">Home</a>
        <a href="dashboard1">Dashboard</a>
        <a href="viewStudents" class="courses-button">Student Information</a>
        <a href="courses" class="courses-button">Courses</a>
         <a href="viewfeedback">View Feedbacks</a>
        <a href="profile1">Profile</a>
        <a href="logout1" class="logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div style="margin-left: 270px; padding: 20px;">
        <h1>Student Information</h1>

        <!-- Display success message -->
        <c:if test="${not empty message}">
            <div class="success-message">
                ${message}
            </div>
        </c:if>

        <!-- Table displaying student information -->
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Department</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Registered Courses</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${students}" var="student">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>${student.gender}</td>
                        <td>${student.dateofbirth}</td>
                        <td>${student.department}</td>
                        <td>${student.email}</td>
                        <td>${student.contact}</td>
                        <td>
                            <ul>
                                <c:forEach items="${student.courses}" var="course">
                                    <li>${course.name}</li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
