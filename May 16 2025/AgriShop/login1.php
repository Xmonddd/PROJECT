<?php
session_start();
if (isset($_SESSION['username'])) {
    header("Location: buying.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>AgriShop</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    
    <style>
        body {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
            background-color: #D3D3D3;
        }

        .left-section {
            flex: 1;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding-left: 20px;
        }

        .mainimage {
            max-width: 90%;
            height: auto;
        }

        .custom-container {
            flex: 1;
            max-width: 400px;
            height: auto;
            margin: 20px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-left: auto;
            margin-right: 500px;
            position: relative;
        }

        .logo {
            position: absolute;
            top: -300px; /* Adjust to position the logo above the container */
            width: 300px; /* Small size for the logo */
            height: auto;
        }

        .container h2,
        .container h3 {
            margin: 10px 0;
        }

        .form-control {
            margin-bottom: 10px;
            padding: 10px;
            font-size: 16px;
        }

        .password-container {
            position: relative;
            width: 100%;
        }

        .password-container .form-control {
            padding-right: 40px; /* Reserve space for the eye icon */
        }

        .password-container .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #aaa;
        }

        .btn-primary {
            background-color: #007BFF;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .remember-me-container {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-top: 10px;
        }

        .remember-me-container input {
            margin-right: 5px;
        }

        .footer {
            text-align: center;
            padding: 10px;
            background-color: #f1f1f1;
            border-top: 1px solid #ddd;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .forgot-password {
            margin-top: 10px;
            font-size: 14px;
        }

        .forgot-password a {
            color: #007BFF;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
    
</head>
<body>

<div class="left-section">
    <img src="image/homepic.png" alt="" class="mainimage">
</div>

<div class="custom-container">
    <!-- Logo added here -->
    <img src="image/logo.png" alt="Logo" class="logo">
    
    <h2>AgriShop: Farmer Online</h2>
    <h3>Selling Web Application</h3>
    <form action="login.php" method="POST">
        <input type="text" name="username" placeholder="Username" required class="form-control">
        
        <!-- Password field with toggle visibility -->
        <div class="password-container">
            <input type="password" name="password" placeholder="Password" required class="form-control" id="password">
            <span class="glyphicon glyphicon-eye-open toggle-password" id="toggle-password"></span>
        </div>
        
        <!-- Google reCAPTCHA widget -->
        <div class="g-recaptcha" data-sitekey="6LczkDMrAAAAAP8xXG6xfiscM_zx6FnX3Lr2zi6Z"></div>
        
        <button type="submit" class="btn btn-primary btn-block">Login</button>
    </form>
    
    

    <a href="register.php">Signup here</a>
</div>

<footer class="footer">
    <p>&copy; 2025 AgriShop</p>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<script>
    // Toggle password visibility
    const togglePassword = document.getElementById('toggle-password');
    const passwordField = document.getElementById('password');

    togglePassword.addEventListener('click', function () {
        // Toggle the type attribute
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);

        // Toggle the eye icon class
        this.classList.toggle('glyphicon-eye-open');
        this.classList.toggle('glyphicon-eye-close');
    });
</script>
</body>
</html>