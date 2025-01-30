-- Chèn dữ liệu vào bảng MedicalHistory
INSERT INTO MedicalHistory (appointment_id, diagnosis, treatment, note) 
VALUES 
(1, 'Cận thị', 'Kính thuốc', 'Tái khám sau 6 tháng'),
(2, 'Viêm kết mạc', 'Thuốc nhỏ mắt', 'Tránh tiếp xúc với bụi bẩn'),
(3, 'Khô mắt', 'Dùng nước mắt nhân tạo', 'Hạn chế nhìn màn hình quá lâu');

-- Chèn dữ liệu vào bảng Follow_Up
INSERT INTO Follow_Up (appointment_id, next_follow_up_date, follow_up_status, follow_up_description, follow_up_note) 
VALUES 
(1, '2025-08-01', 'Pending', 'Tái khám đo mắt lại', 'Mang theo kính hiện tại'),
(2, '2025-02-20', 'Completed', 'Kiểm tra tình trạng viêm', 'Bệnh nhân đáp ứng tốt'),
(3, '2025-03-15', 'Scheduled', 'Đánh giá tình trạng khô mắt', 'Có thể thay đổi thuốc nếu cần');
