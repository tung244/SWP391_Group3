create table Modules(
module_id INT PRIMARY KEY IDENTITY(1,1),
module_name NVARCHAR(50) NOT NULL UNIQUE, 
description NVARCHAR(255),
module_img NVARCHAR(255)
)

ALTER TABLE dbo.Permission
ADD permission_path NVARCHAR(255)

ALTER TABLE dbo.Permission
ADD module_id INT
