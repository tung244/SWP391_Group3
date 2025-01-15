<%-- 
    Document   : userprofile
    Created on : Jan 15, 2025, 9:35:21 PM
    Author     : fptshop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Common/Css.jsp"/>
    </head>
    <body>
        <div class="row" style="background-color: #4EB09B">
            <jsp:include page="Common/Navbar.jsp"/>
            <div class="col-md-2">
                <div class="userprofile-sidebar">
                    <div class="userprofile-nav-header">
                        <img src="placeholder-avatar.jpg" alt="Avatar" class="userprofile-avatar">
                        
                    </div>
                    <ul class="userprofile-nav-list">
                        <li class="userprofile-nav-item userprofile-nav-item--active" data-tab="profile">Thông tin cá nhân</li>
                        <li class="userprofile-nav-item" data-tab="history">Lịch sử dịch vụ</li>
                        <li class="userprofile-nav-item" data-tab="password">Đổi mật khẩu</li>
                        <li class="userprofile-nav-item" data-tab="edit">Chỉnh sửa thông tin</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-10">
                <div class="userprofile-main-content">
                    <!-- Thông tin cá nhân -->
                    <div class="userprofile-section" id="profile-section">
                        <div class="userprofile-header">
                            <h2>Thông tin cá nhân</h2>
                        </div>
                        <div class="userprofile-form">
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Họ và tên</label>
                                <input type="text" class="userprofile-form-input" value="Nguyễn Văn A" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Email</label>
                                <input type="email" class="userprofile-form-input" value="nguyenvana@email.com" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Số điện thoại</label>
                                <input type="tel" class="userprofile-form-input" value="0123456789" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Địa chỉ</label>
                                <input type="text" class="userprofile-form-input" value="123 Đường ABC, Quận XYZ, TP.HCM" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Giới tính</label>
                                <input type="text" class="userprofile-form-input" value="Nam" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Ngày sinh</label>
                                <input type="text" class="userprofile-form-input" value="01/01/1990" readonly>
                            </div>
                        </div>
                    </div>

                    <!-- Lịch sử dịch vụ -->
                    <div class="userprofile-history-container userprofile-section" id="history-section">
                        <div class="userprofile-header">
                            <h2>Lịch sử dịch vụ</h2>
                        </div>
                        <table class="userprofile-table">
                            <thead>
                                <tr>
                                    <th class="userprofile-table-cell userprofile-table-header">Ngày</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Dịch vụ</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Trạng thái</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Giá tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="userprofile-table-cell">15/01/2024</td>
                                    <td class="userprofile-table-cell">Đặt phòng khách sạn</td>
                                    <td class="userprofile-table-cell">Hoàn thành</td>
                                    <td class="userprofile-table-cell">1,500,000đ</td>
                                </tr>
                                <tr>
                                    <td class="userprofile-table-cell">10/01/2024</td>
                                    <td class="userprofile-table-cell">Đặt vé máy bay</td>
                                    <td class="userprofile-table-cell">Hoàn thành</td>
                                    <td class="userprofile-table-cell">2,000,000đ</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Đổi mật khẩu -->
                    <div class="userprofile-change-password-container userprofile-section" id="password-section">
                        <div class="userprofile-header">
                            <h2>Đổi mật khẩu</h2>
                        </div>
                        <div class="userprofile-form">
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Mật khẩu hiện tại</label>
                                <input type="password" class="userprofile-form-input">
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Mật khẩu mới</label>
                                <input type="password" class="userprofile-form-input">
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Xác nhận mật khẩu mới</label>
                                <input type="password" class="userprofile-form-input">
                            </div>
                            <button class="userprofile-btn">Cập nhật mật khẩu</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const navItems = document.querySelectorAll('.userprofile-nav-item');
                const sections = {
                    profile: document.getElementById('profile-section'),
                    history: document.getElementById('history-section'),
                    password: document.getElementById('password-section')
                };

                function showSection(sectionId) {
                    // Hide all sections
                    Object.values(sections).forEach(section => {
                        if (section) {
                            section.style.display = 'none';
                        }
                    });

                    // Show selected section
                    if (sections[sectionId]) {
                        sections[sectionId].style.display = 'block';
                    }

                    // Update active nav item
                    navItems.forEach(item => {
                        item.classList.remove('userprofile-nav-item--active');
                        if (item.getAttribute('data-tab') === sectionId) {
                            item.classList.add('userprofile-nav-item--active');
                        }
                    });
                }

                // Add click event listeners
                navItems.forEach(item => {
                    item.addEventListener('click', function () {
                        const tab = this.getAttribute('data-tab');
                        showSection(tab);
                    });
                });

                // Show profile section by default
                showSection('profile');
            });
        </script>
    </body>
</html>
