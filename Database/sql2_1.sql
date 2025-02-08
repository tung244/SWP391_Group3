-- Insert data into Doctors
INSERT INTO Doctors (account_id, doctor_name, experience_years, specialization_id, profile_image, rating, gender, dob, address, doctor_status) VALUES
(2, 'Lee Min Ho', 10, 1, 'leeminho.jpg', 4.8, 'Male', '1987-06-22', 'Seoul, South Korea','active'),
(3, 'Song Hye Kyo', 8, 2, 'songhyekyo.jpg', 4.6, 'Female', '1981-11-22', 'Seoul, South Korea','active'),
(4, 'Kim Soo Hyun', 12, 3, 'kimsoohyun.jpg', 4.9, 'Male', '1988-02-16', 'Seoul, South Korea','active'),
(5, 'Park Shin Hye', 7, 4, 'parkshinhye.jpg', 4.5, 'Female', '1990-02-18', 'Gwangju, South Korea','active'),
(6, 'Ji Chang Wook', 9, 5, 'jichangwook.jpg', 4.7, 'Male', '1987-07-05', 'Seoul, South Korea','active');

-- Insert data into Degree
INSERT INTO Degree (degree_name) VALUES
(N'Bác sĩ nội trú'),
(N'Bác sĩ chuyên khoa I'),
(N'Bác sĩ chuyên khoa II'),
(N'Thạc sĩ'),
(N'Tiến sĩ'),
(N'Phó giáo sư'),
(N'Giáo sư');

-- Insert data into Degree
INSERT INTO Degree_Doctor (doctor_id, degree_id) VALUES
(1,1),
(1,4),
(2,2),
(2,5),
(2,6),
(3,3),
(3,5),
(3,7),
(4,1),
(4,3),
(5,2),
(5,5);




