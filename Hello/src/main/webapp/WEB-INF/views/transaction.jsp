<%@ page import="java.util.List" %>
<%@ page import="register.Transaction" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Transaction History</title>
   <style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    align-items: center;
    justify-content: center;
    height: 100vh;
    background-color: rgba(18, 10, 143, 0.1); /* Light blue background */
    color: black;
}

.header-strip {
    background-color: rgba(18, 10, 143, 0.5); /* Light blue background */
    padding: 10px 0;
    text-align: center;
    color: white; /* White text */
}

h1 {
    margin-left: 50px;
    color: white; /* White text */
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: black;
    animation: fadeInUp 1s ease-in-out;
}

form {
    width: 300px;
    margin: 0 auto;
    padding: 20px;
    border-radius: 8px;
}

input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: black;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    font-weight: bold;
    font-size: 18px;
}

table {
    width: 80%;
    margin: auto;
    border-collapse: collapse;
    box-shadow: 0 0 10px black;
    background-color: rgba(238, 225, 225, 0.8); /* Light blue background */
    animation: fadeIn 1s ease-in-out;
}

th, td {
    border: 1px solid black;
    padding: 12px;
    text-align: left;
    transition: background-color 0.3s ease-in-out;
}

th {
    background-color: #1B3C73; /* Dark blue background */
    color: white; /* White text */
    animation: fadeInLeft 1s ease-in-out;
}

tr:hover {
    background-color: #1B3C73; /* Dark blue background */
    animation: fadeIn 0.5s ease-in-out;
    color: white; /* White text */
}

.tile {
    margin: auto;
    text-align: center;
}

img {
    max-width: 200px;
    height: auto;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeInLeft {
    from {
        opacity: 0;
        transform: translateX(-50px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}
</style>
</head>

<body>
<div class="header-strip">
        <h1 style="margin-left:auto; margin-right:auto; width:200px;">VelTech Bank</h1>
      </div>
      <div class="tile">
        <img src="ADD-CUS.jpg" alt="Transaction History">
    </div>
<h2>Transaction History</h2>

<% 
List<Transaction> transactionList = (List<Transaction>) request.getAttribute("transactions");
System.out.println("Transaction list size in JSP: " + (transactionList != null ? transactionList.size() : "null"));
if (transactionList != null && !transactionList.isEmpty()) {
%>
    <table border="1">
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Amount</th>
                <th>Transaction Type</th>
                <th>Transaction Time</th>
            </tr>
        </thead>
        <tbody>
            <% for (Transaction transaction : transactionList) { %>
                <tr>
                    <td><%= transaction.getAccountNumber() %></td>
                    <td><%= transaction.getAmount() %></td>
                    <td><%= transaction.getTransactionType() %></td>
                    <td><%= transaction.getTransactionTime() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
<% } else { %>
    <p>No transactions found.</p>
<% } %>

<br>
<form action="MiniServlet" method="get">
    <input type="submit" value="Print in PDF">
</form>
</body>
</html>
