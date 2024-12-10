<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Course Feedback</title>
    <style>
        /* Page styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* White background */
            margin: 0;
            display: flex;
            height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #004b8d;
            height: 100vh;
            padding: 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
            position: fixed;
            top: 0;
            left: 0;
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

        /* Container for Feedback Form */
        .container {
            background: linear-gradient(to bottom, #e6f0ff, #d4e4ff); /* Gradient background */
            padding: 25px 35px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            width: 450px;
            text-align: center;
            margin: auto;
        }

        /* Center Form Wrapper */
        .main-content {
            margin-left: 250px; /* Adjusts for sidebar width */
            display: flex;
            justify-content: center;
            align-items: center;
            width: calc(100% - 250px);
            height: 100vh;
        }

        h2 {
            margin-bottom: 20px;
            color: #004b8d;
            font-size: 1.8em;
        }

        label {
            display: block;
            margin-top: 15px;
            text-align: left;
            color: #003366;
            font-weight: bold;
        }

        select, textarea, input {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border-radius: 8px;
            border: 1px solid #a3c1e1;
            background-color: #f4f9ff;
            color: #004080;
            font-size: 14px;
            box-sizing: border-box;
        }

        textarea {
            resize: none;
            height: 100px;
        }

        button {
            margin-top: 20px;
            padding: 12px;
            background-color: #007bff; /* Blue button */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-weight: bold;
        }

        button:hover {
            background-color: #0056b3;
        }

        .message {
            color: #28a745;
            margin-top: 15px;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar">
        <h2>Student Menu</h2>
        <a href="home1">Home</a>
        <a href="dashboard">Registration</a>
        <a href="mycourses">My Courses</a>
        <a href="studfeedback" class="active">Feedback</a>
        <a href="profile">Profile</a>
        <a href="settings">Update Profile</a>
        <a href="logout" class="logout">Logout</a>
    </div>

    <!-- Centered Feedback Form -->
    <div class="main-content">
        <div class="container">
            <h2>Course Feedback Form</h2>
            <form action="${pageContext.request.contextPath}/submitFeedback" method="POST">
                <!-- Course Selection -->
                <label for="course">Select Course:</label>
                <select name="courseId" id="course" required>
                    <option value="">-- Choose Course --</option>
                    <c:forEach var="course" items="${courses}">
                        <option value="${course.id}">${course.name}</option>
                    </c:forEach>
                </select>

                <!-- Rating -->
                <label for="rating">Rating (1 to 5):</label>
                <input type="number" id="rating" name="rating" min="1" max="5" required>

                <!-- Feedback Comment -->
                <label for="comments">Your Feedback:</label>
                <textarea id="comments" name="comments" placeholder="Share your thoughts here..." required></textarea>

                <!-- Submit Button -->
                <button type="submit">Submit Feedback</button>
            </form>

            <!-- Success Message -->
            <c:if test="${not empty message}">
            <p class="message">${message}</p>
            </c:if>

        </div>
    </div>
</body>
</html>
