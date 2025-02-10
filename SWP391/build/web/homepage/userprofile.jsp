
<%-- 
    Document   : userprofile
    Created on : Jan 15, 2025, 9:35:21 PM
    Author     : fptshop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Common/Css.jsp"/>
        <style>
            .login-button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 48%;
            }

            .login-button:hover {
                background-color: #45a049;
            }

            .search-form {
                display: flex;
                align-items: center;
                border: 2px solid #4CAF50;
                border-radius: 4px;
                overflow: hidden;
                background-color: white;
            }

            .search-input {
                padding: 8px 12px;
                border: none;
                outline: none;
                width: 220px;
                font-size: 16px;
            }

            .search-button {
                background-color: #4CAF50;
                border: none;
                padding: 8px 12px;
                cursor: pointer;
                font-size: 16px;
                color: white;
            }

            .search-button:hover {
                background-color: #45a049;
            }


        </style>  
    </head>
    <body>
        <div class="row" style="background-color: #4EB09B">
            <jsp:include page="Common/Navbar.jsp"/>
            <div class="col-md-2">
                <div class="userprofile-sidebar">
                    <div class="userprofile-nav-header">
                        <img src="${userProfile.image_profile_user}" alt="Avatar" class="userprofile-avatar">

                    </div>
                    <ul class="userprofile-nav-list">
                        <li class="userprofile-nav-item userprofile-nav-item--active" data-tab="profile">Thông tin cá nhân</li>
                        <li class="userprofile-nav-item" data-tab="password">Chỉnh sửa thông tin</li>

                    </ul>
                </div>
            </div>
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
            <p style="color: red;"><%= error %></p>
            <% } %>

            <div class="col-md-10">
                <div class="userprofile-main-content">
                    <!-- Thông tin cá nhân -->
                    <div class=" userprofile-section" id="profile-section">
                        <div class="userprofile-header">
                            <h2>Thông tin cá nhân</h2>
                        </div>
                        <div class="userprofile-form">
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">ID Account</label>
                                <input type="text" class="userprofile-form-input" value="${userProfile.account.account_id}" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Họ và tên</label>
                                <input type="text" class="userprofile-form-input" value="${userProfile.fullname}" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Email</label>
                                <input type="email" class="userprofile-form-input" value="${userProfile.account.email}" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Số điện thoại</label>
                                <input type="tel" class="userprofile-form-input" value="${userProfile.account.phonenumber}" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Địa chỉ</label>
                                <input type="text" class="userprofile-form-input" value="${userProfile.address}" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Giới tính</label>
                                <input type="text" class="userprofile-form-input" value="${userProfile.gender}" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Ngày sinh</label>
                                <input type="text" class="userprofile-form-input" value="${userProfile.dob}" readonly>
                            </div>
                            <div class="userprofile-form-group">
                                <label class="userprofile-form-label">Ảnh đại diện</label>
                                <input type="text" class="userprofile-form-input" value="${userProfile.image_profile_user}" readonly>
                            </div>
                        </div>
                    </div>

                    
                    <form action="updateuserprofile" method="get">

                        <div class="userprofile-change-password-container userprofile-section" id="password-section">
                            <div class="userprofile-header">
                                <h2>Chỉnh sửa thông tin</h2>
                            </div>
                            <div class="userprofile-form">
                                <div class="userprofile-form-group">
                                    <label class="userprofile-form-label">ID Account</label>
                                    <input type="text" class="userprofile-form-input" name="account_id" value="${userProfile.account.account_id}" readonly>
                                </div>
                                <div class="userprofile-form-group">
                                    <label class="userprofile-form-label">Họ và tên</label>
                                    <input type="text" class="userprofile-form-input" name="fullname" value="${userProfile.fullname}">
                                </div>
                                <div class="userprofile-form-group">
                                    <label class="userprofile-form-label">Email</label>
                                    <input type="email" class="userprofile-form-input" name="email" value="${userProfile.account.email}">
                                </div>
                                <div class="userprofile-form-group">
                                    <label class="userprofile-form-label">Số điện thoại</label>
                                    <input type="tel" class="userprofile-form-input" name="phonenumber" value="${userProfile.account.phonenumber}">
                                </div>
                                <div class="userprofile-form-group">
                                    <label class="userprofile-form-label">Địa chỉ</label>
                                    <input type="text" class="userprofile-form-input" name="address" value="${userProfile.address}">
                                </div>
                                <div class="userprofile-form-group">
                                    <label class="userprofile-form-label">Giới tính</label>
                                    <select class="userprofile-form-input" id="genderSelect" onchange="toggleCustomGender()">
                                        <option value="Nam" ${userProfile.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                        <option value="Nữ" ${userProfile.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                        <option value="Khác" ${userProfile.gender != 'Nam' && userProfile.gender != 'Nữ' ? 'selected' : ''}>Khác</option>
                                    </select>
                                    <input type="text" id="customGender" class="userprofile-form-input" 
                                           placeholder="Nhập giới tính khác..." 
                                           value="${(userProfile.gender != 'Nam' && userProfile.gender != 'Nữ') ? userProfile.gender : ''}" 
                                           style="display: none;" oninput="updateGenderValue()">
                                    <input type="hidden" name="gender" id="hiddenGender">
                                </div>

                                <script>
                                    function toggleCustomGender() {
                                        let genderSelect = document.getElementById("genderSelect");
                                        let customGender = document.getElementById("customGender");
                                        let hiddenGender = document.getElementById("hiddenGender");

                                        if (genderSelect.value === "Khác") {
                                            customGender.style.display = "block";
                                            customGender.focus();
                                            hiddenGender.value = customGender.value; // Lấy giá trị từ ô nhập
                                        } else {
                                            customGender.style.display = "none";
                                            customGender.value = ""; // Reset ô nhập khi chọn lại Nam/Nữ
                                            hiddenGender.value = genderSelect.value; // Cập nhật giá trị gửi đi
                                        }
                                    }

                                    function updateGenderValue() {
                                        let customGender = document.getElementById("customGender");
                                        let hiddenGender = document.getElementById("hiddenGender");

                                        hiddenGender.value = customGender.value; // Luôn cập nhật giá trị thực sự gửi đi
                                    }

                                    // Khi tải trang, kiểm tra nếu ban đầu là "Khác" thì hiển thị ô nhập
                                    toggleCustomGender();
                                </script>



                                <div class="userprofile-form-group">
                                    <label class="userprofile-form-label">Ngày sinh</label>
                                    <input type="date" type="text" class="userprofile-form-input" name="dob" value="${userProfile.dob}">
                                </div>
                                <div class="userprofile-form-group">
                                    <label class="userprofile-form-label">Ảnh đại diện</label>
                                    <input type="text"  class="userprofile-form-input" name="imageProfile" value="${userProfile.image_profile_user}">
                                </div>
                            </div>

                            <!-- Nút Submit -->
                            <div class="userprofile-form-group">
                                <button type="submit" class="login-button">Lưu thay đổi</button>
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
