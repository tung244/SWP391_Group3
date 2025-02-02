-- Chèn dữ liệu vào bảng MedicalHistory
INSERT INTO MedicalHistory (appointment_id, diagnosis, treatment, note) 
VALUES 
(1, N'Cận thị', N'Kính thuốc', N'Tái khám sau 6 tháng'),
(2, N'Viêm kết mạc', N'Thuốc nhỏ mắt', N'Tránh tiếp xúc với bụi bẩn'),
(3, N'Khô mắt', N'Dùng nước mắt nhân tạo', N'Hạn chế nhìn màn hình quá lâu');

-- Chèn dữ liệu vào bảng Follow_Up
INSERT INTO Follow_Up (appointment_id, next_follow_up_date, follow_up_status, follow_up_description, follow_up_note) 
VALUES 
(1, '2025-08-01', 'Pending', N'Tái khám đo mắt lại', N'Mang theo kính hiện tại'),
(2, '2025-02-20', 'Completed', N'Kiểm tra tình trạng viêm', N'Bệnh nhân đáp ứng tốt'),
(3, '2025-03-15', 'Scheduled', N'Đánh giá tình trạng khô mắt', N'Có thể thay đổi thuốc nếu cần');
