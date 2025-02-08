-- Insert data into Role
INSERT INTO Role (role_name) VALUES
('Admin'),
('Sales'),
(N'Bác sĩ'),
(N'Thạc sĩ'),
(N'Tiến sĩ'),
(N'Bác sĩ chuyên khoa I'),
(N'Bác sĩ chuyên khoa II'),
(N'Bác sĩ nội trú'),
(N'Giáo sư'),
(N'Phó giáo sư'),
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
('guest1', 'guestpass', 'guest1@example.com', '6677889900', 4, NULL, NULL);

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