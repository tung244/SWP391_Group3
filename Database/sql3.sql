USE EyeCare﻿
-- Chèn dữ liệu vào bảng Services_Type (Loại dịch vụ)
INSERT INTO Services_Type (service_type_name, duration_service) 
VALUES 
(N'Cơ bản', N'30 phút'),
(N'Nâng cao', N'60 phút'),
(N'Chuyên sâu', N'90 phút');

-- Chèn dữ liệu vào bảng Services (Dịch vụ cụ thể)
INSERT INTO Services (service_name, service_description, service_introduce, service_benefit,service_status, specialization_id)  
VALUES 
(N'Khám mắt tổng quát', N'Kiểm tra thị lực, đo khúc xạ', N'Dịch vụ khám mắt tổng quát nhằm kiểm tra tình trạng mắt tổng thể của bạn, giúp phát hiện các dấu hiệu bất thường và các bệnh lý về mắt. Thông qua quá trình đo khúc xạ và kiểm tra thị lực, chúng tôi sẽ cung cấp cho bạn thông tin đầy đủ về tình trạng mắt hiện tại.', N'Khám mắt tổng quát giúp phát hiện sớm các vấn đề về thị lực, giúp bạn cải thiện chất lượng cuộc sống bằng cách điều chỉnh thị lực phù hợp. Đây là dịch vụ thiết yếu để bảo vệ đôi mắt và ngăn ngừa các bệnh lý tiềm ẩn.','Active', 1),
(N'Kiểm tra viêm giác mạc', N'Đánh giá tình trạng viêm nhiễm', N'Dịch vụ kiểm tra viêm giác mạc giúp phát hiện các dấu hiệu viêm giác mạc và các bệnh lý liên quan. Thông qua quá trình kiểm tra và đánh giá tình trạng viêm nhiễm, chúng tôi sẽ đưa ra phương pháp điều trị hiệu quả và an toàn.', N'Phát hiện và điều trị kịp thời tình trạng viêm giác mạc, giúp bảo vệ sức khỏe mắt của bạn. Điều trị sớm giúp ngăn ngừa các biến chứng nghiêm trọng và duy trì thị lực lâu dài.','Active', 5),
(N'Tư vấn khô mắt', N'Hướng dẫn điều trị và phòng ngừa khô mắt', N'Dịch vụ tư vấn khô mắt cung cấp giải pháp hiệu quả để cải thiện tình trạng khô mắt, giúp bạn cảm thấy dễ chịu hơn trong cuộc sống hàng ngày. Chúng tôi sẽ đưa ra những hướng dẫn cụ thể về cách chăm sóc mắt và các phương pháp điều trị phù hợp.', N'Dịch vụ tư vấn khô mắt giúp bạn hiểu rõ hơn về nguyên nhân gây khô mắt và cách điều trị hiệu quả. Điều này sẽ giúp giảm bớt sự khó chịu và bảo vệ mắt khỏi các vấn đề nghiêm trọng hơn trong tương lai.', 'Active',5),
(N'Khám tật khúc xạ', N'Kiểm tra cận thị, viễn thị, loạn thị', N'Khám tật khúc xạ là dịch vụ giúp kiểm tra các vấn đề liên quan đến tật khúc xạ như cận thị, viễn thị và loạn thị. Qua việc đo lường và kiểm tra kỹ lưỡng, chúng tôi sẽ xác định chính xác mức độ và gợi ý giải pháp điều trị phù hợp.', N'Dịch vụ khám tật khúc xạ giúp bạn phát hiện sớm các vấn đề về mắt như cận thị và viễn thị, từ đó đưa ra phương pháp điều trị phù hợp. Điều này sẽ giúp bạn cải thiện thị lực, giảm bớt sự mệt mỏi mắt và nâng cao chất lượng cuộc sống.', 'Active',8),
(N'Đo nhãn áp', N'Kiểm tra áp lực nội nhãn', N'Dịch vụ đo nhãn áp giúp kiểm tra tình trạng áp lực nội nhãn của mắt, một yếu tố quan trọng trong việc phát hiện bệnh glaucoma (tăng nhãn áp). Chúng tôi sử dụng các thiết bị hiện đại để đảm bảo kết quả đo chính xác.', N'Kiểm tra nhãn áp giúp phát hiện sớm các bệnh lý nguy hiểm như tăng nhãn áp, từ đó điều trị và ngăn ngừa các biến chứng nghiêm trọng như mất thị lực. Đây là dịch vụ cần thiết để bảo vệ sức khỏe đôi mắt của bạn.', 'Active',1),
(N'Khám đáy mắt', N'Kiểm tra võng mạc, phát hiện bệnh lý mắt', N'Dịch vụ khám đáy mắt giúp kiểm tra tình trạng võng mạc và các bệnh lý liên quan đến mắt, đặc biệt là các bệnh lý như đái tháo đường, tăng huyết áp. Chúng tôi sẽ thực hiện các xét nghiệm chuyên sâu để phát hiện sớm các dấu hiệu bệnh lý.', N'Khám đáy mắt giúp phát hiện sớm các bệnh lý liên quan đến võng mạc và các bệnh lý mắt nghiêm trọng khác. Phát hiện kịp thời giúp bảo vệ thị lực và ngăn ngừa các biến chứng nghiêm trọng của bệnh mắt.','Active', 6),
(N'Chụp cắt lớp OCT', N'Kiểm tra bệnh lý võng mạc, thần kinh thị giác', N'Dịch vụ chụp cắt lớp OCT sử dụng công nghệ hiện đại để kiểm tra các vấn đề liên quan đến võng mạc và thần kinh thị giác. Đây là một phương pháp quan trọng giúp phát hiện sớm các bệnh lý như thoái hóa hoàng điểm và glaucoma.', N'Dịch vụ chụp cắt lớp OCT giúp bạn phát hiện sớm các bệnh lý về võng mạc và thần kinh thị giác, từ đó đưa ra các phương pháp điều trị sớm và hiệu quả, giúp bảo vệ thị lực lâu dài.','Active', 4),
(N'Phẫu thuật LASIK', N'Điều trị tật khúc xạ bằng laser', N'Dịch vụ phẫu thuật LASIK là phương pháp điều trị tật khúc xạ bằng công nghệ laser tiên tiến. Đây là một phương pháp nhanh chóng và hiệu quả giúp loại bỏ kính hoặc kính áp tròng, mang lại thị lực rõ ràng và tự nhiên.', N'Phẫu thuật LASIK giúp bạn loại bỏ hoàn toàn tật khúc xạ như cận thị, viễn thị và loạn thị, giúp bạn sống cuộc sống thoải mái hơn mà không phải lo lắng về việc sử dụng kính hay kính áp tròng. Đây là một phương pháp an toàn và hiệu quả được chứng nhận.','Active', 8),
(N'Điều trị đục thủy tinh thể', N'Phẫu thuật thay thủy tinh thể nhân tạo', N'Dịch vụ điều trị đục thủy tinh thể thông qua phẫu thuật thay thủy tinh thể nhân tạo giúp phục hồi thị lực cho những người mắc bệnh đục thủy tinh thể. Quy trình phẫu thuật đơn giản và an toàn sẽ giúp bạn lấy lại thị lực rõ ràng.', N'Điều trị đục thủy tinh thể bằng phẫu thuật giúp bạn phục hồi thị lực và giảm thiểu các vấn đề về mắt, cho phép bạn tiếp tục các hoạt động hàng ngày mà không gặp khó khăn về thị lực.','Active', 2),
(N'Xét nghiệm nước mắt', N'Đánh giá chất lượng và số lượng nước mắt', N'Dịch vụ xét nghiệm nước mắt giúp đánh giá chất lượng và số lượng nước mắt để xác định các vấn đề như khô mắt. Chúng tôi sử dụng các phương pháp xét nghiệm hiện đại để đưa ra chẩn đoán chính xác.', N'Xét nghiệm nước mắt giúp xác định nguyên nhân gây khô mắt, từ đó đưa ra phương pháp điều trị thích hợp giúp giảm bớt sự khó chịu và bảo vệ mắt khỏi các tác động xấu trong tương lai.', 'Active',5),
(N'Khám mắt trẻ em', N'Kiểm tra mắt cho trẻ em từ 3 tuổi trở lên', N'Dịch vụ khám mắt trẻ em giúp kiểm tra thị lực và phát hiện sớm các vấn đề về mắt cho trẻ em từ 3 tuổi trở lên. Chúng tôi thực hiện các bài kiểm tra đơn giản và dễ hiểu, giúp trẻ cảm thấy thoải mái.', N'Khám mắt cho trẻ em giúp phát hiện sớm các vấn đề về mắt và điều trị kịp thời, giúp trẻ phát triển thị lực khỏe mạnh và ngăn ngừa các vấn đề về mắt sau này.','Active', 10),
(N'Tầm soát bệnh lý võng mạc tiểu đường', N'Phát hiện sớm biến chứng tiểu đường lên mắt', N'Dịch vụ tầm soát bệnh lý võng mạc tiểu đường giúp phát hiện các biến chứng về mắt do tiểu đường gây ra. Chúng tôi sử dụng các phương pháp hiện đại để kiểm tra và phát hiện bệnh lý võng mạc tiểu đường.', N'Tầm soát bệnh lý võng mạc tiểu đường giúp phát hiện sớm các biến chứng và điều trị hiệu quả, từ đó bảo vệ thị lực và ngăn ngừa mất thị lực do tiểu đường.', 'Active',6);


-- Chèn dữ liệu vào bảng Services_Detail (Chi tiết dịch vụ, combo khám mắt)
INSERT INTO Services_Detail (service_type_id, service_id, cost) 
VALUES 
-- Dịch vụ Cơ bản
(1, 1, 200000), -- Khám mắt tổng quát
(1, 2, 150000), -- Kiểm tra viêm giác mạc
(1, 3, 180000), -- Tư vấn khô mắt
(1, 4, 220000), -- Khám tật khúc xạ
(1, 5, 250000), -- Đo nhãn áp
(1, 6, 300000), -- Khám đáy mắt
(1, 11, 200000), -- Khám mắt trẻ em
(1, 12, 280000), -- Tầm soát bệnh lý võng mạc tiểu đường

-- Dịch vụ Nâng cao
(2, 1, 350000), -- Khám mắt tổng quát nâng cao
(2, 2, 300000), -- Kiểm tra viêm giác mạc nâng cao
(2, 3, 320000), -- Tư vấn khô mắt nâng cao
(2, 4, 400000), -- Khám tật khúc xạ nâng cao
(2, 5, 450000), -- Đo nhãn áp nâng cao
(2, 6, 500000), -- Khám đáy mắt nâng cao
(2, 7, 700000), -- Chụp cắt lớp OCT
(2, 8, 15000000), -- Phẫu thuật LASIK
(2, 9, 18000000), -- Điều trị đục thủy tinh thể
(2, 10, 350000), -- Xét nghiệm nước mắt nâng cao
(2, 11, 300000), -- Khám mắt trẻ em nâng cao
(2, 12, 400000), -- Tầm soát bệnh lý võng mạc tiểu đường nâng cao

-- Dịch vụ Chuyên sâu
(3, 6, 700000), -- Khám đáy mắt chuyên sâu
(3, 7, 1200000), -- Chụp cắt lớp OCT chuyên sâu
(3, 8, 25000000), -- Phẫu thuật LASIK chuyên sâu
(3, 9, 28000000), -- Điều trị đục thủy tinh thể chuyên sâu
(3, 10, 500000), -- Xét nghiệm nước mắt chuyên sâu
(3, 12, 600000); -- Tầm soát bệnh lý võng mạc tiểu đường chuyên sâu

-- Insert data into Slots
-- Chèn slot 30 phút (dịch vụ cơ bản)
-- Thêm Slot cho Dịch Vụ Cơ Bản (30 phút)
INSERT INTO Slots (start_time, end_time, service_type_id)
VALUES 
('08:00', '08:30', 1), -- Slot 1
('08:30', '09:00', 1), -- Slot 2
('09:00', '09:30', 1), -- Slot 3
('09:30', '10:00', 1), -- Slot 4
('10:00', '10:30', 1), -- Slot 5
('10:30', '11:00', 1), -- Slot 6
('11:00', '11:30', 1), -- Slot 7
('13:00', '14:00', 2), -- Slot 1
('14:00', '15:00', 2), -- Slot 2
('15:00', '16:00', 2), -- Slot 3
('16:00', '17:00', 2); -- Slot 4
-- Insert data into Schedules

