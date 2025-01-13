
CREATE TABLE Role (
    role_id INT PRIMARY KEY IDENTITY(1,1),
    role_name NVARCHAR(255) NOT NULL
);


CREATE TABLE Permission (
    permission_id INT PRIMARY KEY IDENTITY(1,1),
    permission_name NVARCHAR(255) NOT NULL
);


CREATE TABLE Permission_Role (
    permission_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (permission_id, role_id),
    FOREIGN KEY (permission_id) REFERENCES Permission(permission_id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES Role(role_id) ON DELETE CASCADE
);


CREATE TABLE Account (
    account_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    email NVARCHAR(255),
    phone_number NVARCHAR(50),
    created_date DATETIME DEFAULT GETDATE(),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(role_id) ON DELETE SET NULL
);


CREATE TABLE UserProfile (
    account_id INT PRIMARY KEY,
    full_name NVARCHAR(255) NOT NULL,
    address NVARCHAR(500),
    dob DATE,
    gender NVARCHAR(50),
    service_package NVARCHAR(255),
    image_profile_user NVARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);


CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY IDENTITY(1,1),
    account_id INT,
    doctor_name NVARCHAR(255) NOT NULL,
    experience_years INT,
    specialization NVARCHAR(255),
    profile_image NVARCHAR(255),
    rating FLOAT,
    gender NVARCHAR(50),
    dob DATE,
    address NVARCHAR(500),
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE SET NULL
);


CREATE TABLE Certificate (
    certificate_id INT PRIMARY KEY IDENTITY(1,1),
    doctor_id INT NOT NULL,
    certificate_name NVARCHAR(255) NOT NULL,
    date_certificate DATE NOT NULL,
    issued_by NVARCHAR(255),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);


CREATE TABLE Services (
    service_id INT PRIMARY KEY IDENTITY(1,1),
    service_name NVARCHAR(255) NOT NULL,
    description NVARCHAR(500),
    duration_service NVARCHAR(50),
    cost DECIMAL(18,2) NOT NULL
);


CREATE TABLE Appoinment_Service (
    appointment_id INT PRIMARY KEY IDENTITY(1,1),
    appointment_date DATETIME NOT NULL,
    appointment_status NVARCHAR(50),
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Account(account_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);


CREATE TABLE Appointment (
    appointment_service_id INT PRIMARY KEY IDENTITY(1,1),
    appointment_id INT NOT NULL,
    service_id INT NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appoinment_Service(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES Services(service_id) ON DELETE CASCADE
);


CREATE TABLE Categories_FAQ (
    categories_id INT PRIMARY KEY IDENTITY(1,1),
    categories_name NVARCHAR(255) NOT NULL,
    description NVARCHAR(500)
);


CREATE TABLE FAQ (
    faq_id INT PRIMARY KEY IDENTITY(1,1),
    question NVARCHAR(500) NOT NULL,
    categories_id INT NOT NULL,
    created_date DATETIME DEFAULT GETDATE(),
    updated_date DATETIME,
    questioner NVARCHAR(255),
    FOREIGN KEY (categories_id) REFERENCES Categories_FAQ(categories_id) ON DELETE CASCADE
);


CREATE TABLE FAQ_Answers (
    answers_id INT PRIMARY KEY IDENTITY(1,1),
    faq_id INT NOT NULL,
    answer_text NVARCHAR(MAX) NOT NULL,
    answer_by NVARCHAR(255),
    create_date DATETIME DEFAULT GETDATE(),
    last_update DATETIME,
    FOREIGN KEY (faq_id) REFERENCES FAQ(faq_id) ON DELETE CASCADE
);


CREATE TABLE Blog (
    blog_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(255) NOT NULL,
    content NVARCHAR(MAX),
    author_id INT,
    blog_created_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (author_id) REFERENCES Account(account_id) ON DELETE SET NULL
);


CREATE TABLE Blog_Content (
    blog_content_id INT PRIMARY KEY IDENTITY(1,1),
    blog_id INT NOT NULL,
    content_type NVARCHAR(50) NOT NULL CHECK (content_type IN ('text', 'image')),
    content NVARCHAR(MAX),
    image_id INT,
    FOREIGN KEY (blog_id) REFERENCES Blog(blog_id) ON DELETE CASCADE
);


CREATE TABLE Image_Type (
    image_type_id INT PRIMARY KEY IDENTITY(1,1),
    image_type NVARCHAR(255) NOT NULL
);


CREATE TABLE Images_Video (
    image_id INT PRIMARY KEY IDENTITY(1,1),
    image_url NVARCHAR(255) NOT NULL,
    image_description NVARCHAR(500),
    image_type_id INT,
    FOREIGN KEY (image_type_id) REFERENCES Image_Type(image_type_id) ON DELETE CASCADE
);


CREATE TABLE Blog_Image (
    blog_id INT NOT NULL,
    image_id INT NOT NULL,
    PRIMARY KEY (blog_id, image_id),
    FOREIGN KEY (blog_id) REFERENCES Blog(blog_id) ON DELETE CASCADE,
    FOREIGN KEY (image_id) REFERENCES Images_Video(image_id) ON DELETE CASCADE
);


CREATE TABLE Feedback_Blog (
    feedback_blog_id INT PRIMARY KEY IDENTITY(1,1),
    blog_id INT NOT NULL,
    account_id INT NOT NULL,
    feedback_text NVARCHAR(MAX),
    rating FLOAT,
    created_date DATETIME DEFAULT GETDATE(),
    lastchanged_comment_blog DATETIME,
    FOREIGN KEY (blog_id) REFERENCES Blog(blog_id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);


CREATE TABLE Feedback_Doctor (
    feedback_id INT PRIMARY KEY IDENTITY(1,1),
    appointment_service_id INT NOT NULL,
    feedback_text NVARCHAR(MAX),
    rating FLOAT,
    feedback_date DATETIME DEFAULT GETDATE(),
    last_changed DATETIME,
    FOREIGN KEY (appointment_service_id) REFERENCES Appointment(appointment_service_id) ON DELETE CASCADE
);


CREATE TABLE Content_Stories (
    patient_name NVARCHAR(255) NOT NULL,
    image_id INT,
    content_stories NVARCHAR(MAX),
    FOREIGN KEY (image_id) REFERENCES Images_Video(image_id) ON DELETE SET NULL
);

