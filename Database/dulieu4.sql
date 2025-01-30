-- Chèn d? li?u vào b?ng MedicalHistory
INSERT INTO MedicalHistory (appointment_id, diagnosis, treatment, note) 
VALUES 
(1, 'C?n th?', 'Kính thu?c', 'Tái khám sau 6 tháng'),
(2, 'Viêm k?t m?c', 'Thu?c nh? m?t', 'Tránh ti?p xúc v?i b?i b?n'),
(3, 'Khô m?t', 'Dùng n??c m?t nhân t?o', 'H?n ch? nhìn màn hình quá lâu');

-- Chèn d? li?u vào b?ng Follow_Up
INSERT INTO Follow_Up (appointment_id, next_follow_up_date, follow_up_status, follow_up_description, follow_up_note) 
VALUES 
(1, '2025-08-01', 'Pending', 'Tái khám ?o m?t l?i', 'Mang theo kính hi?n t?i'),
(2, '2025-02-20', 'Completed', 'Ki?m tra tình tr?ng viêm', 'B?nh nhân ?áp ?ng t?t'),
(3, '2025-03-15', 'Scheduled', '?ánh giá tình tr?ng khô m?t', 'Có th? thay ??i thu?c n?u c?n');
