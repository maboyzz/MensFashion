<?php
    include("db_connect.php");

    $product_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

    if ($product_id) {
        $query = "SELECT * FROM products WHERE product_id = $product_id";
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
                    <h1 class="name"><?php echo $product['product_name']; ?></h1>
                    <div class="price-parent">
                        <p class="price-title">Giá bán:</p>
                        <p class="price"><?php echo (isset($product['price']) ? number_format($product['price'], 0, ',', '.') : '0')   ?> <u>đ</u></p>
                    </div>
                    <div class="sold-parent">
                        <p class="sold-title">Số lượng đã bán:</p>
                        <p class="sold"><?php echo $product['sold_quantity']; ;?></p>
                    </div>
                    <div class="quantity-parent">
                        <p class="quantity-title">Số lượng tồn kho:</p>
                        <p class="quantity"><?php echo $product['quantity']; ;?></p>
                    </div>
                    <div class="lines"></div>
                    <div class="size-purchase-quantity">
                        <div class="size-parent">
                            <p class="size-title">SIZE:</p>
                            <p class="size">
                                <select name="size">
                                    <option value="S">S</option>
                                </select>
                            </p>
                        </div>
                        <div class="purchase-quantity-parent">
                            <p class="quantity-title">SỐ LƯỢNG:</p>
                            <p class="quantity">
                                <select name="quantity">
                                    <?php for ($i = 1; $i <= 10; $i++) : ?>
                                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                                    <?php endfor; ?>
                                </select>
                            </p>
                        </div>
                    </div>
                    <div class="lines"></div>
                    <div class="description">
                        <p>Mô tả: <?php echo $product['information']; ?></p>
                    </div> 
                    <div class="add_cart">
                        <a href="#">Thêm vào giỏ hàng</a>
                    </div>                   
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