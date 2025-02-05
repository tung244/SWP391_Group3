-- **1. Phẫu thuật khúc xạ (Refractive Surgery - specialization_id = 8)**
INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id) 
VALUES 
(N'Phẫu thuật khúc xạ', NULL, 8, NULL); -- Cha

DECLARE @parent_id INT = SCOPE_IDENTITY();

INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id)
VALUES 
(N'Phẫu thuật Phakic', NULL, 8, @parent_id),
(N'Phẫu thuật Relex Smile', NULL, 8, @parent_id),
(N'Phẫu thuật Femtosecond Lasik', NULL, 8, @parent_id),
(N'Phẫu thuật SBK Lasik', NULL, 8, @parent_id),
(N'CrossLinking - Gia cố giác mạc', NULL, 8, @parent_id),
(N'Phẫu thuật lão thị Presbyond', NULL, 8, @parent_id),
(N'Diễn đàn Lasik & Phakic', NULL, 8, @parent_id);

-- **2. Phẫu thuật đục thủy tinh thể (Ophthalmic Surgery - specialization_id = 2)**
INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id) 
VALUES 
(N'Phẫu thuật đục thủy tinh thể', NULL, 2, NULL);

SET @parent_id = SCOPE_IDENTITY();

INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id)
VALUES 
(N'Phẫu thuật Phaco', NULL, 2, @parent_id),
(N'Phẫu thuật Laser Cataract', NULL, 2, @parent_id),
(N'Các loại thủy tinh thể nhân tạo', NULL, 2, @parent_id);

-- **3. Điều trị bệnh võng mạc (Retinal Disease - specialization_id = 6)**
INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id) 
VALUES 
(N'Điều trị bệnh võng mạc', NULL, 6, NULL);

SET @parent_id = SCOPE_IDENTITY();

INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id)
VALUES 
(N'Phẫu thuật cắt dịch kính', NULL, 6, @parent_id),
(N'Phẫu thuật độn đai', NULL, 6, @parent_id),
(N'Thủ thuật Laser quang đông', NULL, 6, @parent_id),
(N'Tiêm nội nhãn', NULL, 6, @parent_id);

-- **4. Điều trị Glocom (General Ophthalmology - specialization_id = 1)**
INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id) 
VALUES 
(N'Điều trị Glocom', NULL, 1, NULL);

SET @parent_id = SCOPE_IDENTITY();

INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id)
VALUES 
(N'Thủ thuật tạo hình bè chọn lọc bằng Laser', NULL, 1, @parent_id),
(N'Phẫu thuật đặt van dẫn lưu tiền phòng', NULL, 1, @parent_id);

-- **5. Nhãn nhi (Pediatric Ophthalmology - specialization_id = 3)**
INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id) 
VALUES 
(N'Nhãn nhi', NULL, 3, NULL);

SET @parent_id = SCOPE_IDENTITY();

INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id)
VALUES 
(N'Khám khúc xạ học đường', NULL, 3, @parent_id),
(N'Kính chỉnh hình giác mạc Ortho-K', NULL, 3, @parent_id),
(N'Kiểm soát tiến triển cận thị', NULL, 3, @parent_id);

-- **6. Tạo hình và trung phẫu mắt (Cosmetic Ophthalmology - specialization_id = 7)**
INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id) 
VALUES 
(N'Tạo hình và trung phẫu mắt', NULL, 7, NULL);

-- **7. Các gói khám và điều trị khác (General Ophthalmology - specialization_id = 1)**
INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id) 
VALUES 
(N'Các gói khám và điều trị khác', NULL, 1, NULL);

SET @parent_id = SCOPE_IDENTITY();

INSERT INTO [Services] (service_name, service_description, specialization_id, parent_id)
VALUES 
(N'Đo thị lực và kiểm tra mắt', NULL, 1, @parent_id),
(N'Khám chuyên sâu trước phẫu thuật khúc xạ', NULL, 1, @parent_id),
(N'Tầm soát đục thủy tinh thể', NULL, 1, @parent_id),
(N'Tầm soát thoái hóa võng mạc', NULL, 1, @parent_id),
(N'Tầm soát Glaucoma', NULL, 1, @parent_id),
(N'Điều trị giác mạc chóp', NULL, 1, @parent_id);
