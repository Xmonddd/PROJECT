<?php
session_start();
include "database.php"; // Ensure database connection

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST['email']);

    // Validate email field
    if (empty($email)) {
        echo "<script>alert('Email is required!'); window.location='forgot-password.php';</script>";
        exit();
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "<script>alert('Invalid email format!'); window.location='forgot-password.php';</script>";
        exit();
    }

    // Check if the email exists in the database
    $sql = "SELECT * FROM users WHERE email=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Generate a unique token for password reset
        $token = bin2hex(random_bytes(50));
        $expires_at = date("Y-m-d H:i:s", strtotime("+1 hour")); // Token expires after 1 hour

        // Save token and expiry time in the database
        $updateSql = "UPDATE users SET reset_token=?, reset_token_expires=? WHERE email=?";
        $updateStmt = $conn->prepare($updateSql);
        $updateStmt->bind_param("sss", $token, $expires_at, $email);
        $updateStmt->execute();

        // Send reset link to the user's email
        $resetLink = "http://yourdomain.com/reset-password.php?token=" . $token;
        $subject = "Password Reset Request - AgriShop";
        $message = "Hello,\n\nWe received a request to reset your password. Please click the link below to reset your password:\n\n$resetLink\n\nIf you did not request this, please ignore this email.\n\nThank you,\nAgriShop Team";
        $headers = "From: no-reply@yourdomain.com";

        if (mail($email, $subject, $message, $headers)) {
            echo "<script>alert('A password reset link has been sent to your email.'); window.location='index.php';</script>";
        } else {
            echo "<script>alert('Failed to send reset email. Please try again later.'); window.location='forgot-password.php';</script>";
        }
    } else {
        // If email does not exist
        echo "<script>alert('No account found with that email address.'); window.location='forgot-password.php';</script>";
    }

    $stmt->close();
    $conn->close();
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Forgot Password - AgriShop</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
            background-color: #D3D3D3;
        }

        .custom-container {
            max-width: 400px;
            width: 90%;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
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

        a {
            color: #007BFF;
            text-decoration: none;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="custom-container">
        <h2>Forgot Password</h2>
        <p>Enter your email address to reset your password.</p>
        <form action="forgot-password.php" method="POST">
            <input type="email" name="email" placeholder="Email Address" required class="form-control">
            <button type="submit" class="btn btn-primary btn-block">Send Reset Link</button>
        </form>
        <a href="index.php">Back to Login</a>
    </div>
</body>
</html>