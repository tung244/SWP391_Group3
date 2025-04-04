-- Insert data into Doctors

INSERT INTO Doctors (account_id, doctor_name, experience_years, specialization_id, profile_image, rating, gender, dob, address, doctor_status) VALUES
(2, 'Lee Min Ho', 10, 1, 'https://res.cloudinary.com/djmftornv/image/upload/v1739089349/doctor/lxilek68buesdfztcww3.jpg', 4.8, 'Male', '1987-06-22', 'Seoul, South Korea','Active'),
(3, 'Song Hye Kyo', 8, 2, 'https://res.cloudinary.com/djmftornv/image/upload/v1739089348/doctor/e6cmqgkqartwvvxo45s0.jpg', 4.6, 'Female', '1981-11-22', 'Seoul, South Korea','Active'),
(4, 'Kim Soo Hyun', 12, 3, 'https://res.cloudinary.com/djmftornv/image/upload/v1739089348/doctor/h1en31pbtigykshv0tf7.jpg', 4.9, 'Male', '1988-02-16', 'Seoul, South Korea','Active'),
(5, 'Park Shin Hye', 7, 4, 'https://res.cloudinary.com/djmftornv/image/upload/v1739089347/doctor/endxfdr01bzwk4sjpbfa.jpg', 4.5, 'Female', '1990-02-18', 'Gwangju, South Korea','Active'),
(6, 'Ji Chang Wook', 9, 5, 'https://res.cloudinary.com/djmftornv/image/upload/v1739089474/doctor/bwsuvnyhcaha1xfhfau1.jpg', 4.7, 'Male', '1987-07-05', 'Seoul, South Korea','Active');


-- Insert data into Degree
INSERT INTO Degree (degree_name) VALUES
(N'Bác sĩ nội trú'),
(N'Bác sĩ chuyên khoa I'),
(N'Bác sĩ chuyên khoa II'),
(N'Thạc sĩ'),
(N'Tiến sĩ'),
(N'Phó giáo sư'),
(N'Giáo sư');



