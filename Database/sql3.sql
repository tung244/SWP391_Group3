-- Chèn dữ liệu vào bảng Services_Type (Loại dịch vụ)
INSERT INTO Services_Type (service_type_name, duration_service) 
VALUES 
(N'Cơ bản', N'30 phút'),
(N'Nâng cao', N'60 phút'),
(N'Chuyên sâu', N'90 phút');

-- Chèn dữ liệu vào bảng Services (Dịch vụ cụ thể)
INSERT INTO Services (service_name, service_descriptprion) 
VALUES 
(N'Khám mắt tổng quát', N'Kiểm tra thị lực, đo khúc xạ'),
(N'Kiểm tra viêm giác mạc', N'Đánh giá tình trạng viêm nhiễm'),
(N'Tư vấn khô mắt', N'Hướng dẫn điều trị và phòng ngừa khô mắt'),
(N'Khám tật khúc xạ', N'Kiểm tra cận thị, viễn thị, loạn thị'),
(N'Đo nhãn áp', N'Kiểm tra áp lực nội nhãn'),
(N'Khám đáy mắt', N'Kiểm tra võng mạc, phát hiện bệnh lý mắt'),
(N'Chụp cắt lớp OCT', N'Kiểm tra bệnh lý võng mạc, thần kinh thị giác'),
(N'Phẫu thuật LASIK', N'Điều trị tật khúc xạ bằng laser'),
(N'Điều trị đục thủy tinh thể', N'Phẫu thuật thay thủy tinh thể nhân tạo'),
(N'Xét nghiệm nước mắt', N'Đánh giá chất lượng và số lượng nước mắt'),
(N'Khám mắt trẻ em', N'Kiểm tra mắt cho trẻ em từ 3 tuổi trở lên'),
(N'Tầm soát bệnh lý võng mạc tiểu đường', N'Phát hiện sớm biến chứng tiểu đường lên mắt');

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


INSERT INTO Appointment (appointment_date, appointment_status, doctor_id, time_begin, time_end, service_id, customer_id, patient_id, phonenumber_patient) 
VALUES 
('2025-02-01 10:00:00', 'Scheduled', 1, '2025-02-01 10:00:00', '2025-02-01 10:30:00', 1, 7, 1, '0123456789'),
('2025-02-02 14:00:00', 'Completed', 2, '2025-02-02 14:00:00', '2025-02-02 14:45:00', 2, 7, 2, '0987654321'),
('2025-02-03 09:30:00', 'Canceled', 3, '2025-02-03 09:30:00', '2025-02-03 10:00:00', 3, 7, 3, '0369857412');




