<?php
    include("db_connect.php");

    $product_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

    if ($product_id) {
        $query = "SELECT * FROM productdetails WHERE product_id = $product_id";
        $result = $conn->query($query);
        $product = $result->fetch_assoc();
    } else {
        $product = null;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="../css/productInfoStyles.css">
</head>
<body>
    <div class="page-containers">
        <div class="come-back">
            <a href="<?php echo htmlspecialchars($_SERVER['HTTP_REFERER']); ?>">
                <img src="../../images/back_next_page/comeback.png" alt="COMEBACK">
            </a>
        </div>
        <div class="product-info">        
            <?php if ($product): ?>            
                <img src="<?php echo $product['image']; ?>" alt="Product Image">
                <div class="text-info">
                    <h1 class="title-info">Thông tin sản phẩm</h1>
                    <p class="name">Tên sản phẩm: <?php echo $product['product_name']; ?></p>
                    <p class="price">Giá bán: <?php echo (isset($product['price']) ? number_format($product['price'], 0, ',', '.') : '0')   ?> <u>đ</u></p>
                    <p class="description">Mô tả: <?php echo $product['information']; ?></p>
                    <p class="sold">Đã bán: <?php echo $product['sold_quantity']; ?></p>
                </div>
            <?php else: ?>
                <p>Sản phẩm không tồn tại.</p>
            <?php endif; ?>
        </div>
    </div>    
</body>
</html>

<?php
    $conn->close();
?>