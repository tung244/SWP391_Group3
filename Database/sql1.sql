USE EyeCare
INSERT INTO Role (role_name) VALUES
('Admin'),
('Sales'),
('Doctors'),
('Customer Support'),
('Customer')

-- Insert data into Specialization
INSERT INTO Specialization (specialization_name, specialization_status) VALUES
(N'General Ophthalmology - Bệnh lý Mắt tổng quát', 'Active'),
(N'Ophthalmic Surgery - Phẫu thuật Mắt', 'Active'),
(N'Pediatric Ophthalmology - Nhãn khoa nhi', 'Active'),
(N'Neuro-Ophthalmology - Mắt học thần kinh', 'Active'),
(N'Corneal Disease - Bệnh lý giác mạc', 'Active'),
(N'Retinal Disease - Bệnh lý võng mạc', 'Active'),
(N'Cosmetic Ophthalmology - Chuyên khoa mắt thẩm mỹ', 'Active'),
(N'Refractive Surgery - Khúc xạ học', 'Active'),
(N'Iris Disease - Chuyên khoa mống mắt', 'Active'),
(N'Pediatric Eye Care - Chuyên khoa mắt trẻ em', 'Active');


-- Insert data into Accounts
INSERT INTO Accounts (username, password, email, phone_number, role_id, google_id, facebook_id) VALUES
('admin1', 'pass123', 'admin1@example.com', '1234567890', 1, NULL, NULL),
('doctor1', 'doctorpass1', 'doctor1@example.com', '1112233445', 3, NULL, NULL),
('doctor2', 'doctorpass2', 'doctor2@example.com', '1112233446', 3, NULL, NULL),
('doctor3', 'doctorpass3', 'doctor3@example.com', '1112233447', 3, NULL, NULL),
('doctor4', 'doctorpass4', 'doctor4@example.com', '1112233448', 3, NULL, NULL),
('doctor5', 'doctorpass5', 'doctor5@example.com', '1112233449', 3, NULL, NULL),
('guest1', 'guestpass', 'dinhthanhtung2442k4@gmail.com', '6677889900', 5, NULL, NULL);


INSERT INTO Accounts (username, password, email, phone_number, role_id, google_id, facebook_id) VALUES
('staff1', 'staffpass1', 'staff1@example.com', '1000000001', 2, NULL, NULL),
('staff2', 'staffpass2', 'staff2@example.com', '1000000002', 2, NULL, NULL),
('staff3', 'staffpass3', 'staff3@example.com', '1000000003', 2, NULL, NULL),
('staff4', 'staffpass4', 'staff4@example.com', '1000000004', 2, NULL, NULL),
('staff5', 'staffpass5', 'staff5@example.com', '1000000005', 2, NULL, NULL),
('staff6', 'staffpass6', 'staff6@example.com', '1000000006', 2, NULL, NULL),
('staff7', 'staffpass7', 'staff7@example.com', '1000000007', 2, NULL, NULL),
('support1', 'supportpass1', 'support1@example.com', '1000000011', 5, NULL, NULL),
('support2', 'supportpass2', 'support2@example.com', '1000000012', 5, NULL, NULL),
('support3', 'supportpass3', 'support3@example.com', '1000000013', 5, NULL, NULL),
('support4', 'supportpass4', 'support4@example.com', '1000000014', 5, NULL, NULL),
('support5', 'supportpass5', 'support5@example.com', '1000000015', 5, NULL, NULL),
('support6', 'supportpass6', 'support6@example.com', '1000000016', 5, NULL, NULL),
('support7', 'supportpass7', 'support7@example.com', '1000000017', 5, NULL, NULL),
('support8', 'supportpass8', 'support8@example.com', '1000000018', 5, NULL, NULL);

INSERT INTO Staff (account_id, admin_fullname, admin_address, admin_dob, admin_gender, image_profile_admin, admin_hired_date, admin_salary)
VALUES
((SELECT account_id FROM Accounts WHERE username = 'staff1'), N'Nguyễn Văn A', N'Hà Nội', '1990-01-15', N'Nam', 'staff1.jpg', GETDATE(), 12000000),
((SELECT account_id FROM Accounts WHERE username = 'staff2'), N'Trần Thị B', N'Hồ Chí Minh', '1992-05-10', N'Nữ', 'staff2.jpg', GETDATE(), 13000000),
((SELECT account_id FROM Accounts WHERE username = 'staff3'), N'Phạm Văn C', N'Đà Nẵng', '1993-07-25', N'Nam', 'staff3.jpg', GETDATE(), 12500000),
((SELECT account_id FROM Accounts WHERE username = 'staff4'), N'Lê Thị D', N'Cần Thơ', '1991-09-12', N'Nữ', 'staff4.jpg', GETDATE(), 12800000),
((SELECT account_id FROM Accounts WHERE username = 'staff5'), N'Hồ Văn E', N'Hải Phòng', '1995-11-30', N'Nam', 'staff5.jpg', GETDATE(), 12300000),
((SELECT account_id FROM Accounts WHERE username = 'staff6'), N'Vũ Thị F', N'Bình Dương', '1990-03-05', N'Nữ', 'staff6.jpg', GETDATE(), 12600000),
((SELECT account_id FROM Accounts WHERE username = 'staff7'), N'Đỗ Văn G', N'Quảng Ninh', '1994-06-20', N'Nam', 'staff7.jpg', GETDATE(), 12700000),
((SELECT account_id FROM Accounts WHERE username = 'support1'), N'Nguyễn Thị H', N'Hà Nội', '1991-08-08', N'Nữ', 'support1.jpg', GETDATE(), 10000000),
((SELECT account_id FROM Accounts WHERE username = 'support2'), N'Bùi Văn I', N'Hồ Chí Minh', '1992-10-22', N'Nam', 'support2.jpg', GETDATE(), 10500000),
((SELECT account_id FROM Accounts WHERE username = 'support3'), N'Hoàng Thị J', N'Đà Nẵng', '1993-12-18', N'Nữ', 'support3.jpg', GETDATE(), 10200000),
((SELECT account_id FROM Accounts WHERE username = 'support4'), N'Phan Văn K', N'Cần Thơ', '1990-04-25', N'Nam', 'support4.jpg', GETDATE(), 10300000),
((SELECT account_id FROM Accounts WHERE username = 'support5'), N'Trịnh Thị L', N'Hải Phòng', '1995-01-05', N'Nữ', 'support5.jpg', GETDATE(), 10100000),
((SELECT account_id FROM Accounts WHERE username = 'support6'), N'Ngô Văn M', N'Bình Dương', '1994-02-14', N'Nam', 'support6.jpg', GETDATE(), 10400000),
((SELECT account_id FROM Accounts WHERE username = 'support7'), N'Đinh Thị N', N'Quảng Ninh', '1991-09-07', N'Nữ', 'support7.jpg', GETDATE(), 10600000),
((SELECT account_id FROM Accounts WHERE username = 'support8'), N'Kiều Văn O', N'Long An', '1993-05-19', N'Nam', 'support8.jpg', GETDATE(), 10700000);


-- Insert data into Certificate
INSERT INTO Certificate (certificate_name) VALUES
(N'Chứng chỉ bác sĩ chuyên khoa mắt'),
(N'Chứng chỉ bác sĩ chuyên khoa mắt cấp II'),
(N'Chứng chỉ bác sĩ chuyên khoa mắt cấp I'),
(N'Chứng chỉ phẫu thuật mắt'),
(N'Chứng chỉ đào tạo chẩn đoán hình ảnh mắt'),
(N'Chứng chỉ điều trị bệnh lý mắt trẻ em'),
(N'Chứng chỉ phẫu thuật mắt thẩm mỹ'),
(N'Hội viên Hội Nhãn Khoa Việt Nam'),
(N'Hội viên Hiệp hội Nhãn Khoa Thế Giới');