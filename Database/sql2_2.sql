USE EyeCare
-- Insert data into Certificate_Doctor
INSERT INTO Certificate_Doctor (certificate_id, doctor_id, date_certificate,issued_by) VALUES
(1, 1, '2010-06-15','FPT Edu'),
(2, 2, '2012-08-20','FPT Edu'),
(3, 3, '2015-03-25','FPT Edu'),
(4, 4, '2018-09-10','FPT Edu'),
(5, 5, '2020-11-05','FPT Edu');


insert Into CustomerRank(rankName, minAmount) values
(N'Đồng' , 2000000),
(N'Bạc' , 5000000),
(N'Vàng' , 10000000),
(N'Bạch kim' , 20000000),
(N'Kim cương' , 5000000);


INSERT INTO Discount (discountName, startDate, endDate, [status])  
VALUES  
(N'Giảm giá cố định cho hạng Đồng', NULL, NULL, 1),  
(N'Giảm giá cố định cho hạng Bạc', NULL, NULL, 1),  
(N'Giảm giá cố định cho hạng Vàng', NULL, NULL, 1),  
(N'Giảm giá cố định cho hạng Bạch Kim', NULL, NULL, 1),  
(N'Giảm giá cố định cho hạng Kim Cương', NULL, NULL, 1);  
INSERT INTO DiscountDetail ([percent], rankId, discountId)  
VALUES  
(5, 1, 1),  -- Đồng  
(7, 2, 2),  -- Bạc  
(9, 3, 3),  -- Vàng  
(11, 4, 4), -- Bạch Kim  
(15, 5, 5); -- Kim Cương  


INSERT INTO Discount (discountName, startDate, endDate, [status])  
VALUES  
(N'Giảm giá dịp Tết Nguyên Đán', '2025-01-20', '2025-02-10', 1),  
(N'Giảm giá dịp 8/3', '2025-03-07', '2025-03-09', 1),  
(N'Giảm giá dịp 30/4 - 1/5', '2025-04-29', '2025-05-02', 1),  
(N'Giảm giá dịp Trung Thu', '2025-09-05', '2025-09-10', 1),  
(N'Giảm giá Black Friday', '2025-11-25', '2025-11-30', 1);

INSERT INTO DiscountDetail ([percent], rankId, discountId)  
VALUES  
(10, 1, 6), (12, 2, 6), (15, 3, 6), (18, 4, 6), (20, 5, 6), -- Tết Nguyên Đán  
(8, 1, 7), (10, 2, 7), (12, 3, 7), (15, 4, 7), (18, 5, 7), -- 8/3  
(7, 1, 8), (9, 2, 8), (11, 3, 8), (14, 4, 8), (17, 5, 8), -- 30/4 - 1/5  
(5, 1, 9), (7, 2, 9), (9, 3, 9), (12, 4, 9), (15, 5, 9), -- Trung Thu  
(15, 1, 10), (18, 2, 10), (20, 3, 10), (25, 4, 10), (30, 5, 10); 

-- Insert data into Customers
INSERT INTO Customers (account_id, full_name, address, dob, gender, image_profile_user,rankId) VALUES
(7, 'Chris Davis', '654 Fir St', '1985-02-14', 'Male', 'chrisd.jpg' ,4 );
