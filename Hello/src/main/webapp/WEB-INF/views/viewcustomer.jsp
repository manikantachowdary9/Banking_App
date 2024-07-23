<%@ page import="java.util.List" %>
<%@ page import="register.Customer" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333; /* Dark gray text color */
            animation: fadeIn 1s ease-in-out; /* Fade-in animation */
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .header-strip {
            background-color: rgba(18, 10, 143, 0.5); /* Same color as Add Customer page */
            padding: 10px 0;
            text-align: left;
            color: white; /* White header text color */
            margin-top: -5px; /* Adjusted margin */
        }

        h1 {
            margin-left: 50px;
            opacity: 0; /* Initially hidden */
            animation: fadeInLeft 1s forwards; /* Slide in from left */
            color: #333; /* Dark gray heading color */
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333; /* Dark gray heading color */
            animation: fadeInUp 1s ease-in-out; /* Fade in with upward animation */
        }

        table {
            width: 80%;
            margin: auto;
            margin-bottom: 70px;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Slight shadow effect */
            background-color: #fff; /* White table background */
        }

        th, td {
            border: 1px solid #ccc; /* Light gray border */
            padding: 12px;
            text-align: left;
            transition: background-color 0.3s ease; /* Smooth background color transition */
        }

        th {
            background-color: rgba(18, 10, 143, 0.5); /* Same color as Add Customer page */
            color: white; /* White header text color */
        }

        tr:hover {
            background-color: #f1f1f1; /* Light gray background on hover */
            color: #333; /* Dark gray text color on hover */
            animation: fadeIn 0.5s ease-in-out; /* Fade-in animation on hover */
        }

        .tile {
            margin: auto; 
            text-align: center; 
        }

        img {
            max-width: 8%;
            height: auto;
        }
    </style>

</head>
<body>
    <div class="header-strip">
        <h1>VelTech InfiniBank</h1>
    </div>
    <div class="tile">
        <img src="view.png" alt="View Customer">
    </div>

    <h2>Customer Details</h2>

    <table border="1">
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Full Name</th>
                <th>Address</th>
                <th>Email ID</th>
                <th>Date of Birth</th>
                <th>Phone</th>
            </tr>
        </thead>
        <tbody>
            <% List<Customer> customerList = (List<Customer>) request.getAttribute("customers");
               for (Customer customer : customerList) { %>
                <tr>
                    <td><%= customer.getAccountNumber() %></td>
                    <td><%= customer.getFullName() %></td>
                    <td><%= customer.getAddress() %></td>
                    <td><%= customer.getEmailId() %></td>
                    <td><%= customer.getDob() %></td>
                    <td><%= customer.getphone() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
