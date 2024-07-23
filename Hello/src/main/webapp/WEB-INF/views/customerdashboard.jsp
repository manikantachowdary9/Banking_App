<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="register.AccountDetails" %>   
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        user-select: none;
        background-color: #f2f2f2; /* Light gray background */
    }
    
    .header-strip {
        background-color: rgba(18, 10, 143, 0.8); /* Dark blue background */
        padding: 10px 0;
        text-align: center;
        color: white;
        border-radius: 0 0 8px 8px; /* Rounded corners at the bottom */
    }
    
    h1 {
        margin: 0;
    }
    
    h2 {
        text-align: center;
        margin-top: 50px;
        color: black;
        opacity: 0;
        animation: fadeIn 1s forwards;
    }

    @keyframes fadeIn {
        100% {
            opacity: 1;
        }
    }

    #balance {
        text-align: center;
        color: green;
        font-size: 18px;
    }

    .tiles-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        margin-top: 20px;
    }
    
    .tile {
        width: 40%; /* Adjusted width for 2 buttons in a row */
        margin-bottom: 20px;
        text-align: center;
        position: relative;
        padding-top: 50px; /* Add padding for image */
        background-color: white;
        border-radius: 8px; /* Rounded corners */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow for depth */
        overflow: hidden; /* Hide overflowing content */
        transition: transform 0.3s ease; /* Add smooth hover effect */
    }

    .tile:hover {
        transform: translateY(-5px); /* Move tile up slightly on hover */
    }
    
    .tile img {
        width: 100px;
        height: 100px;
        position: absolute;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
    }

    button {
        margin-top: 60px; /* Adjusted margin */
        background-color: rgba(18, 10, 143, 0.8); /* Dark blue button */
        color: white;
        padding: 15px 10px; /* Adjusted padding */
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease, font-size 0.3s ease, font-weight 0.3s ease;
        width: 80%; /* Adjusted width */
    }

    button a {
        text-decoration: none; 
        color: white;
    }
    
    button:hover {
        font-size: 18px;
        font-weight: bold;
    }

    .error {
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
</style>
</head>
<body>
    <div class="header-strip">
        <h1>VelTech Bank</h1>
    </div>
    <%
        AccountDetails accountDetails = (AccountDetails) request.getAttribute("accountDetails");
        if (accountDetails != null) {
    %>
    <%
    if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
%>
    <h2>Welcome to your Dashboard, <%= accountDetails.getFullName() %>!</h2>
    <p id="balance"><strong>Current Balance:</strong> <%= accountDetails.getBalance() %></p>
    <div class="tiles-container">
        <div class="tile">
            <img src="acc-det.png" alt="Account">
            <button><a href="<%= request.getContextPath() %>/AccountServlet">Account</a></button>
        </div>
        <div class="tile">
            <img src="transaction-cus.png" alt="Transactions">
            <button><a href="<%= request.getContextPath() %>/TransactionServlet">Transactions</a></button>
        </div>
        <div class="tile">
            <img src="deposit-cus.png" alt="Deposit">
            <button><a href="<%= request.getContextPath() %>/DS">Deposit</a></button>
        </div>
        <div class="tile">
            <img src="withdraw-cus.png" alt="Withdraw">
            <button><a href="<%= request.getContextPath() %>/WithdrawServlet">Withdraw</a></button>
        </div>
        <div class="tile">
            <img src="delete-cus.png" alt="Delete">
            <button><a href="<%= request.getContextPath() %>/DeleteServlet">Delete</a></button>
        </div>
    </div>
<%
    } else {
%>
    <p class="error">You are not logged in. Please log in to access the dashboard.</p>
<%
    }
%>
<%
        } else {
    %>
        <p class="error">Account details not available.</p>
    <%
        }
    %>
</body>
</html>
