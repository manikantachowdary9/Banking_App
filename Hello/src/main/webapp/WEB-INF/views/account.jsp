<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="register.AccountDetails" %>

<html>
<head>
    <title>Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            user-select: none;
            background-color: rgba(18, 10, 143, 0.1); /* Light blue background */
        }
       
        .header-strip {
            background-color: rgba(18, 10, 143, 0.5); /* Light blue background */
            padding: 10px 0;
            margin-top: 0px;
            text-align: left;
            color: white; /* Change text color to white */
        }
        
        h1 {
            margin-left: 50px;
            color: white; /* Change text color to white */
        }
        
        h2 {	
            margin-top: 5px;
            color: black;
            text-align: center;
            animation: fadeIn 1s forwards;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        .container {
            max-width: 1000px;
            margin: 20px auto;
            color: black;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid rgba(18, 10, 143, 0.8); /* Light blue border */
            box-shadow: 0 0 10px rgba(18, 10, 143, 0.5); /* Light blue shadow */
            animation: slideIn 1s forwards;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-100%);
            }
            to {
                transform: translateY(0);
            }
        }

        .detail-box {
            margin-bottom: 10px;
            border-radius: 5px;
            animation: fadeIn 1s forwards;
            border: 2px solid rgba(18, 10, 143, 0.8); /* Light blue border */
            box-shadow: 0 0 10px rgba(18, 10, 143, 0.5); /* Light blue shadow */
        }
        
        .detail-label {
            font-weight: bold;
            color: white; /* Change text color to white */
            padding: 10px;
            border: 2px solid rgba(18, 10, 143, 0.8); /* Light blue border */
            background-color: rgba(18, 10, 143, 0.8); /* Light blue background */
            text-align: center;
        }
        
        .detail-value {
            color: black;
            padding: 10px;
            text-align: center;
            background-color: white;
            border: 2px solid rgba(18, 10, 143, 0.8); /* Light blue border */
        }
        
        .tile {
            margin: auto;
            text-align: center;
        }
        
        img {
            max-width: 10%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="header-strip">
        <h1>VelTech Bank</h1>
    </div>
    <div class="tile">
        <img src="acc-det.png" alt="Account Details">
    </div>
    <h2>Account Details</h2>
    <div class="container">
        <%
            AccountDetails accountDetails = (AccountDetails) request.getAttribute("accountDetails");
            if (accountDetails != null) {
        %>
            <div class="detail-box">
                <div class="detail-label">Account Number:</div>
                <div class="detail-value"><%= accountDetails.getAccountNumber() %></div>
            </div>
            <div class="detail-box">
                <div class="detail-label">Account Holder Name:</div>
                <div class="detail-value"><%= accountDetails.getFullName() %></div>
            </div>
            <div class="detail-box">
                <div class="detail-label">Account Type:</div>
                <div class="detail-value"><%= accountDetails.getAccount() %></div>
            </div>
            <div class="detail-box">
                <div class="detail-label">Account Holder Address:</div>
                <div class="detail-value"><%= accountDetails.getAddress() %></div>
            </div>
            <div class="detail-box">
                <div class="detail-label">Account Holder Email-Id:</div>
                <div class="detail-value"><%= accountDetails.getEmailId() %></div>
            </div>
            <div class="detail-box">
                <div class="detail-label">Account Holder Phone Number:</div>
                <div class="detail-value"><%= accountDetails.getPhone() %></div>
            </div>
            <div class="detail-box">
                <div class="detail-label">Account Balance:</div>
                <div class="detail-value"><%= accountDetails.getBalance() %></div>
            </div>
            <div class="detail-box">
                <div class="detail-label">Account Holder Dob:</div>
                <div class="detail-value"><%= accountDetails.getDob() %></div>
            </div>
        <%
            } else {
        %>
            <p class="error">Account details not available.</p>
        <%
            }
        %>
    </div>
</body>
</html>
