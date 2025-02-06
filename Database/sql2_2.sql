
-- Insert data into Certificate_Doctor
INSERT INTO Certificate_Doctor (certificate_id, doctor_id, date_certificate,issued_by) VALUES
(1, 1, '2010-06-15','FPT Edu'),
(2, 2, '2012-08-20','FPT Edu'),
(3, 3, '2015-03-25','FPT Edu'),
(4, 4, '2018-09-10','FPT Edu'),
(5, 5, '2020-11-05','FPT Edu');


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
