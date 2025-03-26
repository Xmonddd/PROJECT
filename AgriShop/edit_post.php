<?php
session_start();
$conn = new mysqli("localhost", "root", "", "agrishop");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["post_id"], $_POST["description"])) {
    $post_id = $_POST["post_id"];
    $description = $_POST["description"];

    $sql = "UPDATE posts SET description = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $description, $post_id);

    if ($stmt->execute()) {
        header("Location: buying.php");
    } else {
        echo "Error updating post.";
    }
}
?>
