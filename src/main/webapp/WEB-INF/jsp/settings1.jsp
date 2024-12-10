<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
 Admin a=(Admin)session.getAttribute("admin");
 if(a==null)
 {
     response.sendRedirect("adminsessionfail");
     return;
 }

 String successMessage = (String) request.getAttribute("successMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>
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
            font-size: 2.2em;
            color: #003366;
            text-align: center;
            margin-bottom: 40px;
        }

        /* Form Styles */
        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        form {
            width: 100%;
        }

        table {
            width: 100%;
            border-spacing: 10px;
            margin-top: 20px;
        }

        table td {
            padding: 10px;
        }

        label {
            font-weight: bold;
            color: #333;
            font-size: 1.1em;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            margin-top: 5px;
            margin-bottom: 15px;
            transition: border-color 0.3s ease;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 1em;
            font-weight: bold;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            width: 45%;
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        input[type="submit"]:hover {
            background-color: #0069d9;
        }

        .button-container {
            text-align: center;
        }

        /* Success Message */
        .success-message {
            background-color: #28a745;
            color: white;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
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
    <div class="main">
        <h3 style="text-align: center;"><u>Update Data</u></h3>

        <div class="container">
            <form method="post" action="update">
            <table>
                    <tr>
                        <td><label for="uname">Enter Username</label></td>
                        <td><input type="text" id="uname" name="uname" value="<%=a.getUsername()%>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="epwd">Enter Password</label></td>
                        <td><input type="password" id="epwd" name="epwd" value="<%=a.getPassword()%>" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Update"/>
                        </td>
                    </tr>
                </table>
        </form>

        </div>
        
    </div>
    
</body>
</html>
