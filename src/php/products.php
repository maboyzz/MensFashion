<?php
    include("db_connect.php");

    $so_san_pham_moi_trang = 15;
    $page_hien_tai = isset($_GET['pagenum']) ? (int)$_GET['pagenum'] : 1;
    $page_hien_tai = max($page_hien_tai, 1);

    $search = isset($_GET['search']) ? $_GET['search'] : '';
    $sort_category = isset($_POST['category']) ? (int)$_POST['category'] : 0;
    $sort_best_selling = isset($_POST['best-selling']) ? $_POST['best-selling'] : '';
    $sort_price = isset($_POST['sort-price']) ? $_POST['sort-price'] : '';

    // Điều kiện tự về mặc định khi chọn select khác
    if ($sort_price) {
        $sort_best_selling = '';
    }
    if ($sort_best_selling) {
        $sort_price = '';
    }

    // Tạo câu lệnh SQL cơ bản
    $query = "SELECT * FROM productdetails WHERE 1=1";
    $total_query = "SELECT COUNT(*) AS total FROM productdetails WHERE 1=1";

    // Thêm điều kiện tìm kiếm
    if ($search) {
        $search = $conn->real_escape_string($search);
        $query .= " AND product_name LIKE '%$search%'";
        $total_query .= " AND product_name LIKE '%$search%'";
    }

    // Thêm điều kiện lọc theo thể loại
    if ($sort_category) {
        $query .= " AND category_id = $sort_category";
        $total_query .= " AND category_id = $sort_category";
    }

    // Thêm điều kiện sắp xếp
    if ($sort_best_selling) {
        $query .= " ORDER BY sold_quantity $sort_best_selling"; // Sửa lại tên trường
    } elseif ($sort_price) {
        $query .= " ORDER BY price $sort_price";
    }

    // Tính toán tổng số sản phẩm
    $total_result = $conn->query($total_query);
    $total_row = $total_result->fetch_assoc();
    $tong_so_san_pham = $total_row['total'];

    $tong_so_page = ceil($tong_so_san_pham / $so_san_pham_moi_trang);
    $offset = ($page_hien_tai - 1) * $so_san_pham_moi_trang;

    $query .= " LIMIT $so_san_pham_moi_trang OFFSET $offset";
    $result = $conn->query($query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm</title>
    <link rel="stylesheet" href="../css/productStyles.css">
</head>
<body>
    <div class="product-containers">
        <form method="POST" action="">
            <div class="product-filter">
                <div class="category">
                    <label for="">Thể loại:</label>
                    <select name="category" id="category" onchange="this.form.submit();">
                        <option value="">--Tất cả--</option>
                        <option value="1" <?php echo ($sort_category === 1) ? 'selected' : ''; ?>>Áo</option>
                        <option value="2" <?php echo ($sort_category === 2) ? 'selected' : ''; ?>>Quần</option>
                        <option value="3" <?php echo ($sort_category === 3) ? 'selected' : ''; ?>>Giày</option>
                    </select>
                </div>
                <div class="best-selling">
                    <label for="">Sắp xếp theo đơn bán:</label>
                    <select name="best-selling" id="best-selling" onchange="this.form.submit();">
                        <option value="">-------Mặc định-------</option>                        
                        <option value="asc" <?php echo ($sort_best_selling === 'asc') ? 'selected' : ''; ?>>Bán chạy tăng dần</option>
                        <option value="desc" <?php echo ($sort_best_selling === 'desc') ? 'selected' : ''; ?>>Bán chạy giảm dần</option>
                    </select>
                </div>
                <div class="sort-price">
                    <label for="">Sắp xếp theo giá bán:</label>
                    <select name="sort-price" id="sort-price" onchange="this.form.submit();">
                        <option value="">------------Mặc định------------</option>
                        <option value="asc" <?php echo ($sort_price === 'asc') ? 'selected' : ''; ?>>Sắp xếp theo giá tăng dần</option>
                        <option value="desc" <?php echo ($sort_price === 'desc') ? 'selected' : ''; ?>>Sắp xếp theo giá giảm dần</option>
                    </select>
                </div>
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
        </form>
        <div class="page-number">
            <p><?php echo $page_hien_tai; ?> / <?php echo $tong_so_page; ?></p>
        </div>
        <div class="pagination">
            <a href="?page=products&pagenum=<?php echo max($page_hien_tai - 1, 1); ?>&best-selling=<?php echo $sort_best_selling; ?>&search=<?php echo urlencode($search); ?>" class="<?php echo ($page_hien_tai <= 1) ? 'disabled' : ''; ?>">
                <img src="../../images/back_next_page/back.png" alt="BACK">
            </a>
            <a href="?page=products&pagenum=<?php echo min($page_hien_tai + 1, $tong_so_page); ?>&best-selling=<?php echo $sort_best_selling; ?>&search=<?php echo urlencode($search); ?>" class="<?php echo ($page_hien_tai >= $tong_so_page) ? 'disabled' : ''; ?>">
                <img src="../../images/back_next_page/next.png" alt="NEXT">
            </a>
        </div>
    </div>
</body>
</html>

<?php
    $conn->close();
?>
