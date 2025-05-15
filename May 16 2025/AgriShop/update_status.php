<?php
// Database Connection for updating post status
$conn_update = new mysqli("localhost", "root", "", "agrishop");
if ($conn_update->connect_error) {
    die("Connection failed: " . $conn_update->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $post_id = $_POST['post_id'];
    $new_status = $_POST['status'];

    // Get the redirect URL passed from the form or use HTTP_REFERER as a fallback
    $redirect_url = isset($_POST['redirect_url']) ? $_POST['redirect_url'] : (isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : 'index.php');

    $stmt = $conn_update->prepare("UPDATE posts SET status = ? WHERE id = ?");
    $stmt->bind_param("si", $new_status, $post_id);

    if ($stmt->execute()) {
        header("Location: " . $redirect_url . "?status_updated=true"); // Redirect back to the referring page
    } else {
        echo "Error updating status: " . $conn_update->error;
    }
    $stmt->close();
}

$conn_update->close();
?>