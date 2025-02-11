USE EyeCare
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
