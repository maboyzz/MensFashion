<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản</title>
    <link rel="stylesheet" href="../css/registerStyles.css">
</head>

<body>
    <?php 
    session_start();
    include("db_connect.php");

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = $_POST['username'];
        $customer_name = $_POST['customer_name'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $confirm_password = $_POST['confirm-password'];

        if (!$conn) {
            die("Kết nối thất bại: " . mysqli_connect_error());
        }

        if ($password !== $confirm_password) {
            $_SESSION['error'] = "Mật khẩu không khớp!";
            header("Location: register.php");
            exit();
        }

        $check_user = "SELECT * FROM users WHERE username = ?";
        $stmt = $conn->prepare($check_user);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $_SESSION['error'] = "Tên đăng nhập đã tồn tại!";
            header("Location: register.php");
            exit();
        }

        try {
            $conn->begin_transaction();

            $insert_user = "INSERT INTO users (username, password) VALUES (?, ?)";
            $stmt = $conn->prepare($insert_user);
            $stmt->bind_param("ss", $username, $password);
            $stmt->execute();

            $user_id = $conn->insert_id;

            $insert_details = "INSERT INTO userdetails (user_id, customer_name, email) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($insert_details);
            $stmt->bind_param("iss", $user_id, $customer_name, $email);
            $stmt->execute();

            $conn->commit();
            $_SESSION['success'] = "Đăng ký thành công!";
            header("Location: login.php");
            exit();

        } catch (Exception $e) {
            $conn->rollback();
            $_SESSION['error'] = "Có lỗi xảy ra trong quá trình đăng ký. Vui lòng thử lại!";
            header("Location: register.php");
            exit();
        } finally {
            $stmt->close();
            $conn->close();
        }
    }
    ?>

    <div class="register-container">
        <button class="close-btn" onclick="window.location.href='index.php'">x</button>
        <h2>Đăng Ký</h2>
        <form action="register.php" method="POST">
            <div class="input-group">
                <label for="username">Tên đăng nhập</label>
                <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
            </div>
            <div class="input-group">
                <label for="customer_name">Họ và tên</label>
                <input type="text" id="customer_name" name="customer_name" placeholder="Nhập họ và tên" required>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required>
            </div>
            <div class="input-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
            </div>
            <div class="input-group">
                <label for="confirm-password">Xác nhận mật khẩu</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Xác nhận mật khẩu" required>
            </div>
            <button type="submit" class="register-btn">Đăng Ký</button>
        </form>
        <div class="login-link">
            <p>Đã có tài khoản? <a href="login.php">Đăng nhập</a></p>
        </div>
    </div>

</body>
</html>
