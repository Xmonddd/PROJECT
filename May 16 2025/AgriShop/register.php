<?php 
include "database.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $fullname = $firstname . " " . $lastname; // Combine Firstname and Lastname
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Check if passwords match
    if ($password !== $confirm_password) {
        echo "<script>alert('Passwords do not match.'); window.location='register.php';</script>";
        exit();
    }

    // Validate firstname and lastname (no numbers allowed)
    if (!preg_match("/^[A-Za-z\s]+$/", $firstname) || !preg_match("/^[A-Za-z\s]+$/", $lastname)) {
        echo "<script>alert('Firstname and Lastname must only contain letters and spaces.'); window.location='register.php';</script>";
        exit();
    }

    // Validate strong password (no special characters)
    if (!preg_match("/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$/", $password)) {
        echo "<script>alert('Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, and a number. Special characters are not allowed.'); window.location='register.php';</script>";
        exit();
    }

    // Hash the password
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Check for duplicate username
    $checkUsernameSql = "SELECT * FROM users WHERE username = ?";
    $checkStmt = $conn->prepare($checkUsernameSql);
    $checkStmt->bind_param("s", $username);
    $checkStmt->execute();
    $checkResult = $checkStmt->get_result();

    if ($checkResult->num_rows > 0) {
        echo "<script>alert('Username already exists. Please choose a different username.'); window.location='register.php';</script>";
        exit();
    }

    // Check for duplicate email
    $checkEmailSql = "SELECT * FROM users WHERE email = ?";
    $checkEmailStmt = $conn->prepare($checkEmailSql);
    $checkEmailStmt->bind_param("s", $email);
    $checkEmailStmt->execute();
    $checkEmailResult = $checkEmailStmt->get_result();

    if ($checkEmailResult->num_rows > 0) {
        echo "<script>alert('Email already exists. Please use a different email address.'); window.location='register.php';</script>";
        exit();
    }

    // Handle Image Upload
    $profile_image_path = "uploads/default.png"; // Default profile picture
    if (isset($_FILES['profile_image']) && $_FILES['profile_image']['error'] === 0) {
        $image_name = time() . '_' . $_FILES['profile_image']['name'];
        $image_tmp = $_FILES['profile_image']['tmp_name'];
        $upload_dir = "uploads/";

        // Create uploads directory if it doesn't exist
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        move_uploaded_file($image_tmp, $upload_dir . $image_name);
        $profile_image_path = $upload_dir . $image_name;
    }

    // Save user to the database including the image path
    $sql = "INSERT INTO users (fullname, username, email, password, profile_image) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $fullname, $username, $email, $hashedPassword, $profile_image_path);

    if ($stmt->execute()) {
        echo "<script>alert('Registration successful! You can now login.'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error in registration!'); window.location='register.php';</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
   <!-- <link rel="stylesheet" href="css/style.css"> -->
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


        .container {
    flex: 1;
    max-width: 400px;
    height: auto;
    margin: 20px;
    padding: 30px; /* Increased padding for better spacing */
    background-color: #ffffff;
    border-radius: 12px; /* Slightly more rounded corners */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); /* Deeper shadow for a more modern look */
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-left: auto;
    margin-right: 20%; /* Adjusted margin for better centering */
    position: relative;
    border: 1px solid #ddd; /* Subtle border for definition */
}





        .logo {
            position: absolute;
            top: -300px; /* Adjust to position the logo above the container */
            width: 300px; /* Small size for the logo */
            height: auto;
        }

        form input[type="text"],
        form input[type="email"],
        form input[type="password"],
        button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background-color: #0056b3;
        }

        .file-upload-container {
            margin: 10px 0;
            text-align: left;
            width: 100%;
        }

        .file-upload-container .custom-file-label {
            background-color: #f4f4f9;
            border: 1px dashed #007bff;
            color: #007bff;
            text-align: center;
            cursor: pointer;
        }

        .file-name {
            font-size: 12px;
            color: #555;
            margin-top: 2px;
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

        a {
            font-size: 14px;
        }
    </style>

    <div class="left-section">
    <img src="image/homepic.png" alt="" class="mainimage">
</div>

    <script>
        // Add real-time validation for the Firstname and Lastname fields
        function validateName(input, id) {
            const regex = /^[A-Za-z\s]*$/; // Only letters and spaces are allowed
            const errorMessage = document.getElementById(id);

            if (!regex.test(input.value)) {
                errorMessage.textContent = "This field must only contain letters and spaces.";
                input.style.borderColor = "red";
            } else {
                errorMessage.textContent = "";
                input.style.borderColor = "green";
            }
        }

        // Add real-time validation for the Gmail email field
        function validateEmail(input) {
            const regex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/; // Only Gmail addresses are allowed
            const errorMessage = document.getElementById('email-error');

            if (input.value === "") {
                errorMessage.textContent = ""; // Clear the error message when input is empty
                input.style.borderColor = "";
            } else if (!regex.test(input.value)) {
                errorMessage.textContent = "Email must be a Gmail address (e.g., example@gmail.com).";
                input.style.borderColor = "red";
            } else {
                errorMessage.textContent = "";
                input.style.borderColor = "green";
            }
        }

        // Add real-time validation for strong passwords (no special characters)
        function validatePassword(input) {
            const regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$/; // Password regex without special characters
            const errorMessage = document.getElementById('password-error');

            if (input.value === "") {
                errorMessage.textContent = ""; // Clear the error message when the input is empty
                input.style.borderColor = "";
            } else if (!regex.test(input.value)) {
                errorMessage.textContent = "Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, and a number.";
                input.style.borderColor = "red";
            } else {
                errorMessage.textContent = "";
                input.style.borderColor = "green";
            }
        }

        // Real-time validation for confirm password field
        function validateConfirmPassword() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm-password").value;
            const errorMessage = document.getElementById("confirm-password-error");

            if (password !== confirmPassword) {
                errorMessage.textContent = "Passwords do not match.";
                document.getElementById("confirm-password").style.borderColor = "red";
            } else {
                errorMessage.textContent = "";
                document.getElementById("confirm-password").style.borderColor = "green";
            }
        }

        // Show the selected file name
        function showFileName(input) {
            const fileName = input.files[0] ? input.files[0].name : "No file selected";
            document.getElementById('file-name').textContent = fileName;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Signup</h2>
        <form action="register.php" method="POST" enctype="multipart/form-data">
            <!-- Real-time validation for Firstname -->
            <input type="text" name="firstname" placeholder="Firstname" required oninput="validateName(this, 'firstname-error')">
            <span id="firstname-error" style="color: red;"></span>

            <!-- Real-time validation for Lastname -->
            <input type="text" name="lastname" placeholder="Lastname" required oninput="validateName(this, 'lastname-error')">
            <span id="lastname-error" style="color: red;"></span>

            <!-- Username input -->
            <input type="text" name="username" placeholder="Username" required>

            <!-- Real-time validation for Gmail email -->
            <input type="email" name="email" placeholder="example@gmail.com" required oninput="validateEmail(this)">
            <span id="email-error" style="color: red;"></span>

            <!-- Password input with real-time strong password validation -->
            <input type="password" name="password" placeholder="Password" required id="password" oninput="validatePassword(this)">
            <span id="password-error" style="color: red;"></span>

            <!-- Confirm Password -->
            <input type="password" name="confirm_password" placeholder="Confirm Password" required id="confirm-password" oninput="validateConfirmPassword()">
            <span id="confirm-password-error" style="color: red;"></span>

           
            <!-- Custom file input for profile picture -->
            <div class="file-upload-container">
    <label class="custom-file-label" for="profile_image">Select Profile Picture</label>
    <input id="profile_image" type="file" name="profile_image" class="custom-file-input" accept="image/*" onchange="showFileName(this)" style="display: none;">
    <span id="file-name" class="file-name">No file selected</span>
</div>

            <button type="submit">Register</button>
        </form>
        <a href="index.php">Back to login</a>
    </div>
</body>
</html>