<?php
session_start();
include "database.php"; // Ensure database connection

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);
    $recaptchaResponse = $_POST['g-recaptcha-response'];

    // Verify the reCAPTCHA response
    $secretKey = '6LczkDMrAAAAAM5uDo_-iJe1XYYNijp7e41e78f4'; // Replace with your reCAPTCHA secret key
    $verifyUrl = "https://www.google.com/recaptcha/api/siteverify";
    $response = file_get_contents($verifyUrl . "?secret=" . $secretKey . "&response=" . $recaptchaResponse);
    $responseData = json_decode($response);

    if (!$responseData->success) {
        // If CAPTCHA verification failed
        echo "<script>alert('CAPTCHA verification failed. Please try again.'); window.location='index.php';</script>";
        exit();
    }

    // Validate username and password fields
    if (empty($username) || empty($password)) {
        echo "<script>alert('Both fields are required!'); window.location='index.php';</script>";
        exit();
    }

    // Check if the user exists in the database
    $sql = "SELECT * FROM users WHERE username=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if ($user) {
        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Store user data in session
            $_SESSION['username'] = $user['username'];
            $_SESSION['fullname'] = $user['fullname']; // Store full name
            $_SESSION['profile_pic'] = $user['profile_pic'] ?? 'default.jpg'; // Store profile pic (if applicable)


            // Check if the user is an admin
            if ($user['is_admin'] == 1) {
                $_SESSION['is_admin'] = true;
                header("Location: adminpage.php"); // Redirect to the admin page
                exit();
            } else {
                $_SESSION['is_admin'] = false;
                header("Location: mainhome.php"); // Redirect to the user home page
                exit();
            }
        } else {
            // If password does not match
            echo "<script>alert('Invalid login credentials'); window.location='index.php';</script>";
            exit();
        }
    } else {
        // If user does not exist
        echo "<script>alert('User not found!'); window.location='index.php';</script>";
        exit();
    }

    $stmt->close();
} else {
    // Redirect back to the login page if accessed without POST method
    header("Location: index.php");
    exit();
}

$conn->close();
?>