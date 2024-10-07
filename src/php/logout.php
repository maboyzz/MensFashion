<?php
    session_start();
    session_destroy(); // Hủy bỏ session hiện tại
    header('Location: index.php'); // Điều hướng về trang chủ
    exit;
?>
