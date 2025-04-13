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
'<b>\\nCác giải thưởng mà anh đạt được:</b><br>
  <ul>
    <li> Quán Quân <a href=\\"/nghe-nghiep/chuong-trinh-truyen-hinh/guong-mat-than-quen/bgee\\">Gương
      mặt thân quen </a>2014
    </li>
    <li> Thần tượng của giới trẻ The Magic Box 2014</li>
    <li> Sao được yêu thích nhất Tiin Vote Awards 2014 - 2015</li>
    <li> Ca sĩ hát nhạc âm hưởng dân ca Mai Vàng báo Người Lao Động 2015</li>
    <li> Nhạc sỹ, ca sỹ của năm với ca khúc \\"Có khi\\" - Chương trình Bài hát yêu thích 2015</li>
    <li> Nam Ca sĩ trẻ triển vọng Làn Sóng Xanh 2015</li>
    <li>Làm Cha MV được yêu thích nhất Tiin Vote Awards 2015</li>
  </ul></div>',
'<ul>\n    <li> Cô bé ngày xưa</li>\n    <li> Quay về</li>\n    <li> Làm cha</li>\n    <li> Có khi</li>\n    <li> Về đâu mái tóc người thương</li>\n  </ul>'),

(10, 'Hoàng Thùy Linh', 'Ca sĩ', 'Việt Nam', STR_TO_DATE('11-08-1988', '%d-%m-%Y'), 'Hà Nội',
'<div class=\"about-nnt\" style=\"height: auto !important;\
">\n<b>Ca sĩ Hoàng Thùy Linh là ai?</b><br>\nHoàng Thùy Linh là một ca sĩ kiêm người mẫu nổi tiếng
của làng giải trí Việt. Nhắc tới Hoàng Thùy Linh, khán giả Việt Nam, đặc biệt là thế hệ 9x và 8x sẽ
liên tưởng đến cô nàng Vàng Anh trong bộ phim \"Nhật Ký vàng anh\", từng là bộ phim ăn khách trên
truyền hình.<br><a href=\"/nghe-nghiep/nguoi-mau/hoang-thuy/1\">Hoàng Thùy</a> lĩnh đã học múa trong
7 năm tại trường Cao đẳng nghệ thuật Hà Nội, Cô từng là ca sĩ hát phụ của nhóm nhạc Thiên Thần. Cô
đến với điện ảnh lần đầu tiên, là khi cô thủ vai Thùy trong bộ phim \"Đường đời\" của đạo diễn Quốc
Trọng. Sau này, Hoàng Thùy Linh còn tham gia nhiều phim khác như \"Đi về phía mặt trời\", \"Trò đùa
của số phận\"... Năm 2006, cô thi đỗ thủ khoa vào trường Đại học Sân khấu Điện ảnh, khoa Đạo diễn
truyền hình.
<div class=\"google-auto-placed ap_container\
" style=\"width: 100%; height: auto; clear: both; text-align: center;\">
<ins data-ad-format=\"auto\" class=\"adsbygoogle adsbygoogle-noablate\
" data-ad-client=\"ca-pub-2988304919300319\" data-adsbygoogle-status=\"done\"
style=\"display:block;clear:both\" data-ad-status=\"ok\">
<div class=\"clear5\">&nbsp;</div>
<iframe frameborder=\"0\" scrolling=\"no\" style=\"width:100%;height:285px\"
        src=\"/abn/hmt.jsp\"></iframe>
</ins></div><br>Sở hữu gương mặt xinh xắn, biểu cảm tốt, Hoàng Thùy Linh đã được chọn đóng vai Vàng
Anh trong phim truyền hình tương tác \"Nhật ký Vàng Anh\", là phim được giới trẻ rất hâm mộ. Tuy
nhiên, không lâu sau đó, cô đã dính vào scandal lộ clip \"nóng\" cùng người yêu là Việt Dart. Vụ
việc này đã khiến dư luận trong nước lẫn nước ngoài quan tâm. Đặc biệt, scandal này đã gây ra nhiều
dư luận trái chiều, nhất là các bậc phụ huynh đã phê phán một các rất nghiêm khắc, yêu cầu cô phải
xin lỗi công khai trên truyền hình vì đã hủy hoại một chương trình vốn mang tính chất giáo dục cho
giới trẻ. <br>Sau vụ lộ clip \"nóng\", Hoàng Thùy Linh vẫn tiếp tục hoạt động nghệ thuật. Sau khi
trở lại, Hoàng Thùy Linh đã trở thành một ca sĩ \"hot\" hàng đầu tại Việt Nam lúc bấy giờ. Năm 2008,
cô còn được mời làm người mẫu ảnh, người mẫu quảng cáo cho nhiều nhãn hàng thời trang và trò chơi
điện tử trực tuyến. Năm 2010, CNN GO đã liệt kê scandal của Hoàng Thùy Linh vào 5 vụ bê bối tình dục
lớn nhất ở Châu Á.
<div class=\"google-auto-placed ap_container\
" style=\"width: 100%; height: auto; clear: both; text-align: center;\">
<ins data-ad-format=\"auto\" class=\"adsbygoogle adsbygoogle-noablate\
" data-ad-client=\"ca-pub-2988304919300319\" data-adsbygoogle-status=\"done\"
style=\"display:block;clear:both\" data-ad-status=\"ok\">
<div class=\"clear5\">&nbsp;</div>
<iframe frameborder=\"0\" scrolling=\"no\" style=\"width:100%;height:285px\"
        src=\"/abn/hmt.jsp\"></iframe>
</ins></div><br>Năm 2010, Hoàng Thùy Linh hợp tác với <a
    href=\"/nghe-nghiep/nhac-si/nguyen-duc-cuong/cf\">nhạc sĩ Nguyễn Đức Cường</a>, <a
    href=\"/nghe-nghiep/nhac-si/luu-thien-huong/j7\">Lưu Thiên Hương </a>và nữ <a
    href=\"/nghe-nghiep/ca-si/dong-nhi/br\">ca sĩ Đông Nhi</a> để sản xuất và phát hành album
\"Hoàng Thùy Linh\", với dòng nhạc chủ yếu là dance-pop. Trong album này, single \"Nhịp đập giấc
mơ\", \"Cho nhau lối đi riêng\", \"Rung động\" đã trở thành những ca khúc được khán giả yêu thích
nhất lúc bấy giờ. Trong năm 2011, Hoàng Thùy Linh tiếp tục gặt hái thành công trong âm nhạc nhờ
album \"Đừng vội vàng\", hợp tác với nhạc sĩ Lưu Thiên Hương. Trong đó, ca khúc \"Ngày không anh\"
nhận được nhiều đánh giá tích cực, còn ca khúc \"Đừng vội vàng\" lại nhận nhiều phản ứng trái chiều.<br>Đến
nay, Hoàng Thùy Linh là một ca sĩ có chỗ đứng vững chắc trong showbiz Việt. Tuy bị trượt ngã vì
scandal tình ái, nhưng người đẹp này đã vực dậy và trở nên tỏa sáng. Với khối tài sản hiện có, Hoàng
Thùy Linh khiến nhiều người phải ghen tỵ với tài kiếm tiền của cô. Hiện tại, Hoàng Thùy Linh đang sở
hữu một căn hộ cao cấp tại một chưng cư cao cấp ở Quận 7, một chiếc xe Mercedes E-class đời 2012 có
trị giá ước tính khoảng 2 tỷ đồng, và không phải là chiếc xe duy nhất mà cô từng sử dụng. Cô còn sở
hữu một căn biệt thự đang xây dựng tại Tam Đảo. Ngoài ra, nữ ca sĩ này còn sở hữu nhiều món đồ hàng
hiệu cao cấp đắt tiền.<br></div>',
'<ul><li> Hoàng Thùy Linh lọt vào bảng xếp hàng liveshow tháng 2/2014 chương trình Bài Hát Yêu Thích.</li></ul>',
'<ul><li>Just You+ (Special Edition)</li><li>Just You</li><li>Rơi (Single)</li><li>Crazy, I Wanna Dance (Mashup)</li><li>Hoàng Thùy Linh 2013 (EP)</li><li>Hờn Dỗi (Single)</li><li>Mini Album 2012</li><li>Đừng Vội Vàng</li><li>Hoàng Thùy Linh</li></ul>'),

(11, 'Hoàng Yến Chibi', 'Ca sĩ', 'Việt Nam', STR_TO_DATE('08-12-1988', '%d-%m-%Y'), 'Hà Nội',
'<div class=\\"about-nnt\\">\\n<b>>Hoàng Yến Chibi là ai?</b><br>Hoàng Yến Chibi là một cô gái trẻ
  xinh
  đẹp với giọng ca trong trẻo và cao . Cô vào nghề từ khá sớm nhưng lại có nhiều thành công rất đáng
  nể và dấu mốc đầu tiên cho bước đường hoạt động nghệ thuật trải đầy hoa hồng của Hoàng Yến Chibi
  đó là đạt danh hiệu Á quân Học Viện Ngôi Sao, tạo đà cho cô tới gần hơn với khán giả trẻ.<br>
  Khi mới 5 tuổi, Hoàng Yến đã tham gia đi hát và cô thường tham gia hoạt động văn nghệ tại nhà
  trường và địa phương.
  <br>
  Hiện tại, ChiBi đang là sinh viên của trường Đại học Văn hóa Hà Nội. Việc học của cô cũng bị gián
  đoạn nhiều vì việc ca hát khá bận rộn.
  <br>
  Hoàng Yến là một ca sĩ trẻ nhưng khá đắt show và được mời đóng phim, quảng cáo tại Hồ Chí Minh. Cô
  cũng đã từng được biểu diễn trên sân khấu với những ca sĩ như: Ngọc Anh, Phương Linh, Lương Minh
  Trang, Tùng Dương, … Hoàng Yến tham gia vai diễn trong sitcom “Cửa sổ thủy tinh”.
  <br></div>',
'<ul>
  <li> Hoàng Thùy Linh lọt vào bảng xếp hàng liveshow tháng 2/2014 chương trình Bài Hát Yêu Thích.
  </li>
</ul>',
'  <ul>
    <li> Ngây ngô</li>
    <li> Ba kể con nghe</li>
    <li> Dường như anh đã</li>
    <li> Là mẹ của con</li>
    <li> Một phút giây</li>
    <li> Em sẽ quên thôi</li>
    <li> Ánh trăng nói hộ lòng thôi</li>
  </ul>'),

(12, 'Hồ Quang Hiếu', 'Ca sĩ', 'Việt Nam', STR_TO_DATE('20-09-1986', '%d-%m-%Y'), 'Hồ Chí Minh',
'"<div class=\\"about-nnt\\" style=\\"height: auto !important;\\
">\\n<b>Ca sĩ Hồ Quang Hiếu là ai?</b><br>\\nHồ Quang Hiếu là một trong những nam ca sĩ <a
    href=\\"/nghe-nghiep/doi-tuyen-bong-da-quoc-gia/viet-nam/bi96\\">Việt Nam</a> đang sở hữu lượng
fan hâm mộ khủng. Anh nổi tiếng với các ca khúc hit như: \\"Con bướm xuân\\", \\"Em là của anh\\",
\\"Còn lại gì sau cơn mưa\\", \\"Nơi ấy con tìm về\\", \\"Không cảm xúc\\", \\"Ngã tư đường\\",
\\"Bí mật trái tim\\", \\"Giá mình là người lạ\\"...<br>Thành công đầu tiên trong sự nghiệp của Hồ
Quang Hiếu phải kể đến album \\"Chỉ cần em hạnh phúc\\". Album này đã lọt vào Top 20 trên bảng xếp
hạng của Zing. Trước đó, anh từng giành giải nhất của cuộc thi \\"Hãy tỏa sáng\\" vào năm 2010. Năm
2014, Hồ Quang Hiếu bắt đầu nổi tiếng nhờ hit \\"Con bướm xuân\\". Hồ Quang Hiếu và nạn thân, nam ca
sĩ Hồ Việt Trung đã cộng tác sản xuất bộ phim ca nhạc dài 46 phút mang tên \\"Giải cứu tiểu thư\\".
Chỉ sau 1 tháng phát hành sản phẩm âm nhạc này đã thu hút được hơn 11 triệu lượt xem trên kênh
Youtube. Sau thành công của \\"Giải cứu tiểu thư\\", Hồ Quang Hiếu và <a
    href=\\"/nghe-nghiep/ca-si/ho-viet-trung/c8\\">Hồ Việt Trung</a> bắt tay vào thực hiện sản phẩm
âm nhạc tiếp theo, đó là album \\"Em là của anh\\", trùng tên với ca khúc chủ đề của album. Ngày
14/04/2015, Hồ quang Hiếu đã tổ chức một cuộc họp báo để ra mắt sản phẩm âm nhạc mới, MV \\"Chỉ còn
trong ký ức\\".
<div class=\\"google-auto-placed ap_container\\
" style=\\"width: 100%; height: auto; clear: both; text-align: center;\\">
<ins data-ad-format=\\"auto\\" class=\\"adsbygoogle adsbygoogle-noablate\\
" data-ad-client=\\"ca-pub-2988304919300319\\" data-adsbygoogle-status=\\"done\\"
style=\\"display:block;clear:both\\" data-ad-status=\\"ok\\">
<div class=\\"clear5\\">&nbsp;</div>
<iframe frameborder=\\"0\\" scrolling=\\"no\\" style=\\"width:100%;height:285px\\"
        src=\\"/abn/hmt.jsp\\"></iframe>
</ins></div><br>Sau nhiều năm hoạt động trong nghề, đến nay Hồ Quang Hiếu đã trở thành một nam ca sĩ
nổi tiếng của làng âm nhạc Việt Nam. Anh là một trong những nghệ sĩ nam có lượng fan hâm mộ khủng
nhất của showbiz Việt. Mới đây, nam ca sĩ này còn cho biết, sau nhiều năm hoạt động âm nhạc, anh đã
tích lũy được một số tiền đủ để mua một chiếc xế hộp trị giá 3 tỷ và 2 căn nhà tại <a
    href=\\"/tinh-tp/ho-chi-minh-viet-nam\\">Tp. Hồ Chí Minh</a>. Chuyện đời tư của nam ca sĩ này
cũng thu hút sự quan tâm của nhiều khán giả và người hâm mộ. Khi Hồ Quang Hiếu và nữ ca sĩ <a
    href=\\"/nghe-nghiep/ca-si/bao-anh/o\\">Bảo Anh</a> công khai hẹn hò, đã có nhiều fan hâm mộ
không khỏi bất ngờ, nhưng đa số đều ủng hộ và chúc phúc cho cặp đôi này. Mới đây nhất, Hồ Quang Hiếu
và bạn gái thường xuyên chia sẻ những hình ảnh đi chơi cùng nhau tại nước ngoài, điều này đã khiến
không ít fan hâm mộ phải trầm trồ ngưỡng mộ về tình yêu của họ.<br></div>', '',
'<ul>
  <li>Giấc mơ không trọn vẹn</li>
  <li>Xin tình yêu quay về</li>
  <li>Thoáng</li>
  <li>Giờ mới biết yêu em</li>
  <li>Bỏ lại sau lưng quá khứ</li>
  <li>Quá khứ và anh</li>
  <li>Một bờ môi hai lời nói</li>
  <li>Phải chăng tình sai lầm</li>
  <li>Để anh được yêu</li>
  <li>Nổi lo của anh</li>
  <li>Quên tình dối gian</li>
  <li>Đêm khóc</li>
  <li>Chỉ có tôi</li>
  <li>Cơn mưa chiều</li>
  <li>Vì sao anh mất em</li>
  <li>Vết thương chưa lành</li>
  <li>Tỉnh giấc</li>
  <li>Quên đi một hình dung</li>
  <li>Nước mắt theo màn mưa</li>
  <li>Một nữa hạnh phúc</li>
  <li>Em vẫn còn trong giấc mơ</li>
  <li>Chỉ cần em hạnh phúc</li>
  <li>Cố níu lấy đôi tay</li>
  <li>Yêu</li>
  <li>Ngày em đến ngày em đi</li>
  <li>Bí mật trái tim</li>
  <li>Cho anh một lần</li>
  <li>Em không có thật</li>
  <li>Hãy luôn nhớ về nhau</li>
  <li>Khoảng cách cho nhau</li>
  <li>Mong đợi vầng trăng</li>
  <li>Ngã tư đường</li>
  <li>Vì ngày xưa</li>
  <li>Vô tâm</li>
  <li>Em là hạnh phúc trong anh</li>
  <li>Chỉ cần gặp em</li>
  <li>Bức tranh vẽ thiếu nét (ft <a href=\\"/nghe-nghiep/ca-si/nam-du/f6\\">Nam Du</a>)</li>
  <li>Muốn yêu em như ngày xưa</li>
  <li>Mẹ</li>
  <li>Ngỡ đã quên</li>
  <li>Phải chăng là muộn màng</li>
  <li>Thà rằng em cứ nói</li>
  <li>Vết thương vô hình</li>
  <li>Vì em quay lưng</li>
  <li>Quên giấc mơ</li>
</ul>
<b>Đĩa đơn hợp tác:</b><br>
<ul>
  <li>\\"Lặng nhìn thời gian\\" và \\"Yêu thầm\\" - 2012 - Ft Nipe</li>
  <li>\\"Bức tranh vẽ thiếu nét\\" - 2012 - Ft Nam Du</li>
  <li>\\"Thôi\\" - 2012 - Ft Tùy Phong</li>
  <li>\\"Cha mẹ không cho\\" - 2012 (nhiều nghệ sĩ)</li>
  <li>\\"Mùa thu yêu đương\\" - 2013 - Ft Hoàng Châu</li>
  <li>\\"Qua đêm nay\\" - 2013 - Ft Đinh Kiến Phong</li>
  <li>\\"Ký ức còn đâu\\" - 2013 - Ft Minh Vương M4U</li>
  <li>\\"Ta nên dừng lại\\" - 2013 - Ft nhiều nghệ sĩ</li>
  <li>\\"Tình yêu còn xa\\" &amp; \\"Chiều nghe biển khóc\\" - 2014 - Ft Quách Tuấn Du</li>
  <li>\\"Còn lại gì trong em\\", \\"Phải làm sao\\" &amp; \\"Không ai yêu em hơn anh\\" - 2015 - Ft
    Hồ Tuấn Anh
  </li>
  <li>\\"Nhìn lại dấu chân\\" - 2015</li>
</ul>'),

(13, 'Hồ Quỳnh Hương', 'Ca sĩ', 'Việt Nam', STR_TO_DATE('16-10-1980', '%d-%m-%Y'), 'Hạ Long',
'<div class=\\"about-nnt\\">\\n<b>>Hồ Quỳnh Hương là ai?</b><br>Hồ Quỳnh Hương (sinh 16 tháng 10 năm 1980, tại Hạ Long, Quảng Ninh) là một ca sĩ người Việt Nam, từng nhận được 2 đề cử và giành 1 giải Cống hiến. Ngoài ra, Hồ Quỳnh Hương còn đam mê âm nhạc cổ điển, cô được biết đến với danh hiệu “cô gái của những giải thưởng” nhờ sở hữu nhiều giải thưởng trong sự nghiệp ca hát.
  <br>
  Hồ Quỳnh Hương là giám khảo chính thức cuộc thi “Nhân tố bí ẩn” (X-Factor Vietnam) mùa thứ nhất và mùa thứ hai. Hiện tại cô là giảng viên chuyên ngành thanh nhạc tại Đại học Văn hóa – Nghệ thuật Quân đội.
  <br>
  Ngoài ca hát, Hồ Quỳnh Hương còn là nhà sáng lập thương hiệu thuần chay Loving Vegan Food, kinh doanh,….
  <br>', '',
'<ul>
  <li>Vào đời (2003) (Vol 1)</li>
  <li>Ngày dịu dàng (2004) (Vol 2)</li>
  <li>Sao tình yêu (2005) (Vol 3)</li>
  <li>14M – 2222 (2005) (Vol 4)</li>
  <li>Non-Stop (2007) (Vol 5)</li>
  <li>Năng lượng (2009) (Vol 6)</li>
  <li>Anh (2010) (Vol 7)</li>
  <li>Giáng Sinh an lành (2010)</li>
  <li>Tĩnh lặng (2013) (Vol 8)</li>
  <li>Hương xưa I (2016)</li>
</ul>'),

(14, 'Jang Mi', 'Ca sĩ', 'Việt Nam', STR_TO_DATE('22-03-1986', '%d-%m-%Y'), 'Hồ Chí Minh',
' <div class=\\"about-nnt\\">\\n<b>>Jang Mi là ai?</b> <br> Jang Mi là một người con út trong gia đình có 2 anh em. Nhà cô ở xã Tân Tiến, huyện Đầm Dơi, tỉnh Cà Mau. Nguồn kinh tế của gia đình cô chủ yếu là sản xuất tôm giống. Mặc dù cuộc khống không quá khó khăn. Nhưng Jang Mi lại gặp khó khăn trong việc đi học vì nhà cô cách trường học quá xa.
  <br>
  Sau đó khi thấy con gái đi học vất vả quá, cha mẹ cô đã quyết định chuyển hẳn lên Sài Gòn sinh sống để con gái có thể thuận tiện hơn trong việc học hành.
  <br>
  Jang Mi không phải “con nhà nòi”, không được các đơn vị giải trí lăng xê hay giới thiệu hình ảnh của mình đến với công chúng. Trong cô có một tình yêu đặc biệt với dòng nhạc Bolero, ngày càng được yêu mến bởi những bản cover ngọt ngào, sâu lắng đi vào lòng người.
  <br>
  Jang Mi được đặt biệt danh là “Hot girl xe buýt” sau khi cô quay một đoạn clip “quay lén” cô hát trên chuyến xe buýt. Video được chia sẻ trên mạng xã hội Facebook nhận được sự chú ý của đông đảo cư dân mạng. Với hơn 340.000 lượt theo dõi và hơn 19.000 lượt thích và hàng trăm lượt chia sẻ và bình luận.
  <br>
  </div>', '',
'<ul>
  <li>Nhớ thương làm chi</li>
  <li>Đừng hỏi em cover</li>
  <li>I don’t like to sleep cover</li>
  <li>Chuyện ba mùa mưa cover</li>
  <li>Sầu tím thiệp hồng cover</li>
  <li>Bối rối vover</li>
  <li>Ánh trăng nói hộ lòng tôi cover</li>
  <li>Để khoảnh khắc mãi đong đầy cover</li>
  <li>Ừ có anh đây cover</li>
  <li>Vừng lá me bay cover</li>
  <li>Trả lại thời gian cover</li>
  <li>Đừng tin em mạnh mẽ</li>
  <li>Mùa thu lá bay cover</li>
  <li>Phượng buồn cover</li>
  <li>Yêu là phải liều</li>
  <li>Sáng nay mưa</li>
  <li>Trọn tình</li>
  <li>Mặt trái của hạnh phúc</li>
  <li>Dạ cổ hoài lang cover</li>
  <li>Duyên phận cover</li>
</ul>'),

(16, 'Lương Bích Hữu', 'Ca sĩ', 'Việt Nam', STR_TO_DATE('1-09-1984', '%d-%m-%Y'), 'Hồ Chí Minh',
'<div class=\\"about-nnt\\">\\n<b>>  Lương Bích Hữu là ai?</b><br>
  Lương Bích Hữu sinh ngày 1 tháng 9 năm 1984, còn có biệt danh là A Mí, được người hâm mộ gọi thân mật là chị Bảy, là con thứ 4 trong một gia đình có 5 chị em gái, tại quận 8, Thành phố Hồ Chí Minh. Tên tiếng Hoa trong khai sinh của cô là 梁碧好. Khi dịch tên ra tiếng Việt, người dịch lúc ấy đã dịch sai tên thật từ “Hảo” (好) thành “Hữu” (友). Và cô đã lấy tên Lương Bích Hữu làm nghệ danh.
  <br>
  Năm 12 tuổi, trong một cuộc thi cấp quận, cô và một số người bạn đã giành giải nhất với tiết mục "Cô gái Bích Lan Hương" sau đó bắt đầu sinh hoạt tại Nhà Thiếu nhi quận 5.
  <br>
  Sau khi học hết lớp 12, Lương Bích Hữu đậu vào Khoa Thanh nhạc của Nhạc viện Thành phố Hồ Chí Minh, mơ ước chính của cô lúc bấy giờ là sau này sẽ trở thành giảng viên thanh nhạc thật giỏi, vừa có thể gần gũi với việc ca hát, vừa "không trở thành ca sĩ" theo ý gia đình.
</div>', '<ul>
  <li>Giải nhất toàn quận với tiết mục "Cô gái Bích Lan Hương" năm 1996</li>
  <li>Giải Năm: Hội thi đơn ca tiếng Hoa lần XIII năm 2000</li>
  <li>Giải Ba: Hội diễn văn nghệ quần chúng chào mừng 70 năm ngày thành lập MTDTTN Việt Nam năm 2000</li>
  <li>Giải Nhất: Liên hoan tiếng hát truyền thống "Âm vang giai điệu hào hùng" năm 2002</li>
  <li>ZING ALBUM 2008: Album Vol.3 It''s not over - Chưa dừng lại</li>
  <li>Giải thưởng Zing Music Awards 2013 (do cộng đồng mạng bình chọn) hạng mục “Ca khúc mang âm hưởng dân ca được yêu thích nhất”: ca khúc chủ đề của album “Đứt từng đoạn ruột”</li>
  <li>Á quân Our song - Bài hát của chúng ta 2024</li>
</ul>
', '<ul>
  <li>Anh không muốn bất công với em 2, 2004</li>
  <li>We are H.A.T, 2005</li>
  <li>Cô gái Trung Hoa (Vol.1), 2005</li>
  <li>Ây da ây da (Vol.2), 2007</li>
  <li>It''s Not Over (Vol.3), 2008</li>
  <li>Cô gái Trung Hoa trở lại, 2009</li>
  <li>Story Of Time, 2010</li>
  <li>Gọi tên nhau mãi (Vol.4), 2010</li>
  <li>Lương Bích Hữu Collection 2011, 2011</li>
  <li>Cô nàng đẹp trai, 2012</li>
  <li>Học cách đi một mình, 2013</li>
  <li>Người lạ từng yêu (ft. Tam Hổ), 2013</li>
  <li>Đứt từng đoạn ruột, 2013</li>
  <li>Có kiếp sau không (ft. Đan Trường), 2013</li>
  <li>Anh muốn chia tay phải không?, 2014</li>
  <li>Mình cưới nhau nhé (ft. Hồ Quang Hiếu), 2014</li>
  <li>Em chọn cô đơn, 2015</li>
  <li>Đến sau phải lau nước mắt, 2015</li>
  <li>Hữu với dance (DJ Phơ Nguyễn), 2015</li>
  <li>Tình yêu trong vòng tay, 2015</li>
  <li>Người ta nói đúng, 2016</li>
  <li>Party girl, 2017</li>
</ul>'),

(15, 'Lam Trường', 'Ca sĩ', 'Việt Nam', '1996-03-22', 'Hồ Chí Minh',
'<div class=\\"about-nnt\\">\\n<b>> Ca sĩ Lam Trường là ai?</b><br>
  Ca sĩ Lam Trường sinh ra trong một gia đình người Việt gốc Hoa, anh là con út trong gia đình có 3 anh chị em. Nguyên quán của Lam Trường vốn ở tỉnh Triều Châu thuộc Trung Quốc, sau đó gia đình anh di cư sang Việt Nam. Ngay từ khi còn rất nhỏ, Lam Trường đã rất bộc lộ niềm đam mê với ca hát, âm nhạc.
  <br>
  Dưới sự khuyến khích của anh trai ruột là Lam Thông – vốn là một sinh viên thanh nhạc của Nhạc viện TP.HCM, Tiêu Lam Trường càng trở nên hăng hái tham gia vào các hoạt động ở trường học. Sau khi tốt nghiệp bậc THPT, Lam Trường thi đỗ trở thành tân sinh viên của trường Cao đẳng Văn Hóa Nghệ Thuật TP.HCM.
  <br>
  Trong thời gian học tập tại trường, ca sĩ Lam Trường được thầy Hoàng Tín dìu dắt, anh thường xuyên đi hát ở các nhà hàng tại quận 5.Những ca khúc anh trình bày đều là bài hát của Tứ Đại Thiên Vương rất được ưa chuộng tại Hồng Koong thời đó.
  <br>
  Sau này, ca sĩ Lam trường tiếp tục tham gia vào lực lượng Thanh niên xung phong với hoạt động chính là văn nghệ  được nhạc sĩ Nguyễn Đức Trung trực tiếp phụ trách.
  <br>
  Đến tháng 10/1995, ca sĩ Lam Trường đạt được thành tựu đầu tiên trong sự nghiệp với giải nhì cuộc thi Thập đại tinh tú – một trong những cuộc thi rất nổi tiếng tại cộng đồng người Hoa ở TP.HCM khi ấy. Có bệ phóng từ cuộc thi kể trên, ca sĩ Lam Trường bắt đầu được mời đi hát tại những địa điểm lớn như Queen Bee, Volvo, Rex, Phương Đông và nhất là Kim Lợi mời cộng tác.
  <br>
  Cũng chính từ đấy, ca sĩ Lam Trường trở thành cái tên được nhiều hãng băng đĩa mời cộng tác, thu âm và biểu diễn tại các sân khấu lớn nhỏ.
  <br>
</div>', '<ul>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 1998</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 1999</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2000</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2001</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2002</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2003</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2004</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2005</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2006</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2007</li>
  <li>Ca sĩ yêu thích nhất trên Làn sóng xanh - 2008</li>
  <li>Giải Mai Vàng - 1998</li>
  <li>Giải Mai Vàng - 1999</li>
  <li>Giải Mai Vàng - 2000</li>
  <li>Giải Mai Vàng - 2001</li>
  <li>Giải Mai Vàng - 2002</li>
  <li>Giải Mai Vàng - 2003</li>
  <li>Giải Mai Vàng - 2004</li>
</ul>
', '<ul>
  <li>Xin đến trong giấc mộng. Ngày phát hành: 1/1/1999.</li>
  <li>Vol 1: Mãi mãi. Ngày phát hành: 28/6/1999.</li>
  <li>Tình thôi xót xa 1-2-3. Hãng Phim Trẻ (1999)</li>
  <li>Yêu nhau ghét nhau - Lam Trường (1999)</li>
  <li>Cô bé kính cận - Lam Trường & Cẩm Ly (1999)</li>
  <li>Biển trắng (Nhạc Hoa Vol 1). Ngày phát hành: 28/11/2000.</li>
  <li>Vol 2: Chút tình thơ ngây. Ngày phát hành: 4/4/2000.</li>
  <li>Vol 3: Có một ngày. Ngày phát hành: 24/11/2001.</li>
  <li>Vol 4: Đêm lạnh. Ngày phát hành: 19/1/2003.</li>
  <li>Vol 5: Dù ta không còn yêu. Ngày phát hành: 16/9/2003.</li>
  <li>Vol 6: Đôi chân thiên thần. Ngày phát hành: 21/7/2004.</li>
  <li>Vol 7: Khi em ra đi. Ngày phát hành: 10/10/2005.</li>
  <li>Vol 8: Anh nhớ em. Ngày phát hành: 11/8/2006.</li>
  <li>Vol 9: Đôi giày vải. Ngày phát hành: 31/10/2006.</li>
  <li>Vol 10: Chuyện hôm qua. Ngày phát hành: 2007.</li>
  <li>Vol 11: TODAY (Ngày hôm nay). Ngày phát hành: 6/8/2008.</li>
  <li>Vol 12: Con đường tình yêu. Ngày phát hành: 2009.</li>
  <li>Vol 13: Khi người yêu tôi khóc (2011)</li>
  <li>Vol 14: Mong em hạnh phúc (2013)</li>
  <li>Vol 15: Đi qua bốn mùa (2015)</li>
</ul>
');