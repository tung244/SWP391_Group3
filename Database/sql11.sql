INSERT INTO Modules (module_name, DESCRIPTION, module_img)
VALUES 
    ('Appointment', N'Module quản lý lịch hẹn', 'bx bx-calendar'),
    ('Blog', N'Module quản lý blog', 'bx bx-book'),
    ('Certificate', N'Module quản lý chứng chỉ', 'bx bx-award'),
    ('Checking', N'Module kiểm tra sức khỏe', 'bx bx-check-circle'),
    ('Customer', N'Module quản lý khách hàng', 'bx bx-user'),
    ('Degree', N'Module quản lý bằng cấp', 'bx bx-graduation'),
    ('Doctor', N'Module quản lý bác sĩ', 'bx bx-user-md'),
    ('Email', N'Module quản lý email', 'bx bx-envelope'),
    ('Services', N'Module quản lý dịch vụ', 'bx bx-briefcase'),
    ('Specialization', N'Module quản lý chuyên môn', 'bx bx-star'),
	('DashBoard',N'Module trang chủ','bx bx-home');


	
	
	INSERT INTO Permission (module_id, permission_name, permission_path)
VALUES
    -- Module Appointment (module_id = 1)
    (1, N'View Appointment List', '/admin/AppointmentList'),
    (1, N'View Appointment Stats', '/admin/AppointmentStats'),
    (1, N'View Note Medical', '/admin/NoteMedical'),
    (1, N'Update Appointment', '/admin/UpdateAppointment'),
    (1, N'Get Available Slots', '/admin/getAvailableSlots'),

    -- Module Blog (module_id = 2)
    (2, N'View Blog Dashboard', '/admin/blog_dashboard'),
    (2, N'Create Blog', '/admin/create_blog'),
    (2, N'Delete Blog', '/admin/delete_blog'),
    (2, N'Demo Post', '/admin/demo_Post'),
    (2, N'Save Image', '/admin/save_image'),
    (2, N'Save Blog', '/admin/save_blog'),
    (2, N'Save Draft', '/admin/save_draft'),
    (2, N'Update Status Blog', '/admin/update_status_blog'),
    (2, N'Update Blog', '/admin/update_blog'),

    -- Module Certificate (module_id = 3)
    (3, N'View Certificate List', '/admin/listCertificate'),

    -- Module Checking (module_id = 4)
    (4, N'Check Doctor Degree', '/admin/checkingDoctorDegree'),
    (4, N'Update Doctor Degree', '/admin/checkingUpdateDegreeDoctor'),

    -- Module Customer (module_id = 5)
    (5, N'View Customer Detail', '/admin/CustomerDetail'),
    (5, N'View Customers', '/admin/customers'),
    (5, N'Search Customer', '/admin/searchcustomer'),

    -- Module Degree (module_id = 6)
    (6, N'View Degree List', '/admin/listDegree'),

    -- Module Doctor (module_id = 7)
    (7, N'Add Degree', '/admin/addDegree'),
    (7, N'Add Doctor', '/admin/AddDoctor'),
    (7, N'View Certificate Detail', '/admin/certificateDetail'),
    (7, N'Change Password', '/admin/changePass'),
    (7, N'Create Account', '/admin/createAccount'),
    (7, N'Create Doctor', '/admin/createDoctor'),
    (7, N'View Degree Detail', '/admin/degreeDetail'),
    (7, N'View Doctor Profile', '/admin/doctorProfile'),
    (7, N'View Doctor Stats', '/admin/DoctorStats'),
    (7, N'Edit Doctor Profile', '/admin/editDoctorProfile'),
    (7, N'Get Doctor Calendar', '/admin/GetDoctorCalendar'),
    (7, N'View Doctor List', '/admin/DoctorList'),
    (7, N'View Doctor Detail', '/admin/listDoctorDetail'),
    (7, N'Update Doctor', '/admin/updateDoctor'),

    -- Module Email (module_id = 8) - Không có /admin/callback và /admin/login_show_email
    (8, N'Read Email', '/admin/read_email'),
    (8, N'Send Email', '/admin/sendmail'),
    (8, N'Send Auto Email', '/admin/sendMailAuto'),
    (8, N'Show Email', '/admin/show_email'),
    (8, N'View Email Statistics', '/admin/email_statistics'),

    -- Module Services (module_id = 9)
    (9, N'Add Service', '/admin/AddService'),
    (9, N'Delete Service', '/admin/deleteService'),
    (9, N'Search Service', '/admin/searchService'),
    (9, N'View Service List', '/admin/ServiceList'),
    (9, N'View Service Revenue Stats', '/admin/ServiceRevenueStats'),
    (9, N'Update Service', '/admin/UpdateService'),

    -- Module Specialization (module_id = 10)
    (10, N'View Specialization List', '/admin/listSpecialization'),
	
	-- Module DashBoard(module_id = 11)
	(11, N'DashBoard','/admin/dashboard');

	INSERT INTO Permission_Role (role_id, permission_id)
VALUES
    -- Admin (role_id = 1) - Tất cả 48 quyền
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
    (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
    (1, 11), (1, 12), (1, 13), (1, 14), (1, 15),
    (1, 16), (1, 17), (1, 18), (1, 19), (1, 20),
    (1, 21), (1, 22), (1, 23), (1, 24), (1, 25),
    (1, 26), (1, 27), (1, 28), (1, 29), (1, 30),
    (1, 31), (1, 32), (1, 33), (1, 34), (1, 35),
    (1, 36), (1, 37), (1, 38), (1, 39), (1, 40),
    (1, 41), (1, 42), (1, 43), (1, 44), (1, 45),
    (1, 46), (1, 47),(1,48),

    -- Sales (role_id = 2) - Appointment (1-5), Customer (18-20), Services (43-47), Dashboard(48)
    (2, 1), (2, 2), (2, 3), (2, 4), (2, 5),
    (2, 18), (2, 19), (2, 20),
    (2, 43), (2, 44), (2, 45), (2, 46), (2, 47),(2,48),

    -- Doctor (role_id = 3) - Appointment (1-5),  Doctor (22-35), Dashboard(48)
    (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
    (3, 22), (3, 23), (3, 24), (3, 25), (3, 26),
    (3, 27), (3, 28), (3, 29), (3, 30), (3, 31),
    (3, 32), (3, 33), (3, 34), (3, 35),(3,48),

    -- Customer Support (role_id = 4) - Appointment (1-5), Checking (16-17), Customer (18-20), Email (36-40), Dashboard(48)
    (4, 1), (4, 2), (4, 3), (4, 4), (4, 5),
	(4, 16), (4, 17),
    (4, 18), (4, 19), (4, 20),
    (4, 36), (4, 37), (4, 38), (4, 39), (4, 40),(4,48)

   