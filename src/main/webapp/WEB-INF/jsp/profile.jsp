<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Student s = (Student) session.getAttribute("student");
    if (s == null) {
        response.sendRedirect("studentsessionfail");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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
            margin-left: 270px; /* Space for the sidebar */
            padding: 40px;
            flex-grow: 1;
        }

        .main h1 {
            font-size: 2.5em;
            color: #003366;
            text-align: center;
            margin-bottom: 40px;
        }

        /* Profile Card */
        .profile-card {
            width: 100%;
            max-width: 800px;
            background-color: #fff;
            padding: 30px;
            margin: auto;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            font-size: 1.1em;
        }

        .profile-card h2 {
            text-align: center;
            font-size: 2em;
            color: #003366;
            margin-bottom: 20px;
        }

        /* Profile Item */
        .profile-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-item label {
            font-weight: bold;
            color: #333;
            width: 30%;
        }

        .profile-item span {
            color: #555;
            width: 65%;
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

            .profile-card {
                padding: 20px;
            }

            .profile-item span {
                width: 80%;
            }
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar">
        <h2>Student Menu</h2>
        <a href="home1">Home</a>
        <a href="dashboard">Registration</a>
        <a href="mycourses" class="active">My Courses</a>
        <a href="studfeedback" class="active">Feedback</a>
        <a href="profile" class="active">Profile</a>
        <a href="settings">Update Profile</a> 
        <a href="logout" class="logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h1>Your Profile</h1>
        <div class="profile-card">
            <div class="profile-item">
                <label for="id">ID:</label>
                <span><%=s.getId() %></span>
            </div>
            <div class="profile-item">
                <label for="name">Name:</label>
                <span><%=s.getName()%></span>
            </div>
            <div class="profile-item">
                <label for="gender">Gender:</label>
                <span><%=s.getGender() %></span>
            </div>
            <div class="profile-item">
                <label for="dob">Date of Birth:</label>
                <span><%=s.getDateofbirth() %></span>
            </div>
            <div class="profile-item">
                <label for="department">Department:</label>
                <span><%=s.getDepartment() %></span>
            </div>
            <div class="profile-item">
                <label for="email">Email:</label>
                <span><%=s.getEmail() %></span>
            </div>
            <div class="profile-item">
                <label for="contact">Contact:</label>
                <span><%=s.getContact() %></span>
            </div>
        </div>
    </div>
</body>
</html>
