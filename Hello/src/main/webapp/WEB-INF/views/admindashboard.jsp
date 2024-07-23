<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            user-select: none;
        }
        
        .header-strip {
            background-color: rgba(18, 10, 143, 0.5); /* Light blue background */
            padding: 10px 0;
            margin-top: 0px;
            text-align: left;
            color: white; /* Change text color to white */
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        h1 {
            margin-left: 50px;
        }
        
        h2 {
            text-align: center;
            margin-top: 50px;
            color: black;
        }
       
        p {
            text-align: center;
            color: black;
            animation: blink 1s infinite alternate;
        }
        
        @keyframes blink {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }
        
        .tiles-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin-top: 20px;
        }
        
        .tile {
            width: 200px;
            margin-bottom: 20px;
            text-align: center;
            background-color: rgba(18, 10, 143, 0.7); /* Light blue background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.3s ease; /* Add transition effect */
        }
        
        .tile:hover {
            background-color: rgba(18, 10, 143, 0.9); /* Darken background color on hover */
            transform: translateY(-5px); /* Move tile up slightly on hover */
        }
        
        .tile img {
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
        }

        button {
            background-color: green;
            color: white;
            padding: 10px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, font-size 0.3s ease, font-weight 0.3s ease;
        }

        button a {
            text-decoration: none; 
            color: white;
        }
        
        button:hover {
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="header-strip">
        <h1>VelTech Bank</h1>
        <div class="tile1">
            <button id="cc"><a href="<%= request.getContextPath() %>/AdminLogoutServlet">Logout</a></button>
        </div>
    </div>
    <h2>Welcome Admin</h2>
    
    <div class="tiles-container">
        <div class="tile">
            <img src="ADD-CUS.jpg" alt="Add Customer">
            <button><a href="<%= request.getContextPath() %>/RegisterServlet">Add Customer</a></button>
        </div>
        <div class="tile">
            <img src="mod-cus.png" alt="Modify Customer">
            <button><a href="<%= request.getContextPath() %>/ModifyCustomerServlet">Modify Customer</a></button>
        </div>
        <div class="tile">
            <img src="view.png" alt="View Customer Details">
            <button><a href="<%= request.getContextPath() %>/ViewCustomerServlet">View Customer Details</a></button>
        </div>
        <div class="tile">
            <img src="delete-cus.png" alt="Delete Customer">
            <button><a href="<%= request.getContextPath() %>/DeleteCustomerServlet">Delete Customer</a></button>
        </div>
    </div>
</body>
</html>
