INSERT INTO dbo.Modules( module_name, description, module_img)
VALUES(N'FeedBack', N'CheckFeedBack', 'bx bx-like')

INSERT INTO dbo.Permission( permission_name, permission_path, module_id)
VALUES(N'Feeback Dashboard', N'admin/dashboardcustomersupport', 12)

INSERT INTO dbo.Permission( permission_name, permission_path, module_id)
VALUES(N'Feeback Dashboard', N'/admin/searchdashboardcustomersupport', 12)
		
INSERT INTO dbo.Permission_Role(permission_id,role_id)
VALUES(50, 1)

INSERT INTO dbo.Permission_Role(permission_id,role_id)
VALUES(51, 1)