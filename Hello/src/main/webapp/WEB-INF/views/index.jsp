<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Application</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
            background-image: url('https://static.vecteezy.com/system/resources/previews/023/221/109/non_2x/banking-and-finance-concept-digital-connect-system-financial-and-banking-technology-with-integrated-circles-glowing-line-icons-and-on-blue-background-design-vector.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #333;
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 500px;
            width: 100%;
            margin-bottom: 100px; /* Ensure space for Contact Us section */
        }

        .dashboard h1 {
            margin-bottom: 20px;
            font-size: 2.5em;
            color: #007bff;
        }

        .description {
            margin-bottom: 20px;
            font-size: 1.2em;
        }

        .login-options {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .button {
            background-color: #007bff;
            color: white;
            padding: 15px 20px;
            margin: 10px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 45%;
            text-align: center;
        }

        .button.admin {
            background-color: #6c757d;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .contact-ribbon {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 1.2em;
        }

        .ribbon {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 40px;
            text-align: center;
            font-size: 3em;
            font-weight: bold;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
            .button {
                padding: 10px;
                width: 100%;
            }
            .login-options {
                flex-direction: column;
            }
            .contact-ribbon {
                padding: 10px;
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="ribbon">Banking Application</div>
    <div class="container">
        <div class="dashboard">
            <h1>Welcome to Our Bank</h1>
            <p class="description">Our bank offers a range of financial services to help you achieve your financial goals. We are committed to providing exceptional service and innovative solutions to meet your needs.</p>
            <div class="login-options">
                <a href="http://localhost:8034/Hello/AdminLoginServlet" class="button admin">Admin Login</a>
                <a href="http://localhost:8034/Hello/LoginServlet" class="button user">User Login</a>
            </div>
        </div>
    </div>
    <div class="contact-ribbon">
        <p>Contact Us: Email - support@ourbank.com | Phone - +123 456 7890</p>
    </div>
</body>
</html>
