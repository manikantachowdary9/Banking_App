<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
    <title>Withdraw Money</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #F0F0F0; /* Light gray background */
        }

        h2{
            color: black;
            text-align: center;
            padding-top: 50px; /* Decreased padding */
            margin-top: -40px; /* Adjusted margin */
        }

        form {
            width: 90%; /* Adjusted width for responsiveness */
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid black;
            background-color: white; /* White background */
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: black;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc; /* Added border */
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: red;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            font-size: 18px;
            font-weight: bold;
        }

        .tile {
            margin: auto;
            text-align: center;
        }

        .header-strip {    
            background-color: rgba(18, 10, 143, 0.5); /* Dark blue background */
            padding: 10px 0;
            text-align: center;
            color: white; /* White text */
        }
        
        h1 {
            margin-left: 50px;
            opacity: 0;
            animation: fadeIn 1s forwards;
        }
        
        @keyframes fadeIn {
            100% {
                opacity: 1;
            }
        }

        img {
            max-width: 200px; /* Adjusted max-width for responsiveness */
            height: auto;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="header-strip">
    <h1>VelTech Bank</h1>
</div>
<div class="tile">
    <img src="withdraw-cus.png" alt="Withdraw Money">
</div>

<h2>Withdraw Money</h2>

<form action="<%= request.getContextPath() %>/WithdrawServlet" method="post" onsubmit="return validateForm()">
    <label for="amount">Enter Amount:</label>
    <input type="text" id="amount1" name="amount1" required>
    <br>
    <%
        String withdrawTime = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        session.setAttribute("withdrawTime", withdrawTime);
    %>
    <input type="submit" value="Withdraw" name="submit">
</form>

<script>
    function validateForm() {
        var amount = document.getElementById("amount1").value;
        if (amount <= 0) {
            alert("Withdrawal amount must be more than zero.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
