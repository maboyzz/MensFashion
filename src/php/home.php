<?php
    include("db_connect.php");

    $query = "SELECT * FROM products ORDER BY sold_quantity DESC LIMIT 5";
    $result = $conn->query($query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="../css/homeStyles.css">
</head>
<body>
    <div class="containers">
        <div class="introductory-logo">
            <img src="../../images/banner/banner.jpg" alt="BANNER">
        </div>
        <div class="product-page">
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo '
                    <a href="?page=product_info&id=' . $row['product_id'] . '">
                        <div class="product">
                            <img src="' . (isset($row['image']) ? $row['image'] : 'default_image.jpg') . '" alt="Product Image" class="img-product">
                            <h2>' . (isset($row['product_name']) ? $row['product_name'] : 'Tên sản phẩm không có') . '</h2>
                            <p>Giá bán: ' . (isset($row['price']) ? number_format($row['price'], 0, ',', '.') : '0') . ' <u>đ</u></p>
                            <p>Số lượng đã bán: ' . (isset($row['sold_quantity']) ? $row['sold_quantity'] : '0') . '</p>
                        </div>
                    </a>
                    ';
                }
                
            } else {
                echo "Không có sản phẩm nào.";
            }
            ?>
        </div>
    </div>
</body>
</html>
