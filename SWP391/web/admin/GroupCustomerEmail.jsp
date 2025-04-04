<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Nhóm Khách Hàng</title>
    <style>
        .tc-body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }
        
        .tc-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .tc-header {
            background-color: #4CAF50;
            color: #fff;
            padding: 15px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .tc-header__content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .tc-logo {
            font-size: 24px;
            font-weight: bold;
        }
        
        .tc-user-panel {
            display: flex;
            align-items: center;
        }
        
        .tc-user-panel__avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #A5D6A7;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: #388E3C;
            font-weight: bold;
        }
        
        .tc-layout {
            display: flex;
            margin-top: 20px;
            gap: 20px;
        }
        
        .tc-sidebar {
            width: 250px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            padding: 20px;
        }
        
        .tc-nav {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .tc-nav__item {
            margin-bottom: 10px;
        }
        
        .tc-nav__link {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #333;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        .tc-nav__link:hover, .tc-nav__link--active {
            background-color: #f0f9f0;
            color: #4CAF50;
        }
        
        .tc-nav__link--active {
            border-left: 3px solid #4CAF50;
            font-weight: bold;
        }
        
        .tc-main {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            padding: 20px;
        }
        
        .tc-main__header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        
        .tc-main__title {
            font-size: 20px;
            font-weight: bold;
            margin: 0;
        }
        
        .tc-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        
        .tc-btn--primary {
            background-color: #4CAF50;
            color: white;
        }
        
        .tc-btn--primary:hover {
            background-color: #388E3C;
        }
        
        .tc-btn--outline {
            background-color: white;
            color: #4CAF50;
            border: 1px solid #4CAF50;
        }
        
        .tc-btn--outline:hover {
            background-color: #f0f9f0;
        }
        
        .tc-btn-group {
            display: flex;
            gap: 10px;
        }
        
        .tc-search {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }
        
        .tc-search__input {
            flex: 1;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .tc-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .tc-table__header, .tc-table__cell {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        .tc-table__header {
            background-color: #A5D6A7;
            color: #388E3C;
            font-weight: 600;
        }
        
        .tc-table__row:hover {
            background-color: #f0f9f0;
        }
        
        .tc-table__actions {
            display: flex;
            gap: 5px;
        }
        
        .tc-btn--small {
            padding: 5px 10px;
            font-size: 14px;
        }
        
        .tc-status {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .tc-status--active {
            background-color: #E8F5E9;
            color: #388E3C;
        }
        
        .tc-status--inactive {
            background-color: #FFEBEE;
            color: #D32F2F;
        }
        
        /* Modal styles */
        .tc-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        
        .tc-modal__content {
            background-color: white;
            border-radius: 8px;
            width: 500px;
            max-width: 90%;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .tc-modal__header {
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .tc-modal__title {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
        }
        
        .tc-modal__close {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            color: #999;
        }
        
        .tc-modal__body {
            padding: 20px;
        }
        
        .tc-modal__footer {
            padding: 15px 20px;
            border-top: 1px solid #ddd;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        
        .tc-form__group {
            margin-bottom: 15px;
        }
        
        .tc-form__label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        
        .tc-form__input {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .tc-form__input:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
        }
        
        .tc-member-panel {
            display: none;
            margin-top: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
        }
        
        .tc-member-panel__header {
            padding: 10px 15px;
            background-color: #A5D6A7;
            color: #388E3C;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .tc-member-panel__body {
            max-height: 300px;
            overflow-y: auto;
        }
        
        .tc-member-item {
            padding: 10px 15px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .tc-member-item:last-child {
            border-bottom: none;
        }
        
        .tc-file-upload {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }
        
        .tc-file-upload__input {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            opacity: 0;
            cursor: pointer;
        }
        
        .tc-file-upload__label {
            display: inline-block;
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .tc-file-upload__name {
            margin-left: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body class="tc-body">
    <header class="tc-header">
        <div class="tc-container">
            <div class="tc-header__content">
                <div class="tc-logo">Quản Lý Khách Hàng</div>
                <div class="tc-user-panel">
                    <div class="tc-user-panel__avatar">A</div>
                    <div class="tc-user-panel__info">Admin</div>
                </div>
            </div>
        </div>
    </header>
    
    <div class="tc-container">
        <div class="tc-layout">
            <aside class="tc-sidebar">
                <ul class="tc-nav">
                    <li class="tc-nav__item">
                        <a href="#" class="tc-nav__link tc-nav__link--active">Nhóm Khách Hàng</a>
                    </li>
                    <li class="tc-nav__item">
                        <a href="#" class="tc-nav__link">Danh Sách Khách Hàng</a>
                    </li>
                    <li class="tc-nav__item">
                        <a href="#" class="tc-nav__link">Báo Cáo</a>
                    </li>
                    <li class="tc-nav__item">
                        <a href="#" class="tc-nav__link">Cài Đặt</a>
                    </li>
                </ul>
            </aside>
            
            <main class="tc-main">
                <div class="tc-main__header">
                    <h2 class="tc-main__title">Quản Lý Nhóm Khách Hàng</h2>
                    <div class="tc-btn-group">
                        <button class="tc-btn tc-btn--outline" id="btnImportExcel">Import Excel</button>
                        <button class="tc-btn tc-btn--primary" id="btnAddGroup">Thêm Nhóm Mới</button>
                    </div>
                </div>
                
                <div class="tc-search">
                    <input type="text" class="tc-search__input" placeholder="Tìm kiếm nhóm khách hàng...">
                    <button class="tc-btn tc-btn--outline">Tìm kiếm</button>
                </div>
                
                <table class="tc-table">
                    <thead>
                        <tr>
                            <th class="tc-table__header">Tên Nhóm</th>
                            <th class="tc-table__header">Mô Tả</th>
                            <th class="tc-table__header">Số Lượng</th>
                            <th class="tc-table__header">Trạng Thái</th>
                            <th class="tc-table__header">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tc-table__row">
                            <td class="tc-table__cell">Khách hàng VIP</td>
                            <td class="tc-table__cell">Nhóm khách hàng thân thiết</td>
                            <td class="tc-table__cell">25</td>
                            <td class="tc-table__cell"><span class="tc-status tc-status--active">Hoạt động</span></td>
                            <td class="tc-table__cell">
                                <div class="tc-table__actions">
                                    <button class="tc-btn tc-btn--small tc-btn--outline btn-view-members" data-group="Khách hàng VIP">Xem</button>
                                    <button class="tc-btn tc-btn--small tc-btn--outline">Sửa</button>
                                    <button class="tc-btn tc-btn--small tc-btn--outline">Xóa</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="tc-table__row">
                            <td class="tc-table__cell">Khách hàng mới</td>
                            <td class="tc-table__cell">Khách hàng đăng ký mới</td>
                            <td class="tc-table__cell">42</td>
                            <td class="tc-table__cell"><span class="tc-status tc-status--active">Hoạt động</span></td>
                            <td class="tc-table__cell">
                                <div class="tc-table__actions">
                                    <button class="tc-btn tc-btn--small tc-btn--outline btn-view-members" data-group="Khách hàng mới">Xem</button>
                                    <button class="tc-btn tc-btn--small tc-btn--outline">Sửa</button>
                                    <button class="tc-btn tc-btn--small tc-btn--outline">Xóa</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="tc-table__row">
                            <td class="tc-table__cell">Khách hàng tiềm năng</td>
                            <td class="tc-table__cell">Khách hàng có khả năng chuyển đổi</td>
                            <td class="tc-table__cell">18</td>
                            <td class="tc-table__cell"><span class="tc-status tc-status--inactive">Tạm ngưng</span></td>
                            <td class="tc-table__cell">
                                <div class="tc-table__actions">
                                    <button class="tc-btn tc-btn--small tc-btn--outline btn-view-members" data-group="Khách hàng tiềm năng">Xem</button>
                                    <button class="tc-btn tc-btn--small tc-btn--outline">Sửa</button>
                                    <button class="tc-btn tc-btn--small tc-btn--outline">Xóa</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="tc-member-panel" id="memberPanel">
                    <div class="tc-member-panel__header">
                        <div class="tc-member-panel__title">Danh sách thành viên: <span id="groupName"></span></div>
                        <button class="tc-btn tc-btn--small tc-btn--outline" id="btnCloseMemberPanel">Đóng</button>
                    </div>
                    <div class="tc-member-panel__body" id="memberList">
                        <!-- Danh sách thành viên sẽ được hiển thị ở đây -->
                    </div>
                </div>
            </main>
        </div>
    </div>
    
    <!-- Modal Thêm Nhóm Mới -->
    <div class="tc-modal" id="modalAddGroup">
        <div class="tc-modal__content">
            <div class="tc-modal__header">
                <h3 class="tc-modal__title">Thêm Nhóm Khách Hàng Mới</h3>
                <button class="tc-modal__close">&times;</button>
            </div>
            <div class="tc-modal__body">
                <form id="formAddGroup">
                    <div class="tc-form__group">
                        <label class="tc-form__label">Tên nhóm</label>
                        <input type="text" class="tc-form__input" required>
                    </div>
                    <div class="tc-form__group">
                        <label class="tc-form__label">Mô tả</label>
                        <textarea class="tc-form__input" rows="3"></textarea>
                    </div>
                    <div class="tc-form__group">
                        <label class="tc-form__label">Trạng thái</label>
                        <select class="tc-form__input">
                            <option value="active">Hoạt động</option>
                            <option value="inactive">Tạm ngưng</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="tc-modal__footer">
                <button class="tc-btn tc-btn--outline" id="btnCancelAddGroup">Hủy</button>
                <button class="tc-btn tc-btn--primary" id="btnSaveGroup">Lưu</button>
            </div>
        </div>
    </div>
    
    <!-- Modal Import Excel -->
    <div class="tc-modal" id="modalImportExcel">
        <div class="tc-modal__content">
            <div class="tc-modal__header">
                <h3 class="tc-modal__title">Import Danh Sách Khách Hàng</h3>
                <button class="tc-modal__close">&times;</button>
            </div>
            <div class="tc-modal__body">
                <form id="formImportExcel">
                    <div class="tc-form__group">
                        <label class="tc-form__label">Chọn nhóm</label>
                        <select class="tc-form__input" id="groupSelect">
                            <option value="">-- Chọn nhóm --</option>
                            <option value="1">Khách hàng VIP</option>
                            <option value="2">Khách hàng mới</option>
                            <option value="3">Khách hàng tiềm năng</option>
                        </select>
                    </div>
                    <div class="tc-form__group">
                        <label class="tc-form__label">Tệp Excel</label>
                        <div class="tc-file-upload">
                            <label class="tc-file-upload__label">
                                Chọn tệp Excel
                                <input type="file" class="tc-file-upload__input" accept=".xlsx, .xls">
                            </label>
                            <span class="tc-file-upload__name" id="fileName">Chưa có tệp nào được chọn</span>
                        </div>
                    </div>
                    <div class="tc-form__group">
                        <label class="tc-form__label">Lưu ý</label>
                        <p>File Excel cần có các cột: Họ tên, Email, Số điện thoại, Địa chỉ</p>
                    </div>
                </form>
            </div>
            <div class="tc-modal__footer">
                <button class="tc-btn tc-btn--outline" id="btnCancelImport">Hủy</button>
                <button class="tc-btn tc-btn--primary" id="btnImport">Import</button>
            </div>
        </div>
    </div>
    
    <script>
        // Dữ liệu mẫu
        const memberData = {
            "Khách hàng VIP": [
                { id: 1, name: "Nguyễn Văn A", email: "nguyenvana@example.com", phone: "0901234567" },
                { id: 2, name: "Trần Thị B", email: "tranthib@example.com", phone: "0912345678" },
                { id: 3, name: "Lê Văn C", email: "levanc@example.com", phone: "0923456789" }
            ],
            "Khách hàng mới": [
                { id: 4, name: "Phạm Thị D", email: "phamthid@example.com", phone: "0934567890" },
                { id: 5, name: "Hoàng Văn E", email: "hoangvane@example.com", phone: "0945678901" }
            ],
            "Khách hàng tiềm năng": [
                { id: 6, name: "Vũ Thị F", email: "vuthif@example.com", phone: "0956789012" },
                { id: 7, name: "Đặng Văn G", email: "dangvang@example.com", phone: "0967890123" }
            ]
        };

        // Lấy các elements
        const btnAddGroup = document.getElementById('btnAddGroup');
        const btnImportExcel = document.getElementById('btnImportExcel');
        const modalAddGroup = document.getElementById('modalAddGroup');
        const modalImportExcel = document.getElementById('modalImportExcel');
        const btnCancelAddGroup = document.getElementById('btnCancelAddGroup');
        const btnCancelImport = document.getElementById('btnCancelImport');
        const btnSaveGroup = document.getElementById('btnSaveGroup');
        const btnImport = document.getElementById('btnImport');
        const modalCloseButtons = document.querySelectorAll('.tc-modal__close');
        const memberPanel = document.getElementById('memberPanel');
        const groupName = document.getElementById('groupName');
        const memberList = document.getElementById('memberList');
        const btnCloseMemberPanel = document.getElementById('btnCloseMemberPanel');
        const btnViewMembers = document.querySelectorAll('.btn-view-members');
        const fileInput = document.querySelector('.tc-file-upload__input');
        const fileName = document.getElementById('fileName');

        // Mở modal thêm nhóm
        btnAddGroup.addEventListener('click', () => {
            modalAddGroup.style.display = 'flex';
        });

        // Mở modal import Excel
        btnImportExcel.addEventListener('click', () => {
            modalImportExcel.style.display = 'flex';
        });

        // Đóng modal
        modalCloseButtons.forEach(button => {
            button.addEventListener('click', () => {
                modalAddGroup.style.display = 'none';
                modalImportExcel.style.display = 'none';
            });
        });

        // Hủy thêm nhóm
        btnCancelAddGroup.addEventListener('click', () => {
            modalAddGroup.style.display = 'none';
        });

        // Hủy import
        btnCancelImport.addEventListener('click', () => {
            modalImportExcel.style.display = 'none';
        });

        // Lưu nhóm mới
        btnSaveGroup.addEventListener('click', () => {
            alert('Đã thêm nhóm mới thành công!');
            modalAddGroup.style.display = 'none';
        });

        // Import Excel
        btnImport.addEventListener('click', () => {
            const selectedGroup = document.getElementById('groupSelect').value;
            if (!selectedGroup) {
                alert('Vui lòng chọn nhóm!');
                return;
            }
            
            if (!fileInput.files[0]) {
                alert('Vui lòng chọn file Excel!');
                return;
            }
            
            alert('Đã import danh sách khách hàng thành công!');
            modalImportExcel.style.display = 'none';
        });

        // Hiển thị tên file khi chọn
        fileInput.addEventListener('change', () => {
            if (fileInput.files.length > 0) {
                fileName.textContent = fileInput.files[0].name;
            } else {
                fileName.textContent = 'Chưa có tệp nào được chọn';
            }
        });

        // Xem danh sách thành viên
        btnViewMembers.forEach(button => {
            button.addEventListener('click', () => {
                const group = button.getAttribute('data-group');
                showMembers(group);
            });
        });

        // Đóng panel danh sách thành viên
        btnCloseMemberPanel.addEventListener('click', () => {
            memberPanel.style.display = 'none';
        });

        // Hiển thị danh sách thành viên
        function showMembers(group) {
            groupName.textContent = group;
            memberList.innerHTML = '';
            
            if (memberData[group]) {
                memberData[group].forEach(member => {
                    const memberItem = document.createElement('div');
                    memberItem.className = 'tc-member-item';
                    memberItem.innerHTML = `
                        <div>
                            <div><strong>${member.name}</strong></div>
                            <div>${member.email} | ${member.phone}</div>
                        </div>
                        <div>
                            <button class="tc-btn tc-btn--small tc-btn--outline">Sửa</button>
                            <button class="tc-btn tc-btn--small tc-btn--outline">Xóa</button>
                        </div>
                    `;
                    memberList.appendChild(memberItem);
                });
            }
            
            memberPanel.style.display = 'block';
        }

        // Đóng modal khi click bên ngoài
        window.addEventListener('click', (event) => {
            if (event.target === modalAddGroup) {
                modalAddGroup.style.display = 'none';
            }
            if (event.target === modalImportExcel) {
                modalImportExcel.style.display = 'none';
            }
        });
    </script>
</body>
</html>