<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Role Selection</title>
  <style>
    body {
      
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            
            user-select: none;
        

    } body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 150%;
            background-image: url('money-2724241_1280.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0.8; /* Adjust the opacity value */
            z-index: -1; /* Ensure it's behind other content */
        }

    /* Reset default margin and padding */
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  
}

/* Header Strip Styles */

.header-strip {
  background-color: rgba(238, 225, 225, 0.5); /* Adjust the alpha value (last parameter) as needed */
  padding: 10px 0;
  text-align: left;
  color: green ;
}

    .container {
      max-width: 600px;
      margin: 50px auto;
      background-color: rgba(238, 225, 225, 0.5); 
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .header {
      text-align: center;
      margin-bottom: 10px;
    }
    .welcome {
      font-style: italic;
      color: white;
      text-align: center;
      font-size: 14px;
      margin-bottom: 20px;
      
    }
    .caption {
      font-size: 18px; /* Changed font size to 14px */
      color: #555;
      
      margin-bottom: 10px;
      text-align: center;
    }
    h2{
        color: white;
    }
    .role-selection {
      text-align: center;
      margin-bottom: 30px;
    }
    .role-selection button {
      padding: 10px 20px;
      font-size: 14px;
      margin: 0 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      background-color: green;
      color: white;
      
    }
    .role-selection button:hover {
        
        font-size: 18px;
        font-weight: bold;
    }
    .role-image {
      display: block;
    margin: auto;
      width: 120px; /* Adjust image size as needed */
      height: auto;
      margin-bottom: 20px;
      margin-top: 20px;
    }
    h2{
      text-align: center;
    }
   .welcome-message{
    text-align: center;
    margin-bottom: 10px;
   }
    .footer {
      text-align: center;
      margin-top: 30px;
    }
    h1{
        margin-left: 50px;
    }
    button {
        background-color: #092635;
        color: #f2f1eb; /* Change button text color to black */
        padding: 10px 10px;
        
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease, font-size 0.3s ease, font-weight 0.3s ease;
    }
    button a {
        text-decoration: none; 
        color: white;/* Remove underline */
        /* Change hyperlink color to black */
    }
    button a:hover {
        color: Black;/* Remove underline */
        /* Change hyperlink color to black */
    }
    button:hover {
            color: #092635;
        
        font-size: 18px;
    font-weight: bold;
    }
    p {
        text-align: center;
        color: #092635;
        animation: blink 1s infinite alternate; /* Add blinking animation */
    }
    @keyframes blink {
        0% {
            opacity: 1;
        }
        100% {
            opacity: 0;
        }
    }
  </style>
</head>
<body>
  <div class="header-strip">
    <h1>VelTech InfiniBank</h1>
  </div>
  <div class="container">
    <div class="welcome-section">
      <h2>Welcome</h2>
      <p class="welcome-message">Effortless Transactions - Every time - Every Where</p>
      <p class="caption">Please select your role:</p>
    </div>
    <div class="role-selection">
      <div class="role">
        <img src="download.jpeg" alt="Admin" class="role-image">
        <button><a href="<%= request.getContextPath() %>/AdminLoginServlet">Admin</a></button>
      </div>
      <div class="role">
        <img src="images.jpeg" alt="Customer" class="role-image">
        <button><a href="<%= request.getContextPath() %>/LoginServlet">Customer</a></button>
      </div>
    </div>
    </div>
</body>
</html>