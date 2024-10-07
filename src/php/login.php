<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="../css/loginStyles.css">
</head>

<body>
    <?php
        session_start();

        include("db_connect.php");

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $email = $_POST['email'];
            $password = $_POST['password'];            

            $sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $email, $password);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                // Đăng nhập thành công
                $_SESSION['user'] = $result->fetch_assoc();
                header("Location: index.php");
                exit;
            }

            $stmt->close();
            $conn->close();
        }
    ?>
    <div class="login-container">
        <button class="close-btn" onclick="window.location.href='index.php'">x</button>
        <h2>Đăng Nhập</h2>
        <form action="login.php" method="POST">
            <div class="input-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="Nhập email của bạn" required>
            </div>
            <div class="input-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu của bạn" required>
            </div>
            <button type="submit" class="login-btn">Đăng Nhập</button>
            <a href="#" class="forgot-password">Quên mật khẩu?</a>
        </form>
        <div class="register-link">
            <p>Chưa có tài khoản? <a href="register.php">Đăng ký ngay</a></p>
        </div>
    </div>
</body>    
</html>
