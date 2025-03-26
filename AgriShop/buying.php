<?php 
session_start();
include 'post.php';

if (!isset($_SESSION['username'])) {
    die("Error: User not logged in.");
}

// Database Connection
$conn = new mysqli("localhost", "root", "", "agrishop");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$user = $_SESSION['username']; 

// Get user profile image
$sql_user = "SELECT profile_image FROM users WHERE username = ?";
$stmt = $conn->prepare($sql_user);
$stmt->bind_param("s", $user);
$stmt->execute();
$result_user = $stmt->get_result();
$user_data = $result_user->fetch_assoc();

// Set default profile image if empty
$default_image = 'uploads/default.png';
$profile_image = !empty($user_data['profile_image']) ? htmlspecialchars($user_data['profile_image']) : $default_image;

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>AgriShop: Farm Online Website</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">

    <style>
/* Ensure dropdown is above other elements */
.dropdown-menu li a {
    display: block;
    padding: 8px 15px;
    color: black !important;
    text-decoration: none;
    font-size: 14px;
    background-color: transparent;
    width: 100%;
    text-align: left;
}

.dropdown-menu li a:hover {
    background-color: #f5f5f5 !important;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Post Input Box -->
<div class="post-container">
    <img src="<?php echo $profile_image; ?>" class="profile-pic">
    <div class="post-box" data-toggle="modal" data-target="#postModal">Click to post</div>
</div>

<!-- Posts Container -->
<div class="posts">
    <?php
    $conn = new mysqli("localhost", "root", "", "agrishop");
    $sql = "SELECT posts.*, users.fullname, users.profile_image
            FROM posts 
            JOIN users ON posts.username = users.username 
            WHERE posts.category='buying' 
            ORDER BY posts.created_at DESC";
    $result = $conn->query($sql);

    while ($row = $result->fetch_assoc()) {
        echo "<div class='post'>";
        echo "<div class='post-header'>";
        echo "<img src='" . htmlspecialchars($row['profile_image']) . "' class='profile-pic'>";
        echo "<p class='username'><strong>" . htmlspecialchars($row['fullname']) . "</strong></p>";
        echo "<span class='time' data-time='" . $row['created_at'] . "'></span>";

     // If the post belongs to the logged-in user, show the 3-dot menu
if ($row['username'] == $user) {
    echo "<div class='dropdown'>
            <button class='btn btn-default dropdown-toggle' type='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                <i class='fa fa-ellipsis-h'></i>
            </button>
            <ul class='dropdown-menu'>
                <li><a href='#' class='edit-post' data-id='" . $row['id'] . "' data-description='" . htmlspecialchars($row['description']) . "'>Edit</a></li>
                <li>
                    <form method='POST' action='delete_post.php' onsubmit='return confirm(\"Are you sure you want to delete this post?\");'>
                        <input type='hidden' name='post_id' value='" . $row['id'] . "'>
                        <button type='submit' class='dropdown-item' style='background: none; border: none; padding: 8px 15px; color: black; width: 100%; text-align: left;'>Delete</button>
                    </form>
                </li>
            </ul>
        </div>";
}

        

        echo "</div>"; // Close post-header
        
        echo "<p class='description'>" . htmlspecialchars($row['description']) . "</p>";
        echo "<img src='" . htmlspecialchars($row['file_path']) . "' class='post-image'>";
        echo "</div>"; // Close post
    }

    $conn->close();
    ?>
</div>

<!-- Edit Post Modal -->
<div id="editModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Post</h4>
            </div>
            <div class="modal-body">
                <form method="POST" action="edit_post.php">
                    <input type="hidden" name="post_id" id="edit-post-id">
                    <textarea name="description" id="edit-description" class="form-control" required></textarea>
                    <br>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Custom Script to Fix Dropdown -->
<script>
    $(document).ready(function() {
        // Fix Dropdown Toggle
        $(".dropdown-toggle").click(function(e) {
            e.stopPropagation(); // Prevent immediate closing
            $(this).next(".dropdown-menu").toggle();
        });

        // Close dropdown when clicking outside
        $(document).click(function() {
            $(".dropdown-menu").hide();
        });

        // Open Edit Post Modal
        $(".edit-post").click(function() {
            var postId = $(this).data("id");
            var description = $(this).data("description");
            $("#edit-post-id").val(postId);
            $("#edit-description").val(description);
            $("#editModal").modal("show");
        });
    });
</script>
<script>
    // Open Edit Post Modal
    $(".edit-post").click(function() {
        var postId = $(this).data("id");
        var description = $(this).data("description");
        $("#edit-post-id").val(postId);
        $("#edit-description").val(description);
        $("#editModal").modal("show");
    });
</script>



</body>
</html>
