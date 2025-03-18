ALTER TABLE dbo.Appointment
ADD staff_id INT 

ALTER TABLE dbo.Appointment
ADD CONSTRAINT FK_Staff_Id 
FOREIGN KEY (staff_id) 
REFERENCES dbo.Staff(staff_id);