<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Student Navigation</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            display: flex;
            background-color: #f5f7fa;
        }

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

        .main-content {
            margin-left: 270px; /* Sidebar width + padding */
            padding: 20px;
            width: calc(100% - 270px);
        }

        .form-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h3 {
            font-size: 1.8em;
            color: #004b8d;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .form-group label {
            font-size: 1.1em;
            width: 35%;
            text-align: right;
            padding-right: 10px;
        }

        .form-group input,
        .form-group select {
            width: 60%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }

        .form-group input[type="radio"] {
            width: auto;
        }

        .radio-group {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .form-buttons input {
            width: 48%;
            padding: 10px;
            background-color: #004b8d;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.1em;
            cursor: pointer;
        }

        .form-buttons input:hover {
            background-color: #007bff;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .sidebar {
                width: 200px;
            }

            .form-container {
                width: 100%;
            }

            .form-group {
                flex-direction: column;
                align-items: flex-start;
            }

            .form-group label {
                width: 100%;
                margin-bottom: 5px;
                text-align: left;
                padding: 0;
            }

            .form-group input,
            .form-group select {
                width: 100%;
            }

            .form-buttons input {
                width: 100%;
                margin-bottom: 10px;
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
    <div class="main-content">
        <!-- Form Container -->
        <div class="form-container">
            <h3>Update Student Profile</h3>

            <!-- Display message if any -->
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
            <div style="text-align: center; color: green; font-size: 1.2em; margin-bottom: 20px;">
                <%= message %>
            </div>
            <% } %>

            <!-- Update Profile Form -->
            <form method="post" action="/update">
                <div class="form-group">
                    <label for="sid">ID</label>
                    <input type="number" id="sid" name="sid" value="<%= s.getId() %>" readonly />
                </div>
                <div class="form-group">
                    <label for="sname">Enter Name</label>
                    <input type="text" id="sname" name="sname" value="<%= s.getName() %>" required />
                </div>
                <div class="form-group">
                    <label>Select Gender</label>
                    <div class="radio-group">
                        <input type="radio" id="male" name="sgender" value="MALE" <%= s.getGender().equals("MALE") ? "checked" : "" %> required />
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="sgender" value="FEMALE" <%= s.getGender().equals("FEMALE") ? "checked" : "" %> required />
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="sgender" value="OTHERS" <%= s.getGender().equals("OTHERS") ? "checked" : "" %> required />
                        <label for="others">Others</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sdob">Enter Date of Birth</label>
                    <input type="date" id="sdob" name="sdob" value="<%= s.getDateofbirth() %>" required />
                </div>
                <div class="form-group">
                    <label for="sdept">Select Department</label>
                    <select id="sdept" name="sdept" required>
                        <option value="CSE" <%= s.getDepartment().equals("CSE") ? "selected" : "" %>>CSE</option>
                        <option value="ECE" <%= s.getDepartment().equals("ECE") ? "selected" : "" %>>ECE</option>
                        <option value="CS & IT" <%= s.getDepartment().equals("CS & IT") ? "selected" : "" %>>CS & IT</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="semail">Enter Email ID</label>
                    <input type="email" id="semail" name="semail" value="<%= s.getEmail() %>" required />
                </div>
                <div class="form-group">
                    <label for="scontact">Enter Contact</label>
                    <input type="text" id="scontact" name="scontact" value="<%= s.getContact() %>" required />
                </div>

                <!-- Form Buttons -->
                <div class="form-buttons">
                    <input type="submit" value="Update" />
                    <input type="reset" value="Clear" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>
