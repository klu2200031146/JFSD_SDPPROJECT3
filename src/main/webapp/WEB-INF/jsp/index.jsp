<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Courses</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            background-color: #f5f5f5;
        }

        /* Navbar Styling */
        .navbar {
            width: 100%;
            padding: 15px 20px;
            background-color: #007bff; /* Bright blue */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            z-index: 10;
        }

        .navbar .logo {
            font-size: 1.5rem;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .navbar .links a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .navbar .links a:hover {
            color: #ffdd57; /* Warm yellow on hover */
        }

        /* Main Section */
        .main {
            text-align: right; /* Align text to the right */
            padding: 90px;
            width: 100%;
            margin-top: 10px; /* Offset for the fixed navbar */
        }

        .main h1 {
            font-size: 2.8rem;
            color: #007bff;
            margin-bottom: 20px;
        }

        .main p {
            font-size: 1.3rem;
            color: #555;
        }

        /* Image Styling */
        .image-container {
            position: absolute;
            top: 50%;
            left: 10%;
            transform: translateY(-50%);
        }

        .image-container img {
            width: 750px;
            height: auto;
            border-radius: 80px; /* Rounded corners for the image */
            box-shadow: 0 4px 70px rgba(0, 0, 0, 0.2); /* Add a shadow for depth */
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .main h1 {
                font-size: 2rem;
            }

            .main p {
                font-size: 1rem;
            }

            .navbar .links a {
                margin: 0 10px;
                font-size: 0.9rem;
            }

            .image-container img {
                width: 250px; /* Adjust size for smaller screens */
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">LearnHub</div>
        <div class="links">
            <a href="signup">Sign Up</a>
            <a href="loginS">Login</a>
        </div>
    </div>

    <!-- Image Section -->
    <div class="image-container">
        <img src="indexbg.avif" alt="Learning Image">
    </div>

    <!-- Main Section -->
    <div class="main">
        <h1>Learn Something New Today!</h1>
        <p>Explore courses, grow your skills, and shine bright!</p>
    </div>

</body>
</html>
