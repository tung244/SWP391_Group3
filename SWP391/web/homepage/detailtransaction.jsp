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
                        <li class="userprofile-nav-item userprofile-nav-item--active" data-tab="profile">Chi tiết lịch sử dịch vụ</li>


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
                            <h2>Chi tiết lịch sử dịch vụ</h2>
                        </div>



                        <table class="userprofile-table">
                            <thead>
                                <tr>
                                    <th class="userprofile-table-cell userprofile-table-header">AppointmentID</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Chi tiết dịch vụ</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Trạng thái</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Ngày bắt đầu</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Ngày hết hạn</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Số điện thoại khách hàng</th>


                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${requestScope.appointment}" var="appointment">
                                    <tr>
                                        <td class="userprofile-table-cell">${appointment.appointment_id}</td>
                                        <td class="userprofile-table-cell">${appointment.service_description}</td>
                                        <td class="userprofile-table-cell">${appointment.appointment_status}</td>
                                        <td class="userprofile-table-cell">${appointment.time_begin}</td>
                                        <td class="userprofile-table-cell">${appointment.time_end}</td>
                                        <td class="userprofile-table-cell">${appointment.phonenumber_patient}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>

                    <button class="login-button" onclick="goBack()">⬅ Quay lại</button>
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
            function goBack() {
                window.history.back(); // Quay lại trang trước đó
            }
        </script>
        
    </body>
</html>
