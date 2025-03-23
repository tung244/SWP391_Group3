

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý quyền nâng cao</title>
    <jsp:include page="admin/Common/Css.jsp"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .role-select {
            margin-bottom: 20px;
            padding: 10px;
            font-size: 16px;
            width: 200px;
        }

        .accordion {
            margin-top: 20px;
        }

        .accordion-item {
            border-bottom: 1px solid #ddd;
        }

        .accordion-header {
            background-color: #f8f8f8;
            padding: 15px;
            cursor: pointer;
            font-weight: bold;
        }

        .accordion-header:hover {
            background-color: #e8e8e8;
        }

        .accordion-content {
            padding: 15px;
            display: none;
            background-color: #fff;
        }

        .permission-group {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 10px;
        }

        .save-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        .save-btn:hover {
            background-color: #45a049;
        }
    </style>
    
</head>
<body>
    <div>
        <jsp:include page="Common/Navbar.jsp"/>
    </div>
    <div class="container">
        <h1>Quản lý quyền theo vai trò</h1>
        <select class="role-select" id="roleSelect" onchange="loadPermissions()">
            <option value="admin">Admin</option>
            <option value="editor">Editor</option>
            <option value="viewer">Viewer</option>
        </select>

        <div class="accordion" id="permissionsAccordion">
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">Quản lý nội dung</div>
                <div class="accordion-content">
                    <div class="permission-group">
                        <label><input type="checkbox" data-permission="content.view"> Xem nội dung</label>
                        <label><input type="checkbox" data-permission="content.edit"> Sửa nội dung</label>
                        <label><input type="checkbox" data-permission="content.delete"> Xóa nội dung</label>
                        <label><input type="checkbox" data-permission="content.create"> Tạo nội dung</label>
                        <label><input type="checkbox" data-permission="content.publish"> Xuất bản nội dung</label>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">Quản lý người dùng</div>
                <div class="accordion-content">
                    <div class="permission-group">
                        <label><input type="checkbox" data-permission="user.view"> Xem danh sách người dùng</label>
                        <label><input type="checkbox" data-permission="user.edit"> Sửa thông tin người dùng</label>
                        <label><input type="checkbox" data-permission="user.delete"> Xóa người dùng</label>
                        <label><input type="checkbox" data-permission="user.create"> Tạo người dùng</label>
                        <label><input type="checkbox" data-permission="user.ban"> Cấm người dùng</label>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">Quản lý hệ thống</div>
                <div class="accordion-content">
                    <div class="permission-group">
                        <label><input type="checkbox" data-permission="system.config"> Cấu hình hệ thống</label>
                        <label><input type="checkbox" data-permission="system.backup"> Sao lưu dữ liệu</label>
                        <label><input type="checkbox" data-permission="system.update"> Cập nhật hệ thống</label>
                    </div>
                </div>
            </div>
        </div>
        <button class="save-btn" onclick="savePermissions()">Lưu thay đổi</button>
    </div>

    <script>
        let permissions = {
            admin: {
                'content.view': true, 'content.edit': true, 'content.delete': true, 'content.create': true, 'content.publish': true,
                'user.view': true, 'user.edit': true, 'user.delete': true, 'user.create': true, 'user.ban': true,
                'system.config': true, 'system.backup': true, 'system.update': true
            },
            editor: {
                'content.view': true, 'content.edit': true, 'content.delete': false, 'content.create': true, 'content.publish': false,
                'user.view': false, 'user.edit': false, 'user.delete': false, 'user.create': false, 'user.ban': false,
                'system.config': false, 'system.backup': false, 'system.update': false
            },
            viewer: {
                'content.view': true, 'content.edit': false, 'content.delete': false, 'content.create': false, 'content.publish': false,
                'user.view': false, 'user.edit': false, 'user.delete': false, 'user.create': false, 'user.ban': false,
                'system.config': false, 'system.backup': false, 'system.update': false
            }
        };

        // Toggle accordion
        function toggleAccordion(header) {
            const content = header.nextElementSibling;
            content.style.display = content.style.display === 'block' ? 'none' : 'block';
        }

        // Load permissions based on selected role
        function loadPermissions() {
            const role = document.getElementById('roleSelect').value;
            document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
                const permission = checkbox.dataset.permission;
                checkbox.checked = permissions[role][permission] || false;
                checkbox.onchange = () => {
                    permissions[role][permission] = checkbox.checked;
                };
            });
        }

        // Save permissions
        function savePermissions() {
            const role = document.getElementById('roleSelect').value;
            console.log(`Permissions saved for ${role}:`, permissions[role]);
            alert('Đã lưu thay đổi quyền hạn!\nKiểm tra console để xem kết quả.');
        }

        // Initialize
        window.onload = loadPermissions;
    </script>
</body>
</html>
