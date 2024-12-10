<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.model.Course"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminsessionfail");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Course Details</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f8;
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
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.8em;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 15px;
            margin: 10px 0;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .sidebar a:hover {
            background-color: #007bff;
            transform: translateX(5px);
        }

        .logout {
            background-color: #e74c3c;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
            display: block;
        }

        .logout:hover {
            background-color: #c0392b;
        }

        /* Main Content Styles */
        .main {
            margin-left: 270px;
            padding: 40px;
        }

        h1, h2 {
            color: #004b8d;
        }

        h3 {
            margin-top: 30px;
        }

        .no-data {
            color: #e74c3c;
            font-weight: bold;
            font-size: 1.2em;
        }

        /* Table Styles */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #004b8d;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover td {
            background-color: #d9eaff;
        }

        /* Back Button */
        .back-button {
            display: inline-block;
            background-color: #004b8d;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
        }

        .back-button:hover {
            background-color: #007bff;
        }

        /* Delete Button */
        .delete-button {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 20px;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }

        /* Success and Error Messages */
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
        }

        .alert.success {
            background-color: #2ecc71;
            color: white;
        }

        .alert.error {
            background-color: #e74c3c;
            color: white;
        }
    </style>
    <script>
        // Confirmation before deleting the course
        function confirmDelete() {
            return confirm("Are you sure you want to delete this course? This action cannot be undone.");
        }
    </script>
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
        <!-- Success and Error Messages -->
        <c:if test="${not empty successMessage}">
            <div class="alert success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert error">${errorMessage}</div>
        </c:if>

        <h1>Course Details</h1>
        <h2>${course.name}</h2>
        <p>${course.description}</p>

        <!-- PDF Section -->
        <h3>Course Materials</h3>
        <c:if test="${not empty course.base64Pdf}">
            <a href="data:application/pdf;base64,${course.base64Pdf}" download="${course.name}_Material.pdf">Download Course PDF</a>
        </c:if>
        <c:if test="${empty course.base64Pdf}">
            <p class="no-data">No course material available.</p>
        </c:if>

        <!-- Enrolled Students -->
        <h3>Enrolled Students</h3>
        <c:if test="${not empty students}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <td>${student.email}</td>
                            <td>${student.contact}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty students}">
            <p class="no-data">No students enrolled in this course.</p>
        </c:if>

        <!-- Delete Course Button with Confirmation -->
        <form method="post" action="deleteCourse" onsubmit="return confirmDelete();">
            <input type="hidden" name="courseId" value="${course.id}" />
            <button type="submit" class="delete-button">Delete Course</button>
        </form>

        <a href="courses" class="back-button">Back to Courses</a>
    </div>
</body>
</html>
