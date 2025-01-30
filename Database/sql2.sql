-- Insert data into Doctors
INSERT INTO Doctors (account_id, doctor_name, experience_years, specialization_id, profile_image, rating, gender, dob, address) VALUES
(2, 'Lee Min Ho', 10, 1, 'leeminho.jpg', 4.8, 'Male', '1987-06-22', 'Seoul, South Korea'),
(3, 'Song Hye Kyo', 8, 2, 'songhyekyo.jpg', 4.6, 'Female', '1981-11-22', 'Seoul, South Korea'),
(4, 'Kim Soo Hyun', 12, 3, 'kimsoohyun.jpg', 4.9, 'Male', '1988-02-16', 'Seoul, South Korea'),
(5, 'Park Shin Hye', 7, 4, 'parkshinhye.jpg', 4.5, 'Female', '1990-02-18', 'Gwangju, South Korea'),
(6, 'Ji Chang Wook', 9, 5, 'jichangwook.jpg', 4.7, 'Male', '1987-07-05', 'Seoul, South Korea');


-- Insert data into Certificate_Doctor
INSERT INTO Certificate_Doctor (certificate_id, doctor_id, date_certificate) VALUES
(1, 1, '2010-06-15'),
(2, 2, '2012-08-20'),
(3, 3, '2015-03-25'),
(4, 4, '2018-09-10'),
(5, 5, '2020-11-05');

-- Insert data into Customers
INSERT INTO Customers (account_id, full_name, address, dob, gender, image_profile_user) VALUES
(7, 'Chris Davis', '654 Fir St', '1985-02-14', 'Male', 'chrisd.jpg');
-- Insert data into Slots
INSERT INTO Slots (slot_begin, slot_end) VALUES
('2024-01-01 08:00:00', '2024-01-01 09:00:00'),
('2024-01-01 09:00:00', '2024-01-01 10:00:00'),
('2024-01-01 10:00:00', '2024-01-01 11:00:00'),
('2024-01-01 11:00:00', '2024-01-01 12:00:00'),
('2024-01-01 13:00:00', '2024-01-01 14:00:00');

-- Insert data into Schedules
INSERT INTO Schedules (doctor_id, slot_id, schedule_status) VALUES
(1, 1, 'Available'),
(2, 2, 'Booked'),
(3, 3, 'Available'),
(4, 4, 'Booked'),
(5, 5, 'Available');