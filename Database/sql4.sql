-- Chèn dữ liệu vào bảng MedicalHistory

INSERT INTO Appointment (appointment_date, appointment_status, doctor_id, slot_id, service_detail_id, patient_id) 
VALUES 
('2025-02-20', 'Completed', 1, 1, 7, 7),
('2025-02-20', 'Completed', 2, 2, 2, 7),
('2025-02-18', 'Completed', 3, 3, 3, 7),
('2025-02-17', 'Completed', 4, 4, 5, 7),
('2025-02-18', 'Completed', 5, 5, 5, 7),
('2025-02-20', 'Completed', 2, 8, 13, 7),
('2025-02-20', 'Completed', 3, 8, 14, 7),
('2025-02-21', 'Completed', 4, 9, 15, 7),
('2025-02-21', 'Completed', 5, 10, 16, 7),
('2025-02-20', 'Completed', 1, 11, 17, 7),
('2025-02-21', 'Completed', 3, 6, 7, 7),
('2025-02-23', 'Completed', 3, 11, 18, 7),
('2025-02-27', 'Scheduled', 2, 10, 16, 7);

-- Chèn dữ liệu vào bảng Schedules (chỉ lấy ngày làm việc của bác sĩ từ bảng Appointment)
INSERT INTO Schedules (doctor_id, slot_id, schedule_date, schedule_status) 
VALUES 
(1, 1, '2025-02-20', 'Available'),
(2, 2, '2025-02-20', 'Available'),
(3, 3, '2025-02-18', 'Available'),
(4, 4, '2025-02-17', 'Available'),
(5, 5, '2025-02-18', 'Available'),
(2, 8, '2025-02-20', 'Available'),
(3, 8, '2025-02-20', 'Available'),
(4, 9, '2025-02-21', 'Available'),
(5, 10, '2025-02-21', 'Available'),
(1, 11, '2025-02-20', 'Available'),
(3, 6, '2025-02-21', 'Available'),
(3, 11, '2025-02-23', 'Available'),
(2, 10, '2025-02-27', 'Available');


INSERT INTO MedicalHistory (
    appointment_id, diagnosis, symptoms, treatment, prescription, 
    vision_left, vision_right, additional_tests, note
) 
VALUES 
(1, N'Cận thị', N'Mờ mắt', N'Đeo kính', N'Kính cận 1.5 độ', 
 1.5, 1.2, N'Kiểm tra võng mạc', N'Tái khám sau 6 tháng'),

(2, N'Viêm kết mạc', N'Mắt đỏ, ngứa', N'Dùng thuốc nhỏ mắt', N'Thuốc nhỏ mắt kháng viêm', 
 NULL, NULL, N'Không cần', N'Tránh bụi bẩn, rửa tay thường xuyên'),

(3, N'Khô mắt', N'Rát mắt, cay mắt', N'Dùng nước mắt nhân tạo', N'Nước mắt nhân tạo 3 lần/ngày', 
 NULL, NULL, N'Kiểm tra tuyến lệ', N'Không nhìn màn hình quá lâu'),

(4, N'Loạn thị', N'Nhìn mờ, méo hình', N'Đeo kính chỉnh loạn', N'Kính loạn 2 độ', 
 2.0, 1.8, N'Đo bản đồ giác mạc', N'Kiểm tra định kỳ sau 3 tháng'),

(5, N'Đục thủy tinh thể', N'Mắt mờ, chói sáng', N'Phẫu thuật thay thủy tinh thể', N'Không kê đơn', 
 0.5, 0.3, N'Chụp OCT', N'Cần theo dõi tiến triển bệnh'),

(6, N'Viêm giác mạc', N'Đau mắt, chảy nước mắt', N'Dùng thuốc kháng sinh', N'Nhỏ mắt Tobradex', 
 NULL, NULL, N'Xét nghiệm vi khuẩn', N'Không tự ý ngừng thuốc'),

(7, N'Glaucoma (Tăng nhãn áp)', N'Đau đầu, giảm thị lực', N'Dùng thuốc hạ nhãn áp', N'Nhỏ mắt Timolol', 
 1.2, 1.0, N'Đo nhãn áp', N'Thăm khám định kỳ để kiểm soát bệnh'),

(8, N'Lác mắt', N'Nhìn lệch, mỏi mắt', N'Tập luyện cơ mắt, phẫu thuật (nếu cần)', N'Không kê đơn', 
 1.0, 1.0, N'Kiểm tra cơ vận nhãn', N'Theo dõi tiến triển, tập mắt hàng ngày'),

(9, N'Bong võng mạc', N'Nhìn thấy đốm đen, chớp sáng', N'Phẫu thuật laser', N'Không kê đơn', 
 0.8, 0.7, N'Soi đáy mắt', N'Khẩn cấp, cần điều trị ngay'),

(10, N'Mỏi mắt do máy tính', N'Đau đầu, mỏi mắt', N'Điều chỉnh tư thế, nghỉ mắt', N'Nước mắt nhân tạo, kính chống ánh sáng xanh', 
 1.0, 1.0, N'Không cần', N'Áp dụng quy tắc 20-20-20 (20 phút nhìn xa 20 giây)');


INSERT INTO Feedback_Service (appointment_id, feedback_text, feedback_date, feedback_rating, response_text, response_date, staff_id)
VALUES
(1, N'Dịch vụ tốt, bác sĩ nhiệt tình', '2025-02-21', 5, N'Cảm ơn bạn đã phản hồi!', '2025-02-22', 1),
(2, N'Khá hài lòng với trải nghiệm', '2025-02-21', 4, N'Cảm ơn bạn, chúng tôi sẽ cố gắng hơn!', '2025-02-22', 2),
(3, N'Thời gian chờ hơi lâu', '2025-02-22', 3, N'Chúng tôi xin lỗi về sự bất tiện này', '2025-02-23', 3),
(4, N'Bác sĩ tận tâm, nhưng cơ sở vật chất cần cải thiện', '2025-02-23', 4, N'Chúng tôi sẽ ghi nhận góp ý của bạn', '2025-02-24', 4),
(5, N'Rất hài lòng với dịch vụ', '2025-02-24', 5, N'Cảm ơn bạn đã tin tưởng!', '2025-02-25', 5),
(6, N'Giá dịch vụ hơi cao', '2025-02-24', 3, N'Chúng tôi sẽ xem xét về giá cả', '2025-02-25', 6),
(7, N'Nhân viên hỗ trợ nhiệt tình', '2025-02-25', 5, N'Cảm ơn bạn đã phản hồi!', '2025-02-26', 7),
(8, N'Bác sĩ giỏi, giải thích dễ hiểu', '2025-02-26', 5, N'Chúng tôi rất vui khi nhận được phản hồi này!', '2025-02-27', 2);


INSERT INTO Feedback_Doctor (appointment_id, feedback_text, feedback_date, feedback_rating, response_text, response_date, staff_id)
VALUES
(1, N'Bác sĩ rất tận tâm, khám kỹ lưỡng.', '2025-02-21', 5, N'Cảm ơn bạn đã phản hồi!', '2025-02-22', 1),
(2, N'Dịch vụ tốt, nhưng chờ hơi lâu.', '2025-02-21', 4, N'Xin lỗi vì sự bất tiện. Chúng tôi sẽ cải thiện!', '2025-02-22', 2),
(3, N'Bác sĩ thân thiện nhưng phòng khám hơi đông.', '2025-02-19', 4, NULL, NULL, NULL),
(4, N'Tôi cảm thấy chưa hài lòng về cách tư vấn.', '2025-02-18', 2, N'Chúng tôi sẽ kiểm tra lại và cải thiện.', '2025-02-19', 3),
(5, N'Rất hài lòng, bác sĩ tư vấn rất rõ ràng.', '2025-02-19', 5, N'Cảm ơn bạn đã tin tưởng!', '2025-02-20', 4),
(6, N'Bác sĩ khám cẩn thận, nhưng giá hơi cao.', '2025-02-21', 3, N'Chúng tôi sẽ xem xét điều chỉnh dịch vụ.', '2025-02-22', 1),
(7, N'Dịch vụ ổn, nhưng thời gian chờ quá lâu.', '2025-02-22', 3, NULL, NULL, NULL),
(8, N'Bác sĩ chuyên môn cao, tư vấn tận tình.', '2025-02-22', 5, N'Cảm ơn bạn đã ủng hộ!', '2025-02-23', 5),
(9, N'Không hài lòng với cách tiếp đón.', '2025-02-22', 2, N'Chúng tôi sẽ huấn luyện lại nhân viên.', '2025-02-23', 2),
(10, N'Rất hài lòng, tôi sẽ quay lại.', '2025-02-23', 5, N'Mong được phục vụ bạn lần sau!', '2025-02-24', 3),
(11, N'Khá ổn, nhưng phòng khám hơi nhỏ.', '2025-02-24', 4, NULL, NULL, NULL);


-- Chèn dữ liệu vào bảng Follow_Up
INSERT INTO Follow_Up (appointment_id, next_follow_up_date, follow_up_status, follow_up_description, follow_up_note) 
VALUES 
(1, '2025-08-01', 'Pending', N'Tái khám đo mắt lại', N'Mang theo kính hiện tại'),
(2, '2025-02-20', 'Completed', N'Kiểm tra tình trạng viêm', N'Bệnh nhân đáp ứng tốt'),
(3, '2025-03-15', 'Scheduled', N'Đánh giá tình trạng khô mắt', N'Có thể thay đổi thuốc nếu cần');



