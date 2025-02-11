USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'EyeCare')
BEGIN
	ALTER DATABASE EyeCare SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE EyeCare SET ONLINE;
	DROP DATABASE EyeCare;
END

GO

CREATE DATABASE EyeCare
GO

USE EyeCare
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO

CREATE TABLE [Role] (
    role_id INT PRIMARY KEY IDENTITY(1,1),
    role_name NVARCHAR(255) NOT NULL
);

CREATE TABLE Permission (
    permission_id INT PRIMARY KEY IDENTITY(1,1),
    permission_name NVARCHAR(255) NOT NULL
);
CREATE TABLE Specialization(
specialization_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
specialization_name NVARCHAR(255),
specialization_status NVARCHAR(255),
)

CREATE TABLE Permission_Role (
    permission_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (permission_id, role_id),
    FOREIGN KEY (permission_id) REFERENCES Permission(permission_id) ,
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255),
    email NVARCHAR(255),
    phone_number NVARCHAR(50),
    created_date DATETIME DEFAULT GETDATE(),
    role_id INT,
	google_id nvarchar(255),
	facebook_id NVARCHAR(255),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY IDENTITY(1,1),
    account_id INT unique,
    doctor_name NVARCHAR(255) NOT NULL,
    experience_years INT,
    specialization_id INT,
    profile_image NVARCHAR(255),
    rating FLOAT,
    gender NVARCHAR(50),
    dob DATE,
    address NVARCHAR(500),
	doctor_status NVARCHAR(255),
	doctor_description NVARCHAR(255),
    FOREIGN KEY(account_id) REFERENCES dbo.Accounts(account_id),
	FOREIGN KEY(specialization_id) REFERENCES dbo.Specialization(specialization_id)
);

CREATE TABLE [Degree](
	degree_id INT PRIMARY KEY IDENTITY(1,1),
	degree_name NVARCHAR(255)
)

CREATE TABLE [Degree_Doctor](
	doctor_id INT,
	degree_id INT,
	PRIMARY KEY(doctor_id,degree_id),
	FOREIGN KEY (doctor_id) REFERENCES dbo.Doctors(doctor_id),
	FOREIGN KEY (degree_id) REFERENCES dbo.Degree(degree_id)
)
CREATE TABLE [Certificate](
	certificate_id INT PRIMARY KEY IDENTITY(1,1),
	certificate_name  NVARCHAR(255),
);

CREATE TABLE Certificate_Doctor(
	certificate_id INT ,
	doctor_id INT,
	date_certificate DATETIME,
	issued_by NVARCHAR(255),
	PRIMARY KEY (doctor_id, certificate_id),
	FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ,
    FOREIGN KEY (certificate_id) REFERENCES Certificate(certificate_id) 
);

CREATE TABLE Customers (
	account_id INT PRIMARY KEY,
    full_name NVARCHAR(255) NOT NULL,
    address NVARCHAR(500),
    dob DATE,
    gender NVARCHAR(50),
    image_profile_user NVARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) 
);






CREATE TABLE Services_Type(
service_type_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
service_type_name NVARCHAR(255),
duration_service NVARCHAR(50),
)
CREATE TABLE [Services](
service_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
service_name NVARCHAR(255),
service_description NVARCHAR(255),
service_introduce nvarchar(1000),
service_benefit nvarchar(1000),
service_status varchar(20),
specialization_id INT,
FOREIGN KEY(specialization_id) REFERENCES dbo.Specialization(specialization_id)
)

CREATE TABLE Services_Detail (
    service_detail_id INT PRIMARY KEY IDENTITY(1,1),
	service_type_id INT,
	service_id INT,
    cost DECIMAL(18,2) NOT NULL
	FOREIGN KEY(service_type_id) REFERENCES dbo.Services_Type(service_type_id),
	FOREIGN KEY(service_id) REFERENCES dbo.Services(service_id)
);

CREATE TABLE Slots (
    slot_id INT PRIMARY KEY IDENTITY(1,1),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    service_type_id INT NOT NULL,
    FOREIGN KEY (service_type_id) REFERENCES Services_Type(service_type_id),
    UNIQUE (start_time, end_time, service_type_id) -- Tránh trùng lặp slot
);


CREATE TABLE Schedules (
    doctor_id INT,
    slot_id INT,
    schedule_date DATE NOT NULL, -- Ngày bác sĩ làm việc
    schedule_status NVARCHAR(255),
    PRIMARY KEY (doctor_id, slot_id, schedule_date),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (slot_id) REFERENCES Slots(slot_id)
);

CREATE TABLE Appointment(
	appointment_id INT PRIMARY KEY IDENTITY(1,1),
	appointment_date DATETIME,
	appointment_status nvarchar(255),
	doctor_id INT,
	slot_id int,
	service_detail_id INT,
	FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
	FOREIGN KEY (slot_id) REFERENCES dbo.Slots(slot_id) ,
	FOREIGN KEY (service_detail_id) REFERENCES dbo.Services_Detail(service_detail_id) ,
	patient_id int,
	FOREIGN KEY (patient_id) REFERENCES dbo.Customers(account_id) ,
);


create table MedicalHistory(
	appointment_id  INT PRIMARY KEY,
	diagnosis nvarchar(255),
	treatment nvarchar(255),
	note nvarchar(255),
	FOREIGN KEY (appointment_id) REFERENCES dbo.Appointment(appointment_id),
);

CREATE TABLE Follow_Up (
    appointment_id INT,
    next_follow_up_date DATE,
    follow_up_status NVARCHAR(50),
    follow_up_description NVARCHAR(255),
    follow_up_note NVARCHAR(255),
	FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id) ,
);

CREATE TABLE Staff (
    account_id INT PRIMARY KEY,
	admin_fullname NVARCHAR(255),
	admin_address NVARCHAR(255),
	admin_dob DATE,
	admin_gender NVARCHAR(50),
	image_profile_admin NVARCHAR(255),
	admin_hired_date DATETIME,
	admin_salary DECIMAL(18,2),
	FOREIGN KEY(account_id) REFERENCES dbo.Accounts(account_id)
);

CREATE TABLE Feedback_Service(
    feedback_id INT IDENTITY(1,1) PRIMARY KEY,
	appointment_id INT,
	FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id) ,
	feedback_text NVARCHAR(255),
	feedback_date DATETIME,
	feedback_rating INT,
);

CREATE TABLE Feedback_Response(
    feedback_id INT PRIMARY KEY,
	response_text NVARCHAR(255),
	response_note NVARCHAR(255),
	response_date datetime,
    account_id INT,
    FOREIGN KEY (account_id) REFERENCES dbo.Accounts(account_id),
	FOREIGN KEY(feedback_id) REFERENCES dbo.Feedback_Service(feedback_id)
);

create table CheckOut(
	checkout_id INT PRIMARY KEY IDENTITY(1,1),
	appointment_id int,
    transaction_type NVARCHAR(255),
	transaction_status nvarchar(255),
	total_bill DECIMAL(18,2),
	checkout_code NVARCHAR(255),
	payer NVARCHAR(255),
	FOREIGN KEY(appointment_id) REFERENCES dbo.Appointment(appointment_id)
);

CREATE TABLE Blog(
blog_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
title NVARCHAR(255),
title_content NVARCHAR(255),
author_id INT,
blog_created_date DATETIME,
FOREIGN KEY(author_id) REFERENCES dbo.Accounts(account_id)

)


CREATE TABLE Images_Type(
image_type_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
image_type NVARCHAR(255),

)

CREATE TABLE Images_Service(
service_id int primary key,
image_main NVARCHAR(255),
image_before NVARCHAR(255),
image_after NVARCHAR(255),
FOREIGN KEY(service_id) REFERENCES dbo.[Services](service_id)
)

CREATE TABLE Images_Video(
image_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
image_url NVARCHAR(255),
image_description NVARCHAR(255),
image_type_id INT,
FOREIGN KEY(image_type_id) REFERENCES dbo.Images_Type(image_type_id)
)


CREATE TABLE Blog_Content (
blog_content_id INT IDENTITY(1,1) PRIMARY KEY,
blog_id INT,
content_type NVARCHAR(50),
content NVARCHAR(Max),
image_id INT,
FOREIGN KEY(blog_id) REFERENCES dbo.Blog(blog_id),
FOREIGN KEY(image_id) REFERENCES dbo.Images_Video(image_id)
)
CREATE TABLE Blog_Image(
blog_id INT,
image_id INT,
PRIMARY KEY(blog_id,image_id),
FOREIGN KEY(blog_id) REFERENCES dbo.Blog(blog_id),
FOREIGN KEY(image_id) REFERENCES dbo.Images_Video(image_id)
)
CREATE TABLE Content_Stories(
patient_name NVARCHAR(255),
image_patient nvarchar(255),
content_stories NVARCHAR(MAX),
PRIMARY KEY(patient_name),

)
CREATE TABLE Banner(
banner_id INT IDENTITY(1,1) PRIMARY KEY,
banner_name NVARCHAR(255),
banner_title NVARCHAR(255),
banner_description NVARCHAR(255),
banner_status NVARCHAR(10),
link_banner NVARCHAR(255),
href_banner NVARCHAR(255)
)

CREATE TABLE Machine(
machine_id INT IDENTITY(1,1) PRIMARY KEY,
machine_name NVARCHAR(255),
machine_description NVARCHAR(max),
machine_img NVARCHAR(255),

)

CREATE TABLE OTP_Services(
otp_id INT IDENTITY(1,1) PRIMARY KEY,
account_id INT,
otp NVARCHAR(20),
created_otp_time NVARCHAR(255),
otp_expiry_date NVARCHAR(255),

)