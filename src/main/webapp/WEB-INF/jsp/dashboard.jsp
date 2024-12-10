<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
    <title>Dashboard</title>
    <style>
    /* General Styles */
    body {
        font-family: 'Arial', sans-serif;
        display: flex;
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
        box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
        position: fixed;
        color: #fff;
    }

    .sidebar h2 {
        margin-bottom: 20px;
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
        text-align: center;
        text-decoration: none;
        font-weight: bold;
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
        font-size: 2.5em;
        color: #003366;
        text-align: center;
        margin-bottom: 40px;
    }

    /* Beautiful Table Style */
    .course-table {
        width: 100%;
        margin: 0 auto;
        border-collapse: collapse;
        background-color: #fff;
    }

    .course-table th, .course-table td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .course-table th {
        background-color: #004b8d;
        color: white;
    }

    .course-table tr:hover {
        background-color: #f1f1f1;
    }

    /* Register Button Style */
    .course-table td button {
        background-color: #004b8d; /* Dark blue */
        color: white;
        padding: 8px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .course-table td button:hover {
        background-color: #003366; /* Even darker blue on hover */
    }

    .course-table tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    
    /* Success Message */
    .success-message {
        padding: 20px;
        background-color: #4caf50;
        color: white;
        text-align: center;
        margin-bottom: 20px;
        border-radius: 5px;
    }

    /* Error Message */
    .error-message {
        padding: 20px;
        background-color: #f44336;
        color: white;
        text-align: center;
        margin-bottom: 20px;
        border-radius: 5px;
    }

    /* Responsive Styles */
    @media (max-width: 768px) {
        .main {
            margin-left: 0;
            padding: 20px;
        }

        .sidebar {
            width: 200px;
        }

        .course-table {
            padding: 20px;
        }
    }
</style>

</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar">
        <h2>Student Menu</h2>
        <a href="home1">Home</a>
        <a href="dashboard" class="active">Registration</a>
        <a href="mycourses" class="active">My Courses</a>
        <a href="studfeedback" class="active">Feedback</a>
        <a href="profile">Profile</a>
        <a href="settings">Update Profile</a>
        <a href="logout" class="logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h1>Course Registration</h1>

        <!-- Success Message -->
        <c:if test="${not empty successMessage}">
            <div class="success-message">${successMessage}</div>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>

        <h2>Available Courses</h2>
        <table class="course-table">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Course Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.name}</td>
                        <td>${course.description}</td>
                        <td>
                            <form action="/registerCourse" method="post">
                             <input type="hidden" name="courseId" value="${course.id}" />
                              <button type="submit">Register</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
