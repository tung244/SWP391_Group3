<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="Common/Css.jsp"/>
        <style>
            /* CSS styles (giữ nguyên như của bạn) */
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
            .back-button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                width: auto;
                min-width: 80px;
                height: 30px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }
            .review-button {
                background-color: #FFA500;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                width: auto;
                min-width: 80px;
                height: 30px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                margin-left: 10px;
            }
            .review-button:hover {
                background-color: #FF8C00;
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                align-items: center;
                justify-content: center;
            }
            .modal-content {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                width: 400px;
                text-align: center;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }
            .close {
                float: right;
                font-size: 24px;
                cursor: pointer;
            }
            .star-rating {
                font-size: 30px;
                color: #ddd;
                cursor: pointer;
            }
            .star {
                display: inline-block;
                transition: color 0.3s;
            }
            .star:hover, .star.active {
                color: #FFD700;
            }
            textarea {
                width: 100%;
                margin-top: 10px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .submit-review {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 10px;
            }
            .submit-review:hover {
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
                    <div class="userprofile-section" id="profile-section">
                        <div class="userprofile-header">
                            <h2>Chi tiết lịch sử dịch vụ</h2>
                        </div>
                        <table class="userprofile-table">
                            <thead>
                                <tr>
                                    <th class="userprofile-table-cell userprofile-table-header">AppointmentID</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Chi tiết dịch vụ</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Trạng thái</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Giờ bắt đầu</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Giờ kết thúc</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Bác sĩ phụ trách</th>
                                    <th class="userprofile-table-cell userprofile-table-header">Customer Support</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.appointment}" var="appointment">
                                    <tr>
                                        <td class="userprofile-table-cell">${appointment.appointment_id}</td>
                                        <td class="userprofile-table-cell">${appointment.service.service_description}</td>
                                        <td class="userprofile-table-cell">${appointment.appointment_status}</td>
                                        <td class="userprofile-table-cell">${appointment.slot.start_time}</td>
                                        <td class="userprofile-table-cell">${appointment.slot.end_time}</td>
                                        <td class="userprofile-table-cell">${appointment.doctor.doctor_name}</td>
                                        <td class="userprofile-table-cell">
                                            ${appointment.staff.admin_fullname}
                                            <button class="review-button" onclick="openReviewModal('${appointment.appointment_id}')">★</button>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <!-- Modal đánh giá -->
                            <div class="modal" id="reviewModal">
                                <div class="modal-content">
                                    <span class="close" onclick="closeReviewModal()">&times;</span>
                                    <h2>Đánh giá Customer Support</h2>
                                    <form action="admin/dashboardcustomersupport" method="POST">
                                        <input type="hidden" id="appointmentId" name="appointment_id" />
                                        <div class="star-rating">
                                            <span class="star" data-value="1">★</span>
                                            <span class="star" data-value="2">★</span>
                                            <span class="star" data-value="3">★</span>
                                            <span class="star" data-value="4">★</span>
                                            <span class="star" data-value="5">★</span>
                                        </div>
                                        <textarea name="feedback" placeholder="Ghi đánh giá của bạn ở đây..."></textarea>
                                        <input type="hidden" name="rating" id="rating" />
                                        <button type="submit" class="submit-review">Gửi đánh giá</button>
                                    </form>
                                </div>
                            </div>    
                            </tbody>
                        </table>
                    </div>
                    <button class="back-button" onclick="goBack()">⬅ Quay lại</button>
                </div>
            </div>
        </div>
        <jsp:include page="Common/Message.jsp"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <jsp:include page="Common/Js.jsp"/>

        <script>
                        let selectedRating = 0;

                        document.querySelectorAll('.star').forEach(star => {
                            star.addEventListener('click', function () {
                                selectedRating = this.getAttribute('data-value');
                                document.getElementById('rating').value = selectedRating;
                                document.querySelectorAll('.star').forEach(s => {
                                    s.classList.remove('active');
                                });
                                for (let i = 0; i < selectedRating; i++) {
                                    document.querySelectorAll('.star')[i].classList.add('active');
                                }
                            });
                        });

                        function openReviewModal(appointmentId) {
                            document.getElementById('appointmentId').value = appointmentId;
                            document.getElementById('reviewModal').style.display = 'flex';
                        }

                        function closeReviewModal() {
                            document.getElementById('reviewModal').style.display = 'none';
                            selectedRating = 0;
                            document.querySelectorAll('.star').forEach(s => {
                                s.classList.remove('active');
                            });
                            document.getElementById('rating').value = '';
                        }

                        function goBack() {
                            window.history.back();
                        }
        </script>
    </body>
</html>