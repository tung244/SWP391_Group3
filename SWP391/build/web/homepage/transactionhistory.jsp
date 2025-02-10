
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
                        <li class="userprofile-nav-item userprofile-nav-item--active" data-tab="profile">Lịch sử dịch vụ</li>
                    </ul>
                </div>
            </div>
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
            <p style="color: red;"><%= error %></p>
            <% } %>

            <div class="col-md-10">
                <div class="userprofile-main-content">
                    <div class="userprofile-header" style="display: flex; justify-content: space-between; align-items: center;">
                        <h2>Lịch sử dịch vụ</h2>
                        <form action="searchtransactionhistory" method="get" class="search-form">
                            <input type="text" name="query" class="search-input" placeholder="Tìm kiếm giao dịch...">
                            <button type="submit" class="search-button">
                                🔍
                            </button>
                        </form>
                        <form action="searchtransactionhistory" method="get" class="search-form" style="display: flex; align-items: center;">
                            <div class="service-type-filter">
                                <select name="query" class="search-input" style="width: 180px;">
                                    <option value="">Gói dịch vụ</option>
                                    <option value="Cơ bản">Cơ bản</option>
                                    <option value="Nâng cao">Nâng cao</option>
                                </select>
                                <button type="submit" class="search-button" style="margin-left: 10px;">🔍</button>
                            </div>
                        </form>
                    </div>

                    <table class="userprofile-table">
                        <thead>
                            <tr>
                                <th class="userprofile-table-cell userprofile-table-header">AppointmentID</th>
                                <th class="userprofile-table-cell userprofile-table-header">Tên dịch vụ</th>
                                <th class="userprofile-table-cell userprofile-table-header">Giá tiền</th>
                                <th class="userprofile-table-cell userprofile-table-header">Gói dịch vụ</th>
                                <th class="userprofile-table-cell userprofile-table-header">Ngày sử dụng</th>
                                <th class="userprofile-table-cell userprofile-table-header">Thời gian sử dụng</th>
                                <th class="userprofile-table-cell userprofile-table-header"></th>

                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${requestScope.appointment}" var="appointment">
                                <tr>
                                    <td class="userprofile-table-cell"> ${appointment.appointment_id}</td>
                                    <td class="userprofile-table-cell">${appointment.service_name}</td>
                                    <td class="userprofile-table-cell">${appointment.cost}</td>
                                    <td class="userprofile-table-cell">${appointment.service_type_name}</td>
                                    <td class="userprofile-table-cell">${appointment.appointment_date}</td>
                                    <td class="userprofile-table-cell">${appointment.duration_service}</td>
                                    <td class="userprofile-table-cell">
                                        <a href="transactiondetail?appointment_id=${appointment.appointment_id}" class="login-button">Chi tiết</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>



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
