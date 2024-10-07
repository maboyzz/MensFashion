<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="../css/indexStyles.css">    
</head>
<body>
    <?php
        session_start();
    ?>
    <div class="containers">
        <div class="header">
            <a href="index.php">
                <div class="left-header">
                    <img src="../../images/LOGO/logo.png" alt="LOGO" class="left-header">
                </div>
            </a>
            <div class="mid-header">
                <?php
                    $search = isset($_GET['search']) ? $_GET['search'] : '';
                ?>
                <div class="search-bar">
                    <form method="GET" action="">
                        <input type="text" name="search" class="search-input" placeholder="Tìm kiếm..." value="<?php echo isset($search) ? htmlspecialchars($search) : ''; ?>">
                        <input type="hidden" name="page" value="products">
                        <button type="submit" class="search-button">
                            <img src="../../images/header/search.png" alt="SEARCH">
                        </button>
                    </form>
                </div>               
            </div>
            <div class="right-header">
                <a href="?page=cart">
                    <img src="../../images/header/cart.png" alt="CART">
                </a>
                <div class="user-icon">
                    <img src="../../images/header/user.png" alt="USER">
                </div>
                <div class="dropdown-content">
                    <?php if(isset($_SESSION['user'])): ?>
                        <a href="?page=user_info">Thông tin người dùng</a>
                        <a href="logout.php">Đăng xuất</a>
                    <?php else: ?>
                        <a href="login.php">Đăng nhập</a>
                        <a href="register.php">Đăng ký</a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <div class="main">
            <nav class="tab">
                <a href="?page=home">
                    <div class="button-tab home">
                        <img src="../../images/tab/home.png" alt="HOME">
                        <span>Trang chủ</span>
                    </div>                    
                </a>
                <a href="?page=products">
                    <div class="button-tab products">
                        <img src="../../images/tab/buy.png" alt="PRODUCTS">
                        <span>Sản phẩm</span>
                    </div>
                </a>
                <a href="?page=contact">
                    <div class="button-tab contact">
                        <img src="../../images/tab/contact.png" alt="CONTACT">
                        <span>Liên hệ</span>
                    </div>
                </a> 
            </nav>
            <div class="content">
                <?php
                    if (isset($_GET['page'])) {
                        $page = $_GET['page'];
                        switch ($page) {
                            case 'home':
                                include 'home.php';
                                break;
                            case 'products':
                                include 'products.php';
                                break;
                            case 'contact':
                                include 'contact.php';
                                break;
                            case 'user_info':
                                include 'user_info.php';
                                break;
                            case 'product_info':
                                include 'product_info.php';
                                break;
                            case 'cart':
                                include 'cart.php';
                                break;
                            default:
                                echo '<h1>Trang không tồn tại</h1>';
                                break;
                        }
                    } else {
                        include 'home.php';
                    }
                ?>
            </div>
            <div class="information">
            </div>
        </div>
        <div class="footer">
            <div class="footer-introduce">
                <h3>GIỚI THIỆU</h3>
                <p>Chào mừng đến với Team Nine Store - nơi phong cách và sự tinh tế hội tụ.
                     Chúng tôi tự hào mang đến những sản phẩm thời trang nam chất lượng cao, theo kịp xu hướng.
                      Hãy khám phá bộ sưu tập của chúng tôi và tạo dấu ấn riêng cho phong cách của bạn</p>
            </div>
            <div class="footer-member">
                <h3>THÀNH VIÊN NHÓM</h3>
                <ul>
                    <li>Nguyễn Trần Huy - 31/10/2003</li>
                    <li>Dương Văn Kiên - 30/11/2003</li>
                    <li>Hồ Anh Minh - 14/12/2003</li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>