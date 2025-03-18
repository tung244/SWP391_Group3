
<%-- 
    Document   : userprofile
    Created on : Jan 15, 2025, 9:35:21 PM
    Author     : fptshop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
=======
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
>>>>>>> test
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Common/Css.jsp"/>
        <style>
            html, body {
                overflow: auto;
                min-height: 100vh;
            }
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

            .modal-dialog.modal-custom {
                max-width: 90%; /* Chiều rộng modal là 90% của màn hình */
                width: 90%;
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
                        <a href="transactionhistoryy"><li class="userprofile-nav-item userprofile-nav-item--active" data-tab="profile">Lịch sử dịch vụ</li></a>
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
                        <form action="searchtransactionhistory" method="get" class="search-form" style="display: flex; gap: 10px; align-items: center;">

                            <input type="text" name="query" class="search-input" placeholder="Tìm kiếm giao dịch...">


                            <label for="startDate">Từ:</label>
                            <input type="date" name="startDate" class="search-input">

                            <label for="endDate">Đến:</label>
                            <input type="date" name="endDate" class="search-input">


                            <select name="queryType" class="search-input" style="width: 180px;">
                                <option value="">Chọn loại dịch vụ</option>
                                <option value="Cơ bản">Cơ bản</option>
                                <option value="Nâng cao">Nâng cao</option>
                            </select>


                            <button type="submit" class="search-button">🔍</button>
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
                                <th class="userprofile-table-cell userprofile-table-header">Trạng thái</th>
                                <th class="userprofile-table-cell userprofile-table-header"></th>

                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${requestScope.appointment}" var="appointment">
                                <tr>
                                    <td class="userprofile-table-cell"> ${appointment.appointment_id}</td>
                                    <td class="userprofile-table-cell">${appointment.service.service_name}</td>
<<<<<<< HEAD
                                    
                                    <td> 
                                        <fmt:formatNumber value="${appointment.service_detail.cost}" pattern="#,###"/>
                                    </td>
                                    
                                    <td class="userprofile-table-cell">${appointment.service_type.service_type_name}</td>
                                    <td> 
                                        <fmt:formatDate value="${appointment.appointment_date}" pattern="dd/MM/yyyy"/>
                                    </td>
                                    
                                    <td class="userprofile-table-cell">${appointment.service_type.duration_service}</td>
=======
>>>>>>> test
                                    <td class="userprofile-table-cell">
                                        <fmt:formatNumber value="${appointment.service_detail.cost}" pattern="#,###"/>
                                    </td>
                                    <td class="userprofile-table-cell">${appointment.service_type.service_type_name}</td>
                                    <td class="userprofile-table-cell">${appointment.appointment_date}</td>
                                    <td class="userprofile-table-cell">${appointment.service_type.duration_service}</td>
                                    <td class="userprofile-table-cell">${appointment.appointment_status}</td>
                                    <td class="userprofile-table-cell">

                                        <a href="transactiondetail?appointment_id=${appointment.appointment_id}"><i style="color: green" class="fas fa-eye icon"></i></a>
                                            <c:if test="${appointment.appointment_status.equals('Scheduled')}">
                                            <a href="payment?id=${appointment.appointment_id}&cost=5000"><i style="color: green" class="fas fa-wallet"></i></a>
                                            </c:if>
                                            <c:if test="${appointment.appointment_status.equals('Completed')}">
                                            <a href="#" title="View" onclick="loadMedicalHistory(${appointment.appointment_id});" data-toggle="modal" data-target="#viewModal">
                                                <i style="color: green" class="fas fa-file-alt icon"></i>
                                            </a>
                                        </c:if> 
                                        <c:if test="${appointment.appointment_status.equals('Scheduled') ||appointment.appointment_status.equals('Completed') }">
                                        <a href="Invoice?appointment=${appointment.appointment_id}" title="Bill"><i style="color: green" class="fas fa-file-invoice-dollar"></i></a>
                                            </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                    <div class="pagination">
                        <c:if test="${page > 1}">
                            <a href="${type == 'search' ? 'searchtransactionhistory' : 'transactionhistoryy'}?page=${page - 1}&query=${param.query}&startDate=${param.startDate}&endDate=${param.endDate}&queryType=${param.queryType}">«</a>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${numpage}">
                            <a href="${type == 'search' ? 'searchtransactionhistory' : 'transactionhistoryy'}?page=${i}&query=${param.query}&startDate=${param.startDate}&endDate=${param.endDate}&queryType=${param.queryType}"
                               class="${i == page ? 'active' : ''}">${i}</a>
                        </c:forEach>

                        <c:if test="${page < numpage}">
                            <a href="${type == 'search' ? 'searchtransactionhistory' : 'transactionhistoryy'}?page=${page + 1}&query=${param.query}&startDate=${param.startDate}&endDate=${param.endDate}&queryType=${param.queryType}">»</a>
                        </c:if>
                    </div>




                </div>
            </div>


        </div>
        <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">

            <div class="modal-dialog modal-custom"> <!-- Thêm lớp modal-lg -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">Medical Record</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modalContent">
                        <!-- Nội dung chi tiết đơn hàng sẽ được cập nhật ở đây -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" style="background-color: green" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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

        <script>
            function loadMedicalHistory(id) {
                console.log("Loading medical history for ID:", id);
                var modalContent = document.getElementById("modalContent");
                modalContent.innerHTML = "Loading...";

                // Send request to servlet
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "/SWP391/LoadMedicalReport?aId=" + id, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        console.log("Response from server:", xhr.responseText);
                        modalContent.innerHTML = xhr.responseText;
                        // Show the modal after content is loaded
                        var modal = new bootstrap.Modal(document.getElementById('viewModal'));
                        modal.show();
                    }
                };
                xhr.send();
            }
        </script>
    </body>
</html>
