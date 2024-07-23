<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            user-select: none;
            position: relative;
        }

        body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('cus-login.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0.8;
            z-index: -1;
        }

        .header-strip {
            padding: 20px 0;
            text-align: center;
            color: white;
            background-color: rgba(18, 10, 143, 0.8); /* Darkened background color */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add shadow for better visibility */
        }

        h1 {
            margin: 0;
        }

        h2 {
            text-align: center;
            color: white;
            font-size: 32px;
            margin-top: 40px;
            opacity: 0;
            animation: fadeInDown 1s forwards;
        }

        @keyframes fadeInDown {
            100% {
                opacity: 1;
                margin-top: 0;
            }
        }

        form {
            width: 600px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Add shadow for better visibility */
            opacity: 0.8;
            animation: slideInUp 1s forwards;
        }

        @keyframes slideInUp {
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 40px);
            background-color: #f5f5f5; /* Light gray background */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            color: #333;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff; /* Blue border color on focus */
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff; /* Blue button color */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, font-size 0.3s ease, font-weight 0.3s ease;
        }

        input[type="submit"]:hover {
            font-weight: bold;
            font-size: 18px;
        }

        .password-links {
            text-align: center;
        }

        .change-password {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .change-password:hover {
            color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
<div class="header-strip">
    <h1>VelTech Bank</h1>
</div>
<h2>Customer Login</h2>
<form action="<%= request.getContextPath() %>/LoginServlet" method="post">
    <label for="accountNumber">Account Number:</label>
    <input type="text" id="accountNumber" name="accountNumber" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <input type="submit" value="Login"><br>
    <div class="password-links">
        <a class="change-password" href="ChangePasswordServlet">Change Password</a><br>
    </div>
</form>
</body>
</html>
