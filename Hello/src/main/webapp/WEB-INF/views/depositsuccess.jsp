<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="register.AccountDetails" %> 
<%@ page import="java.math.BigDecimal" %>
<html>
<head>
    <title>DepositSuccess</title>
</head>
<style>
body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;       
        user-select: none;
        text-align:center;
    }
    img{
    max-width:30%;
    height:auto;
    }
    button {
        margin-top: 2px;
        background-color:green;	
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
<body>
<%
	AccountDetails accountDetails = (AccountDetails) request.getAttribute("accountDetails");
	BigDecimal amount = (BigDecimal) request.getSession().getAttribute("amount1");
   System.out.println("Amount in JSP: " + amount);
   if (accountDetails != null) {
    %>
    <img src="deposit-suc-cust.gif">
    <h2>Deposit Success</h2>
    <p><strong>Current Balance:</strong> <%= accountDetails.getBalance() %></p>	
	<p>You have successfully deposited <%= amount %> Rs to your account.</p>
    
    <button><a href="<%= request.getContextPath() %>/CustomerDashboardServlet">Return To DashBoard</a></button>
<%
        } else {
    %>
        <p class="error">Account details not available.</p>
    <%
        }
    %>
</body>
</html>
