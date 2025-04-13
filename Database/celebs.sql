/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `celeb_match` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `celeb_match`;

CREATE TABLE IF NOT EXISTS `Celebrities` (
  `id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `occupation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Nghề nghiệp (diễn viên, ca sĩ, đạo diễn,...)',
  `nationality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `residence` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Nơi sống/làm việc (thành phố, quốc gia)',
  `biography` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Tiểu sử',
  `awards` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Danh sách giải thưởng',
  `songs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Danh sách bài hát nổi bật',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
INSERT INTO `Celebrities` (`id`, `full_name`, `occupation`, `nationality`, `birth_date`, `residence`, `biography`, `awards`, `songs`) VALUES
(9, 'Hoài Lâm', 'Ca sĩ', 'Việt Nam', STR_TO_DATE('1-7-1995', '%d-%m-%Y'), 'Hồ Chí Minh',
'<div class="about-nnt">\n<b>Ca sĩ Hoài Lâm là ai?</b><br>\nHoài Lâm tên thật là Nguyễn Tuấn Lộc. Anh được biết đến là một ca sĩ trẻ triển vọng của Việt Nam được đông đảo khán giả biết đến và yêu mến..<br>',
'<b> Các giải thưởng mà anh đạt được:</b><br>\n  <ul>\n    <li> Quán Quân <a href="/nghe-nghiep/chuong-trinh-truyen-hinh/guong-mat-than-quen/bgee">Gương mặt thân quen </a>2014\n    </li>\n    <li> Thần tượng của giới trẻ The Magic Box 2014</li>\n    <li> Sao được yêu thích nhất Tiin Vote Awards 2014 - 2015</li>\n    <li> Ca sĩ hát nhạc âm hưởng dân ca Mai Vàng báo Người Lao Động 2015</li>\n    <li> Nhạc sỹ, ca sỹ của năm với ca khúc "Có khi" - Chương trình Bài hát yêu thích 2015</li>\n    <li> Nam Ca sĩ trẻ triển vọng Làn Sóng Xanh 2015</li>\n    <li>Làm Cha MV được yêu thích nhất Tiin Vote Awards 2015</li>\n  </ul></div>',
'<ul>\n    <li> Cô bé ngày xưa</li>\n    <li> Quay về</li>\n    <li> Làm cha</li>\n    <li> Có khi</li>\n    <li> Về đâu mái tóc người thương</li>\n  </ul>'),

(10, 'Hoàng Thùy Linh', 'Ca sĩ', 'Việt Nam', STR_TO_DATE('11-08-1988', '%d-%m-%Y'), 'Hà Nội',
'<div class="about-nnt" style="height: auto !important;">...tiểu sử đầy đủ với HTML...</div>',
'<ul><li> Hoàng Thùy Linh lọt vào bảng xếp hàng liveshow tháng 2/2014 chương trình Bài Hát Yêu Thích.</li></ul>',
'<ul><li>Just You+ (Special Edition)</li><li>Just You</li><li>Rơi (Single)</li><li>Crazy, I Wanna Dance (Mashup)</li><li>Hoàng Thùy Linh 2013 (EP)</li><li>Hờn Dỗi (Single)</li><li>Mini Album 2012</li><li>Đừng Vội Vàng</li><li>Hoàng Thùy Linh</li></ul>'),

(11, 'Hoàng Yến Chibi', 'Ca sĩ', 'Việt Nam', '1995-12-08', 'Hà Nội',
'<div class="about-nnt">\n<b>Hoàng Yến Chibi là ai?</b><br>Hoàng Yến Chibi là một cô gái trẻ xinh đẹp với giọng ca trong trẻo và cao. Cô vào nghề từ khá sớm nhưng lại có nhiều thành công rất đáng nể và dấu mốc đầu tiên cho bước đường hoạt động nghệ thuật trải đầy hoa hồng của Hoàng Yến Chibi đó là đạt danh hiệu Á quân Học Viện Ngôi Sao, tạo đà cho cô tới gần hơn với khán giả trẻ.<br> Khi mới 5 tuổi, Hoàng Yến đã tham gia đi hát và cô thường tham gia hoạt động văn nghệ tại nhà trường và địa phương.<br> Hiện tại, ChiBi đang là sinh viên của trường Đại học Văn hóa Hà Nội. Việc học của cô cũng bị gián đoạn nhiều vì việc ca hát khá bận rộn.<br> Hoàng Yến là một ca sĩ trẻ nhưng khá đắt show và được mời đóng phim, quảng cáo tại Hồ Chí Minh. Cô cũng đã từng được biểu diễn trên sân khấu với những ca sĩ như: Ngọc Anh, Phương Linh, Lương Minh Trang, Tùng Dương, … Hoàng Yến tham gia vai diễn trong sitcom “Cửa sổ thủy tinh”.<br></div>',
'<ul><li> Hoàng Thùy Linh lọt vào bảng xếp hàng liveshow tháng 2/2014 chương trình Bài Hát Yêu Thích.</li></ul>',
'<ul><li> Ngây ngô</li><li> Ba kể con nghe</li><li> Dường như anh đã</li><li> Là mẹ của con</li><li> Một phút giây</li><li> Em sẽ quên thôi</li><li> Ánh trăng nói hộ lòng thôi</li></ul>'),

(12, 'Hồ Quang Hiếu', 'Ca sĩ', 'Việt Nam', '1986-09-20', 'Hồ Chí Minh',
'<div class="about-nnt" style="height: auto !important;">...tiểu sử đầy đủ với HTML...</div>', '',
'<ul><li>Giấc mơ không trọn vẹn</li>...<li>Quên giấc mơ</li></ul>'),

(13, 'Hồ Quỳnh Hương', 'Ca sĩ', 'Việt Nam', '1980-10-16', 'Hạ Long',
'<div class="about-nnt">\n<b>>Hồ Quỳnh Hương là ai?</b><br>...tiểu sử đầy đủ với HTML...</div>', '',
'<ul><li>Vào đời (2003)</li>...<li>Hương xưa I (2016)</li></ul>'),

(14, 'Jang Mi', 'Ca sĩ', 'Việt Nam', '1996-03-22', 'Hồ Chí Minh',
'<div class="about-nnt">\n<b>>Jang Mi là ai?</b><br>...tiểu sử đầy đủ với HTML...</div>', '',
'<ul><li>Nhớ thương làm chi</li>...<li>Duyên phận cover</li></ul>'),

(15, 'Lam Trường', 'Ca sĩ', 'Việt Nam', '1996-03-22', 'Hồ Chí Minh',
'<div class="about-nnt">\n<b>> Ca sĩ Lam Trường là ai?</b><br>...tiểu sử đầy đủ với HTML...</div>', '', '');