-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 07, 2024 lúc 07:44 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mensfashion`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Áo'),
(2, 'Quần'),
(3, 'giày');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productdetails`
--

CREATE TABLE `productdetails` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` decimal(18,0) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sold_quantity` int(11) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `productdetails`
--

INSERT INTO `productdetails` (`product_id`, `product_name`, `category_id`, `price`, `information`, `quantity`, `sold_quantity`, `size`, `color`, `image`) VALUES
(1, 'Áo Polo In Full Họa Tiết Màu Trắng', 1, 200000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải silk cao cấp tạo sự thoải mái cho người mặc.', 9999, 5, 'S', 'Trắng', 'https://4menshop.com/images/thumbs/2024/07/ao-polo-in-full-hoa-tiet-4tc-form-regular-po132-18645-slide-products-66a76571b7c0b.jpg'),
(2, 'Áo Polo họa tiết nanh sói', 1, 200000, 'Áo dệt ngắn tay cest la vie năng động. Trang phục phù hợp dạo phố, đi học. Chất liệu vải knit đàn hồi cao, tạo sự thoải mái cho người mặc.', 9999, 7, 'S', 'Nhiều Màu', 'https://4menshop.com/images/thumbs/2024/10/ao-polo-vai-hoa-tiet-nanh-soi-phoi-tay-raglan-form-slimfit-po139-18742-slide-products-67000759cb0b1.jpg'),
(3, 'Áo Polo In Sọc Thêu Hình Ở Ngực', 1, 300000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải silk cao cấp tạo sự thoải mái cho người mặc.', 9999, 120, 'S', 'Kem', 'https://4menshop.com/images/thumbs/2024/06/ao-polo-in-soc-theu-hinh-o-nguc-form-regular-po129-mau-kem-18491-slide-products-666677328242f.jpg'),
(4, 'Áo Polo Rã Phối Thêu Đắp Con', 1, 250000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải silk cao cấp tạo sự thoải mái cho người mặc.', 9999, 9, 'S', 'Xanh đen', 'https://4menshop.com/images/thumbs/2024/06/ao-polo-ra-phoi-theu-dap-con-giong-form-regular-po127-mau-xanh-den-18481-slide-products-666673595bdc7.jpg'),
(5, 'Áo Polo in họa tiết kim cương', 1, 200000, 'Áo dệt ngắn tay cest la vie năng động. Trang phục phù hợp dạo phố, đi học. Chất liệu vải knit đàn hồi cao, tạo sự thoải mái cho người mặc.', 9999, 5, 'S', 'Xanh than', 'https://4menshop.com/images/thumbs/2023/12/ao-polo-in-hoa-tiet-form-regular-po117-xanh-den-18324-slide-products-658a5c82548a4.jpg'),
(6, 'Áo PoLo Regular Go Explore', 1, 200000, 'Áo thun form boxy thêu 3D \"MIAMI AESTHETIC\" cá tính, trẻ trung. Trang phục phù hợp dạo phố, thường ngày, đi học...\r\n', 9999, 87, 'S', 'Vàng', 'https://4menshop.com/images/thumbs/2022/05/-16758-slide-products-627a26c369b14.JPG'),
(7, 'Áo Len Tay Dài Dệt Họa Tiết Quả Trám', 1, 420000, 'Áo dệt ngắn tay cest la vie năng động. Trang phục phù hợp dạo phố, đi học. Chất liệu vải knit đàn hồi cao, tạo sự thoải mái cho người mặc.', 9999, 1000, 'S', 'Trắng', 'https://4menshop.com/images/thumbs/2024/10/ao-len-tay-dai-det-hoa-tiet-qua-tram-form-regular-al012-18748-slide-products-6700f3e69ac9d.JPG'),
(8, 'Áo Sơ Mi đi phố ', 1, 200000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải silk cao cấp tạo sự thoải mái cho người mặc.', 9999, 645, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2022/02/ao-so-mi-in-hoa-tiet-asm083-mau-den-16613-slide-products-620c768e6a1fa.JPG'),
(9, 'Áo Hoodie Rã Phối Thêu Home Is Form Regular', 1, 550000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải len cao cấp tạo sự thoải mái cho người mặc.', 9999, 885, 'S', 'Kem', 'https://4menshop.com/images/thumbs/2024/03/ao-hoodie-ra-phoi-theu-home-is-form-regular-ah004-mau-kem-18373-slide-products-65feae51a559e.jpg'),
(10, 'Áo Vest NAZAFU Đỏ Mận ', 1, 9999999, 'Áo Vest nam đã trở thành món đồ không thể thiếu, giúp tôn lên vẻ đẹp, sức cuốn hút của phái mạnh. Một bộ Vest hoàn hảo giúp tôn lên vóc dáng, vẻ lịch lãm sẽ giúp các chàng trai  thêm tự tin và thu hút. Chỉnh chu trong vẻ bề ngoài cũng là cách khẳng định giá trị của bản thân. Dù là đi làm hay đi chơi thì áo Vest cũng luôn là một điểm nhấn đặc biệt ghi điểm trong mắt người đối diện', 9999, 523, 'S', 'Đỏ mận', 'https://4menshop.com/images/thumbs/2019/01/ao-vest-nazafu-do-man-1133-10578-slide-products-5c36c8319f42c.jpg'),
(11, 'Quần Tây Sidetab 1 Bên Form Regular', 2, 425000, 'Được làm từ chất liệu vải cao cấp, quần tây nam này mang đến vẻ ngoài trang nhã, hoàn hảo cho các buổi họp mặt, công sở hoặc sự kiện quan trọng.', 9999, 100, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/10/quan-tay-sidetab-1-ben-form-regular-qt062-mau-be-18786-slide-products-6703ae986f254.jpg'),
(12, 'Quần Tây Sọc Túi Nắp Sau Form Slimfit', 2, 525000, 'Sản phẩm quần tây này phù hợp cho nhiều dịp, từ đi làm đến dự tiệc. Với thiết kế đơn giản nhưng tinh tế, bạn có thể dễ dàng kết hợp với nhiều kiểu áo khác nhau.', 9999, 150, 'S', 'Xám', 'https://4menshop.com/images/thumbs/2024/10/quan-tay-soc-tui-nap-sau-form-slimfit-qt061-mau-xam-18777-slide-products-6701743d146a5.png'),
(13, 'Quần Tây Trơn Form Slimfit', 2, 299000, 'Thiết kế với đường may tinh tế và chi tiết tỉ mỉ, quần tây cổ điển giúp bạn toát lên vẻ lịch lãm và phong cách, là lựa chọn lý tưởng cho những người yêu thích sự truyền thống.', 9999, 120, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/08/quan-tay-tron-form-slimfit-qt058-mau-den-18346-slide-products-66bc7b4c4ac5b.jpg'),
(14, 'Quần Kaki Túi Kiểu Trang Trí Dây Sọc Form Regular', 2, 425000, 'Với chất liệu vải bền bỉ và thoải mái, quần kaki nam là lựa chọn lý tưởng cho cả những buổi đi làm và đi dạo, dễ dàng kết hợp với nhiều kiểu áo.', 9999, 125, 'S', 'Be', 'https://4menshop.com/images/thumbs/2024/10/quan-kaki-tui-kieu-trang-tri-day-soc-form-regular-qk029-18780-slide-products-6703a908782c6.jpg'),
(15, 'Quần Kaki Túi Nhỏ Kiểu Form Slimfit', 2, 500000, 'Được làm từ vải kaki mềm mại và thoáng khí, quần kaki này giúp bạn cảm thấy dễ chịu và mát mẻ trong suốt cả ngày, đặc biệt trong những ngày hè oi bức.', 9999, 150, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/03/quan-kaki-tui-nho-kieu-form-slimfit-qk026-18417-slide-products-65e7f3d70537d.jpg'),
(16, 'Quần Kaki Trơn Signature Gắn Tag Kim Loại Form Slimfit', 2, 600000, 'Với chất liệu vải bền bỉ và thoải mái, quần kaki nam là lựa chọn lý tưởng cho cả những buổi đi làm và đi dạo, dễ dàng kết hợp với nhiều kiểu áo.', 9999, 800, 'S', 'Be', 'https://4menshop.com/images/thumbs/2024/07/quan-kaki-signature-gan-tag-kim-loai-form-slimfit-qk028-18631-slide-products-66a7505a93531.jpg'),
(17, 'Quần Jeans Xanh Đậm Wash Cát Form Straight', 2, 495000, 'Được làm từ chất liệu denim bền bỉ, quần jeans cổ điển mang đến phong cách timeless, dễ dàng kết hợp với áo thun, áo sơ mi hay áo khoác cho mọi dịp.', 9999, 888, 'S', 'Xanh đậm', 'https://4menshop.com/images/thumbs/2024/02/quan-jeans-xam-wash-bac-duong-may-suon-form-slimfit-qj093-18404-slide-products-65dda271a3ee6.jpg'),
(18, 'Quần Jeans Xanh Nhạt In Túi Sau Form Slimfit', 2, 525000, 'Với gam màu xanh nhạt nhẹ nhàng, quần jeans này dễ dàng kết hợp với nhiều loại trang phục khác nhau, từ áo polo đến áo khoác, giúp bạn luôn nổi bật và thời thượng.', 9999, 666, 'S', 'Xanh nhạt', 'https://4menshop.com/images/thumbs/2024/06/quan-jeans-xanh-den-theu-4men-form-regular-qj101-18592-slide-products-66710c63e4b78.jpg'),
(19, 'Quần Short Kaki Xếp Ly Form Straight', 2, 375000, 'Chất liệu kaki mềm mại và thoáng khí giúp quần short này mang lại cảm giác dễ chịu trong những ngày hè oi ả, lý tưởng cho các hoạt động ngoài trời.', 9999, 555, 'S', 'Be', 'https://4menshop.com/images/thumbs/2024/10/quan-short-kaki-xep-ly-form-straight-qs059-mau-be-18761-slide-products-6701098eb84e0.jpg'),
(20, 'Quần Short Trơn Lưng Thun Ẩn Thông Minh Form Regular', 2, 385000, 'Quần short kaki thường dễ dàng giặt giũ và không cần ủi, giúp bạn tiết kiệm thời gian chăm sóc và luôn sẵn sàng cho mọi hoạt động.', 9999, 333, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/07/quan-short-tron-lung-thun-an-thong-minh-form-regular-qs057-18626-slide-products-66a7474652d8a.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userdetails`
--

CREATE TABLE `userdetails` (
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `userdetails`
--

INSERT INTO `userdetails` (`user_id`, `customer_name`, `phone_number`, `email`, `address`) VALUES
(1, 'Nguyễn Trần Huy', '0962681386', 'nthuy311023@gmail.com', 'Hương Trạch, Hương Khê, Hà Tĩnh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'admin@admin', 'admin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `productdetails`
--
ALTER TABLE `productdetails`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `madanhmuc` (`category_id`);

--
-- Chỉ mục cho bảng `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `productdetails`
--
ALTER TABLE `productdetails`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `productdetails`
--
ALTER TABLE `productdetails`
  ADD CONSTRAINT `productdetails_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `productdetails_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `products` (`category_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Các ràng buộc cho bảng `userdetails`
--
ALTER TABLE `userdetails`
  ADD CONSTRAINT `userdetails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
