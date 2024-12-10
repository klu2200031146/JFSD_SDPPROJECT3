<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Course Details</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            background-color: #f8f9fa;
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
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #007bff;
            transform: translateX(5px);
        }

        .logout {
            background-color: #d9534f;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            display: block;
            margin-top: 20px;
            font-weight: bold;
            text-decoration: none;
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
            font-size: 2em;
            color: #003366;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Search Bar Styles */
        #myInput {
            width: 90%;
            padding: 12px;
            margin: 20px auto;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            display: block;
        }

        /* Table Styles */
        #myTableContainer {
            width: 90%;
            margin: auto;
        }

        #myTable {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #myTable th,
        #myTable td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        #myTable th {
            background-color: #004b8d;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        #myTable tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #myTable tr:hover {
            background-color: #e6f7ff;
        }

        .action-button {
            display: inline-block;
            background-color: #004b8d;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .action-button:hover {
            background-color: #007bff;
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
         <a href="viewfeedback">View Feedbacks</a>
        <a href="profile1">Profile</a>
        <a href="logout1" class="logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h1>View All Courses</h1>

        <!-- Search Bar -->
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for courses...">

        <!-- Table -->
        <div id="myTableContainer">
            <table id="myTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Description</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courses}" var="course">
                        <tr>
                            <td>${course.id}</td>
                            <td>${course.description}</td>
                            <td>${course.name}</td>
                            <td>
                                <img src="/courses/displaycourseimage?id=${course.id}" width="80px" height="80px" 
                                     onerror="this.src='default-image.jpg'" alt="Course Image" />
                            </td>
                            <td>
                                <a href="courseDetails?id=${course.id}" class="action-button">View Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 1; i < tr.length; i++) { // Start from 1 to skip header row
                td = tr[i].getElementsByTagName("td")[2];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</body>

</html>
