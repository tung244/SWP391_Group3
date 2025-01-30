-- Chèn d? li?u vào b?ng Services_Type (Lo?i d?ch v?)
INSERT INTO Services_Type (service_type_name, duration_service) 
VALUES 
(N'C? b?n', N'30 phút'),
(N'Nâng cao', N'60 phút'),
(N'Chuyên sâu', N'90 phút');

-- Chèn d? li?u vào b?ng Services (D?ch v? c? th?)
INSERT INTO Services (service_name, service_descriptprion) 
VALUES 
(N'Khám m?t t?ng quát', N'Ki?m tra th? l?c, ?o khúc x?'),
(N'Ki?m tra viêm giác m?c', N'?ánh giá tình tr?ng viêm nhi?m'),
(N'T? v?n khô m?t', N'H??ng d?n ?i?u tr? và phòng ng?a khô m?t'),
(N'Khám t?t khúc x?', N'Ki?m tra c?n th?, vi?n th?, lo?n th?'),
(N'?o nhãn áp', N'Ki?m tra áp l?c n?i nhãn'),
(N'Khám ?áy m?t', N'Ki?m tra võng m?c, phát hi?n b?nh lý m?t'),
(N'Ch?p c?t l?p OCT', N'Ki?m tra b?nh lý võng m?c, th?n kinh th? giác'),
(N'Ph?u thu?t LASIK', N'?i?u tr? t?t khúc x? b?ng laser'),
(N'?i?u tr? ??c th?y tinh th?', N'Ph?u thu?t thay th?y tinh th? nhân t?o'),
(N'Xét nghi?m n??c m?t', N'?ánh giá ch?t l??ng và s? l??ng n??c m?t'),
(N'Khám m?t tr? em', N'Ki?m tra m?t cho tr? em t? 3 tu?i tr? lên'),
(N'T?m soát b?nh lý võng m?c ti?u ???ng', N'Phát hi?n s?m bi?n ch?ng ti?u ???ng lên m?t');

-- Chèn d? li?u vào b?ng Services_Detail (Chi ti?t d?ch v?, combo khám m?t)
INSERT INTO Services_Detail (service_type_id, service_id, cost) 
VALUES 
-- D?ch v? C? b?n
(1, 1, 200000), -- Khám m?t t?ng quát
(1, 2, 150000), -- Ki?m tra viêm giác m?c
(1, 3, 180000), -- T? v?n khô m?t
(1, 4, 220000), -- Khám t?t khúc x?
(1, 5, 250000), -- ?o nhãn áp
(1, 6, 300000), -- Khám ?áy m?t
(1, 11, 200000), -- Khám m?t tr? em
(1, 12, 280000), -- T?m soát b?nh lý võng m?c ti?u ???ng

-- D?ch v? Nâng cao
(2, 1, 350000), -- Khám m?t t?ng quát nâng cao
(2, 2, 300000), -- Ki?m tra viêm giác m?c nâng cao
(2, 3, 320000), -- T? v?n khô m?t nâng cao
(2, 4, 400000), -- Khám t?t khúc x? nâng cao
(2, 5, 450000), -- ?o nhãn áp nâng cao
(2, 6, 500000), -- Khám ?áy m?t nâng cao
(2, 7, 700000), -- Ch?p c?t l?p OCT
(2, 8, 15000000), -- Ph?u thu?t LASIK
(2, 9, 18000000), -- ?i?u tr? ??c th?y tinh th?
(2, 10, 350000), -- Xét nghi?m n??c m?t nâng cao
(2, 11, 300000), -- Khám m?t tr? em nâng cao
(2, 12, 400000), -- T?m soát b?nh lý võng m?c ti?u ???ng nâng cao

-- D?ch v? Chuyên sâu
(3, 6, 700000), -- Khám ?áy m?t chuyên sâu
(3, 7, 1200000), -- Ch?p c?t l?p OCT chuyên sâu
(3, 8, 25000000), -- Ph?u thu?t LASIK chuyên sâu
(3, 9, 28000000), -- ?i?u tr? ??c th?y tinh th? chuyên sâu
(3, 10, 500000), -- Xét nghi?m n??c m?t chuyên sâu
(3, 12, 600000); -- T?m soát b?nh lý võng m?c ti?u ???ng chuyên sâu


INSERT INTO Appointment (appointment_date, appointment_status, doctor_id, time_begin, time_end, service_id, customer_id, patient_id, phonenumber_patient) 
VALUES 
('2025-02-01 10:00:00', 'Scheduled', 1, '2025-02-01 10:00:00', '2025-02-01 10:30:00', 1, 7, 1, '0123456789'),
('2025-02-02 14:00:00', 'Completed', 2, '2025-02-02 14:00:00', '2025-02-02 14:45:00', 2, 7, 2, '0987654321'),
('2025-02-03 09:30:00', 'Canceled', 3, '2025-02-03 09:30:00', '2025-02-03 10:00:00', 3, 7, 3, '0369857412');




