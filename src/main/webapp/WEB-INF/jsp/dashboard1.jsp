<%@ page import="com.klef.jfsd.springboot.model.Admin, com.klef.jfsd.springboot.model.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Admin Dashboard</title>
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
            color: #003366;
            text-align: center;
            margin-bottom: 40px;
        }

        /* Table Styles */
        table {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
            font-size: 16px;
        }

        td {
            font-size: 14px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Form Styles */
        .form-container {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            max-width: 600px;
            margin: 20px auto;
        }

        .form-container input,
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .form-container input[type="file"] {
            padding: 0;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            text-align: center;
            font-weight: bold;
            text-decoration: none;
        }

        .btn:hover {
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

            table {
                width: 100%;
            }
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
        <h1>Dashboard</h1>

        <!-- Display success or error message -->
        <c:if test="${not empty message}">
            <div style="color: green; font-weight: bold; text-align: center; margin-top: 20px;">
                ${message}
            </div>
        </c:if>

        <!-- Add Course Form -->
        <div class="form-container">
    <h2>Add Course</h2>
    <form action="addCourse" method="post" enctype="multipart/form-data">
        <!-- Course Name -->
        <label for="coursename">Course Name:</label>
        <input type="text" id="coursename" name="coursename" required>

        <!-- Course Description -->
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>

        <!-- Course Photo -->
        <label for="photo">Upload Photo:</label>
        <input type="file" id="photo" name="photo" accept="image/*" required>

        <!-- Course PDF -->
        <label for="pdf">Upload Course PDF:</label>
        <input type="file" id="pdf" name="pdf" accept="application/pdf" required>

        <!-- Submit Button -->
        <button type="submit" class="btn">Add Course</button>
    </form>
</div>



</body>
</html>
