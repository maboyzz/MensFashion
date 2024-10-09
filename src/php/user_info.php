<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin người dùng</title>
    <link rel="stylesheet" href="../css/userInfoStyles.css">
    <script>
        function enableEditing() {
            document.getElementById("customer_name").disabled = false;
            document.getElementById("email").disabled = false;
            document.getElementById("phone").disabled = false;
            document.getElementById("address").disabled = false;
            document.getElementById("save-btn").style.display = "inline-block";
            document.getElementById("update-btn").style.display = "none";
        }
    </script>
</head>
<body>
    <?php
        include("db_connect.php");
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        if (!isset($_SESSION['user'])) {
            header("Location: login.php");
            exit();
        }

        $user = $_SESSION['user'];
        $sql = "SELECT ud.customer_name, ud.email, ud.phone_number, ud.address 
                FROM users u 
                JOIN userdetails ud ON u.id = ud.user_id 
                WHERE u.id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user['id']);
        $stmt->execute();
        $user_info = $stmt->get_result()->fetch_assoc();

        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['change_password'])) {
            $old_password = $_POST['old_password'];
            $new_password = $_POST['new_password'];
            $confirm_password = $_POST['confirm_password'];

            $password_check_sql = "SELECT password FROM users WHERE id = ?";
            $password_check_stmt = $conn->prepare($password_check_sql);
            $password_check_stmt->bind_param("i", $user['id']);
            $password_check_stmt->execute();
            $result = $password_check_stmt->get_result();
            $user_data = $result->fetch_assoc();

            if ($old_password === $user_data['password']) {
                if ($new_password === $confirm_password) {
                    $update_password_sql = "UPDATE users SET password = ? WHERE id = ?";
                    $update_password_stmt = $conn->prepare($update_password_sql);
                    $update_password_stmt->bind_param("si", $new_password, $user['id']);

                    if ($update_password_stmt->execute()) {
                        $password_success_message = "Đổi mật khẩu thành công.";
                    } else {
                        $password_error_message = "Có lỗi trong quá trình đổi mật khẩu.";
                    }
                    $update_password_stmt->close();
                } else {
                    $password_error_message = "Mật khẩu mới và xác nhận không khớp.";
                }
            } else {
                $password_error_message = "Mật khẩu cũ không chính xác.";
            }

            $password_check_stmt->close();
        }

        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['save'])) {
            $customer_name = $_POST['customer_name'];
            $email = $_POST['email'];
            $phone_number = $_POST['phone_number'];
            $address = $_POST['address'];

            $update_sql = "UPDATE userdetails SET customer_name = ?, email = ?, phone_number = ?, address = ? WHERE user_id = ?";
            $update_stmt = $conn->prepare($update_sql);
            $update_stmt->bind_param("ssssi", $customer_name, $email, $phone_number, $address, $user['id']);

            if ($update_stmt->execute()) {
                $success_message = "Cập nhật thông tin thành công.";
            } else {
                $error_message = "Có lỗi trong quá trình cập nhật thông tin.";
            }
            $update_stmt->close();
        }

        $stmt->close();
        $conn->close();
    ?>
    <h2>Thông tin người dùng</h2>
    <div class="container">
        <div class="user-info-container">
            <form action="" method="POST">
                <div class="input-group">
                    <label for="customer_name">Họ và tên:</label>
                    <input type="text" id="customer_name" name="customer_name" value="<?php echo htmlspecialchars($user_info['customer_name']); ?>" required disabled>
                </div>
                <div class="input-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($user_info['email']); ?>" required disabled>
                </div>
                <div class="input-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="text" id="phone" name="phone_number" value="<?php echo htmlspecialchars($user_info['phone_number']); ?>" required disabled>
                </div>
                <div class="input-group">
                    <label for="address">Địa chỉ:</label>
                    <input type="text" id="address" name="address" value="<?php echo htmlspecialchars($user_info['address']); ?>" required disabled>
                </div>
                <button type="button" id="update-btn" class="update-btn" onclick="enableEditing()">Cập nhật</button>
                <button type="submit" name="save" id="save-btn" class="update-btn" style="display:none;">Lưu</button>
            </form>
            <?php if (isset($success_message)): ?>
                <p class="success"><?php echo $success_message; ?></p>
            <?php elseif (isset($error_message)): ?>
                <p class="error"><?php echo $error_message; ?></p>
            <?php endif; ?>
        </div>

        <div class="change-password-container">
            <form action="" method="POST">
                <div class="input-group">
                    <label for="old_password">Mật khẩu cũ:</label>
                    <input type="password" id="old_password" name="old_password" required>
                </div>
                <div class="input-group">
                    <label for="new_password">Mật khẩu mới:</label>
                    <input type="password" id="new_password" name="new_password" required>
                </div>
                <div class="input-group">
                    <label for="confirm_password">Xác nhận mật khẩu mới:</label>
                    <input type="password" id="confirm_password" name="confirm_password" required>
                </div>
                <button type="submit" name="change_password" class="update-btn">Đổi mật khẩu</button>
            </form>
        </div>
    </div>
    <?php if (isset($success_message)): ?>
        <p class="success"><?php echo $success_message; ?></p>
    <?php elseif (isset($error_message)): ?>
        <p class="error"><?php echo $error_message; ?></p>
    <?php endif; ?>
    <?php if (isset($password_success_message)): ?>
        <p class="success"><?php echo $password_success_message; ?></p>
    <?php elseif (isset($password_error_message)): ?>
        <p class="error"><?php echo $password_error_message; ?></p>
    <?php endif; ?>
</body>
</html>
