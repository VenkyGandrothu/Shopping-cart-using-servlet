<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>

<style>
    * {
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #4facfe, #00f2fe);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
    }

    .container {
        background: #fff;
        width: 350px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    label {
        display: block;
        margin-top: 12px;
        font-size: 14px;
        color: #555;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
        margin-top: 20px;
        padding: 10px;
        background: #4facfe;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background: #00c6ff;
    }

    .login-link {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
    }

    .login-link a {
        color: #4facfe;
        text-decoration: none;
        font-weight: bold;
    }
</style>

</head>
<body>

<div class="container">
    <h2>Create Account</h2>

    <form action="registration" method="post">
        <label>Name</label>
        <input type="text" name="username" placeholder="Enter your name" required>

        <label>Email</label>
        <input type="email" name="useremail" placeholder="Enter your email" required>

        <label>Password</label>
        <input type="password" name="userpassword" placeholder="Enter password" required>

        <input type="submit" value="Register">

        <div class="login-link">
            Already have an account?
            <a href="Login.jsp">Login</a>
        </div>
    </form>
</div>

</body>
</html>
