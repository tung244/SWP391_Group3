ALTER TABLE dbo.Certificate_Doctor
ADD certificate_version INT


ALTER TABLE dbo.Certificate_Doctor
DROP CONSTRAINT FK__Certifica__docto__534D60F1

ALTER TABLE dbo.Certificate_Doctor
DROP CONSTRAINT FK__Certifica__certi__5441852A

ALTER TABLE dbo.Certificate_Doctor
DROP CONSTRAINT PK__Certific__FDBB63B79AB00E74

ALTER TABLE dbo.Certificate_Doctor
ADD certificate_doctor_id INT IDENTITY(1,1) PRIMARY KEY


ALTER TABLE dbo.Certificate_Doctor
ADD CONSTRAINT FK_Certificate_ID 
FOREIGN KEY (certificate_id) 
REFERENCES dbo.Certificate(certificate_id);


ALTER TABLE dbo.Certificate_Doctor
ADD CONSTRAINT FK_Doctor_ID
FOREIGN KEY(doctor_id)
REFERENCES dbo.Doctors(doctor_id)