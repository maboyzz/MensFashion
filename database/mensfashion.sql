-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 09, 2024 lúc 04:14 PM
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
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(1, 1, 10, 1);

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
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(18,0) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sold_quantity` int(11) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `price`, `information`, `quantity`, `sold_quantity`, `size`, `color`, `image`) VALUES
(1, 1, 'Áo Polo In Full Họa Tiết Màu Trắng', 200000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải silk cao cấp tạo sự thoải mái cho người mặc.', 9999, 5, 'S', 'Trắng', 'https://4menshop.com/images/thumbs/2024/07/ao-polo-in-full-hoa-tiet-4tc-form-regular-po132-18645-slide-products-66a76571b7c0b.jpg'),
(2, 1, 'Áo Polo họa tiết nanh sói', 200000, 'Áo dệt ngắn tay cest la vie năng động. Trang phục phù hợp dạo phố, đi học. Chất liệu vải knit đàn hồi cao, tạo sự thoải mái cho người mặc.', 9999, 7, 'S', 'Nhiều Màu', 'https://4menshop.com/images/thumbs/2024/10/ao-polo-vai-hoa-tiet-nanh-soi-phoi-tay-raglan-form-slimfit-po139-18742-slide-products-67000759cb0b1.jpg'),
(3, 1, 'Áo Polo In Sọc Thêu Hình Ở Ngực', 300000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải silk cao cấp tạo sự thoải mái cho người mặc.', 9999, 120, 'S', 'Kem', 'https://4menshop.com/images/thumbs/2024/05/ao-polo-in-soc-theu-hinh-o-nguc-form-regular-po129-18491-slide-products-664f0902ec899.jpg'),
(4, 1, 'Áo Polo Rã Phối Thêu Đắp Con', 250000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải silk cao cấp tạo sự thoải mái cho người mặc.', 9999, 9, 'S', 'Xanh đen', 'https://4menshop.com/images/thumbs/2024/05/ao-polo-ra-phoi-theu-dap-con-giong-form-regular-po127-18481-slide-products-664ef489bb368.jpg'),
(5, 1, 'Áo Polo in họa tiết kim cương', 200000, 'Áo dệt ngắn tay cest la vie năng động. Trang phục phù hợp dạo phố, đi học. Chất liệu vải knit đàn hồi cao, tạo sự thoải mái cho người mặc.', 9999, 5, 'S', 'Xanh than', 'https://4menshop.com/images/thumbs/2023/12/ao-polo-in-hoa-tiet-form-regular-po117-xanh-den-18324-slide-products-658a5c82548a4.jpg'),
(6, 1, 'Áo PoLo Regular Go Explore', 200000, 'Áo thun form boxy thêu 3D \"MIAMI AESTHETIC\" cá tính, trẻ trung. Trang phục phù hợp dạo phố, thường ngày, đi học...\r\n', 9999, 87, 'S', 'Vàng', 'https://4menshop.com/images/thumbs/2022/05/-16758-slide-products-627a26c369b14.JPG'),
(7, 1, 'Áo Len Tay Dài Dệt Họa Tiết Quả Trám', 420000, 'Áo dệt ngắn tay cest la vie năng động. Trang phục phù hợp dạo phố, đi học. Chất liệu vải knit đàn hồi cao, tạo sự thoải mái cho người mặc.', 9999, 1000, 'S', 'Trắng', 'https://4menshop.com/images/thumbs/2024/10/ao-len-tay-dai-det-hoa-tiet-qua-tram-form-regular-al012-18748-slide-products-6700f3e69ac9d.JPG'),
(8, 1, 'Áo Sơ Mi đi phố ', 200000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải silk cao cấp tạo sự thoải mái cho người mặc.', 9999, 645, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2022/02/ao-so-mi-in-hoa-tiet-asm083-mau-den-16613-slide-products-620c768e6a1fa.JPG'),
(9, 1, 'Áo Hoodie Rã Phối Thêu Home Is Form Regular', 550000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải len cao cấp tạo sự thoải mái cho người mặc.', 9999, 885, 'S', 'Kem', 'https://4menshop.com/images/thumbs/2024/03/ao-hoodie-ra-phoi-theu-home-is-form-regular-ah004-mau-kem-18373-slide-products-65feae51a559e.jpg'),
(10, 1, 'Áo Khoác Da Form Regular', 875000, 'Trang phục phù hợp dạo phố, đi chơi. Chất liệu vải len cao cấp tạo sự thoải mái cho người mặc.', 9999, 245, 'S', 'Màu Nâu', 'https://4menshop.com/images/thumbs/2024/04/ao-khoac-da-form-regular-ak056-mau-nau-18336-slide-products-662335355bfdb.jpg'),
(11, 2, 'Quần Tây Sidetab 1 Bên Form Regular', 425000, 'Được làm từ chất liệu vải cao cấp, quần tây nam này mang đến vẻ ngoài trang nhã, hoàn hảo cho các buổi họp mặt, công sở hoặc sự kiện quan trọng.', 9999, 100, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/10/quan-tay-sidetab-1-ben-form-regular-qt062-mau-be-18786-slide-products-6703ae986f254.jpg'),
(12, 2, 'Quần Tây Sọc Túi Nắp Sau Form Slimfit', 525000, 'Sản phẩm quần tây này phù hợp cho nhiều dịp, từ đi làm đến dự tiệc. Với thiết kế đơn giản nhưng tinh tế, bạn có thể dễ dàng kết hợp với nhiều kiểu áo khác nhau.', 9999, 150, 'S', 'Xám', 'https://4menshop.com/images/thumbs/2024/10/quan-tay-soc-tui-nap-sau-form-slimfit-qt061-mau-xam-18777-slide-products-6701743d146a5.png'),
(13, 2, 'Quần Tây Trơn Form Slimfit', 299000, 'Thiết kế với đường may tinh tế và chi tiết tỉ mỉ, quần tây cổ điển giúp bạn toát lên vẻ lịch lãm và phong cách, là lựa chọn lý tưởng cho những người yêu thích sự truyền thống.', 9999, 120, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/08/quan-tay-tron-form-slimfit-qt058-mau-den-18346-slide-products-66bc7b4c4ac5b.jpg'),
(14, 2, 'Quần Kaki Túi Kiểu Trang Trí Dây Sọc Form Regular', 425000, 'Với chất liệu vải bền bỉ và thoải mái, quần kaki nam là lựa chọn lý tưởng cho cả những buổi đi làm và đi dạo, dễ dàng kết hợp với nhiều kiểu áo.', 9999, 125, '', 'Be', 'https://4menshop.com/images/thumbs/2024/10/quan-kaki-tui-kieu-trang-tri-day-soc-form-regular-qk029-18780-slide-products-6703a908782c6.jpg'),
(15, 2, 'Quần Kaki Túi Nhỏ Kiểu Form Slimfit', 500000, 'Được làm từ vải kaki mềm mại và thoáng khí, quần kaki này giúp bạn cảm thấy dễ chịu và mát mẻ trong suốt cả ngày, đặc biệt trong những ngày hè oi bức.', 9999, 150, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/03/quan-kaki-tui-nho-kieu-form-slimfit-qk026-18417-slide-products-65e7f3d70537d.jpg'),
(16, 2, 'Quần Kaki Trơn Signature Gắn Tag Kim Loại Form Slimfit', 600000, 'Với chất liệu vải bền bỉ và thoải mái, quần kaki nam là lựa chọn lý tưởng cho cả những buổi đi làm và đi dạo, dễ dàng kết hợp với nhiều kiểu áo.', 9999, 800, 'S', 'Be', 'https://4menshop.com/images/thumbs/2024/07/quan-kaki-signature-gan-tag-kim-loai-form-slimfit-qk028-18631-slide-products-66a7505a93531.jpg'),
(17, 2, 'Quần Jeans Xanh Đậm Wash Cát Form Straight', 495000, 'Được làm từ chất liệu denim bền bỉ, quần jeans cổ điển mang đến phong cách timeless, dễ dàng kết hợp với áo thun, áo sơ mi hay áo khoác cho mọi dịp.', 9999, 888, 'S', 'Xanh đậm', 'https://4menshop.com/images/thumbs/2024/02/quan-jeans-xam-wash-bac-duong-may-suon-form-slimfit-qj093-18404-slide-products-65dda271a3ee6.jpg'),
(18, 2, 'Quần Jeans Xanh Nhạt In Túi Sau Form Slimfit', 525000, 'Với gam màu xanh nhạt nhẹ nhàng, quần jeans này dễ dàng kết hợp với nhiều loại trang phục khác nhau, từ áo polo đến áo khoác, giúp bạn luôn nổi bật và thời thượng.', 9999, 666, 'S', 'Xanh nhạt', 'https://4menshop.com/images/thumbs/2024/06/quan-jeans-xanh-den-theu-4men-form-regular-qj101-18592-slide-products-66710c63e4b78.jpg'),
(19, 2, 'Quần Short Kaki Xếp Ly Form Straight', 375000, 'Chất liệu kaki mềm mại và thoáng khí giúp quần short này mang lại cảm giác dễ chịu trong những ngày hè oi ả, lý tưởng cho các hoạt động ngoài trời.', 9999, 555, 'S', 'Be', 'https://4menshop.com/images/thumbs/2024/10/quan-short-kaki-xep-ly-form-straight-qs059-mau-be-18761-slide-products-6701098eb84e0.jpg'),
(20, 2, 'Quần Short Trơn Lưng Thun Ẩn Thông Minh Form Regular', 385000, 'Quần short kaki thường dễ dàng giặt giũ và không cần ủi, giúp bạn tiết kiệm thời gian chăm sóc và luôn sẵn sàng cho mọi hoạt động.', 9999, 333, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/07/quan-short-tron-lung-thun-an-thong-minh-form-regular-qs057-18626-slide-products-66a7474652d8a.jpg'),
(21, 3, 'Giày Derby GI021', 50000000, 'Theo Schlemmer, với những ai muốn tìm kiếm thêm phong cách, Dunk High chính là lựa chọn hoàn hảo. Mặc dù hiếm gặp hơn Dunk Low, nhưng Dunk High lại mang nét sang trọng, có thể kết hợp hoàn hảo với quần jean và các loại quần khác. Để có sự đổi mới so với thiết kế cổ điển, phiên bản Knicks là lựa chọn mạnh mẽ với sự kết hợp sắc màu của đội bóng New York Knicks. Ra mắt vào tháng 7/2022, phong cách đặc trưng này gợi nhớ đến phiên bản City Attack Japan độc quyền năm 1999.', 9999, 246, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2024/06/giay-penny-loafer-da-bo-gi020-18585-slide-products-665ecb7c84442.jpg'),
(22, 3, 'Giày Thể Thao Phối G011', 545000, 'Kiểu dáng: phong cách, cá tính, chất. Phù hợp: Có thể đi đôi,thích hợp đi chơi, đi học,đi làm, đạp xe,....Phối đồ: Có thể kết hợp với jeans,thô, sooc, bộ thể thao ....', 9999, 423, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2022/08/-17096-slide-products-62ea4b9d163df.JPG'),
(23, 3, 'Giày Thể Thao Trơn G010', 500000, 'Kiểu dáng: phong cách, cá tính, chất. Phù hợp: Có thể đi đôi,thích hợp đi chơi, đi học,đi làm, đạp xe,....Phối đồ: Có thể kết hợp với jeans,thô, sooc, bộ thể thao, váy cá tính,....', 9999, 423, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2022/08/-17093-slide-products-62ea494d393c9.JPG'),
(24, 3, 'Giày Slip On Jeans G016', 249000, 'Kiểu dáng: phong cách, cá tính, chất. Phù hợp: Có thể đi đôi,thích hợp đi chơi, đi học,đi làm, đạp xe,....Phối đồ: Có thể kết hợp với jeans,thô, sooc, bộ thể thao, váy cá tính,....', 9999, 1028, 'S', 'Xanh Xám', 'https://4menshop.com/images/thumbs/2022/07/-17070-slide-products-62e09f86282e3.JPG'),
(25, 3, 'Giày Thể Thao G013', 645000, 'Giày Thể Thao có thiết kế đẹp mắt, kiểu dáng hiện đại đến từ thương hiệu nổi tiếng. Giày sở hữu gam màu trang nhã, cùng bộ đệm êm ái mang lại trải nghiệm tuyệt vời cho bạn khi chơi thể thao, vận động, chạy nhảy.', 9999, 1243, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2022/07/-17060-slide-products-62dfb83737e5c.JPG'),
(26, 3, 'Giày Thể Thao G210', 1450000, 'Kháng nước nhẹ khi đi mưa. Đế và lót được khâu toàn bộ tránh bung keo. Thích hợp sử dụng với nhiều hoạt động thể thao, vui chơi,..', 9999, 118, 'S', 'Đỏ', 'https://4menshop.com/images/thumbs/2019/01/giay-the-thao-do-g210-10611-slide-products-5c413ea722d32.jpg'),
(27, 3, 'Giày Tây Leather G017 ', 8850000, 'Giày đẹp, nhẹ, bền. Giá phải chăng phù hợp với người đi làm. Thích hợp đi sự kiện,  chơi, du lịch, đi học, đi làm... ', 9999, 111, 'S', 'Nâu', 'https://4menshop.com/images/thumbs/2022/08/-17173-slide-products-630c82357f2c3.JPG'),
(28, 3, 'Giày Chelsea Boots All Black', 975000, 'Dễ phối đồ, có thể kết hợp với quần tây, jeans, sooc…. Phù hợp với mọi thời tiết từ đông sang hè.', 9999, 113, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2022/08/giay-tay-leather-g017-17174-slide-products-630c83ea0cf78.JPG'),
(29, 3, 'Giày Penny Loafer Da Bò', 572000, 'Dễ phối đồ, có thể kết hợp với quần tây, jeans, sooc…. Phù hợp với mọi thời tiết từ đông sang hè.', 9999, 113, 'S', 'Nâu', 'https://4menshop.com/images/thumbs/2024/05/giay-penny-loafer-gi020-mau-den-18549-slide-products-6650a4fdd814f.jpg'),
(30, 3, 'Giày Thể Thao G012', 484000, 'Giày đẹp, nhẹ, bền. Giá phải chăng phù hợp với các bạn học sinh, sinh viên. Có thể làm giày đôi, giày nhóm. Thích hợp đi chơi, du lịch, chạy bộ, gym, đi học, đi làm... ', 9999, 178, 'S', 'Trắng', 'https://4menshop.com/images/thumbs/2022/07/-17058-slide-products-62dfb475e732f.JPG'),
(31, 1, 'Áo Len Tay Dài Cổ V Sọc Dệt Vặn Thừng Form Regular', 510000, 'Thiết kế áo len phối màu độc đáo với cổ chữ V tạo điểm nhấn nổi bật cho trang phục. Chất liệu len cao cấp, giữ ấm tốt và thoải mái khi mặc. Sản phẩm dễ dàng kết hợp với quần jeans hoặc quần âu, mang lại phong cách thời trang năng động và hiện đại.', 9999, 99, 'S', 'Trắng Kem', 'https://4menshop.com/images/thumbs/2024/10/ao-len-tay-dai-co-v-soc-det-van-thung-form-regular-al013-18730-slide-products-66ffcbda5199b.jpg'),
(32, 1, 'Áo Len Phối Màu AL011', 396000, 'Áo len phối màu AL011 với gam màu đỏ nổi bật, thiết kế trẻ trung và năng động. Chất liệu len cao cấp, mềm mại, giữ ấm tốt, phù hợp cho những ngày thời tiết se lạnh. Điểm nhấn của áo là sự kết hợp tinh tế giữa màu đỏ chủ đạo và các mảng phối màu tạo nên phong cách hiện đại, thu hút mọi ánh nhìn. Kiểu dáng cổ tròn đơn giản, dễ dàng phối hợp với các trang phục khác như quần jeans hoặc áo khoác ngoài. Sản phẩm lý tưởng cho các buổi dạo phố hoặc những dịp gặp gỡ bạn bè.', 9999, 178, 'S', 'Đỏ', 'https://4menshop.com/images/thumbs/2023/07/ao-len-phoi-mau-al011-mau-do-18179-slide-products-64c1e0abf2686.jpg'),
(33, 1, 'Áo Len Đắp Tay AL010', 199000, 'Áo len đắp tay AL010 với tông màu bò sang trọng, thiết kế ấn tượng với chi tiết đắp tay tạo điểm nhấn cá tính. Chất liệu len mềm mại, co giãn tốt, giữ ấm hiệu quả trong thời tiết lạnh. Kiểu dáng ôm vừa vặn giúp tôn dáng, phù hợp cho nhiều phong cách phối đồ từ lịch lãm đến năng động. Sản phẩm không chỉ mang lại sự thoải mái mà còn thể hiện phong cách thời trang riêng biệt, lý tưởng cho các dịp đi chơi, gặp gỡ bạn bè hoặc đi làm. ', 9999, 128, 'S', 'Bò', 'https://4menshop.com/images/thumbs/2023/07/ao-len-dap-tay-al010-mau-bo-18174-slide-products-64c1de4c75caf.jpg'),
(34, 1, 'Áo Len Regular Sọc Dệt Kim AL009 Màu Đen', 650000, 'Áo len Regular AL009 với thiết kế sọc dệt kim độc đáo, mang phong cách hiện đại và tinh tế. Màu đen chủ đạo giúp sản phẩm dễ dàng phối hợp với nhiều trang phục khác, từ quần jeans đến quần âu. Chất liệu len dệt kim mềm mại, thoáng khí, giữ ấm tốt và mang lại cảm giác dễ chịu khi mặc. Kiểu dáng regular phù hợp với mọi vóc dáng, giúp tôn lên vẻ nam tính, mạnh mẽ. Đây là lựa chọn hoàn hảo cho những ngày thời tiết mát mẻ hoặc se lạnh.', 9999, 1463, 'S', 'Đen', 'https://4menshop.com/images/thumbs/2022/12/-17577-slide-products-638ec0d34eff5.jpg'),
(35, 1, 'Áo Len Cổ Lọ Trơn AL008', 375000, 'Áo len cổ lọ trơn AL008 với gam màu rêu thanh lịch, thiết kế cổ lọ giúp giữ ấm tối đa cho cổ trong những ngày lạnh giá. Chất liệu len dày dặn, mềm mại, không gây kích ứng da, mang lại sự thoải mái và ấm áp suốt cả ngày dài. Kiểu dáng trơn đơn giản, dễ dàng phối với các trang phục khác, từ phong cách năng động đến lịch sự. Áo len cổ lọ AL008 là lựa chọn hoàn hảo cho các buổi dạo phố, đi làm hay gặp gỡ bạn bè trong mùa đông.', 9999, 99, 'S', 'Rêu', 'https://4menshop.com/images/thumbs/2022/11/-17483-slide-products-6368ab9357831.JPG');

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
(1, 'Nguyễn Trần Huy', '0962681386', 'nthuy311023@gmail.com', 'Hương Trạch, Hương Khê, Hà Tĩnh'),
(3, 'huy', NULL, 'admin@g', NULL);

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
(2, 'admin@admin', 'admin'),
(3, 'admin1', 'admin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

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
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

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
