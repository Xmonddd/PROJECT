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
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 100vh; /* Full viewport height */
    margin: 0;
    padding: 0;
}

.left-section {
    flex: 1;
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
}

.mainimage {
    max-width: 50%;
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

.footer {
    text-align: center;
    padding: 10px;
    background-color: #f1f1f1;
    border-top: 1px solid #ddd;
    position: fixed;
    bottom: 0;
    width: 100%;
}
    </style>
</head>
<body>

<div class="left-section">
    <img src="image/homepic.png" alt="" class="mainimage">
</div>

<div class="custom-container">
    <h2>AgriShop: Farmer Online</h2>
    <h3>Selling Web Application</h3>
    <form action="login.php" method="POST">
        <input type="text" name="username" placeholder="Username" required class="form-control">
        <input type="password" name="password" placeholder="Password" required class="form-control">
        <button type="submit" class="btn btn-primary btn-block">Login</button>
    </form>
    <a href="register.php">Signup here</a>
</div>

<footer class="footer">
    <p>&copy; 2023 AgriShop</p>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>