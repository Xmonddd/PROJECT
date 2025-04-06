<?php
session_start();
include_once 'functions.php';
 // Functions are already in this file

// Ensure user is logged in
if (!isset($_SESSION['fullname'])) {
    header("Location: login.php"); // Redirect to login page if not logged in
    exit();
}

// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "agrishop";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$activeUser = $_SESSION['fullname']; // Now $activeUser is set
//eto yung nilagay ko pang debug
$sql = "SELECT * FROM messages WHERE sender = ? OR receiver = ? ORDER BY timestamp DESC";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $activeUser, $activeUser);
$stmt->execute();
$result = $stmt->get_result();



// Fetch conversations using the function from functions.php
$conversations = getConversations($conn, $activeUser);


// Function to fetch messages between two users
function getMessages($conn, $user1, $user2) {
    $sql = "SELECT messages.*, users.profile_image 
            FROM messages 
            JOIN users ON messages.sender = users.fullname 
            WHERE (messages.sender = ? AND messages.receiver = ?) 
               OR (messages.sender = ? AND messages.receiver = ?) 
            ORDER BY messages.timestamp ASC";

    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("SQL Error: " . $conn->error);
    }

    $stmt->bind_param("ssss", $user1, $user2, $user2, $user1);
    $stmt->execute();
    $result = $stmt->get_result();

    $messages = [];
    while ($row = $result->fetch_assoc()) {
        $messages[] = $row;
    }
    return $messages;
}

// Function to send a message
function sendMessage($conn, $sender, $receiver, $message) {
    $sql = "INSERT INTO messages (sender, receiver, message, timestamp) 
            VALUES (?, ?, ?, CURRENT_TIMESTAMP)";

    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("SQL Error: " . $conn->error);
    }

    $stmt->bind_param("sss", $sender, $receiver, $message);
    $stmt->execute();
}

// Function to delete a message
function deleteMessage($conn, $messageId, $activeUser) {
    $sql = "DELETE FROM messages WHERE id = ? AND sender = ?";

    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("SQL Error: " . $conn->error);
    }

    $stmt->bind_param("is", $messageId, $activeUser);
    $stmt->execute();
}



// Fetch conversations **after defining the function**
$conversations = getConversations($conn, $activeUser);








// Handle sending a message
if (isset($_POST['send_message'])) {
    $receiver = $_POST['receiver'];
    $message = $_POST['message'];
    sendMessage($conn, $activeUser, $receiver, $message);
}

// Handle deleting a message
if (isset($_POST['delete_message'])) {
    $messageId = $_POST['message_id'];
    deleteMessage($conn, $messageId, $activeUser);
}

// Get the user to message (if set)
$receiverToMessage = isset($_GET['user']) ? $_GET['user'] : null;


if ($receiverToMessage) {
    $sql = "UPDATE messages SET is_read = 1 
            WHERE sender = ? AND receiver = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $receiverToMessage, $activeUser);
    $stmt->execute();
}


// Get messages for display
$messages = [];
if ($receiverToMessage) {
    $messages = getMessages($conn, $activeUser, $receiverToMessage);
}

// Get conversations
$conversations = getConversations($conn, $activeUser);
?>

<!DOCTYPE html>
<html lang="en">


<head>
    <title>Messaging</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    

   <link rel="stylesheet" href="css/style.css">
    <style>
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }


        /* Date separator styling */
.timestamp-divider {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    margin: 15px 0;
    font-size: 12px;
    font-weight: bold;
    color: #666;
    position: relative;
}

.timestamp-divider::before,
.timestamp-divider::after {
    content: "";
    flex: 1;
    border-top: 1px solid #ccc;
    margin: 0 10px;
}

/* Time separator styling */
.time-divider {
    display: flex;
    justify-content: center;
    font-size: 10px;
    color: gray;
    margin: 5px 0;
}
        .messenger-container {
            display: flex;
            height: 100vh;
        }

        .conversations {
          /*  width: 250px; */
            width: 500px;
            border-right: 1px solid #ccc;
            padding: 10px;
            overflow-y: auto;
            background-color: #f8f8f8; /* Light background */
        }

        .conversation-item.active {
    background-color: #d9d9d9 !important; /* Active effect */
}

 .conversation-item {
          
            
    display: flex; /* Gamitin ang Flexbox */
    align-items: center; /* I-align sa gitna vertically */
    padding: 10px;
    border-bottom: 1px solid #ddd;
    cursor: pointer;
    background-color: #fff; /* White background */
}

.conversation-item img {
    width: 40px;
    height: 40px;
    border-radius: 50%; /* Para bilog ang profile picture */
    margin-right: 10px; /* Maglagay ng space sa kanan ng picture */
}

.conversation-item p {
    margin: 0;
    flex-grow: 1; /* Para manatili sa left side */
    text-align: left; /* Siguraduhin naka-align sa kaliwa */
}
     
.conversation-item.active:hover {
    background-color: #f0f0f0 !important;  /* Panatilihin ang hover effect kahit active */
}

        .conversation-item:hover {
            
    background-color: #d9d9d9 !important; /* Mas darker na grey */
}
        
            /* eto yung latest msg sa userlist*/
            .conversation-details {
        flex-grow: 1;
        margin-left: 10px;
        overflow: hidden;
    }
    
    .conversation-header {
        display: flex;
        justify-content: space-between;
    }
    
    .conversation-name {
        font-weight: bold;
        margin: 0;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
    .latest-message {
        margin: 2px 0;
        font-size: 0.9em;
        color: #666;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
    .message-time {
        margin: 0;
        font-size: 0.8em;
        color: #999;
        text-align: right;
    }

    .received {
    flex-direction: row; /* Profile picture on the left */
    align-self: flex-start; 
}
.sent {
    flex-direction: row-reverse; /* Profile picture on the right */
    align-self: flex-end;
}

.message .profile-pic {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px; /* Space between picture and message */
    flex-shrink: 0;
    background: none;
}

.message .message-content {
    background-color: #f1f1f1;
    padding: 10px;
    border-radius: 10px;
    max-width: 70%;
}

.sent .message-content {
    background-color: #007bff !important;
    color: white;
    align-self: flex-end;
}

.received .message-content {
    background-color: grey !important;
    color: white;
    align-self: flex-start;
}


 .messages {
       

            flex: 1 1 auto;
     padding: 20px;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    
    min-height: 0;
    max-height: calc(100vh - 150px); /* Adjust based on your header/input height */
    background-color: #e0e0e0;
 
        }
        .message-input-area {
    display: flex;
    align-items: center;
    padding: 10px;
    background: #f8f8f8;
    border-top: 1px solid #ddd;
    position: fixed;
    bottom: 0;
    width: 100%;
    left: 0;
}
.message-input-container {
    width: calc(100% - 250px); /* Subtract sidebar width */
    position: fixed;
    bottom: 0;
    left: 500px; /* Sidebar width */
    background: #f8f8f8;
    padding: 10px;
    border-top: 1px solid #ddd;
    display: flex;
    align-items: center;
}
.message-input-container button {
    padding: 10px 20px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-size: 16px;
}
.message-input-container button:hover {
    background: #0056b3;
}

/* Make it responsive */
@media (max-width: 768px) {
    .message-input-container {
        width: 100%;
        left: 0;
    }
}

.message-input {
    flex-grow: 1;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 20px 0 0 20px;
    outline: none;
    font-size: 16px;
    margin-right: 10px;
}

.message-input-area button {
    padding: 6px 12px;
    background: transparent;  /* Remove the blue background */
    color: #007bff;  /* Set the icon text color to blue or whatever you prefer */
    border: none;
    border-radius: 0 20px 20px 0;
    cursor: pointer;
    font-size: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-left: 0;
   
}

.message-input-area button:hover {
    background: transparent;  /* No background change on hover */
    color: #0056b3;  /* Change the color on hover if needed */

}
        .message-input-area {
           display: flex;
           position: absolute;
    bottom: 0;
    background: white; 
    padding: 10px;
    border-top: 1px solid #ccc; 
    width: 100%;
    align-items: center;
    
        }
        .message-input-area input {
    flex-grow: 1;  /* Makes the input field take the remaining space */
    border: 1px solid #ccc;
    padding: 8px 12px;
    border-radius: 20px;
    font-size: 14px;
}

        .chat-container {
            position: relative;
            flex-direction: column;
  height: 100vh;
}
        .message-input {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ccc; /* Border for input */
            border-radius: 5px;
            margin-right: 5px; /* Add some space between input and button */
        }
        .message .profile-pic {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}
.message .message-content {
    background-color: #f1f1f1;
    padding: 10px;
    border-radius: 10px;
    max-width: 70%;
}
.sent .message-content {
    background-color: #dcf8c6;
}

.received .message-content {
    background-color: #ffffff;
}

        .message {
    display: flex;
    align-items: center; 
    gap: 10px; 
    margin-bottom: 10px;
    padding: 0;
    border-radius: 5px;
    max-width: 70%; 
    background: none;
  
        }

        .message-content {
    background-color: #f1f1f1;
    padding: 10px;
    border-radius: 10px;
    max-width: 100%;
}

        .message span {
    flex-grow: 1; /* Allow message text to take up available space */
        }

        .message-settings {
        flex-shrink: 0; /* Prevent settings from shrinking */
        }

        .sent {
            
           /* text-align: left; */
           align-self: flex-end;
        }

        .received {
           /* background-color: #e6e6e6; */
            /*text-align: left;*/
            align-self: flex-start;
            background: none;
        }

        .navbar {
            background-color: #220430; /* kulay ng  navbar */
            border-bottom: 1px solid #2980b9;
            position: sticky; /* Make it stick */
            top: 0; /* Stick to the top */
            z-index: 100; /* Ensure it's above other elements */
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: white; /* White text */
        }

        .navbar-nav > li > a {
            padding-top: 15px;
            padding-bottom: 15px;
            color: white; /* White text */
        }

        .navbar-nav > li > a:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        .modal-content {
            background-color: #fefefe;
            margin: 20vh auto; /* Adjust top margin for vertical centering */
            padding: 20px;
            border: 1px solid #888;
            width: 400px; /* Reduced width */
            max-width: 90%; /* Ensure it's responsive */
        }

        .modal-content h2 {
            font-size: 1.2em; /* Smaller heading */
            margin-bottom: 10px;
        }

        .modal-content label {
            font-size: 0.9em; /* Smaller label text */
            display: block;
            margin-bottom: 5px;
        }

        .modal-content input[type="text"],
        .modal-content textarea {
            width: calc(100% - 12px); /* Adjust width */
            padding: 6px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing:border-box; /* Include padding and border in element's total width and height */
            font-size: 0.9em; /* Smaller input text */
        }

        .modal-content button {
            padding: 8px 15px; /* Smaller button padding */
            font-size: 0.9em; /* Smaller button text */
            margin-top: 10px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .timestamp {
        font-size: 0.7em; /* Make the timestamp smaller */
        color: #888;
        margin-top: 5px; /* Add some space between the message and timestamp */
        text-align: right;
        }

        #deleteConfirmationModal .modal-content {
            background-color: #fefefe;
            margin: 20vh auto;
            padding: 20px;
            border: 1px solid #888;
            width: 400px;
            max-width: 90%;
        }

        #deleteConfirmationModal h2 {
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        #deleteConfirmationModal p {
            margin-bottom: 15px;
        }

        #deleteConfirmationModal button {
            margin-right: 10px;
        }

        .message-settings {
            position: relative;
            display: inline-block;
        }

        .settings-icon {
            cursor: pointer;
            font-size: 1.2em;
            margin-left: 10px;
        }

        .settings-dropdown {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 120px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 8px 12px;
            z-index: 1;
            right: 0;
        }

        .settings-dropdown button {
            display: block;
            width: 100%;
            text-align: left;
            border: none;
            background-color: transparent;
            padding: 5px 0;
            cursor: pointer;
            color: red;
        }

    </style>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.php" class="navbar-brand">AgriShop: Farm Online Website</a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
             
                <li><a href="buying.php">BUYING</a></li>
                <li><a href="selling.php">SELLING</a></li>
                <li><a href="message.php"><i class="fas fa-envelope fa-2x"></i></a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

 <!-- eto yung message para makita ang conversation -->
<div class="messenger-container" >
<div class="conversations">
    <button id="newMessageBtn" class="btn btn-primary btn-sm" style="margin-bottom: 10px;">New Message</button>

    <?php foreach ($conversations as $conversation): ?>

        <div class="conversation-item" onclick="window.location.href='message.php?user=<?php echo urlencode($conversation['fullname']); ?>'">
            <img src="<?php echo htmlspecialchars($conversation['profile_image']); ?>" class="profile-pic">
            <p><?php echo htmlspecialchars($conversation['fullname']); ?></p>


            <?php if ($conversation['unread_count'] > 0): ?>
                <span class="unread-badge"><?php echo $conversation['unread_count']; ?></span>
            <?php endif; ?>
        </div>
    <?php endforeach; ?>

     <!-- eto yung receiver ng message -->
  </div>
  <div class="messages">
    <?php if ($receiverToMessage): ?>
        <h2>Conversation with <?php echo htmlspecialchars($receiverToMessage); ?></h2>

        <?php if (!empty($messages)): ?>
            <?php 
            $lastDate = null;
            $lastTimestamp = null;
            foreach ($messages as $message):
                $messageDate = date('F j, Y', strtotime($message['timestamp']));
                $messageTime = date('h:i A', strtotime($message['timestamp']));
                
                // Maglagay ng date separator kung iba na ang date
                if ($messageDate !== $lastDate): ?>
                    <div class="timestamp-divider"><?php echo $messageDate; ?></div>
                    <?php $lastDate = $messageDate; ?>
                <?php endif; ?>

                <!-- Maglagay ng time separator kung lumampas ng 5 minuto -->
                <?php 
                if ($lastTimestamp && (strtotime($message['timestamp']) - strtotime($lastTimestamp)) > 300): ?>
                    <div class="time-divider"><?php echo $messageTime; ?></div>
                <?php endif; ?>
                
                <div class="message <?php echo ($message['sender'] == $activeUser) ? 'sent' : 'received'; ?>">
                    
                    <!-- Profile picture only for received messages -->
                    <?php if ($message['sender'] != $activeUser): ?>
                        <img src="<?php echo htmlspecialchars($message['profile_image']); ?>" class="profile-pic">
                    <?php endif; ?>

                    <div class="message-content">
                        <span><?php echo htmlspecialchars($message['message']); ?></span>
                    </div>

                    <!-- Message options for sent messages -->
                    <?php if ($message['sender'] == $activeUser): ?>
                        <div class="message-settings">
                            <span class="settings-icon" onclick="toggleSettings(<?php echo $message['id']; ?>)">&#8942;</span>
                            <div class="settings-dropdown" id="settings-<?php echo $message['id']; ?>">
                                <button class="delete-btn" onclick="showDeleteConfirmation(<?php echo $message['id']; ?>)">Delete</button>
                                <button class="cancel-btn" onclick="toggleSettings(<?php echo $message['id']; ?>)">Cancel</button>
                            </div>
                        </div>
                    <?php endif; ?>

                </div>

                <?php $lastTimestamp = $message['timestamp']; // Update last timestamp ?>
                
            <?php endforeach; ?>
        <?php else: ?>
            <p>No messages yet.</p>
        <?php endif; ?>
    <?php endif; ?>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteConfirmationModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeDeleteModal">&times;</span>
        <h2>Delete Message?</h2>
        <p>Are you sure you want to delete this message?</p>
        <form method="post" id="deleteForm">
            <input type="hidden" name="message_id" id="deleteMessageId" value="">
            <button type="submit" name="delete_message" class="btn btn-danger">Delete</button>
            <button type="button" class="btn btn-secondary" id="cancelDeleteBtn">Cancel</button>
        </form>
    </div>
</div>

<!-- Message Input Area -->
<div class="message-input-container">
    <form method="post" class="message-input-area">
        <input type="hidden" name="receiver" value="<?php echo htmlspecialchars($receiverToMessage); ?>">
        <input type="text" name="message" class="message-input" placeholder="Type your message..." required>
        <button type="submit" name="send_message" class="btn btn-primary"> <i class="fas fa-paper-plane"></i></button>
    </form>
</div>




        <div id="newMessageModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>New Message</h2>
                <form method="post" action="send_message.php">
                    <label for="receiver">To:</label>
                    <input type="text" name="receiver" id="receiver" required>
                    <label for="message">Message:</label>
                    <textarea name="message" required></textarea>
                    <button type="submit" name="send_message" class="btn btn-primary">Send</button>
                    <button type="button" class="btn btn-secondary" id="cancelMessageBtn">Cancel</button>
                </form>
            </div>
        </div>
  
        <script>
            var modal = document.getElementById("newMessageModal");
            var btn = document.getElementById("newMessageBtn");
            var span = document.getElementsByClassName("close")[0];
            var cancelBtn = document.getElementById("cancelMessageBtn");

            btn.onclick = function() {
                modal.style.display = "block";
            }

            span.onclick = function() {
                modal.style.display = "none";
            }

            cancelBtn.onclick = function() {
                modal.style.display = "none";
            }

            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            document.querySelector("form").addEventListener("submit", function(event) {
    let receiver = document.getElementById("receiver").value;
    let message = document.querySelector("textarea").value;

    if (receiver.trim() === "" || message.trim() === "") {
        alert("Please fill in all fields.");
        event.preventDefault(); // I-prevent lang kung may kulang
    }
    });
        </script>



 

       
<script>
    var deleteModal = document.getElementById("deleteConfirmationModal");
    var closeDeleteModal = document.getElementById("closeDeleteModal");
    var cancelDeleteBtn = document.getElementById("cancelDeleteBtn");
    var deleteMessageIdInput = document.getElementById("deleteMessageId");

    function toggleSettings(messageId) {
        var settingsDropdown = document.getElementById('settings-' + messageId);
        if (settingsDropdown.style.display === "block") {
            settingsDropdown.style.display = "none";
        } else {
            settingsDropdown.style.display = "block";
        }
    }

    function showDeleteConfirmation(messageId) {
        deleteMessageIdInput.value = messageId;
        deleteModal.style.display = "block";
        var settingsDropdown = document.getElementById('settings-' + messageId);
        settingsDropdown.style.display = "none";
    }

    closeDeleteModal.onclick = function() {
        deleteModal.style.display = "none";
    }

    cancelDeleteBtn.onclick = function() {
        deleteModal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == deleteModal) {
            deleteModal.style.display = "none";
        }
    }
    
//scroll
    function scrollToBottom() {
    var messageContainer = document.querySelector(".messages");
    messageContainer.scrollTop = messageContainer.scrollHeight;
}

// Auto-scroll sa bottom pagkatapos mag-load ng page
window.onload = function() {
    scrollToBottom();
};

// Auto-scroll din kapag nag-submit ng message
document.querySelector("form.message-input-area").addEventListener("submit", function() {
    setTimeout(scrollToBottom, 100); // Delay ng konti para sure na naprocess na ang bagong message
});

//responsive
document.addEventListener("DOMContentLoaded", function() {
    let toggleBtn = document.createElement("button");
    toggleBtn.textContent = "☰ Conversations";
    toggleBtn.classList.add("btn", "btn-primary", "toggle-conversations");
    document.querySelector(".conversations").prepend(toggleBtn);

    toggleBtn.addEventListener("click", function() {
        let conv = document.querySelector(".conversations");
        conv.style.display = conv.style.display === "none" ? "block" : "none";
    });

    // Auto-hide conversation list on small screens after selecting a chat
    document.querySelectorAll(".conversation-item").forEach(item => {
        item.addEventListener("click", function() {
            if (window.innerWidth <= 768) {
                document.querySelector(".conversations").style.display = "none";
            }
        });
    });
});

const conversationItems = document.querySelectorAll('.conversation-item');

conversationItems.forEach(item => {
    item.addEventListener('click', function() {
        conversationItems.forEach(i => i.classList.remove('active')); // Remove active class from all
        this.classList.add('active'); // Add active class to the clicked item
    });
});

</script>

</body>
</html>

<?php
$conn->close();
?>