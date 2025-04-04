INSERT INTO dbo.Permission
(
    permission_name,
    permission_path,
    module_id
)
VALUES
(   N'Role Management',  -- permission_name - nvarchar(255)
    '/admin/role_management', -- permission_path - nvarchar(255)
    11  -- module_id - int
    )

	INSERT INTO dbo.Permission_Role
	(
	    permission_id,
	    role_id
	)
	VALUES
	(   49, -- permission_id - int
	    1  -- role_id - int
	    )

	