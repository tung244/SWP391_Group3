-- Chèn dữ liệu vào bảng Services_Type (Loại dịch vụ)
INSERT INTO Services_Type (service_type_name, duration_service) 
VALUES 
(N'Cơ bản', N'30 phút'),
(N'Nâng cao', N'60 phút'),
(N'Chuyên sâu', N'90 phút');


-- Chèn dữ liệu vào bảng Services_Detail (Chi tiết dịch vụ)
INSERT INTO Services_Detail (service_type_id, service_id, cost) 
VALUES 
-- Phẫu thuật khúc xạ (Refractive Surgery)
(1, 1, 5000000), (2, 1, 8000000), (3, 1, 12000000),

-- Phẫu thuật Phakic
(1, 2, 10000000), (2, 2, 15000000), (3, 2, 20000000),

-- Phẫu thuật Relex Smile
(1, 3, 12000000), (2, 3, 18000000), (3, 3, 25000000),

-- Phẫu thuật Femtosecond Lasik
(1, 4, 7000000), (2, 4, 10000000), (3, 4, 14000000),

-- Phẫu thuật SBK Lasik
(1, 5, 6000000), (2, 5, 9000000), (3, 5, 13000000),

-- CrossLinking - Gia cố giác mạc
(1, 6, 4000000), (2, 6, 6000000), (3, 6, 9000000),

-- Phẫu thuật lão thị Presbyond
(1, 7, 11000000), (2, 7, 16000000), (3, 7, 21000000),

-- Diễn đàn Lasik & Phakic
(1, 8, 2000000), (2, 8, 4000000), (3, 8, 6000000),

-- Phẫu thuật đục thủy tinh thể (Ophthalmic Surgery)
(1, 9, 5000000), (2, 9, 8000000), (3, 9, 10000000),

-- Phẫu thuật Phaco
(1, 10, 6000000), (2, 10, 8500000), (3, 10, 11000000),

-- Phẫu thuật Laser Cataract
(1, 11, 7000000), (2, 11, 9500000), (3, 11, 12000000),

-- Các loại thủy tinh thể nhân tạo
(1, 12, 15000000), (2, 12, 20000000), (3, 12, 25000000),

-- Điều trị bệnh võng mạc (Retinal Disease)
(1, 13, 7000000), (2, 13, 10000000), (3, 13, 14000000),

-- Phẫu thuật cắt dịch kính
(1, 14, 8000000), (2, 14, 12000000), (3, 14, 16000000),

-- Phẫu thuật độn đai
(1, 15, 9000000), (2, 15, 14000000), (3, 15, 18000000),

-- Thủ thuật Laser quang đông
(1, 16, 5000000), (2, 16, 7000000), (3, 16, 9000000),

-- Tiêm nội nhãn
(1, 17, 4000000), (2, 17, 6000000), (3, 17, 8000000),

-- Điều trị Glocom (Iris Disease)
(1, 18, 6000000), (2, 18, 9000000), (3, 18, 12000000),

-- Thủ thuật tạo hình bè chọn lọc bằng Laser
(1, 19, 5000000), (2, 19, 7500000), (3, 19, 10000000),

-- Phẫu thuật đặt van dẫn lưu tiền phòng
(1, 20, 7000000), (2, 20, 10000000), (3, 20, 13000000),

-- Nhãn nhi (Pediatric Eye Care)
(1, 21, 3000000), (2, 21, 5000000), (3, 21, 7000000),

-- Khám khúc xạ học đường
(1, 22, 2000000), (2, 22, 4000000), (3, 22, 6000000),

-- Kính chỉnh hình giác mạc Ortho-K
(1, 23, 8000000), (2, 23, 12000000), (3, 23, 16000000),

-- Kiểm soát tiến triển cận thị
(1, 24, 5000000), (2, 24, 8000000), (3, 24, 11000000),

-- Tạo hình và trung phẫu mắt (Cosmetic Ophthalmology)
(1, 25, 7000000), (2, 25, 11000000), (3, 25, 15000000),

-- Các gói khám và điều trị khác (General Ophthalmology)
(1, 26, 3000000), (2, 26, 5000000), (3, 26, 7000000),

-- Đo thị lực và kiểm tra mắt
(1, 27, 1500000), (2, 27, 3000000), (3, 27, 5000000),

-- Khám chuyên sâu trước phẫu thuật khúc xạ
(1, 28, 4000000), (2, 28, 7000000), (3, 28, 10000000),

-- Tầm soát đục thủy tinh thể
(1, 29, 2500000), (2, 29, 5000000), (3, 29, 7500000),

-- Tầm soát thoái hóa võng mạc
(1, 30, 3500000), (2, 30, 6000000), (3, 30, 8500000),

-- Tầm soát Glaucoma
(1, 31, 4500000), (2, 31, 7000000), (3, 31, 9500000),

-- Điều trị giác mạc chóp
(1, 32, 5500000), (2, 32, 8500000), (3, 32, 11500000);



INSERT INTO Appointment (appointment_date, appointment_status, doctor_id, time_begin, time_end, service_detail_id, patient_id, phonenumber_patient) 
VALUES 
('2025-02-01 10:00:00', 'Scheduled', 1, '2025-02-01 10:00:00', '2025-02-01 10:30:00', 1, 7,  '0123456789'),
('2025-02-02 14:00:00', 'Completed', 2, '2025-02-02 14:00:00', '2025-02-02 14:45:00', 2, 7,  '0987654321'),
('2025-02-03 09:30:00', 'Canceled', 3, '2025-02-03 09:30:00', '2025-02-03 10:00:00', 3, 7,  '0369857412');

