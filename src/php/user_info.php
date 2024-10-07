<?php
    include("db_connect.php");

    if (!isset($_SESSION['user'])) {
        // Nếu người dùng chưa đăng nhập, điều hướng về trang đăng nhập
        header("Location: login.php");
        exit;
    }

    // Lấy thông tin người dùng từ session
    $user = $_SESSION['user'];
    
    // Truy vấn để lấy thông tin chi tiết của người dùng
    $sql = "SELECT * FROM users WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user['id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $user_info = $result->fetch_assoc();

    $stmt->close();
    $conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin người dùng</title>
    <!-- <link rel="stylesheet" href="../css/homeStyles.css">     -->
</head>
<body>
    <div class="user-info-container">
        <h2>Thông tin người dùng</h2>
        <p><strong>ID:</strong> <?php echo $user_info['id']; ?></p>
        <p><strong>Username/Email:</strong> <?php echo $user_info['username']; ?></p>        
        <!-- Các thông tin khác -->
    </div>
</body>
</html>