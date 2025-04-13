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
INSERT INTO `Celebrities` (`id`, `full_name`, `occupation`, `nationality`, `birth_date`, `residence`, `biography`,
                           `awards`, `songs`)
VALUES (1, 'Bích Phương', 'Ca sĩ', 'Việt Nam', '1989-09-30', 'Thành phố Hồ Chí Minh, nước Việt Nam', '<b>Ca sĩ Bích Phương là ai?</b><br/>
Bích Phương là một ca sĩ trẻ thành danh từ chương trình "Việt Nam Idol". Năm 2008 cô tham gia chương trình Việt Nam Idol mùa đầu tiên nhưng chỉ dừng lại ở top 40. Năm 2010, cô tiếp tục nộp hồ sơ tham gia chương trình và đã đi đến top 7 của chương trình. Khi mới xuất hiện lần đầu tiên trên sân khấu Bích Phương không được đánh giá cao về nhan sắc và thậm chí cách trang điểm của cô khiến cô bị già đi so với tuổi. Năm 2011, Bích Phương đã trở thành một hiện tượng khi ca khúc "Có khi nào rời xa" của cô liên tục xuất hiện trên bảng xếp hạng âm nhạc và đã thu hút được nhiều lượt xem, lượt tải về trên các trang nhạc trực tuyến.<br/>Sau khi trở nên nổi tiếng, Bích Phương đã chăm chút tới ngoại hình hơn. Cô thay đổi phong cách ăn mặc, không còn diện những bộ đồ rườm rà như trước mà trở nên hiện đại và gợi cảm hơn rất nhiều. Nữ ca sĩ này còn nghiêm khắc trong việc giảm cân và thay đổi kiểu tóc, xây dựng hình ảnh một cô gái dịu dàng nữ tính, gần gủi với khán giả.<br/>Sau nhiều năm hoạt động trong showbiz, Bích Phương đã thu hút được lượng đông đảo người hâm mộ. Chỉ riêng trang Facebook cá nhân của cô đã thu hút tới hơn 500 nghìn lượt người theo dõi. Gần đây Bích Phương chưa có sản phẩm âm nhạc nào thật sự xuất sắc như "Có khi nào rời xa" nhưng trong tương lai Bích Phương hứa hẹn sẽ mang đến nhiều điều bất ngờ cho khán giả và người hâm mộ cô.<br/>', '<b>
Thành tích:</b><br/><ul><li>2010: Top 7 chương trình Việt Nam Idol</li><li>2013: Giải Ca sĩ triển vọng do Yan Vpop 20 Awards Bình chọn.</li><li>2013: Album "Chỉ là em giấu đi" lọt Top 3 Album được yêu thích nhất Zing Music Awards.</li><li>2013: Album "Chỉ là em giấu đi" đạt giải hạng mục "Album đứng đầu nhiều tuần nhất" Zing Music Awards</li><li>2013, lọt vào Top 20 ca sĩ được yêu thích nhất do Yan Vpop 20 Awards Bình chọn.</li><li>2014: Single "Mình yêu nhau đi" đạt Giải thưởng Ca khúc Pop của năm do Zing Music Awards.</li><li>2014: Single "Mình yêu nhau đi" đạt Giải thưởng Ca khúc được cộng đồng mạng chia sẻ nhiều nhất do Zing Music Awards Bình chọn.</li><li>2014: Lọt TOP 20 ca sĩ được yêu thích nhất do YanVpop20 Awards Bình chọn.</li><li>2014: MV "Mình yêu nhau đi" đạt Giải thưởng Music Video đứng đầu BXH nhiều tuần nhất do Zing Music Awards Bình chọn.</li></ul>',
        '<b>Ca khúc:</b><ul><li>Gửi Anh Xa Nhớ</li><li>Tết Nhẹ Nhàng</li><li>Rằng Em Mãi Ở Bên</li><li>Vâng Anh Đi Đi</li><li>Sâu Trong Em</li><li>Điều Chưa Từng Nói</li><li>Nụ Hồng Mong Manh</li><li>Mình Yêu Nhau Đi</li><li>Chỉ Là Em Giấu Đi</li><li>Có Lẽ Em (Remix)</li><li>Có Lẽ Em</li><li>Chạm Vào Mưa - Ft Nukan Trần Tùng Anh</li><li>Nơi Nào Có Em - Ft Nukan Trần Tùng Anh</li><li>Ơ Hay - Ft Nguyễn Minh Hằng</li></ul>'),
       (2, 'Cao Thái Sơn', 'Ca sĩ', 'Việt Nam', '1985-09-22', 'Thành phố Hồ Chí Minh, nước Việt Nam', '<b>Ca sĩ Cao Thái Sơn là ai?</b><br/>
Cao Thái Sơn là một nam ca sĩ nổi tiếng với dòng nhạc trẻ. Anh được công chúng yêu mến qua các bản hit như "Con đường mưa", "Điều ngọt ngào nhất", "Pha lê tím", "Sẽ có người cần anh".<br/>Cao Thái Sơn bắt đầu hoạt động âm nhạc từ năm 17 tuổi, tuy nhiên, thời gian đầu anh chưa được nhiều người biết đến. Sau khi tham gia vào cuộc thi Sao Mai điểm hẹn thì Cao Thái Sơn mới được khán giả biết đến và quan tâm nhiều hơn. Anh không đi theo hướng đào tạo của truyền hình mà về đầu quân cho công ty HT. Production của ông bầu Hoàng Tuấn, với bản hợp đồng 5 năm. Tuy nhiên, đến năm 2006, nam ca sĩ sinh năm 1985 này bất ngờ châm dứt hợp đồng với công ty của ông bầu Hoàng Tuấn để tách ra hoạt động riêng. Từ sau khi tách khỏi HT. Production, Cao Thái Sơn bắt đầu cho ra mắt nhiều sản phẩm âm nhạc mới, các album như "Không thể quên", "Cool boy", "Phút cuối"... và đặc biệt là ca khúc "Con đường mưa", một ca khúc đã trở thành bản hit làm mưa làm gió trên bảng xếp hạng âm nhạc và trên các trang nhạc điện tử. Tại Chương trình Làn Sóng Xanh năm 2009, Cao Thái Sơn đã nhận được giải thưởng Top 10 ca sĩ được yêu thích nhất, với ca khúc Pha lê tím, Con đường mưa...<br/>Chiều ngày 31/03/2017, Cao Thái Sơn bất ngờ đăng tải hình ảnh chuẩn bị cho lễ cưới của mình được tổ chức tại Australia lên trang cá nhân của mình. Nhiều bạn bè, đồng nghiệp và người hâm mộ sau khi biết tin đã gửi lời chúc mừng đến anh. Trước đó, Cao Thái Sơn chưa từng tiết lộ thông tin về bạn gái, chính vì vậy, có nhiều người cho rằng đây chỉ là trò đùa của nam ca sĩ trong ngày Cá tháng 4. Tuy nhiên, người đại diện của Cao Thái Sơn cho biết, hai gia đình muốn tổ chức tiệc cưới chỉ dành riêng cho anh em bạn bè thân thiết nên mới giữ kín chuyện tình cảm. Một người bạn thân của Cao Thái Sơn cho biết, nam ca sĩ "Con đường mưa" đang rất bận rộn với công việc tổ chức hôn lễ trên bờ biển ở risbane, Queensland của Australia. Được biết, lễ cưới của Cao Thái Sơn sẽ được tổ chức vào ngày 01/4, và cô dâu là một người không làm trong lĩnh vực giải trí mà hoạt động trong lĩnh vực kinh doanh.<br/>',
        '<b>Các giải thưởng của anh:</b><br/><ul><li>Làn Sóng Xanh</li><li>Album Vàng</li><li>Zing Music Awards</li></ul>', '<b>
Các album của Cao Thái Sơn:</b><br/><ul><li>Mình Sẽ Hạnh Phúc Giống Người Ta</li><li>Anh Vẫn Yêu Em Như Ngày Đầu Tiên</li><li>Người Thứ Ba</li><li>Rẽ Lối</li><li>Yêu Một Người Mộng Mơ</li><li>Dancefloor</li><li>Yêu Em Là Định Mệnh</li><li>Tôi Nghe Tổ Quốc Gọi Tên Minh</li><li>Quan Thế Âm Bồ Tát</li><li>Như Hai Người Dưng</li><li>Sẽ Có Người Cần Anh</li><li>Anh Sợ</li><li>Chào Xuân</li><li>Điều Ngọt Ngào Nhất</li><li>Nắng Sân Trường</li><li>Khoảng Cách... anh và...</li><li>Ngày Nào Có Nhau</li><li>Anh Sai Rồi</li><li>Gió Lạnh</li><li>Lệ Đá</li></ul>'),
       (3, 'Cẩm Ly', 'Ca sĩ', 'Việt Nam', '1970-03-30', 'Thành phố Hồ Chí Minh, nước Việt Nam', '<b>Ca sĩ Cẩm Ly là ai?</b><br/>
Cẩm Ly tên đầy đủ là Trần Cẩm Ly, là một trong những ngôi sao ca nhạc của làng âm nhạc Việt Nam. Cô còn là một nhân vật truyền hình được công chúng yêu mến qua vai trò huấn luyện viên của các chương trình âm nhạc như "Giọng hát việt nhí", "Thần tượng Bolero". Cẩm Ly là một trong những ca sĩ có lương fan khủng nhất trong giới ca sĩ, cô còn được người hâm mộ gọi với cái tên dễ mến "Chị Tư".<br/>Cẩm Ly bắt đầu đi hát từ năm 1993. Cô và em gái <a href="/nghe-nghiep/ca-si/minh-tuyet/fj">Minh Tuyết</a> cùng tham gia chương trình ca hát do nhà hát Hòa Bình tổ chức và đã giành được giải nhất song ca. Cô bắt đầu lập nghiệp từ hãng Kim Lợi Studio, một phòng thu nổi tiếng lúc bấy giờ. Năm 1998, Cẩm Ly cho ra mắt album âm nhạc cộng tác với ca sĩ Cảnh Hàn, 1 năm sau cô cộng tác với nam ca sĩ <a href="/nghe-nghiep/ca-si/dan-truong/a4">Đan Trường</a> trong album "Nếu phôi pha ngày mai". Từ năm 2000, Cẩm Ly bắt đầu sự nghiệp ca hát solo, cô cho ra mắt album đầu tay mang tên "Mãi không phai". Sau đó, cô ghi dấu ấn trong lòng khán giả với các ca khúc như: "Thương nhớ người dưng", "Mây chiều", "Tình không đổi thay", "Quên cây cầu dừa", "Nỗi buồn chim sáo", "Người về cuối phố", "Phượng buồn", "Chạnh lòng", "Nhớ mẹ lý mồ côi", "Mưa chiều miền Trung", "Bờ bến lạ".... Có thể nói, Cẩm Ly là ca sĩ thành công nhất của hãng thu âm Kim Lợi studio. Năm 2003 và 2004, Cẩm Ly tổ chức liveshow miễn phí mang tên "Vòng quanh ký túc xá" để phục vụ cho sinh viên Việt Nam. Năm 2008, Cẩm Ly thực hiện Liveshow kỷ niệm 15 năm ca hát của cô tại Sân Khấu Lan Anh. Năm sau đó, cô tiếp tục thực hiện 1 liveshow nữa mang tên "Tự tình quê hương" và cho phát hành hai album là "Biển tình" và "Em không thể quên - Tình khúc Minh Vy". Năm 2011, Cẩm Ly tổ chức liveshow thứ 3 mang tên "Tự tình quê hương 2", bao gồm 4 phong cách chủ yếu là nhạc trẻ, dân ca, trữ tình và cải lương tuồng cổ. Năm 2012, Cẩm Ly thực hiện liveshow tiếp theo mang tên "Tự tình quê hương 3". Liveshow "Tự tình quê hương 4" được tổ chức tại Nhà hát Hòa Bình, <a href="/tinh-tp/ho-chi-minh-viet-nam">Tp. Hồ Chí Minh</a>, là liveshow kỷ niệm 20 năm ca hát của ca sĩ Cẩm Ly và em gái<a href="/nghe-nghiep/ca-si/minh-tuyet/fj"> Minh Tuyết</a>. Trong năm 2015, Cẩm Ly tổ chức liveshow "Tự tình quê hương 5" tại Nhà hát Hòa Bình.<br/>Cẩm Ly còn là một nhân vật truyền hình được nhiều khán giả yêu mến. Năm 2014, cô được mời làm ban giám khảo của chương trình "Giọng hát Việt Nhí" mùa thứ 2. Với sự chỉ dạy nhiệt tình của Cẩm Ly, thí sinh <a href="/nghe-nghiep/ca-si/thien-nhan/acn">Thiện Nhân</a> đã trở thành Quán Quân của Giọng hát Việt nhí mùa thứ 2. Cẩm Ly và ông xã Minh Vy cùng tham gia chương trình "Vợ chồng mình hát" với vai trò Huấn Luyện viên và cũng đã đưa thí sinh của team mình giành chiến thắng. Năm 2016, Cẩm Ly xuất hiện trong chương trình "Thần tượng Bolero" với vai trò Huấn Luyện Viên". Thí sinh <a href="/nghe-nghiep/ca-si/cao-cong-nghia/zx">Cao Công Nghĩa</a> của team Cẩm Ly đã về vị trí thứ hai sau thí sinh <a href="/nghe-nghiep/ca-si/trung-quang-bolero/zv">Trung Quang</a> của team huấn luyện viên <a href="/nghe-nghiep/ca-si/dan-truong/a4">Đan Trường</a>.<br/>',
        '<b>Giải thưởng:</b><br/><ul><li>2001-2002: Top ten Làn Sóng Xanh</li><li>2001-2002: Ca sĩ được yêu thích của báo Mực Tím</li><li>2001-2002: Ca sĩ được yêu thích của CLB Chiều Thứ 5</li><li>2002: Giải Mai Vàng do Báo Người Lao động tổ chức</li><li>2002-2003: Top ten ca sĩ được yêu thích nhất Làn Sóng Xanh</li><li>2003-2004: Top ten ca sĩ được yêu thích nhất Làn Sóng Xanh</li><li>2003-2004: Giải VTV - Bài Hát Tôi Yêu - "Em Chưa Biết Yêu"</li><li>2004-2005: Top ten ca sĩ được yêu thích nhất Làn Sóng Xanh</li><li>2005: Giải VTV - Bài Hát Tôi Yêu - "Tình Ngỡ Là Mơ"</li><li>2005: Giải Mai Vàng do Báo Người Lao động Tổ chức</li><li>2005-2006: Top ten ca sĩ được yêu thích nhất Làn Sóng Xanh</li><li>2006-2007: Top ten ca sĩ được yêu thích nhất Làn Sóng Xanh</li><li>1997-2007: Top 10 thành tựu Làn sóng xanh 10 năm</li><li>2007-2008: Top ten ca sĩ được yêu thích nhất Làn Sóng Xanh</li><li>2009: Giải Video Music Xuất sắc Mai Vàng 08 - Mai Vàng</li><li>2007: Nữ ca sĩ hát nhạc dân ca được yêu thích nhất tại Giải Mai Vàng</li><li>2008: Nữ ca sĩ hát nhạc dân ca được yêu thích nhất tại Giải Mai Vàng</li><li>2008: Kỷ lục Guinness Việt Nam với vở cải lương "Lan và Điệp"</li><li>2009: Nữ ca sĩ hát nhạc dân ca được yêu thích nhất tại Giải Mai Vàng</li><li>2009: Giải ca sĩ thể hiện thành công nhất Album Vàng tháng 12</li><li>2009: Nữ nghệ sĩ thể hiện thành công nhất 2009 "Album Gió lên"</li><li>2009: Nữ ca sĩ được yêu thích nhất 2009 "Album Em không thể quên"</li><li>2009: Ca sĩ của năm "Giải thưởng Âm nhạc Cống hiến 2009"</li><li>2009: Giải Nữ Nghệ sĩ xuất sắc nhất - Dấu Ấn Mai Vàng 15 năm</li><li>2010: Nữ ca sĩ hát nhạc dân ca được yêu thích nhất tại Giải Mai Vàng</li><li>2011-2012: Top ten ca sĩ được yêu thích nhất Làn Sóng Xanh</li><li>2011: Giải nữ ca sĩ được yêu thích nhất HTV Awards</li><li>2014: Top 5 ca sĩ xuất sắc nhất - Bảng GOLD Làn sóng Xanh</li><li>2014: Ca khúc Hát cho người tình nhớ thu tác quyền âm nhạc nhiều nhất do Nhaccuatui. com bình chon</li><li>2015: Bằng khen của Tổng Liên đoàn lao động Việt Nam</li><li>2015: Ca sĩ có Video ca nhạc xem nhiều nhất - POP Awards 2015.</li><li>2015: Top 5 ca sĩ xuất sắc nhất - Bảng GOLD Làn sóng Xanh</li></ul>',
        '<b>Album:</b><br/><ul><li>Hai Lối Mộng</li><li>Người Tình Quê - Ft Quốc Đại</li><li>Nhớ Nhau Hoài (Tuyệt Phẩm Trữ Tình) - Ft Quốc Đại</li><li>Trở Lại Phố Cũ</li><li>Sầu Đâu Quê Ngoại</li><li>Cô Bé Kính Cận - Ft Lam Trường</li><li>Thương Nhớ Người Dưng - Ft Lam Trường</li><li>Tình Ca Lam Phương</li><li>Không Bao Giờ Quên Anh</li><li>Tự Tình Quê Hương 2</li><li>Chiều Cuối Tuần - Thiên Đàng Ái Ân</li><li>Cô Tư Bến Phà - Tôi Mơ</li><li>Đêm Nhớ - Nếu Anh Quên Tất Cả CD2 - Ft Nguyễn Phi Hùng</li><li>Đêm Nhớ - Nếu Anh Quên Tất Cả CD1 - Ft Nguyễn Phi Hùn</li><li>Nửa Trái Tim</li><li>Mưa Tình Yêu - Ft Cảnh Hàn</li><li>Khi Người Yêu Tôi Khóc - Ft Cảnh Hàn</li><li>Em Quên Mùa Đông - Ft Đan Trường, <a href="/nghe-nghiep/ca-si/lam-truong/el">Lam Trường</a></li><li>Em Là Hạnh Phúc Đời Anh - Ft Đan Trường</li><li>Những Tình Khúc Nguyễn Nhất Huy</li><li>Tình Cuối Mùa Đông (Top Hits)</li><li>Trái Tim Màu Vàng - Ft Vân Quang Long</li><li>Kẻ Đứng Sau Tình Yêu</li><li>Bến Vắng - Biết Yêu Khi Nào</li><li>Buồn Con Sáu Sậu</li><li>Người Nhớ Không Người - Em Sẽ Là Người Ra Đi</li><li>Người Ơi Hãy Chia Tay</li><li>Khi Đã Yêu</li><li>Mùa Mưa Đi Qua</li><li>Tuổi Mộng Xứ Đông – 12 Bến Nước</li><li>Em Không Thể Quên</li><li>Sáo Sang Sông - Mùa Đông Xứ Lạ</li><li>Em Sẽ Quên... Đêm Có Mưa Rơi</li><li>Nhớ Người Yêu - Ft Quốc Đại</li><li>Cô Gái Mở Đường - Ft Quốc Đại</li><li>Noel Một Mình - Anh Về Miền Tây - Ft Quốc Đại</li><li>Ngọn Trúc Đào - Ft Quốc Đại</li></ul>'),
       (4, 'Chi Dân', 'Ca sĩ', 'Việt Nam', '1989-06-02', 'Thành phố Hồ Chí Minh, nước Việt Nam', '<b>Ca sĩ Chi Dân là ai?</b><br/>
<div>TIN MỚI: Ngày 14/11/2024, Công an TP HCM khởi tố, bắt tạm giam ca sĩ Chi Dân để điều tra về hành vi tổ chức sử dụng trái phép chất ma túy.</div><a href="/nghe-nghiep/chuyen-gia-trang-diem/nguyen-trung-hieu/bfcw">Nguyễn Trung Hiếu</a> được biết đến nhiều hơn qua nghệ danh Chi Dân, là một nam ca sĩ trẻ nổi tiếng người <a href="/nghe-nghiep/doi-tuyen-bong-da-quoc-gia/viet-nam/bi96">Việt Nam</a>. Anh hiện là ca sĩ được nhiều người quan tâm nhất tại Việt Nam. Chi Dân từng là thành viên của nhóm nhạc Hero tuy nhiên thời điểm này tên tuổi của anh chưa được nhiều người biết tới. Cho tới khi Chi Dân xuất hiện trong chương trình "Việt Nam Idol" với ca khúc "Mất trí nhớ" thì chàng ca sĩ này mới được công chúng chú ý đến nhiều hơn. Không chỉ ca hát, Chi Dân còn tập sáng tác. Anh chính là tác giả của bản hit "Anh muốn em sống sao", của ca sĩ <a href="/nghe-nghiep/ca-si/bao-anh/o">Bảo Anh</a>, một ca khúc giúp Bảo Anh trở nên nổi tiếng hơn rất nhiều. Chi Dân cũng từng chia sẻ về việc ca sĩ Như Loan, một ca sĩ hải ngoại đã liên hệ với anh đề xin được hát ca khúc này trước. Ngoài ra ca sĩ <a href="/nghe-nghiep/ca-si/nhu-loan/bawy">Như Loan</a> cũng cho anh biết việc ca sĩ <a href="/nghe-nghiep/ca-si/minh-tuyet/fj">Minh Tuyế</a>t cũng rất thích ca khúc của anh và cũng muốn liên hệ với anh để được hát ca khúc này. Và đúng là người quản lý của nữ ca sĩ Minh Tuyết đã liên hệ với Chi Dân để mua lại ca khúc "Anh muốn em sống sao". Điều này cho thấy, sáng tác hit của Chi Dân rất được nhiều người yêu thích và ủng hộ.<br/>Tháng 11 năm 2016, Chi Dân cho ra mắt ca khúc "Điều anh biết", ca khúc này nhanh chóng trở thành một ca khúc hit được rất nhiều khán giả trẻ yêu thích. Chỉ sau 1 tuần ra mắt, MV ca khúc "Điều anh biết" đã thu hút hơn 5 triệu lượt xem trên Youtube và sau hơn 1 tháng MV này đã đạt hơn 34 triệu lượt xem.<div><b>Các Album của Chi Dân:</b><br/><ul><li>Mất Trí Nhớ</li><li>Giả Vờ Nhưng Anh Yêu Em</li><li>Anh Không Sao Đâu (Remix)</li><li>Vẫn Là Em</li></ul></div>',
        '',
        '<b>Các Album của Chi Dân:</b><br/><ul><li>Mất Trí Nhớ</li><li>Giả Vờ Nhưng Anh Yêu Em</li><li>Anh Không Sao Đâu (Remix)</li><li>Vẫn Là Em</li></ul>'),
       (5, 'Erik', 'Ca sĩ', 'Việt Nam', '1997-10-13', 'Thành phố Hồ Chí Minh, nước Việt Nam', '<b>Ca sĩ Erik là ai?</b><br/>
Erik được biết đến là ca sĩ tài năng. Ngoài ca hát, anh còn có thể nhảy và sáng tác nhạc. Erik là cựu thành viên (giọng hát chính) của nhóm nhạc Monstar. Sản phẩm âm nhạc đầu tay "Sau tất cả" của Erik được công chúng đón nhận nhiệt tình. Đây là một bản ballad nhẹ nhàng, dễ chạm vào trái tim người nghe từ giai điệu đến ca từ. Ngày 13/01. 2016, MV "Sau tất cả" được phát hành trên kênh Youtube của St. 319 Entertainment. Ca khúc "Sau tất cả" ngay lập tức gây sốt, đứng đầu trong các bảng xếp hạng âm nhạc. "Sau tất cả" cũng trở thành câu nói kinh điển trên mạng xã hội năm 2016. Trên các phương tiện truyền thông lớn, "Sau tất cả" còn được coi là "ca khúc quốc dân".<br/>Erik được khán giả yêu mến đặt biệt danh "Hoàng tử nhạc phim" khi liên tiếp thành công với những bản nhạc trong phim. Đáng chú ý là:<br/><ul><li>Tôi là ai trong em (OST Taxi em tên gì)</li><li>Yêu và yêu (OST Bệnh viện ma)</li><li>Lạc nhau có phải muôn đời (OST Chờ em đến ngày mai)</li></ul>Tháng 2 năm 2017, Erik và ST. 319 Entertainment nảy sinh mâu thuẫn sâu sắc trong vấn đề hợp đồng lao động giữa công ty quản lý và ca sĩ. Scandal này tốn rất nhiều giấy mực của báo chí. Phía công ty quản lý cho rằng: Erik vi phạm đạo đức, , thiếu trách nhiệm, tự ý nhận show riêng khi chưa chấm dứt hợp đồng. Erik tố công ty quản lý không minh bạch về hợp đồng, nhiều lần miệt thị, xúc phạm nhân phẩm anh. Căng thẳng không thể giải quyết, hai bên phải nhờ đến pháp luât can thiệp.<br/>Ba tháng sau Scandal, Erik hoạt động với tư cách ca sĩ tự do, ra mắt MV "Ghen" hợp tác cùng <a href="/nghe-nghiep/ca-si/min/ou">ca sĩ Min</a>. "Ghen" là sáng tác của<a href="/nghe-nghiep/nhac-si/khac-hung/ba0y"> nhạc sĩ Khắc Hưng</a> (nhạc sĩ cùng ST. 319 cho ra đời ca khúc làm nên tên tuổi của Erik). Có thể nói, "Ghen" là cú lột xác của Erik cả về âm nhạc lẫn hình ảnh.<div>TIN MỚI:</div><div>Vừa qua, những ngày đầu tháng 9/2021, trên mạng xã hội lan truyền hình ảnh một nam ca sĩ được cho là lén lút đi thu âm bất chấp lệnh giãn cách cùng quy định phòng dịch nghiêm ngặt tại <a href="/tinh-tp/ho-chi-minh-viet-nam">thành phố Hồ Chí Minh</a>. Sau khi bị netizen liên tục "réo tên" trong sự việc trên, chiều 2/9 nam ca sĩ Erik đã chính thức lên tiếng xin lỗi và thừa nhận có đi thu âm trên fanpage cá nhân của mình. Cùng với đó, Erik cũng công khai thư mời ghi hình từ phía công ty giải trí. Cho dù đã lên tiếng nhận lỗi nhưng netizen vẫn tỏ ra chưa hài lòng khi cho rằng Erik đang cố "lươn lẹo" trong bài đăng của mình.</div>',
        '', '<b>
Ca khúc:</b><br/><ul><li>Sau tất cả</li><li>Lạc nhau có phải muôn đời</li><li>Yêu và yêu</li><li>Chạm đáy nỗi đau</li><li>Mình chia tay đi</li><li>Có tất cả nhưng thiếu anh</li><li>Em không sai, chúng ta sai</li><li>Anh luôn là lý do</li><li>Yêu đương khó quá thì chạy về khóc với anh</li><li>Đau nhất là lặng im</li><li>Người lại trong danh bạ</li><li>Cho dù tận thế</li></ul>'),
       (6, 'Hari Won', 'Ca sĩ', 'Hàn Quốc', '1985-06-22', 'Thành phố Hồ Chí Minh, nước Việt Nam', '<b>Ca sĩ Hari Won là ai?</b><br/>
Hari Won có tên thật Lưu Esther. Cô là một nữ ca sĩ, diễn viên và người dẫn chương trình người <a href="/nghe-nghiep/doi-tuyen-bong-da-quoc-gia/han-quoc/bi01">Hàn Quốc</a> gốc Việt.<br/>Trước khi đến <a href="/nghe-nghiep/doi-tuyen-bong-da-quoc-gia/viet-nam/bi96">Việt Nam</a> hoạt động nghệ thuật, Hari Won từng là thành viên của nhóm nhạc nữ Hàn Quốc Kiss, được thành lập vào năm 2012. Đến năm 2013, cô bắt đầu xuất hiện trên sóng truyền hình Việt Nam khi tham gia chương trình truyền hình thực tế "Cuộc đua kỳ thú", cùng bạn trai là <a href="/nghe-nghiep/ca-si/dinh-tien-dat/0x">nam ca sĩ Đinh Tiến Đạt</a>. Sau đó, Hari Won bắt đầu được mời tham gia nhiều show truyền hình, được khán giả Việt Nam biết đến nhiều hơn. Cô nàng 8X này cũng đã phát hành các đĩa đơn ca nhạc như "Hoa tuyết", "Hương đêm bay xa"... Cô có thể hát được cả ba thứ tiếng là Tiếng Hàn, tiếng Việt và tiếng Anh. Hari Won còn lấn sân sang lĩnh vực diễn xuất. Cô tham gia bộ phim "Chàng trai năm ấy" cùng nam<a href="/nghe-nghiep/ca-si/son-tung/k8"> ca sĩ Sơn Tùng</a>, "Bệnh viện ma" cùng <a href="/nghe-nghiep/mc/tran-thanh/p">Trấn Thành</a>, 49 ngày, Trùm cỏ... <br/>Năm 2016, Hari Won đặc biệt thành công trong lĩnh vực ca hát khi đĩa đơn "Anh cứ đi đi" của cô đã trở thành bản hit đình đám của làng nhạc Việt. Ca khúc này cũng đã mang đến cho cô nhiều đề giải thưởng như: <a href="/nghe-nghiep/giai-thuong/giai-lan-song-xanh/bivb">Giải Làn Sóng Xanh</a> cho "Bài hát hiện tượng" và cho hạng mục "Đĩa đơn của năm". Cũng từ năm 2016, Hari Won xuất hiện nhiều trên truyền hình, với vai trò MC và Giám khảo của nhiều chương trình truyền hình. Cô làm giám khảo của "Biến hóa hoàn hảo" cùng MC Trấn Thành, <a href="/nghe-nghiep/nghe-si-hai/chi-tai/0">nghệ sĩ Chí Tài</a>, mới đây nhất là giám khảo khách mời của cuộc thi "Be a Star- Bạn là ngôi sao". Người đẹp này là người dẫn chương trình của nhiều chương trình truyền hình như: Bí mật đêm chủ nhật, Siêu bất ngờ, Chung sức 2015...<br/>Là một nghệ sĩ nước ngoài thành công tại Việt Nam, Hari Won đã tạo cho mình một chỗ đứng vững chắc trong làng giải trí Việt. Tuy nhiên, nữ ca sĩ này cũng khá nổi tiếng về đời sống riêng tư. Đầu tiên là mối tình 9 năm với nam ca sĩ Đinh Tiến Đạt. Mối quan hệ của cô và Đinh Tiến Đạt được người hâm mộ Việt Nam rất ủng hộ và thậm chí có người cho rằng, nhờ có Đinh Tiến Đạt mà Hari Won mới được công chúng Việt Nam biết tới. Tuy nhiên, sau khi chia tay với Đinh Tiến Đạt không lâu thì nữ ca sĩ này dính tin đồn hẹn hò với <a href="/nghe-nghiep/mc/tran-thanh/p">MC Trấn Thành</a>. Tháng 12 năm 2016, cặp đôi này đã tổ chức lễ cưới sau 1 năm công khai hẹn hò. Sau khi Hari và Trấn Thành công khai hẹn hò, nữ ca sĩ này cũng xuất hiện nhiều hơn trên sóng truyền hình. Chính vì thế, có nhiều người cho rằng cô đang "dựa hơi" bạn trai của mình. Và khi cả hai công bố sẽ kết hôn, cũng có không ít người cho rằng đây chỉ là một đám cưới "nghệ thuật". Nhưng cuộc sống hạnh phúc hiện tại của cặp đôi này lại khiến không ít người phải ngưỡng mộ, thậm chí ghen tỵ.<br/>',
        '', '<b>
Các bài hát của cô bằng tiếng Việt:<br/></b>
- Hương đêm bay xa<br/>
- Hoa Tuyết - Snow Flower<br/>
- Bụi phấn<br/>
- Bài ca thịt nướng<br/>
- Aloha<br/>
- Mùa xuân trở về<br/>
- Honey Honey<br/>
- Love you hate you<br/>
- Lovely active sexy<br/>
- Lời tỏ tình<br/>
- Cảm ơn cha<br/>
- Con gái có quyền điệu'),
       (7, 'Hà Anh Tuấn', 'Ca sĩ', 'Việt Nam', '1984-02-17', 'Thành phố Hồ Chí Minh, nước Việt Nam', '<b>Ca sĩ Hà Anh Tuấn là ai?</b><br/>
- Hà Anh Tuấn là một nam ca sĩ nhạc R& B người Việt Nam. Anh bắt đầu nổi tiếng và được đông đảo khán giả biết đến và yêu mến từ khi lọt vào top 3 cuộc thi Sao Mai điểm hẹn năm 2006.<br/>- Sau khi thành công với "Sao Mai điểm hẹn", anh quyết định chuyển hẳn sang con đường ca hát chuyên nghiệp, khới đầu bằng việc anh bắt đầu tìm thầy học luyện thanh, học nhạc lí và đi gõ cửa các nhà sản xuất âm nhạc chuyên nghiệp.<br/>',
        '<b>Các giải thưởng của anh:</b><br/><ul><li> Năm 2001 và 2002, anh giành giải Nhất dành cho giọng Nam cuộc thi học sinh sinh viên "Chú Ve Con" </li><li> Năm 2002, anh giành giải Nhất đơn ca liên hoan Tiếng Hát Học Sinh Sinh viên toàn Thành.</li><li> Năm 2006, anh giành giải ca sĩ triển vọng Sao mai Điểm Hẹn.</li><li> Năm 2006, anh giành giải Best New Artist do YeuAmNhac bình chọn </li><li> Năm 2006, anh giành giải ca sĩ được yêu thích nhất trong chương trình Bài Hát Việt.</li><li> Năm 2010, giành đề cử "Album của năm" tại Giải Cống Hiến </li><li> Năm 2009, giành giải "Album được yêu thích nhất" do thính giả của bảng xếp hạng Làn Sóng Xanh</li><li>Anh từng giành Giải "Album nghệ thuật xuất sắc nhất của năm" tại năm thứ 3 của giải "Album Vàng"</li><li>Năm 2008, anh giành giải đề cử "Nam ca sĩ của năm" tại Giải Cống Hiến </li><li>Năm 2009, 2010, 2011 anh được đề cử là "Ca sĩ của năm" tại Giải Cống Hiến </li></ul>', '<b>
Các album của Hà Anh Tuấn:</b><br/><ul><li>Ngày hát đôi (với <a href="/nghe-nghiep/nha-thiet-ke-thoi-trang/phuong-linh/bduw">Phương Linh</a>; 2007)</li><li>Café sáng (2007)</li><li>Saigon Radio (2008)</li><li>Acous''84 (2010)</li><li>Cock-tail (2010)</li><li>Anh yêu em (tháng 12 năm 2011) (với Phương Linh; 2011)</li><li>Đĩa đơn kỹ thuật số "Mơ tóc" (2010)</li><li>Đĩa đơn kỹ thuật số "Gióng" (2012)</li><li>"Sống trọn từng giây" (đĩa đơn) (với 365daBand, <a href="/nghe-nghiep/ca-si/kimmese/1i">Kimmese</a>, <a href="/nghe-nghiep/ca-si/kasim-hoang-vu/ds">Kasim Hoàng Vũ</a>) (2013)</li><li>Lava (2015)</li></ul>'),
       (8, 'Hiền Thục', 'Ca sĩ', 'Việt Nam', '1981-05-13', 'Thành phố Hồ Chí Minh, nước Việt Nam', '<b>Ca sĩ Hiền Thục là ai?</b><br/>
- Hiền Thục tên đầy đủ là Nguyễn Thị Hiền Thục. Cô là một nữ ca sĩ nhạc nhẹ Việt Nam đương đại được nhiều khán giả biết đến và yêu mên.<br/>- Hiền Thục cũng là gương mặt hiếm hoi bứt phá thành công khỏi hình ảnh ca sĩ thiếu nhi và có một sự nghiệp hoạt động nghệ thuật bền bỉ. <br/>- Cô có phong cách đa dạng, thiên về nhạc trẻ, nổi tiếng với những bài hát mang âm hưởng nhẹ nhàng, trữ tình.<br/>',
        '<b>Các giải thưởng của cô:</b><br/><ul><li>Năm 1990-1991-1992: Giải I đơn ca toàn quốc.</li><li>Năm 1993: Cô đoạt huy chương Vàng giọng hát hay Học sinh - Sinh viên toàn quốc.</li><li>Năm 1995: Cô đoạt huy chương Bạc giọng hát chuyên nghiệp toàn quốc.</li><li>Năm 1997: Cô đoạt huy chương Vàng giọng hát hay Học sinh - Sinh viên toàn quốc.</li><li>Năm 1999: Cô đoạt cúp vàng ca sĩ trẻ châu Á. Giải đặc biệt Tối giai hình tượng ca sĩ châu Á.</li><li>Năm 2005: Cô giành giải Làn sóng xanh cho ca sĩ thể hiện hit thành công với bài "Dẫu có lỗi lầm"</li><li>Năm 2007: Cô giành giải Album Vàng của năm cho album "Mộc"</li><li>Năm 2009: Cô giành giải Album Vàng tháng 7 cho "Chân dung 17", Giải thưởng thiết kế mỹ thuật đẹp nhất Album Vàng 2009.</li><li>Năm 2010: Album của cô được yêu thích nhất cho "Taurus" giải Làn Sóng Xanh.</li><li>Năm 2012: Cô giành giải Bài hát yêu thích tháng 7 cho ca khúc Nhật ký của mẹ.</li><li>Năm 2010-2011-2012-2013: Cô lọt top 10 ca sĩ giải Làn Sóng Xanh.</li></ul>', '<b>
Các album của Hiền Thục:</b><br/><ul><li>Email Tình yêu (2000)</li><li>Bộ Album Ngũ Hành:</li><li>Vol 2. VCD Kim (2004)</li><li>Vol 3. Bảo (mạng Thủy) (2005)</li><li>Vol 4. Q (mạng Thổ) (2005)</li><li>Vol 5. Hỏa - Tiếng hát thiên thần (tuyển tập các ca khúc thiếu nhi ngoại quốc)</li><li>Vol 6. Mộc (2006)</li><li>Vol 7. Sunflower (2007)</li><li>Vol 8. Diamond (2007)</li><li>Vol 9. Album nhạc Trịnh Portrait 17 (2009)</li><li>Vol 10. Taurus (Kim Ngưu) (2010)</li><li>Vol 11. Album nhạc Trịnh Thiên sứ (2011)</li><li>Vol 12. Free 3: 15 pm (2012)</li><li>Vol 13. Tằm tháng năm (2013)</li></ul>'),
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
        '<ul>\n    <li> Cô bé ngày xưa</li>\n    <li> Quay về</li>\n    <li> Làm cha</li>\n    <li> Có khi</li>\n    <li> Về đâu mái tóc người thương</li>\n  </ul>')
        ,

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

(24,'Thiều Bảo Trâm','Ca sĩ','Việt Nam','1994-09-09','Thành phố Hồ Chí Minh, nước Việt Nam','<b>Ca sĩ Thiều Bảo Trâm là ai?</b><br/>\r\nThiều Bảo Trâm là gương mặt triển vọng từ các cuộc thi lớn trên truyền hình như: Giọng hát Việt, Ngôi nhà âm nhạc hay Tiếng ca học đường. Cô đoạt khá nhiều giải thưởng lớn trong các cuộc thi ca hát lớn dành cho học sinh, sinh viên như: Tiếng hát sinh viên toàn quốc, Tiếng hát truyền hình toàn quốc, Tiếng ca học đường, Ngôi nhà âm nhạc …<br/>\r\n- Cô cũng thường xuyên có mặt trong nhiều đề cứ giải thưởng lớn như: Làn Sóng Xanh, Mai Vàng, ZingMuSic Award.<br/>','<b>\r\nCác giải thưởng của cô:</b><br/><ul><li> Giải 4 Ngôi nhà âm nhạc 2012</li><li> Giải 4 tiếng ca học đường 2011</li></ul>','<b>Các ca khúc thành công của cô:</b><br/><ul><li> Xuân Đến Muôn Nhà - <a href=\"/nghe-nghiep/ca-si/thieu-bao-trang/adq\">Thiều Bảo Trang</a>, Thiều Bảo Trâm</li></ul>')
,
(25,'Thùy Chi','Ca sĩ','Việt Nam','1990-05-04','Thành phố Hồ Chí Minh, nước Việt Nam','<b>Ca sĩ Thùy Chi là ai?</b><br/>\r\nThùy Chi tên thật là Trần Thùy Chi. Cô được biết là một nữ ca sĩ trẻ Việt Nam. Với chất giọng khá đặc biệt của mình cao vút, ngọt ngào, trong sáng, Thùy Chi đã chiếm chọn được cảm tình của khán giả qua các ca khúc \"Giấc mơ trưa\", \"Mưa\", \"Thành thị\", \"Phố cổ\"...<br/>Cái tên Thùy Chi được cộng đồng mạng chú ý đến từ năm 2005, khi cô đăng tải ca khúc \"Giấc mơ trưa\" lên mạng. Trước đó, Thùy Chi và người bạn học của mình là <a href=\"/nghe-nghiep/ca-si-cheo/minh-phuong/f4\">Minh Phương</a> đã tham gia cuộc thi Tuổi đời mênh mông của đài truyền hình VTV3 và đã giành được giải nhất. Thùy Chi và Minh Phương lập nên nhóm nhạc TSD Band, và ban nhạc này đã giành giải đặc biệt trong cuộc thi Ban nhạc học sinh sv toàn quốc vào năm 2005. Với ca khúc \"Giấc mơ trưa\", một sáng tác của <a href=\"/nghe-nghiep/nhac-si/giang-son/baio\">nhạc sĩ Giáng Son</a>, Thùy Chi đã nhận được nhiều lời khen, đánh giá tích cực từ phía khán giả. Đạt thành công sau khi chia sẻ lên mạng, ca khúc \"Giấc mơ trưa\" của Thùy Chi được chọn biểu diễn trong chương trình Bài Hát Việt năm 2005. <br/><p>Năm 2008, nữ ca sĩ \"Giấc mơ trưa\" đã nhận được giải thưởng \"Ca sĩ được yêu thích nhất của tháng\" tại Lễ trao giải Bài hát Việt. Năm 2009, cô nhận giải thưởng Top 10 ca sĩ được yêu thích nhất năm tại Làn Sóng Xanh. Năm 2010, Thùy Chi với sự hỗ trợ của Đoàn hợp xướng Việt Nam đã giành Huy chương bạc tại Hợp Xướng Thế Giới, đến năm 2011 thì Thùy Chi đã giành được Huy Chương Vàng. Trong liveshow Bài hát Việt tháng 12/ 2013, ca khúc \"Phố trong mưa\", một sáng tác của nhạc sĩ Nguyễn Anh Vũ do Thùy Chi thể hiện đã đoạt giải \"Bài hát của tháng\". Trong đêm liveshow Bài hát yêu thích tháng 12/2015, cô tiếp tiếp tục nhận được giải thưởng \"Bài hát của tháng\" nhờ ca khúc \"Giữ em đi\", một sáng tác của ca <a href=\"/nghe-nghiep/nhac-si/tien-tien/mj\">nhạc sĩ trẻ Tiên Tiên</a>.</p><p>Năm 2016, Thùy Chi bắt đầu thay đổi phong cách, từ một cô gái mặt mộc đơn giản, giờ đây Thùy Chi đã trở nên xinh đẹp và quyến rũ hơn rất nhiều. Đặc biệt, ngày 01/10/2016, sau khi nữ ca sĩ này đăng tải một bức ảnh lên trang Fanpage của mình đã nhanh chóng thu hút hơn 22 nghìn lượt like. Trong đó có nhiều người nhận xét rằng cô đang càng ngày càng đẹp hơn so với trước đây.</p><p><b>Các album của cô:</b></p><ul><li> Thùy Chi nhận được giải ca sĩ được yêu thích nhất trong tháng của chương trình Bài hát Việt (2008)</li><li> Giải 1 trong 10 ca sĩ được yêu thích nhất Làn Sóng Xanh năm 2009.</li><li> Năm 2011, cô giành huy chương bạc hợp xướng thế giới.</li><li> Giành huy chương vàng hợp xướng thế giới.</li><li> Đạt giải Vàng bảng Dân gian.</li><li> Giải đặc biệt là giải Trình diễn xuất sắc nhất và giải Khán giả yêu thích.</li></ul><b>Các Album của cô:</b><br/><ul><li>Vòng Eo 56 OST</li><li>Chỉ Là Thoáng Qua</li><li>Cô Bé Mùa Đông (Single)</li><li>Anh Sẽ Tốt Mà (Single)</li><li>Ru Tình</li><li>Yêu Thương Muộn Màng</li></ul>','','<b>Các Album của cô:</b><br/><ul><li>Vòng Eo 56 OST</li><li>Chỉ Là Thoáng Qua</li><li>Cô Bé Mùa Đông (Single)</li><li>Anh Sẽ Tốt Mà (Single)</li><li>Ru Tình</li><li>Yêu Thương Muộn Màng</li></ul>'),
(26,'Trịnh Thăng Bình','Ca sĩ','Việt Nam','1988-04-30','Thành phố Hồ Chí Minh, nước Việt Nam','<b>Ca sĩ Trịnh Thăng Bình là ai?</b><br/>\r\nTrịnh Thăng Bình một nam ca sĩ trẻ nổi tiếng của showbiz Việt đang là cái tên được nhiều người quan tâm khi trở thành \"người hùng\" của nhóm nhạc nữ Hàn Quốc EXID khi giải cứu các cô gái của nhóm nhạc này khỏi vòng vây của người hâm mộ Việt Nam. Sau màn \"giải cứu\" này, Trịnh Thăng Bình đã được rapper LE của EXID theo dõi trên mạng xã hội Istagram. Trước thông tin này, các fan hâm mộ của EXID tại Việt Nam vô cùng vui mừng khi thần tượng của họ đã dành sự quan tâm đặc biệt tới Trịnh Thăng Bình. <br/>Trịnh Thăng Bình đã hoạt động trong làng âm nhạc Việt Nam từ khá lâu, anh đã cho ra mắt nhiều sản phẩm âm nhạc, trong đó ca khúc thành công nhất của anh đó chính là bản hit \"Người ấy\". Trịnh Thăng Bình đã tham gia chương trình \"Sing my song\", tuy nhiên tiết mục dự thi của anh chưa thật sự xuất sắc nên chưa được vị huấn luyện viên nào bấm chọn. Sau khi rời khỏi chương trình, anh cho biết sẽ không tham gia bất cứ một cuộc thi nào nữa và giành thời gian tập trung vào công việc. Anh cũng cho biết, mặc dù không được vị huấn luyện viên nào bấm chọn nhưng anh vẫn cảm thấy rất vui khi tham gia chương trình và được thấy tình cảm của khán giả dành cho mình, đó là điều quan trọng nhất đối với anh.<br/>','<b>Thành tích:</b><br/><ul><li>Lọt vào top 10 nhạc sĩ được yêu thích nhất được Làn Sóng Xanh trao giải.</li><li> Giành giải thưởng \"Album của năm\" được Zing MP3 trao giải trong chương trình Zing Music Awards 2013 với album \"Người Ấy\".</li><li>Giải thưởng \"Ca khúc Pop/Rock được yêu thích\" được Zing MP3 trao giải trong chương trình Zing Music Awards 2013 với các khúc \"Người Ấy\".</li><li>Lọt vào top 20 ca sĩ của năm được YANTV trao giải trong chương trình Yan VPOP20 Awards 2013.</li></ul>','<b>Các Album của anh:</b><br/><ul><li>Từ Khi Gặp Em</li><li>Sài Gòn Đêm Nay (Single)</li><li>Người Thứ 3</li><li>Người Yêu Tuyệt Vời</li><li>Lãng Tử (Single)</li><li>Người Ấy</li><li>Summer Love</li><li>Lời Chưa Nói</li><li>Trịnh Thăng Bình Vol. 1</li></ul>'),
(27,'Tuấn Hưng','Ca sĩ','Việt Nam','1978-10-05','Thành phố Hồ Chí Minh, nước Việt Nam','<b>Ca sĩ Tuấn Hưng là ai?</b><br/>\r\nTuấn Hưng tên khai sinh là Nguyễn Tuấn Hưng, là một nam ca sĩ kiêm diễn viên nổi tiếng của làng giải trí Việt Nam. Anh là một trong những nam ca sĩ thu hút được nhiều fan hâm mộ nhất trong nước. Với gương mặt điển trai, giọng hát khỏe, khàn, lạ, Tuấn Hưng từng làm khiến biết bao fan nữ phải điêu đứng. Anh từng gây bão trong làng âm nhạc với nhiều bản hit đình đám như: Tình yêu nào phải trò chơi, Tình yêu lung linh, Dĩ vãng cuộc tình, Tình là gì, Tìm lại bầu trời...<br/><p>Vào năm học lớp 11, Tuấn Hưng đã bắt đầu được nhiều người biết đến qua khả năng ca hát. Với tiết mục \"Hàn gắn thế giới\" được biểu diễn tại buổi Liên hoan văn nghệ mừng ngày Nhà giáo Việt Nam, Tuấn Hưng đã nhanh chóng tạo được dấu ấn trong lòng toàn thể giáo viên và học sinh trong trường. Cho đến khi đang theo học năm thứ 3 tại trường Đại học dân lập Thăng Long, Tuấn Hưng đã quyết định bỏ học để đi theo đam mê ca hát. Nhóm nhạc Quả Dưa Hấu chính là lựa chọn đầu tiên của Tuấn Hưng khi mới quyết định đi theo con đường ca hát chuyên nghiệp. Tuấn Hưng, <a href=\"/nghe-nghiep/ca-si/bang-kieu/n\">Bằng Kiều</a>, <a href=\"/nghe-nghiep/nhac-si/tuong-van/baxx\">Tường Văn</a> và <a href=\"/nghe-nghiep/ca-si/anh-tu/bb9f\">Anh Tú</a> của nhóm Quả Dưa Hấu đã chiếm được cảm tình của đông đảo khán thính giả trước khi nhóm tuyên bố giải thể để tách ra hát solo.</p><p>Năm 2000, Tuấn Hưng vào Sài Gòn lập nghiệp. Lần biểu diễn đầu tiên của Tuấn Hưng là tại Câu lạc bộ Bạn yêu nhạc ở Nhà hát Bến Thành vào đúng ngày sinh nhật của anh. Năm 2002, Tuấn Hưng nhận lời mời của đạo diễn <a href=\"/nghe-nghiep/dien-vien-hai/hong-van/i5\">Hồng Vân</a>, tham gia vai diễn Xuân Tóc đỏ trong vở kịch \"Số đỏ\", được biểu diễn trên Sân khấu Phú Nhuận vào ngày 11/03. Sau đó, anh cũng đã góp mặt trong nhiều bộ phim, trong đó có phim truyền hình \"Cho một tình yêu\" cùng nữ <a href=\"/nghe-nghiep/ca-si/my-tam/b\">ca sĩ Mỹ Tâm</a>, <a href=\"/nghe-nghiep/dien-vien-hai/hieu-hien/kt\">Hiếu Hiền</a>, bộ phim \"Những nụ hôn rực rỡ\" cùng nữ <a href=\"/nghe-nghiep/ca-si/minh-hang/ac\">ca sĩ Minh Hằng</a>,<a href=\"/nghe-nghiep/nguoi-mau/thanh-hang/y\"> siêu mẫu Thanh Hằng</a>.</p><p>Sau 15 năm ca hát, Tuấn Hưng đã để lại để lại dấu ấn phong cách âm nhạc của mình trong lòng khán gả. Anh đã cho ra đời rất nhiều album phòng thu, cũng đã có nhiều ca khúc liên tục lọt vào bảng xếp hạng âm nhạc uy tín trong nước. Năm 2015, Tuấn Hưng còn tham gia chương trình \"The Voice - Giọng hát Việt\", với vai trò giám khảo cùng <a href=\"/nghe-nghiep/ca-si/thu-phuong/is\">ca sĩ Thu Phương</a>, <a href=\"/nghe-nghiep/ca-si/dam-vinh-hung/a2\">Đàm Vĩnh Hưng</a>, <a href=\"/nghe-nghiep/ca-si/my-tam/b\">Mỹ Tâm</a>.</p><p>Tuấn Hưng cũng là nam ca sĩ đầu tiên của Việt Nam đã đưa ban nhạc riêng của mình ra nước ngoài biểu diễn. Mới đây, nam ca sĩ này cùng vợ và con trai đã lên đường sang Mỹ để chuẩn bị cho chuyến lưu diễn của anh tại đất nước này. Được biết, Tuấn Hưng sẽ tham gia tour diễn \"Tan\" diễn ra trong một thời gian dài, vòng quanh nước Mỹ, nên nam diễn viên đã đưa vợ và con trai đi cùng để tiện bề chăm sóc.</p><p><b>Các Album của anh:</b></p><ul><li> Nhạc... xưa (2009)</li><li> Tuấn Hưng vol. 8 (2010)</li><li> Tình yêu phôi pha (2010)</li><li> Tìm lại bầu trời (2012)</li><li> Ảo giác - Anh nhớ em (2013)</li><li> Đam mê - remixes (2014)</li><li> Tình là gì (2008)</li><li> Như giấc chiêm bao - với <a href=\"/nghe-nghiep/ca-si/le-quyen/es\">Lệ Quyên</a> (2008)</li><li> Đêm định mệnh (2007)</li><li> Dance (2007)</li><li> Vẫn nhớ 2 (2006)</li><li> Tình yêu hát (2004)</li><li> Tình yêu lung linh (2004)</li><li> Đốt chút lá khô (2003)</li><li> Vườn tình nhân - với <a href=\"/nghe-nghiep/dien-vien/ngo-thanh-van/hp\">Ngô Thanh Vân</a> (2002)</li><li> Vũ điệu thần tiên (2001)</li></ul><br/>TIN MỚI:<br/>Ngày 21/7/2020, ca sĩ Tuấn Hưng đã đột ngột chia sẻ về quyết định tạm dừng đi hát của anh một thời gian để chăm sóc gia đình. Tuấn Hưng cho biết \"Nếu không có gì thay đổi thì Hưng sẽ giải nghệ. Chắc cũng vài tháng nữa thôi... \". Với quyết định đột ngột này của mình, Tuấn Hưng đã khiến khán giả hâm mộ khá bất ngờ. Tuy nhiên, khi anh nói lí do tạm nghỉ là muốn dành thời gian nhiều hơn cho gia đình đặc biệt là cho ba con nhỏ của anh thì mọi người cũng rất ủng hộ.<br/>Khán giả hi vọng Tuấn Hưng sẽ sớm sắp xếp được công việc và quay trở lại sân khấu càng sớm càng tốt!','','<b>Các Album của anh:</b>'),
(28,'Ưng Hoàng Phúc','Ca sĩ','Việt Nam','1981-08-18','Thành phố Hồ Chí Minh, nước Việt Nam','<b>Ca sĩ Ưng Hoàng Phúc là ai?</b><br/>\r\nƯng Hoàng Phúc tên khai sinh là Nguyễn Quốc Thanh, là một nam ca sĩ nổi tiếng Việt Nam. Anh là cựu thành viên của nhóm nhạc nam 1088, một nhóm nhạc nổi tiếng một thời. Anh đã trở thành thần tượng của giới trẻ 8x và 9x nhờ loạt ca khúc nhạc thị trường như\" Thà rằng như thế\", \"Tôi không tin\", Hứa thật nhiều thất hứa thật nhiều: , \"Thà một lần đau\"...<br/>Ưng Hoàng Phúc ký hợp đồng trở thành ca sĩ độc quyền của Thế Giới Giải Trí. Dưới sự quản lý của Thế Giới Giải Trí, nam ca sĩ này đã phát hành tổng cộng 5 album riêng, và 1 album hát chung cùng nhóm nhạc nữ H. A. T. Những album của Ưng Hoàng Phúc đều tạo được hiệu ứng tốt, đạt thành công rực rỡ về số lượng đĩa tiêu tụ. Trong đó, album Vol. 1 tiêu thụ 55. 000 bản, Vol. 2 bán ra 35. 000 bản, vol. 3 bán ra 66. 000 bản, vol. 4 bán ra 50. 000 bản. Những năm 2000, âm nhạc của Ưng Hoàng Phúc được vang lên ở khắp mọi nơi, từ các quán cà phê, quán vỉa hè, tại quán game... Có thể nói thời đó là thời hoàng kim trong sự nghiệp ca hát của Ưng Hoàng Phúc.<br/>Khi sự nghiệp đang phát triển rực rỡ, Ưng Hoàng Phúc đã phải quyết định tạm dừng công việc của mình để sang Singapore điều trị căn bệnh thoát vị đĩa đệm trong vòng 2 năm. Anh kết thúc hợp đồng với Thế Giới Giải Trí và bắt đầu tách ra thành lập công ty riêng là \"WMA Records\". Sau đó, anh thành lập một công ty âm nhạc riêng là','','<b>\r\nCác Album của anh:</b><br/><ul><li>Thà Rằng Như Thế</li><li>Tôi Đi Tìm Tôi </li><li>Người Ta Nói</li><li>Thà Một Lần Đau </li><li>Hứa Thật Nhiều Thất Hứa Thật Nhiều</li><li>Anh Không Muốn Bất Công Với Em 2 </li><li>Đàn Ông Không Được Quên</li><li>Hết Tình Còn Nghĩa </li><li>Sóng Ngầm </li><li>Tự Tin Để Đứng Vững</li><li>Căn Gác Trống</li><li>Ưng Hoàng Phúc Greatest Hits </li><li>Chuyện Đó Đâu Ai Ngờ </li><li>Rồng Đen (Mini album)</li><li>Để Mọi Thứ Qua Đi (Mini album) </li><li>Lady Love (Single)</li><li>Chính Liên Bán Cơm </li><li>Mất Em - Người Anh Đã Yêu </li><li>Cảm Thấu </li></ul>'),
(29,'Văn Mai Hương','Ca sĩ','Việt Nam','1994-09-27','Thành phố Hà Nội, nước Việt Nam','<b>Ca sĩ Văn Mai Hương là ai?</b><br/>\r\nVăn Mai Hương là một ca sĩ trẻ đầy tài năng của làng âm nhạc Việt Nam. Cô bắt đầu nổi tiếng sau khi giành danh hiệu Á Quân tại cuộc thi tìm kiếm tài năng âm nhạc \"VietNam Dol\". <br/>Văn Mai Hương bắt đầu sự nghiệp âm nhạc của mình bằng đĩa đơn đầu tien, ca khúc \"Ngày mới trắng hồng\", là một ca khúc quảng cáo cho hãng mỹ phẩm Pond\. Sau đó, cô đã quyết định vào Sài Gòn với mong muốn tìm con đường phát triển sự nghiệp ca hát. Ca khúc\"Nếu như anh đến\" của Văn Mai Hương là một sáng tác của nhạc Sĩ Nguyễn Đức Cường, được theo thể loại Dance-pop và R& B. Ca khúc này được sản xuất bởi <a href=\"/nghe-nghiep/nhac-si/huy-tuan/bv\">nhạc sĩ Huy Tuấn,</a> và đã được phát hành lên trang Zing Mp3 vào ngày 30/06/2011. Ngày 01/07, đĩa mở rộng cùng tên đã được phát hành. Ngày 08/08, video ca khúc này đã được phát hành, và được sản xuất bởi hãng phim Film Ninja Productions. Ca khúc này đã nhanh chóng lọt vào bảng xếp hạng Zing Top Song, và đã có lúc là ca khúc đứng ở vị trí số 1, trở thành một bản \"hit\" đình đám trong giới trẻ lúc bấy giờ. Tiếp theo, ca khúc \"Ngày chung đôi\" của Văn Mai Hương cũng đã tạo được hiệu ứng tốt, được đông đảo khán giả yêu thích. Album đầu tay của Văn Mai Hương có tựa đề \"Hãy mỉm cười\", được sản xuất bởi nhạc sĩ Huy Tuấn và sự giúp đỡ của nhiều nhạc sĩ nổi tiếng như: <a href=\"/nghe-nghiep/nhac-si/giang-son/baio\">Giáng Son</a>, <a href=\"/nghe-nghiep/nhac-si/duc-tri/bh\">Đức Trí</a>, <a href=\"/nghe-nghiep/nhac-si/nguyen-duc-cuong/cf\">Nguyễn Đức Cường</a>,<a href=\"/nghe-nghiep/ca-si/minh-vuong/fm\"> Minh Vương</a>, <a href=\"/nghe-nghiep/nha-bao/ha-quang-minh/bgje\">Hà Quang Minh</a>... <br/>Năm 2012, Văn Mai Hương đã cho ra đời MV \"Chuyện tình nhà thơ\", phát hành sau album \"Hãy mỉm cười\". Đây là ca khúc do nhạc sĩ Nguyễn Đức Cường viết tặng cho Văn Mai Hương. Năm 2013, cô cho ra mắt album thứ hai, có tựa đề \"18+\". Qua Album này, nữ ca sĩ muốn truyền tải đến người nghe nhạc những tâm tư của cô. Với các bản nhạc với giai điệu nhẹ nhàng, ngọt ngào, Văn Mai Hương cho khán giả thấy được cô đã trưởng thành cả về giọng hát lẫn phong cách. Năm 2014, cô cùng nam <a href=\"/nghe-nghiep/ca-si/truc-nhan/oh\">ca sĩ Trúc Nhân</a> và <a href=\"/nghe-nghiep/ca-si/duong-trieu-vu/b5\">Dương Triệu Vũ</a> đã phát hành MV \"Ngày gần anh\", sản phẩm âm nhạc này được khán giả ủng hộ nhiệt tình. Sau thời gian này, Văn Mai Hương từng có một thời gian bị trầm cảm, mọi hoạt động nghệ thuật của cô bắt đầu im ắng. Tháng 12/2015, cô tái xuất showbiz với MV \"Mona Lisa\".<br/>Năm 2016, nhân dịp Valentine, Văn Mai Hương và nam <a href=\"/nghe-nghiep/ca-si/pham-hong-phuoc/dd\">ca sĩ Phạm Hồng Phước</a> đã tung ra ca khúc \"Thanh xuân sẽ qua\", là ca khúc theo phong cách country, có pha chút Valse & Jazz, là một phong cách khá mới mẻ của làng âm nhạc Việt. Tháng 01 năm 2017, cô đã phát hành ca khúc \"Những khát khao ấy\", một sáng tác của<a href=\"/nghe-nghiep/nhac-si/chau-dang-khoa/s6\"> nhạc sĩ Châu Đăng Khoa</a>. Ca khúc này nhận được nhiều đánh giá tích cực, trong đó có nhiều ý kến cho rằng Văn Mai Hương đã có cách xử lý tốt trong những quảng giọng rộng, và các nốt lên cao tiên tục.<br/>Văn Mai Hương cũng đã thử sức với vai trò Ban giám khảo của VietNam Idol kids năm 2016. Mới đây, nữ ca sĩ sinh năm 1994 này đã có mặt tại chương trình Ca sĩ giấu mặt để cỗ vũ cho<a href=\"/nghe-nghiep/ca-si/bui-anh-tuan/z\"> ca sĩ Bùi Anh Tuấn</a>. Trong chương trình này, cô đã bị MC Trường Giang \"chặt chém\" tơi bời khi liên tục nhắc đến tình cũ<a href=\"/nghe-nghiep/ca-si/le-hieu/nd\"> Lê Hiếu</a>. Văn Mai Hương đã van nài MC này \"tha\" cho mình, và hứa sẽ tặng anh cát sê của buổi quay hình này để anh không trêu cô nữa. Thế nhưng, <a href=\"/nghe-nghiep/nghe-si-hai/truong-giang/m\">Trường Giang</a> đã phớt lờ lời đề nghị của cô và tiếp tục nhún nhảy theo giai điệu của một ca khúc của ca sĩ Lê Hiếu.<br/>Tối ngày13-8-2020, nữ ca sĩ Văn Mai Hương chính thức tung teaser MV \'Đốt\' và hé lộ những thông tin đầu tiên về dự án âm nhạc mới mà cô cùng ekip đang ấp ủ thực hiện trong suốt thời gian qua. Có vẻ như cô sẽ dành MV này cho tháng cô hồn, một MV ma mị và liêu trai ư? Chúng ta cùng chờ đợi nhé<br/><h3><b>Các Album của cô:</b></h3><ul><li> Hãy Mỉm Cười (2011)</li><li> Nếu Như Anh Đến (2011)</li><li> Ngày Chung Đôi (2012)</li><li> Chuyện Tình Nhà Thơ (2012)</li><li> Mười Tám (2013)</li><li>Những khát khao ấy (2017)</li><li>Hoa nở không màu (2020)</li><li>Đốt (2020)</li></ul><b>Các giải thưởng của cô:</b><br/><ul><li> Cô từng đoạt giải nữ ca sĩ được yêu thích nhất trong lễ trao giải Giải thưởng truyền hình HTV Awards lần thứ 8 năm 2014.</li><li>Năm 2014, Cô từng lọt vào top 3 Nữ ca sĩ được yêu thích nhất. </li></ul>','<b>Các giải thưởng của cô:</b><br/><ul><li> Cô từng đoạt giải nữ ca sĩ được yêu thích nhất trong lễ trao giải Giải thưởng truyền hình HTV Awards lần thứ 8 năm 2014.</li><li>Năm 2014, Cô từng lọt vào top 3 Nữ ca sĩ được yêu thích nhất. </li></ul>','<b>Các Album của cô:</b>'),
(30,'Đàm Vĩnh Hưng','Ca sĩ','Việt Nam','1971-10-02','Thành phố Hồ Chí Minh, nước Việt Nam','<b>Ca sĩ Đàm Vĩnh Hưng là ai?</b><br/>\n<div>TIN MỚI: Trong buổi lưu diễn tại quận Cam, California, trong lúc biểu diễn anh bước lên một chiếc bồn nước có nhiều người nhảy bao quanh. Anh chuẩn bị bước lên mâm phun nước nhưng trượt ngã và chân anh đã bị mâm phun đè lên. Ngay sau đó anh đã được đưa đến bệnh viện ngay gần đấy. Do vết thương sâu nên anh có thể sẽ phải nghỉ ngơi 1 tháng sau đó mới có thể luyện tập để quay lại sân khấu.</div>Đàm Vĩnh Hưng tên thật là Huỳnh Minh Hưng, được biết đến với nghệ danh Mr Đàm, là một nam ca sĩ nổi tiếng của làng giải trí Việt. Anh được xem là Ông hoàng nhạc Việt. Anh được công chúng biết đến qua nhiều ca khúc nổi tiếng như: Giã từ, Phôi pha, Anh còn nợ em, Qua cơn mê, Nửa vầng trăng, Say tình, Xin lỗi tình yêu, Lâu đài tình ái...<br/>Đàm Vĩnh Hưng là một trong những ca sĩ có lượng fan hâm mộ lớn nhất tại Việt. Phong cách âm nhạc của anh phù hợp với nhiều lứa tuổi và được rất nhiều người yêu thích. Trong sự nghiệp ca hát, nam ca sĩ này đã cho ra mắt nhiều đĩa nhạc, trong đó có: Dạ khúc cho tình nhân gồm 6 đĩa nhạc, album vol 1 đến vol 11, cùng nhiều đĩa nhạc Liveshow của anh. Ngoài ca hát, Đàm Vĩnh Hưng còn thường xuyên xuất hiện trong các liveshow hài của các nghệ sĩ hài tên tuổi như: <a href=\"/nghe-nghiep/nghe-si-hai/truong-giang/m\">Trường Giang</a>, <a href=\"/nghe-nghiep/nghe-si-hai/hoai-linh/h\">Hoài Linh</a>... Anh còn tham gia một số chương trình truyền hình, trong đó có cuộc thi Giọng hát Việt, với tư cách giám khảo của chương trình.<br/>Tối ngày 07/02/2017 vừa qua, nam ca sĩ Đàm Vĩnh Hững đã đăng một bài viết lên trang cá nhân của mình về việc nợ nần của mẹ anh. Trong bài viết, anh còn chia sẻ hình ảnh của hàng chục chủ nợ của bà Trần Thị Thọ (mẹ của Đàm Vĩnh Hưng), đang có mặt tại nhà của anh. Trong bài viết, nam ca sĩ này cho biết anh cảm thấy mệt mỏi và mất trọn niềm tin vào những điều tốt đẹp trong cuộc sống. Anh cũng tự hứa với bản thân, bạn bè và người thân của mình rằng đây sẽ là lần cuối cùng anh trả nợ cho mẹ của mình. Và anh cũng tuyên bố với những người đang có ý đồ xấu muốn hãm hại gia đình anh rằng, nếu họ còn muốn cho mẹ anh vay tiền thì phải tự chịu trách nhiệm. Còn về phía Đàm Vĩnh Hưng, anh cho biết sẽ dùng đến thế lực mạnh nhất để lôi đầu những kẻ xấu đang muốn hãm hại gia đình mình và tiếp tay cho bà Bà Trần Thị Thọ bằng mọi hình thức. Được biết, đây không phải là lần đầu tiên nam ca sĩ này phải \"còng lưng\" trả món nợ lớn của mẹ mình. Cuối tháng 12 năm 2016, nam ca sĩ này cũng đã khóc lóc và đăng bài lên trang cá nhân về việc phải trả số nợ khoảng 10 tỷ đồng cho mẹ của mình. Và nam ca sĩ này cũng từng cho biết, sự việc tương tự này đã diễn ra trong 30 năm nay.<div><b>Ca sĩ Đàm Vĩnh Hưng và chuyện sao kê từ thiện:</b></div><div>Tối ngày 24/08/2021, doanh nhân Nguyễn Phương Hằng khiến mạng xã hội dậy sóng khi livestream khẳng định đang giữ khoảng 1,9kg giấy tờ sao kê tài khoản ngân hàng của ca sĩ Đàm Vĩnh Hưng. Bà Phương Hằng cho rằng số tiền từ thiện mạnh thường quân cả nước chuyển cho ca sĩ Đàm Vĩnh Hưng quyên góp cho bà con vùng lũ miền Trung năm 2020 lên đến 96 tỷ đồng, chứ không phải 1,8 tỷ như ông hoàng nhạc Việt công bố trước đó. Không để cộng đồng mạng phải chờ lâu ngày 25/8/2021, ca sĩ Đàm Vĩnh Hưng đã lên tiếng phản bác thông tin bà <a href=\"/nghe-nghiep/dien-vien-nu/phuong-hang/bavw\">Phương Hằng</a> đưa ra. Anh cho biết sẽ nhờ Pháp luật can thiệp để chứng minh sự trong sạch của mình và lột trần sự vu khống, bôi nhọ, xúc phạm danh dự người khác của doanh nhân <a href=\"/nghe-nghiep/doanh-nhan/nguyen-phuong-hang/bf39\">Nguyễn Phương Hằng</a>. Ca sĩ Đàm Vĩnh Hưng cũng tuyên bố sẽ mời kiểm toán làm rõ số tiền từ thiện. Ngoài Đàm Vĩnh Hưng, doanh nhân Phương Hằng còn gọi tên danh hài Hoài Linh, <a href=\"/nghe-nghiep/ca-si/thuy-tien/in\">ca sĩ Thuỷ Tiên</a>, <a href=\"/nghe-nghiep/mc/tran-thanh/p\">MC Trấn Thành</a> trong lùm xùm từ thiện này.</div><div><b>Ca sĩ Đàm Vĩnh Hưng cùng con trai ruột - bé Polo 3 tuổi</b></div><div>Vào Tối ngày 2/10, trong live concert The Portrait tại Hà Nội, Đàm Vĩnh Hưng đã công khai cậu con trai ruột sau 3 năm giấu kín - bé Polo Huỳnh khiến cho cộng đồng mạng hết sức ngạc nhiên. Bé Polo Huỳnh tên thật là Đàm Vĩnh Quân sinh năm 2019. Bé được nhiều người khen ngợi bởi sự đáng yêu với đôi mắt sáng, khuôn mặt tròn đầy đặn cùng làn da trắng bóc như thiên thần. Cậu bé được mọi người nhận xét như là \"bản sao\" của ca sĩ Đàm Vĩnh Hưng. </div><div><div><div><b>\r\nDanh sách đĩa nhạc</b><br/><ul><li>Dạ khúc cho tình nhân 1 - Hạnh phúc lang thang (2008)</li><li>Dạ khúc cho tình nhân 2 - Qua cơn mê (2008)</li><li>Dạ khúc cho tình nhân 3 - Những bài ca không quên (2010)</li><li>Dạ khúc cho tình nhân 4 - Cuộc tình đã mất (2011)</li><li>Dạ khúc cho tình nhân 5 - Xót xa (2011)</li><li>Dạ khúc cho tình nhân 6 - Xóa tên người tình (2013)</li><li>Vol. 1 - Tình ơi xin ngủ yên (2001)</li><li>Vol. 2 - Bình minh sẽ mang em đi (2001)</li><li>Vol. 3 - Một trái tim tình si (2002)</li><li>Vol. 4 - Bao giờ người trở lại... Hãy đến đây đêm nay (2002)</li><li>Vol. 5 - Giọt nước mắt cho đời (2003)</li><li>Vol. 6 - Hưng (2004)</li><li>Vol. 7 - Mr. Đàm (2005)</li><li>Vol. 8 - Tình ca hoài niệm (2006) với 12 tình khúc 1954-1975 nổi tiếng</li><li>Vol. 9 - Giải thoát (2007)</li><li>Vol. 10 - Lạc mất em (2007)</li><li>Vol. 11 - Hạnh phúc cuối (2008)</li><li>DVD Liveshow Trái tim hát (2003)</li><li>DVD Liveshow Giờ H (2004)</li><li>DVD Liveshow Thương hoài ngàn năm (2008)</li><li>DVD Liveshow Ngày không em (2008)</li><li>DVD Liveshow Sinh viên họ Đàm (2008)</li><li>DVD Liveshow Người tình (2010)</li><li>DVD Biển tình (2011)</li><li>DVD Liveshow Dạ tiệc trắng (2011)</li><li>DVD Liveshow Mr. Đàm By Night 5 - Bước chân miền Trung (2011)</li><li>DVD Liveshow Số phận (2012)</li><li>DVD Liveshow Thương hoài ngàn năm 2 (2015)</li><li>DVD Yêu em trong cả giấc mơ (2015)</li></ul><br/><b>Các album thành công của anh:</b><ul><li>Dạ khúc cho tình nhân 7 - Chờ đông (2013)</li><li>Vùng trời bình yên - với <a href=\"/nghe-nghiep/ca-si/hong-ngoc/dm\">Hồng Ngọc</a> (2002)</li><li>Phôi pha (2003)</li><li>Bước chân mùa xuân (2008)</li><li>Mùa Noel đó (2009)</li><li>Khoảng cách (2010)</li><li>Sa mạc tình yêu - với <a href=\"/nghe-nghiep/ca-si/thanh-lam/ia\">Thanh Lam</a> (2011)</li><li>Anh còn nợ em (2011)</li><li>Ca dao mẹ (2011)</li><li>3H (2011)</li><li>Góc khuất (2012)</li><li>Tuổi hồng thơ ngây (2012)</li><li>Chúc xuân - Bên em mùa xuân (2012)</li><li>Tình buồn của H (2014)</li><li>Làm sao anh biết (2014)</li><li>Ô kìa... (2014)</li><li>Khắc (2015)</li><li>Lời con dâng chúa (2015)</li><li>Tình ca mùa đông (2015)</li></ul><b>Các giải thưởng của anh:</b><br/><ul><li>Năm 2002: Giải thưởng Làn Sóng Xanh của Đài tiếng nói <a href=\"/tinh-tp/ho-chi-minh-viet-nam\">Thành phố Hồ Chí Minh</a></li><li>Năm 2003: Giải nhất Ngôi sao bạch kim - \"Giọng ca nam xuất sắc nhất\".</li><li>Năm 2004: Giải thưởng Làn Sóng Xanh: \"Ca sĩ được yêu thích nhất\" trong năm 2004.</li><li>Năm 2005: Giải thưởng Lá Phong của Tổng lãnh sự Canada</li><li>Năm 2005: Hai giải thưởng Làn Sóng Xanh: \"Ca sĩ được yêu thích nhất\" và Ca sĩ của năm</li><li>Năm 2006: Giải thưởng Ngôi sao bạch kim - Ca sĩ có phong cách ấn tượng nhất.</li><li>Năm 2007: Giải cống hiến 2007 - Ca sĩ xuất sắc nhất 2007.</li><li>Năm 2008: anh giành hai giải thưởng Làn Sóng Xanh: \"10 ca sĩ được yêu thích nhất\" và \"Ca sĩ của năm\".</li><li>Năm 2008, anh giành huy chương bạc thể loại nhạc nhẹ và nhạc dân gian trong cuộc thi Liên hoan giọng hát vàng Asean 2008.</li><li>Năm 2010: anh giành 5 <a href=\"/nghe-nghiep/giai-thuong/zing-music-awards/bivp\">giải thưởng Zing Music Awards</a> 2010 và Ca sĩ được yêu thích nhất</li><li>Năm 2010 anh giành <a href=\"/nghe-nghiep/giai-thuong/htv-awards/bi11\">giải thưởng HTV Awards</a>: Ca sĩ được yêu thích nhất lần thứ hai.</li><li>Năm 2011 anh giành giải ca sĩ được yêu thích nhất</li><li>Giải thưởng video clip của năm: Video clip Dạ Khúc Cho Tình Nhân</li><li>Giải thưởng album của năm: Album Xót Xa và Album Anh Còn Nợ Em</li><li><a href=\"/nghe-nghiep/giai-thuong/giai-mai-vang/bgv4\">Giải Mai Vàng</a> lần thứ 17: Nam ca sĩ nhạc nhẹ được yêu thích nhất</li><li>Giải thưởng Làn Sóng Xanh lần thứ 15: Ca sĩ của năm, 10 ca sĩ được yêu thích nhất</li></ul></div></div></div>','<b>Các giải thưởng của anh:</b><br/><ul><li>Năm 2002: Giải thưởng Làn Sóng Xanh của Đài tiếng nói <a href=\"/tinh-tp/ho-chi-minh-viet-nam\">Thành phố Hồ Chí Minh</a></li><li>Năm 2003: Giải nhất Ngôi sao bạch kim - \"Giọng ca nam xuất sắc nhất\".</li><li>Năm 2004: Giải thưởng Làn Sóng Xanh: \"Ca sĩ được yêu thích nhất\" trong năm 2004.</li><li>Năm 2005: Giải thưởng Lá Phong của Tổng lãnh sự Canada</li><li>Năm 2005: Hai giải thưởng Làn Sóng Xanh: \"Ca sĩ được yêu thích nhất\" và Ca sĩ của năm</li><li>Năm 2006: Giải thưởng Ngôi sao bạch kim - Ca sĩ có phong cách ấn tượng nhất.</li><li>Năm 2007: Giải cống hiến 2007 - Ca sĩ xuất sắc nhất 2007.</li><li>Năm 2008: anh giành hai giải thưởng Làn Sóng Xanh: \"10 ca sĩ được yêu thích nhất\" và \"Ca sĩ của năm\".</li><li>Năm 2008, anh giành huy chương bạc thể loại nhạc nhẹ và nhạc dân gian trong cuộc thi Liên hoan giọng hát vàng Asean 2008.</li><li>Năm 2010: anh giành 5 <a href=\"/nghe-nghiep/giai-thuong/zing-music-awards/bivp\">giải thưởng Zing Music Awards</a> 2010 và Ca sĩ được yêu thích nhất</li><li>Năm 2010 anh giành <a href=\"/nghe-nghiep/giai-thuong/htv-awards/bi11\">giải thưởng HTV Awards</a>: Ca sĩ được yêu thích nhất lần thứ hai.</li><li>Năm 2011 anh giành giải ca sĩ được yêu thích nhất</li><li>Giải thưởng video clip của năm: Video clip Dạ Khúc Cho Tình Nhân</li><li>Giải thưởng album của năm: Album Xót Xa và Album Anh Còn Nợ Em</li><li><a href=\"/nghe-nghiep/giai-thuong/giai-mai-vang/bgv4\">Giải Mai Vàng</a> lần thứ 17: Nam ca sĩ nhạc nhẹ được yêu thích nhất</li><li>Giải thưởng Làn Sóng Xanh lần thứ 15: Ca sĩ của năm, 10 ca sĩ được yêu thích nhất</li></ul>','<b>Các album thành công của anh:</b><ul><li>Dạ khúc cho tình nhân 7 - Chờ đông (2013)</li><li>Vùng trời bình yên - với <a href=\"/nghe-nghiep/ca-si/hong-ngoc/dm\">Hồng Ngọc</a> (2002)</li><li>Phôi pha (2003)</li><li>Bước chân mùa xuân (2008)</li><li>Mùa Noel đó (2009)</li><li>Khoảng cách (2010)</li><li>Sa mạc tình yêu - với <a href=\"/nghe-nghiep/ca-si/thanh-lam/ia\">Thanh Lam</a> (2011)</li><li>Anh còn nợ em (2011)</li><li>Ca dao mẹ (2011)</li><li>3H (2011)</li><li>Góc khuất (2012)</li><li>Tuổi hồng thơ ngây (2012)</li><li>Chúc xuân - Bên em mùa xuân (2012)</li><li>Tình buồn của H (2014)</li><li>Làm sao anh biết (2014)</li><li>Ô kìa... (2014)</li><li>Khắc (2015)</li><li>Lời con dâng chúa (2015)</li><li>Tình ca mùa đông (2015)</li></ul>');

       (18,
        'Minh Hằng',
        'Ca sĩ',
        'Việt Nam',
        STR_TO_DATE('23-06-1987', '%d-%m-%Y'),
        'Hồ Chí Minh',
        '<div class="about-nnt">
    <b>Ca sĩ Minh Hằng là ai?</b><br>
    Minh Hằng Tên thật là Lê Ngọc Minh Hằng, còn được biết đến với biệt danh Bé Heo, là một ca sĩ kiêm diễn viên điện
    ảnh của <a href="/nghe-nghiep/doi-tuyen-bong-da-quoc-gia/viet-nam/bi96">Việt Nam</a>. Trong lĩnh vực ca hát, Minh
    Hằng đã có nhiều bản "hit" được khán giả yêu thích như: "Một vòng trái đất", "Người vô hình", "Cơn mưa nhỏ", "Đến
    giờ phút này", "Sắc Môi Em Hồng", "Vui hay buồn"... Trong diễn xuất, Minh Hằng cũng đã thể hiện khả năng lột xác
    ngoạn mục của mình qua các nhận vật, trong đó vai diễn được yêu thích nhất của cô là vai Minh Minh trong bộ phim
    "Ngôi nhà hạnh phúc", bộ phim chuyển thể lại từ bộ phim cùng tên của Hàn Quốc.<br>Hoạt động trong làng giải trí từ
    khá lâu, và cũng là một nghệ sĩ có tên tuổi hàng đầu trong showbiz Việt, Minh Hằng luôn được người hâm mộ yêu mến
    bởi sự cống hiến hết mình của cô cho nghệ thuật, và đặc biệt cô cũng luôn giữ hình ảnh tốt đẹp trong lòng khán giả.
    Tuy nhiên, nữ diễn viên này cũng không tránh khỏi những scandal ngoài ý muốn như lộ ảnh nóng, diện trang phục gợi
    cảm trong buổi từ thiện. Và mới đây nhất là scandal cô tố một người đàn chị trong nghề đã chèn ép khiến cô phải rút
    lui khỏi chiếc ghế nóng của chương trình The Face 2017. Cụ thể, trong một cuộc phỏng vấn mới đây, nữ <a
        href="/nghe-nghiep/dien-vien/minh-hang/baoz">diễn viên Minh Hằng</a> đã vừa khóc vừa kể về việc cô bị một người
    giấu mặt chèn ép khiến cô tuyên bố rút lui khỏi vị trí huấn luyện viên chương trình The Face 2017. Khi được phóng
    viên hỏi người cô muốn nhắc đến có phải Hà Hồ không thì người đẹp này không chia sẻ thêm gì mà bật khóc vì xúc động.
    Minh Hằng cho biết, người giấu mặt này hơn cô về tuổi đời, tuổi nghề và kinh nghiệm và cũng là người mà cô rất tôn
    trọng. Đặc biệt người chị này còn giúp cô hát bè trong một chương trình biểu diễn ở nước ngoài. Nữ ca sĩ này cũng
    cho biết, cô chỉ muốn nói ra sự thật chứ không muốn làm tổn thương người khác như chính cô đang phải chịu đựng. Sau
    khi có nhiều người cho rằng <a href="/nghe-nghiep/ca-si/ho-ngoc-ha/cw">Hà Hồ</a> chính là đàn chị mà Minh Hằng đang
    nhắc đến thì một số người bạn thân, đàn em của Hà Hồ tỏ ra bức xúc và lên tiếng bênh vực cô. Tuy nhiên, nữ hoàng
    giải trí lại chọn cách im lặng và vẫn tham gia các buổi biểu diễn bình thường như chưa có chuyện gì xảy ra.<br>
</div>',
        '<ul><li>Nữ diễn viên được yêu thích nhất HTV award 2008</li><li>Nữ diễn viên được yêu thích nhất HTV award 2010</li><li>Ca sĩ triển vọng tại Làn Sóng Xanh</li><li>Top 10 ca sĩ của năm tại Mai Vàng 2011</li></ul>',
        '<ul><li>album vol 1: Một Vòng Trái Đất</li><li>Album vol 2: Giờ Em Đã Biết</li></ul>'),
       (19,
        'Ngô Kiến Huy',
        'Ca sĩ',
        'Việt Nam',
        STR_TO_DATE('29-06-1988', '%d-%m-%Y'),
        'Hồ Chí Minh',
        '<div class="about-nnt" style="height: auto !important;">
    <b>Ca sĩ Ngô Kiến Huy là ai?</b><br>
    Ngô Kiến Huy tên khai sinh là Lê Thành Dương, là một nam ca sĩ, diễn viên, MC nổi tiếng của làng giải trí Việt. Anh
    là một trong những nghệ sĩ sở hữu lượng fan hâm đông nhất trong showbiz, với hơn 2 triệu lượt theo dõi trên
    Facebook. Ngô Kiến Huy bắt đầu được khán biết đến và yêu mến sau khi phát hành ca khúc "Mưa sao băng", một ca khúc
    đã từng làm mưa làm gió trong thị trường âm nhạc Việt một thời.<br>Ngô Kiến Huy theo duổi dòng nhạc Pop-ballad. Anh
    bắt đầu nổi tiếng từ ca khúc "Mưa sao băng", "Giả vờ yêu"... Anh còn tham gia đóng phim, các bộ phim từng tham gia
    như: Siêu nhân X, Nàng men chàng bóng, Em là bà nội của anh, Roan hồn, Thiên sứ 99.... Những năm gần đây, Ngô Kiến
    Huy bắt đầu lấn sân sang lĩnh vực MC, anh dẫn chương trình "Thách thức danh hài", "Người hùng tí hon", "Tôi tỏa
    sáng"... Nam ca sĩ này còn là người đoạt kỷ lục nhiều lần giành chiếc cup của chương trình "Ơn giời cậu đây rồi! ",
    từ năm 2014 cho đến nay.
    <br>Mới đây, Ngô Kiến Huy và nữ <a href="/nghe-nghiep/ca-si/khong-tu-quynh/dv">ca sĩ Khổng Tú Quỳnh </a>đã phát hành
    MV "Yêu không đường lui" để kỷ niệm 7 năm bên nhau. Đây là một ca khúc do nhạc sĩ Huỳnh Quốc Huy sáng tác, là một
    bản audio được thực hiện quay tại Hàn Quốc. MV "Yêu không đường lui" được kết hợp du lịch dưới dạng travel blogge,
    để giới thiệu cho khán giả các địa điểm du lịch nổi tiếng của đất nước Hàn Quốc xinh đẹp. Được biết, sau khi phát
    hành MV "Yêu không đường lui", Ngô Kiến Huy dự kiến sẽ phát hành thêm bốn MV ca nhạc khác trong thời gian tới. Ngoài
    ra, nam ca sĩ còn tiết lộ thông tin về việc anh đang tham gia vai chính trong một bộ phim điện ảnh đang chờ ngày ra
    rạp.
    <br>
</div>',
        '<ul><li>Ngô Kiến Huy từng đoạt giải khuyến khích gương mặt điện ảnh.</li><li> Giải nhất cuộc thi “ Vươn tới ngôi sao”.</li></ul>',
        '<ul><li> Yêu như không yêu (2008) - Ngô Kiến Huy</li><li> Chạm tay vào điều ước (2010) - Ngô Kiến Huy</li><li> Cho vơi nhẹ lòng (2011) - Ngô Kiến Huy</li><li> Sau một nụ cười (2012) - Ngô Kiến Huy</li></ul>'),
       (20,
        'Phương Thanh',
        'Ca sĩ',
        'Việt Nam',
        STR_TO_DATE('29-05-1973', '%d-%m-%Y'),
        'Hồ Chí Minh',
        '<div class="about-nnt" style="height: auto !important;">
    <b>Ca sĩ Phương Thanh là ai?</b><br>
    Phương Thanh còn được biết đến với biệt danh "Chanh" tên đầy đủ là Bùi Thị Phương Thanh, là một nữ ca sĩ nổi tiếng
    với chất giọng khàn đặc biệt, và phong cách nhạc pop-rock vô cùng ấn tượng. Ngoài ra, Phương Thanh còn nổi tiếng với
    vai trò diễn viên, cô đã tham gia nhiều bộ phim điện ảnh đạt doanh thu cao.<br>Từ năm 1997, cái tên Phương Thanh bắt
    đầu được công chúng biết đến khi cô xuất hiện trong chương trình Làn Sóng Xanh, một trong những bảng xếp hạng âm
    nhạc uy tín trong nước, là nơi làm nên tên tuổi cho nhiều ca sĩ danh tiếng của Việt Nam như: <a
        href="/nghe-nghiep/ca-si/hong-nhung/do">Hồng Nhung</a>, <a href="/nghe-nghiep/ca-si/my-linh/a">Mỹ Linh</a>, <a
        href="/nghe-nghiep/ca-si/thanh-lam/ia">Thanh Lam</a>, <a href="/nghe-nghiep/ca-si/lam-truong/el">Lam Trường</a>....
    Trong suốt 10 năm tham gia Làn Sóng Xanh, Phương Thanh đã mang đến nhiều tiết mục trình diễn ấn tượng đến khán giả.
    Cũng chính từ Làn Sóng Xanh mà cái tên Phương Thanh mới trở thành một trong những ca sĩ nổi tiếng hàng đầu tại miền
    Nam và toàn quốc.
    <br>Năm 2007, Phương Thanh cho ra đời album "Sang mùa", ca khúc chủ đề của album này là một sáng tác của nhạc sĩ <a
        href="/nghe-nghiep/dao-dien/nguyen-quang-dung/9c">Nguyễn Quang Dũng</a>. Sau khi phát hành album "Sang mùa",
    cuộc đời và sự nghiệp của Phương Thanh như lật san một trang mới. Cô đã thay đổi hình ảnh của mình một cách hoàn
    toàn, Phương Thanh mới nữ tính hơn, đằm thắm hơn. Năm 2009, cô phát hành album "The best of Phương Thanh: Tình
    2010", để tri ân người hâm mộ sau một thời gian vắng bóng. Năm 2011, cô cho ra mắt album "Mèo hoang" và "Con ốc
    bươu".<br>Ngoài ca hát, Phương Thanh còn là một diễn viên điện ảnh. Cô xuất hiện trong nhiều bộ phim điện ảnh ăn
    khách như: Nụ hôn thần chết, Khi đàn ông có bầu, Đẻ mướn, Hot boy nổi loạn, Hồng Trương Ba, da hàng thịt, Đẹp từng
    centimet, Giải cứu thần chết.... Cô đã nhận được một số giải thưởng như: giải "Diễn viên phụ xuất sắc" tại Giải
    thưởng Cánh Diều Vàng cho vai diễn bà bói trong phim "Nụ hôn thần chết", giải "Nữ diễn viên phụ xuất sắc tại Liên
    hoan phim Việt Nam lần thứ 17 cho cô gái điếm trong "Hot boy nổi loạn". Ngoài ra, Phương Thanh còn tham nhiều nhiều
    vở cải lương, hát cổ nhạc như vở "Kim Vân Kiều", "Lan và Điệp", "Chiếc áo thiên nga"...
    <br>Mới đây, nữ ca sĩ Phương Thanh đã thông báo khẩn cấp tới fan hâm mộ của mình về việc, đã có người mạo danh cô để
    lừa tiền. Cụ thể, một con nợ cá độ bóng đá tự nhận là lái xe riêng của nữ ca sĩ này để vay hàng trăm triệu rồi bỏ
    trốn. Chị "Chanh" khẳng định, cô không quen biết người quản lý mạo danh này, lái xe riêng của cô chỉ có một người là
    em trai tên Tâm. Nữ ca sĩ cũng chia sẻ thêm rằng đây không phải là lần đầu tiên cô bị người khác mượn danh để lừa
    đảo tài sản của người khác.
    <br>
</div>',
        '<ul><li> Suốt 10 năm liên tiếp cô đều có tên trên bảng xếp hạng Làn Sóng Xanh.</li><li> Liên tiếp các năm cô đều có tên ở giải Mai Vàng.</li><li> Giải Cánh diều vàng dành cho vai phụ xuất sắc.</li></ul>',
        '<ul><li> Giã từ dĩ vãng</li><li> Một thời đã xa</li><li> Lang thang - Tình 2000</li><li> Tiếng rao</li><li> Ta chẳng còn ai, album đôi cùng Minh Thuận</li><li> Chào năm 2000</li><li> The Best of Phương Thanh: Tình 2010</li><li>Vol. 1 - Nếu như... trót yêu</li><li>Vol. 2 - Khi giấc mơ về</li><li>Vol. 3 - Hãy để em ra đi... Vì em yêu anh</li><li>Vol. 4 - Quay về ngày xưa</li><li>Vol. 5 - Thương một người (Tình khúc <a href="/nghe-nghiep/nhac-si/trinh-cong-son/ae">Trịnh Công Sơn</a>)</li><li>Vol. 6 - Tìm lại lời thề</li><li>Vol. 7 - Sang mùa</li><li> Con ốc Bươu</li><li> Quay về đây </li><li> Mèo hoang</li></ul>'),
       (21,
        'Quang Lê',
        'Ca sĩ',
        'Việt Nam',
        STR_TO_DATE('24-01-1981', '%d-%m-%Y'),
        'Hồ Chí Minh',
        '<div class="about-nnt" style="height: auto !important;">
    <b>Ca sĩ Quang Lê là ai?</b><br>
    Quang Lê tên thật là Lê Hữu Nghị, Anh được biết là một ca sĩ hải ngoại rất thành công với dòng nhạc quê hương. Anh
    là ca sĩ độc quyền của Trung tâm <a href="/nghe-nghiep/dien-vien-hai/thuy-nga/ab">Thúy Nga</a>.<br>Từ nhỏ, Quang Lê
    đã rất thích ca hát. Anh cũng có nhiều cơ hội để tiến đến con đường ca hát. Năm 5 tuổi, nam ca sĩ "Đập vỡ cây đàn"
    bắt đầu đi hát tại các ngôi chùa. Năm lớp 9, anh bắt đầu đi học nhạc. Sau khi cùng gia đình chuyển sang California
    sinh sống, Quang Lê bắt đầu thu âm rồi gửi đi các trung tâm ca nhạc tại đây nhưng anh đã phải thấy vọng khi không có
    bất cứ công ty nào hồi âm. Nhung may mắn đã đến với Quang Lê khi anh được nghệ sĩ Ngọc Phu giới thiệu tham gia cuộc
    thi tìm kiếm giọng ca vàng và đã đoạt giải. Sau đó, anh về làm việc tại Trung tâm Ca Dao trong 2 năm nhưng sự nghiệp
    không mấy khởi sắc. Cho đến khi ca sĩ Chung Tử Lưu đang thu âm Trung tâm Ca Dao, trong một lần tình cờ Quang Lê đã
    gặp được ông Tô Văn Lai- là giám đốc của Trung Tâm Thúy Nga và đã được biểu diễn trong chương trình Paris By Night
    66. Với ca khúc "Thư xuân trên rừng cao", Quang Lê đã nhanh chóng chiếm được cảm tình của khán giả. Sau đó, anh được
    Trung tâm Thúy Nga phát hành nhiều album solo, hầu như đều đạt được tiếng vang lớn.
    <br>Ca khúc "Sương trắng miền quê ngoại" là ca khúc đã làm nên tên tuổi của Quang Lê trong thị trường âm nhạc Hải
    ngoại, ca khúc được anh thể hiện trong Paris By Night 69. Theo lời nhận xét của MC Nguyễn Ngọc Ngạn, tiếng hát của
    Quang Lê đã làm sống lại những giai điệu của ca khúc này. Từ năm 2010, Quang Lê bắt đầu tổ chức nhiều hoạt động nghệ
    thuật tại Việt Nam. Năm 2013, anh nhận Á quân của Giọng hát Việt Nhí mùa đầu tiên là <a
        href="/nghe-nghiep/ca-si/phuong-my-chi/hg">Phương Mỹ Chi</a> làm con nuôi. Nam ca sĩ đã giúp tài năng nhí này
    phát triển sự nghiệp ca hát của mình cả trong nước lẫn hải ngoại. Năm 2017, Quang Lê là giám khảo của chương trình
    Thần tượng Bolero mùa thứ 2.
    <br>Mới đây, Quang Lê và bạn gái -<a href="/nghe-nghiep/hot-girl/thanh-bi/ba13"> hot girl Thanh Bi </a>đã khiến cư
    dận mạng sôi sục vì những hình ảnh nhạy cảm của cặp đôi này bị chia trẻ tràn lan trên mạng. Trong khi có nhiều ý
    kiến cho rằng Quang Lê đang cố ý tạo scandal để đánh bóng tên tuổi thì nam ca sĩ "Đập vỡ cây đàn" cho biết, những
    hình ảnh này được chụp trong một cảnh quay của MV mới sắp được ra mắt của anh, và nam ca sĩ cũng không hiểu vì sao
    bức ảnh nhạy cảm này lại bị phát tán lên mạng. Trước đó, trên mạng cũng xuất hiện nhiều bức ảnh nam ca sĩ này đặt
    tay lên ngực của bạn gái kém anh 11 tuổi mà không có chút ngại ngùng gì khiến cư dân mạng dậy sóng.<br><b>
    Các Album của anh:</b><br>
</div>',
        '<ul><li> Ở hai đầu nỗi nhớ (2014)</li><li> Chuyện tình không dĩ vãng (2013)</li><li> Chuyện tình hoa 10 giờ (2013)</li><li> Không phải tại chúng mình (2012)</li><li> Tương tư nàng ca sĩ (2009)</li><li> Hai quê (2008)</li><li> Đập vỡ cây đàn (2007)</li><li> 7000 đêm góp lại (2005)</li><li> Kẻ ở miền xa (2004)</li><li> Xin gọi nhau là cố nhân (2004)</li><li> Sương trắng miền quê ngoại (2003)</li></ul>',
        '<ul>
    <li> Anh từng đoạt huy chương bạc trong một cuộc thi tài năng trẻ tổ chức tại California.</li>
</ul>'),
       (22,
        'Sĩ Thanh',
        'Ca sĩ',
        'Việt Nam',
        STR_TO_DATE('10-02-1986', '%d-%m-%Y'),
        'Hồ Chí Minh',
        '<div class="about-nnt" style="height: auto !important;">
    <b>Ca sĩ Sĩ Thanh là ai?</b><br>
    - Sĩ Thanh là một ca sĩ được nhiều khán giả biết đến và yêu mến tại Việt Nam. <br>- Bên cạnh ca hát cô còn là một
    trong những VJ được yêu thích nhất của YAN TV qua 2 chương trình Chỉ có thể là YAN và 100 độ.
    <br>- Với một lịch trình quá dày đặc, nên Sĩ Thanh rời bỏ công việc VJ, để tập trung hơn cho sự nghiệp ca hát. Bên
    cạnh ca hát cô còn tham gia đóng phim truyền hình và tham gia nhiều chương trình thực tế, gameshow ăn khách nhất
    hiện nay.<br>
</div>',
        '',
        '<ul><li>Gái Già Lắm Chiêu OST</li><li>Gái Già Lắm Chiêu (Explosive Remix)</li><li>Lời Hứa Nhạt Nhòa (Gái Già Lắm Chiêu OST)</li><li>Cứ Yêu Đi (Single)</li><li>Don''t Want You</li><li>Mùa Yêu Cũ</li><li>Xuân Yêu</li><li>Em Sẽ Buông Tay (Single)</li><li>Linh Cảm</li><li>Không Trở Về (Mash-Up)</li><li>Xa Anh Chậm Chậm Thôi (Single)</li><li>Criminal (Cover)</li><li>Không Trở Về (Single)</li><li>Christmas</li><li>Boy You Know</li></ul>'),
       (23,
        'Sơn Tùng',
        'Ca sĩ',
        'Việt Nam',
        STR_TO_DATE('05-07-1994', '%d-%m-%Y'),
        'Hồ Chí Minh',
        '<div class="about-nnt" style="height: auto !important;">
    <b>Ca sĩ Sơn Tùng là ai?</b><br>
    Sơn Tùng hay Sơn Tùng M-TP tên thật là <a href="/nghe-nghiep/giao-vien/nguyen-thanh-tung/bfng">Nguyễn Thanh Tùng</a>,
    là nam ca sĩ trẻ nổi tiếng của làng âm nhạc <a href="/nghe-nghiep/doi-tuyen-bong-da-quoc-gia/viet-nam/bi96">Việt
    Nam</a>. Anh được khán giả yêu mến qua các ca khúc hit như: Em của ngày hôm qua, Cơn mua ngang qua, Không phải dạng
    vừa đâu, Chúng ta không thuộc về nhau, Chắc ai đó sẽ về, Nắng ấm xa dần...<br>Sơn Tùng tham gia chương trình Bài hát
    yêu thích năm 2012 với ca khúc " Cơn mưa ngang qua" và đã giành được giải thưởng của chương trình. Năm 2014, anh
    tiếp tục ghi dấu ấn tại chương trình Bài hát tôi yêu với ca khúc "Em của ngày hôm qua" và đã giành giải thưởng "Bài
    hát của tháng". Sơn Tùng cũng đã hai lần xuất hiện trong vai trò khách mời của chương trình "Thần Tượng âm nhạc Việt
    Nam". Tại lễ trao giải <a href="/nghe-nghiep/giai-thuong/canh-dieu-vang/bgv6">Cánh Diều Vàng</a> năm 2015, Sơn Tùng
    vinh dự được trao giải "Diễn viên trẻ triển vọng" cho vai diễn của anh trong bộ phim "Chàng trai năm ấy". Cũng trong
    năm 2015, Sơn Tùng lọt vào Top 10 danh sách những người được tìm kiếm nhiều nhất trên Google. Ngoài ra, bộ phim của
    ca khúc "Âm thầm bên em" của Sơn Tùng được xếp thứ 2 danh sách tìm nhiều nhiều nhất năm.
    <br>Từ năm 2014 đến năm 2016 là khoảng thời gian Sơn Tùng dính vào nhiều sacandal đạo nhạc, thậm chí khi nam ca sĩ
    này cho ra sản phẩm âm nhạc nào cũng đều dính nghi ngờ đạo nhạc. Điển hình anh là ca khúc "Chúng ta không thuộc về
    nhau" của nam ca sĩ này được cho là có phần hòa âm giống với ca khúc hit "We Don''t Talk Anymore" của hai ca sĩ nổi
    tiếng <a href="/nghe-nghiep/ca-si-nhac-pop/charlie-puth/1z7">Charlie Puth</a> và <a
        href="/nghe-nghiep/ca-si-nhac-pop/selena-gomez/ap4k">Selena Gomez</a>, phần đọc rap và phần nhấn nhá được cho là
    giống với ca khúc "Fire" của ban nhạc Hàn Quốc BTS, các ý tưởng của MV này còn hao hao giống các ca khúc của nhiều
    nghệ sĩ nổi tiếng khác như ca khúc "Monster" của ban nhạc EXO, "Crayon", "One of a kind", "That XX", của<a
        href="/nghe-nghiep/ca-si-rapper/g-dragon/azkk"> G-Dragon</a> hay "Why" của nam ca sĩ Taeyeon. MV ca khúc "Âm
    thầm bên em" của Sơn Tùng được phát hành vào hồi tháng 8 năm 2015 cũng được cho là đạo ý tưởng từ ca khúc "Crooked"
    của G-Dragon, "Empty" của Winner, "Let''s Not Fall In Love" của Big Bang và "Tui Hou" của <a
        href="/nghe-nghiep/ca-si-the-gioi/jay-chou/as6b">Jay Chou</a>. Trước đó, MC "Không phải dạng vừa đâu" của Sơn
    Tùng được phát hành vào tháng 01 năm 2015, đã bị thu hồi vì có những hình ảnh giễu cợt người khác. MV này cũng dính
    vào nghi ngờ đạo ý tưởng của ca khúc "Crooked" của G-Dragon.
    <br>Trong đêm chung kết Giọng hát Việt năm 2015 Sơn Tùng đã thể hiện ca khúc "Nắng ấm xa dần", tuy nhiên phần rap mà
    nam ca sĩ này cho thêm vào phần biểu diễn đã khiến không ít khán giả phải lên tiếng vì sự kiêu ngạo và được cho là
    nhạy cảm. Thậm chí, phần vũ đạo của Sơn Tùng trong tiết mục trình diễn này được cho là giống với màn vũ đạo của nam
    ca sĩ <a href="/nghe-nghiep/ca-si-nhac-pop/rain/ab8y">Bi Rain</a> trong MV "La Song".<br>Ngày 17 tháng 12 năm 2016,
    nam ca sĩ Sơn Tùng đã lần đầu tiên hé lộ về teaser của sự án âm nhạc "Lạc Trôi" sắp tới của anh. Sau 4 ngày công bố,
    teaser của Lạc Trôi đã thu hút được hơn 1,3 triệu lượt xem trên Youtube. Điều đó cho thấy sức nóng của Sơn Tùng và
    dự án âm nhạc mới của anh đang thu hút được sự quan tâm của đông đảo cộng đồng mạng. Theo thông báo chính thức từ
    Sơn Tùng thì MV ca khúc "Lạc trôi" sẽ được phát hành vào 0h ngày 01 tháng 1 năm 2017. Và vào ngày 31 tháng 12 năm
    2016, Sơn Tùng và công ty quản lý sẽ tổ chức một buổi ra mắt sản phẩm âm nhạc tại Sân khấu <a
        href="/nghe-nghiep/ca-si/lan-anh/ba5m">Lan Anh</a> với sự tham gia của hơn 3000 người bao gồm người hâm mộ và
    các nhân vật trong giới báo trí, truyền thông.
    <br>Ngày 23/04/2017, Sơn Tùng đã cho ra đời sản phẩm âm nhạc mới của mình, MV "Bình yên những phút giây". Trong khi
    cơn bão dư luận đang tập trung vào scandal nữ hoàng giải trí <a href="/nghe-nghiep/ca-si/ho-ngoc-ha/cw">Hồ Ngọc
    Hà</a> chèn ép ca sĩ <a href="/nghe-nghiep/ca-si/minh-hang/ac">Minh Hằng</a> tại The Face 2017, thì những sản phẩm
    âm nhạc ra mắt trong thời gian này đầu bị làm cho lu mờ. Thế nhưng, điều đó lại không làm ảnh hưởng đến độ hot của
    sản phẩm âm nhạc mới của Sơn Tùng khi MV "Bình yên những phút giây" sau khi ra mắt được hai ngày đã thu hút được 2
    triệu lượt xem trên Youtube.<br>
</div>',
        '<ul><li>Năm 2012: Giải bài hát yêu thích.</li><li>Năm 2013: Giải Ca khúc R&amp; B của năm <a href="/nghe-nghiep/giai-thuong/zing-music-awards/bivp">Zing Music Awards</a></li><li>Năm 2014: bài hát của anh được yêu thích của tháng</li><li>Năm 2014: anh đại diện Việt Nam cho hạng mục Nghệ sĩ Đông Nam Á xuất sắc nhất</li><li>Năm 2014: Giải ngôi sao của năm - Mỹ nam của năm</li><li>Năm 2015: Giải giải nghệ sĩ mới của năm - do Zing Music Awards bình chọn</li><li>Năm 2015: Giải nam ca sĩ trẻ xuất sắc do The Magic Box bình chọn</li><li>Năm 2015: Giải diễn viên trẻ triển vọng do Cánh diều vàng bình chọn</li><li>Năm 2015: Giải nam ca sĩ trẻ của năm do We Choice Awards bình chọn</li><li>Năm 2015: Giải nghệ sĩ quốc tế xuất sắc nhất khu vực Đông Nam Á</li><li>Năm 2015: Giải nghệ sĩ quốc tế xuất sắc nhất châu Á do MTV Europe Music Awards bình chọn</li><li>Năm 2015: lọt top 10 nhạc sĩ được yêu thích nhất của Làn sóng xanh</li></ul>',
        '<ul><li>Cơn mưa ngang qua - 2012</li><li>Đừng về trễ - 2013</li><li>Nắng ấm xa dần - 2013</li><li>Em của ngày hôm qua - 2013</li><li>Chắc ai đó sẽ về - 2014</li><li>Không phải dạng vừa đâu - 2015</li><li><a href="/tinh-tp/thai-binh-viet-nam">Thái Bình</a> mồ hôi rơi - 2015.</li><li>Khuôn mặt đáng thương - 2015</li><li>Tiến lên Việt Nam ơi - 2015</li><li>Ấn nút nhớ... thả giấc mơ - 2015</li><li>Âm thầm bên em - 2015</li><li>Buông đôi tay nhau ra - 2015</li><li>Remember me - 2015</li><li>Như ngày hôm qua - 2015</li><li>Một năm mới bình an - 2016</li><li>Chúng ta không thuộc về nhau - 2016</li></ul>')

