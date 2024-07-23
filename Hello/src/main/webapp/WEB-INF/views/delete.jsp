<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Account</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h2{
        color: black;
        text-align: center;
        padding-top: 150px;
        margin-top: -120px;
    }

    form p{
        text-align: center;
    }
   
    form {       
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        width: 600px;
        margin: auto;
        color: black;
        border: 2px solid black;  
    }

    button[type="submit"] {
        background-color: red; /* Changed button color to red */
        color: white;
        padding: 10px 15px;
        align-items: center;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;        
        transition: background-color 0.3s ease;
    }

    button[type="submit"]:hover {
        font-size: 18px;
        font-weight: bold;
    }

    .tile {
        margin: auto; /* This centers the entire tile horizontally */
        text-align: center; /* This centers the contents (the image) within the tile */
    }

    img{
        max-width: 10%;
        height: auto;
    }

    .header-strip {
        background-color: rgba(238, 225, 225, 0.5);
        padding: 10px 0;
        margin-top: 0px;
        text-align: left;
        color: black;
    }
    
    h1 {
        margin-left: 50px;
    }
</style>
</head>
<body>
    <div class="header-strip">
        <h1>VelTech Bank</h1>
    </div>
    <div class="tile">
        <img src="delete-cus.png" alt="Add Customer">
    </div>

    <h2>Delete Account</h2>

    <form action="<%= request.getContextPath() %>/DeleteServlet" method="post">
        <p>Are you sure you want to close your account?</p>
        <button type="submit">Yes, Close Account</button>
    </form>
</body>
</html>
