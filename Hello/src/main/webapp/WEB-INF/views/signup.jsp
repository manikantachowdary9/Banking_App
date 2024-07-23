<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        user-select: none;
    }
    .header-strip {    
        background-color: rgba(18, 10, 143, 0.5); /* Light blue background */
        padding: 2px 0;
        text-align: left;
        color: white;
    }
    h1 {
        margin-left: 50px;
        opacity: 0; /* Initially hidden */
        animation: fadeIn 1s forwards;
    }
    @keyframes fadeIn {
        100% {
            opacity: 1;
        }
    }
    h2 {
        text-align: center;
        color: black;
        margin-top: 20px; /* Adjusted margin top */
        opacity: 0;
        animation: zoomIn 1s forwards; /* Zoom in animation */
    }
    @keyframes zoomIn {
        0% {
            opacity: 0;
            transform: scale(0.5);
        }
        100% {
            opacity: 1;
            transform: scale(1);
        }
    }
    form {
        width: 600px;
        background-color: rgba(18, 10, 143, 0.5); /* Light blue background */
        margin: 0 auto;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        opacity: 0; /* Initially hidden */
        animation: slideIn 1s forwards; /* Slide in animation */
    }
    @keyframes slideIn {
        100% {
            opacity: 1;
        }
    }
    label {
        display: block;
        margin-bottom: 5px;
        color: black;
    }
    input[type="text"],
    input[type="password"],
    input[type="email"] {
        width: calc(100% - 20px);
        padding: 10px;
        color: black;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        background-color: green; /* Change button color to green */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease, font-size 0.3s ease, font-weight 0.3s ease;
    }
    input[type="submit"]:hover {
        font-weight: bold;
        font-size: 18px;
    }
    .error-message {
        color: red;
        font-size: 14px;
        margin-top: 5px;
    }
    .tile {
        margin: auto; 
        text-align: center; 
        max-width: 30%;
        height: 20%;
    }
    img {
        max-width: 40%;
        height: auto;
    }
</style>
</head>
<body>
<div class="header-strip">
    <h1>VelTech Bank</h1>
</div>
<div class="tile">
    <img src="ADD-CUS.jpg" alt="Add Customer">
</div>
<h2>Add Customer</h2>
<form method="post" action="<%= request.getContextPath() %>/RegisterServlet" onsubmit="return validateForm()" enctype="multipart/form-data">
    <label for="full_name">Full Name:</label>
    <input type="text" id="full_name" name="full_name" required><br>
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required><br>
    <label for="email_id">Email ID:</label>
    <input type="email" id="email_id" name="email_id" required><br>
    <label for="phone">Phone Number:</label>
    <input type="text" id="phone" name="phone" required><br>
    <label for="account">Account Type:</label>
    <input type="text" id="account" name="account" required><br>
    <label for="balance">Balance:</label>
    <input type="text" id="balance" name="balance" required><br>
    <label for="dob">Date of Birth:</label>
    <input type="text" id="dob" name="dob" placeholder="YYYY-MM-DD" required><br>
    <label for="id_proof">ID Proof:</label>
    <input type="file" id="id_proof" name="id_proof" accept="image/*"><br>
    <div id="formError" class="error-message"></div>
    <input type="submit" value="Register">
    <p><strong>Note:</strong>Id proof should be in PNG format</p>
</form>
<script>
    function validateForm() {
        var balance = document.getElementById("balance").value;
        var fileInput = document.getElementById("id_proof");
        var filePath = fileInput.value;
        var accountType = document.getElementById("account").value.toLowerCase();
        var allowedExtensions = /(\.png)$/i;
        var formError = document.getElementById("formError");
        formError.innerHTML = "";

        if (isNaN(balance) || parseFloat(balance) < 1000) {
            formError.innerHTML = "Balance should be a numeric value and equal or above 1000";
            return false;
        }

        var email = document.getElementById("email_id").value;
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            formError.innerHTML = "Invalid email address";
            return false;
        }

        if (!allowedExtensions.exec(filePath)) {
            formError.innerHTML = "Please upload file in PNG format only.";
            fileInput.value = '';
            return false;
        }

        if (accountType !== "savings" && accountType !== "current") {
            formError.innerHTML = "Account should be either in Saving account or Current account";
            return false;
        }

        var phoneNumber = document.getElementById("phone").value;
        if (phoneNumber.length !== 10 || isNaN(phoneNumber)) {
            formError.innerHTML = "Phone number should be 10 digits";
            return false;
        }

        return true;
    }
</script>

</body>
</html>
