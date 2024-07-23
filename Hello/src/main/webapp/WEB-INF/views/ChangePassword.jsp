<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <style>
        h2 {
            text-align: center;
            padding-top: 30px;
            color: #1B3C73;
            margin-bottom: 20px;
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            100% {
                opacity: 1;
            }
        }

       body {
            font-family: Arial, sans-serif;
            background-image: url('pass-reset.jpeg');
            background-size: cover;
            background-position: center;
            justify-content: center;
            align-items: center;
            height: 100vh;
            display: flex;
            flex-direction: column;
            margin: 0;
            padding: 0;
        }
        form {
            background-color:#120A8F;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 600px;
            color: white;
            margin: auto;
            opacity: 0;
            animation: slideIn 1s forwards;
            margin-top: -20px; /* Reduce the gap between form and heading */
        }

        @keyframes slideIn {
            100% {
                opacity: 1;
            }
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Ensure padding and border are included in width */
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #1B3C73;
        }

        input[type="submit"] {
            background-color: #1B3C73;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: green;
        }

        input[type="submit"]:active {
            transform: translateY(2px); /* Push the button down slightly when clicked */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add a shadow when clicked */
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            100% {
                opacity: 1;
            }
        }

        p {
            text-align: center;
            color: red;
            font-size: 20px;
            opacity: 0;
            animation: fadeIn 1s forwards;
            margin-top: 10px;
        }

        @keyframes fadeIn {
            100% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<h2>Change your Password!</h2>
<form action="<%= request.getContextPath() %>/ChangePasswordServlet" method="post" onsubmit="return validatePassword()">
    <label for="accountNumber">Account Number:</label>
    <input type="text" id="accountNumber" name="accountNumber" required>
    <label for="oldPassword">Old Password:</label>
    <input type="password" id="oldPassword" name="oldPassword" required>
    <label for="newPassword">New Password:</label>
    <input type="password" id="newPassword" name="newPassword" required>
    <div id="passwordError" class="error-message"></div>
    <input type="submit" value="Change Password">
</form>
<p><strong>NOTE:</strong> Password Should Contain more than 7 Characters and one Special Character</p>
<script>
    function validatePassword() {
        var newPassword = document.getElementById("newPassword").value;
        var passwordError = document.getElementById("passwordError");
        passwordError.innerHTML = "";

        if (newPassword.length < 8 || newPassword.length > 21) {
            passwordError.innerHTML = "Password should contain 8-21 characters.";
            return false;
        }

        var specialCharacterRegex = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/;
        if (!specialCharacterRegex.test(newPassword)) {
            passwordError.innerHTML = "Password should contain at least one special character.";
            return false;
        }

        return true;
    }
</script>
</body>
</html>
