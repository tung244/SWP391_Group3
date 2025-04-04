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

            .star-rating {
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
            }

            .star-rating .fa-star {
                color: #ddd; /* Default unselected star color */
                font-size: 24px;
                cursor: pointer;
                margin: 0 5px;
                transition: color 0.2s ease;
            }

            .star-rating .fa-star.selected {
                color: #ffc107; /* Highlighted star color */
            }

            .star-rating .fa-star:hover {
                color: #ffc107; /* Hover effect */
            }

            .primary-button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 48%;
            }
            .primary-button:hover {
                background-color: #45a049;
            }

            .back-action-btn {
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

            .review-action-btn, .review-button {
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
            .review-action-btn:hover, .review-button:hover {
                background-color: #FF8C00;
            }

            .feedback-modal {
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
            .feedback-modal-content {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                width: 400px;
                text-align: center;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }

            .modal-close-btn {
                float: right;
                font-size: 24px;
                cursor: pointer;
            }

            .star-rating-container {
                font-size: 30px;
                color: #ddd;
                cursor: pointer;
            }
            .star-icon, .star {
                display: inline-block;
                transition: color 0.3s;
            }
            .star-icon:hover, .star-icon.active,
            .star:hover, .star.active {
                color: #FFD700;
            }

            .feedback-textarea {
                width: 100%;
                margin-top: 10px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .submit-feedback-btn {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 10px;
            }
            .submit-feedback-btn:hover {
                background-color: #45a049;
            }

            #customerFeedbackModal .star-icon {
                cursor: pointer;
                transition: color 0.3s;
            }

            #customerFeedbackModal .star-icon.active {
                color: #FFD700;
            }

            #customerFeedbackModal .star-icon.hover {
                color: #FFD700;
            }

        </style>  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

            <%-- Hiển thị thông báo lỗi --%>
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
            <div class="alert alert-danger" style="margin: 20px;">
                <%= error %>
            </div>
            <% } %>

            <div class="col-md-10">
                <div class="userprofile-main-content">
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
                                        <td class="userprofile-table-cell">${appointment.doctor.doctor_name}
                                            <c:if test="${appointment.appointment_status == 'Completed'}">
                                                <span style="margin-left: 10px; color: green" class="rating-icon">
                                                    <a href="#" 
                                                       class="rating-trigger" 
                                                       data-appointment-id="${appointment.appointment_id}"
                                                       data-doctor-name="${appointment.doctor.doctor_name}"
                                                       data-doctor-id="${appointment.doctor.doctor_id}">
                                                        <i class="fas fa-star"></i>
                                                    </a>
                                                </span>
                                            </c:if>
                                        </td>
                                        <td class="userprofile-table-cell">
                                            ${appointment.staffs.admin_fullname}
                                            <c:if test="${appointment.appointment_status == 'Completed'}">
                                                <button class="review-button" onclick="openReviewModal('${appointment.appointment_id}')">★</button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <a href="transactionhistoryy"><button class="login-button">⬅ Quay lại</button></a>
                    </div>

                    <!-- Modal đánh giá bác sĩ -->
                    <div class="modal fade" id="ratingModal" tabindex="-1" role="dialog" aria-labelledby="ratingModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ratingModalLabel">Đánh giá bác sĩ</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="ratingForm" action="transactiondetail" method="POST">
                                        <input type="hidden" id="appointmentId" name="appointment_id" value="${feedback.appointment_id}">
                                        <input type="hidden" id="doctorId" name="doctorId">
                                        <div class="form-group">
                                            <label for="doctorName">Bác sĩ phụ trách:</label>
                                            <input type="text" class="form-control" id="doctorName" name="doctorName" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="rating">Xếp hạng (1-5 sao):</label>
                                            <div id="starRating" class="star-rating">
                                                <i class="fas fa-star" data-value="1"></i>
                                                <i class="fas fa-star" data-value="2"></i>
                                                <i class="fas fa-star" data-value="3"></i>
                                                <i class="fas fa-star" data-value="4"></i>
                                                <i class="fas fa-star" data-value="5"></i>
                                            </div>
                                            <input type="hidden" id="feedbackRating" name="feedback_rating" value="0">
                                        </div>
                                        <div class="form-group">
                                            <label for="feedbackText">Nhận xét:</label>
                                            <textarea class="form-control" id="feedbackText" name="feedback_text" rows="3" placeholder="Nhập nhận xét của bạn..." required>${requestScope.feedback.feedback_text}</textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn btn-primary" id="submitRating">Gửi đánh giá</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal đánh giá Customer Support -->
                    <div class="feedback-modal" id="customerFeedbackModal">
                        <div class="feedback-modal-content">
                            <span class="modal-close-btn" onclick="closeFeedbackModal()">&times;</span>
                            <h2>Đánh giá Dịch vụ CSKH</h2>
                            <form action="addfeedback" method="post">
                                <input type="hidden" id="appointmentRefId" name="appointment_id" />
                                <div class="star-rating-container">
                                    <span class="star-icon" data-value="1">★</span>
                                    <span class="star-icon" data-value="2">★</span>
                                    <span class="star-icon" data-value="3">★</span>
                                    <span class="star-icon" data-value="4">★</span>
                                    <span class="star-icon" data-value="5">★</span>
                                </div>
                                <textarea class="feedback-textarea" name="feedback" placeholder="Ghi đánh giá của bạn ở đây..."></textarea>
                                <input type="hidden" name="rating" id="feedbackRating" />
                                <button type="submit" class="submit-feedback-btn">Gửi đánh giá</button>
                            </form>
                        </div>
                    </div>

                    <%-- Hiển thị thông báo thành công --%>
                    <% String successMessage = (String) session.getAttribute("success"); %>
                    <% if(successMessage != null) { %>
                    <script>
                        $(document).ready(function () {
                            alert("<%= successMessage %>");
                        });
                    </script>
                    <%
                        session.removeAttribute("success");
                    }
                    %>
                </div>
            </div>
        </div>

        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>

        <script>
            // Xử lý đánh giá sao cho customer support
            document.addEventListener('DOMContentLoaded', function () {
                // Customer Support Rating
                const csStars = document.querySelectorAll('#customerFeedbackModal .star-icon');
                const csRatingInput = document.getElementById('customerFeedbackModal').querySelector('input[name="rating"]');

                csStars.forEach(star => {
                    star.addEventListener('click', function () {
                        const rating = this.getAttribute('data-value');
                        csRatingInput.value = rating;

                        // Cập nhật hiển thị sao
                        csStars.forEach((s, index) => {
                            if (index < rating) {
                                s.classList.add('active');
                            } else {
                                s.classList.remove('active');
                            }
                        });
                    });

                    // Hiệu ứng hover
                    star.addEventListener('mouseover', function () {
                        const rating = this.getAttribute('data-value');
                        csStars.forEach((s, index) => {
                            if (index < rating) {
                                s.classList.add('hover');
                            }
                        });
                    });

                    star.addEventListener('mouseout', function () {
                        csStars.forEach(s => {
                            s.classList.remove('hover');
                        });
                    });
                });
            });

            function openReviewModal(appointmentId) {
                if (!appointmentId) {
                    alert('Lỗi: Không có thông tin lịch hẹn');
                    return;
                }

                document.getElementById('appointmentRefId').value = appointmentId;
                document.getElementById('customerFeedbackModal').style.display = 'flex';

                // Reset sao đánh giá khi mở modal
                const csStars = document.querySelectorAll('#customerFeedbackModal .star-icon');
                csStars.forEach(star => {
                    star.classList.remove('active');
                });
                document.querySelector('#customerFeedbackModal input[name="rating"]').value = '0';
            }

            function closeFeedbackModal() {
                document.getElementById('customerFeedbackModal').style.display = 'none';
            }
        </script>
        <script>
            // Xử lý chuyển tab
            document.addEventListener('DOMContentLoaded', function () {
                const navItems = document.querySelectorAll('.userprofile-nav-item');
                const sections = {
                    profile: document.getElementById('profile-section'),
                    history: document.getElementById('history-section'),
                    password: document.getElementById('password-section')
                };

                function showSection(sectionId) {
                    Object.values(sections).forEach(section => {
                        if (section)
                            section.style.display = 'none';
                    });

                    if (sections[sectionId])
                        sections[sectionId].style.display = 'block';

                    navItems.forEach(item => {
                        item.classList.remove('userprofile-nav-item--active');
                        if (item.getAttribute('data-tab') === sectionId) {
                            item.classList.add('userprofile-nav-item--active');
                        }
                    });
                }

                navItems.forEach(item => {
                    item.addEventListener('click', function () {
                        showSection(this.getAttribute('data-tab'));
                    });
                });

                showSection('profile');
            });

            // Xử lý đánh giá sao cho customer support
            let selectedRating = 0;

            document.querySelectorAll('.star').forEach(star => {
                star.addEventListener('click', function () {
                    selectedRating = this.getAttribute('data-value');
                    document.getElementById('feedbackRating').value = selectedRating;
                    document.querySelectorAll('.star').forEach(s => {
                        s.classList.remove('active');
                    });
                    for (let i = 0; i < selectedRating; i++) {
                        document.querySelectorAll('.star')[i].classList.add('active');
                    }
                });
            });

            function openReviewModal(appointmentId) {
                document.getElementById('appointmentRefId').value = appointmentId;
                document.getElementById('customerFeedbackModal').style.display = 'flex';
            }

            function closeFeedbackModal() {
                document.getElementById('customerFeedbackModal').style.display = 'none';
                selectedRating = 0;
                document.querySelectorAll('.star').forEach(s => {
                    s.classList.remove('active');
                });
                document.getElementById('feedbackRating').value = '';
            }

            function goBack() {
                window.history.back();
            }

            // Xử lý đánh giá bác sĩ
            document.addEventListener('DOMContentLoaded', function () {
                const starRatingContainer = document.getElementById('starRating');
                const feedbackRatingInput = document.getElementById('feedbackRating');
                const stars = starRatingContainer.querySelectorAll('.fa-star');

                // Hàm cập nhật trạng thái sao
                function updateStarRating(rating) {
                    stars.forEach(star => {
                        const starValue = parseInt(star.getAttribute('data-value'));
                        if (starValue <= rating) {
                            star.classList.add('selected');
                        } else {
                            star.classList.remove('selected');
                        }
                    });
                    feedbackRatingInput.value = rating;
                }

                // Điền thông tin modal với dữ liệu sẵn có
                function prefillModal(appointmentId, doctorName, doctorId, feedbackRating, feedbackText) {
                    document.getElementById('appointmentId').value = appointmentId;
                    document.getElementById('doctorName').value = doctorName;
                    document.getElementById('doctorId').value = doctorId;
                    document.getElementById('feedbackText').value = feedbackText || '';

                    // Cập nhật sao nếu có đánh giá
                    if (feedbackRating && feedbackRating > 0) {
                        updateStarRating(feedbackRating);
                    } else {
                        // Đặt lại sao nếu chưa có đánh giá
                        stars.forEach(s => s.classList.remove('selected'));
                        feedbackRatingInput.value = 0;
                    }
                }

                // Sự kiện click vào các ngôi sao
                stars.forEach(star => {
                    star.addEventListener('click', function () {
                        const rating = this.getAttribute('data-value');
                        updateStarRating(rating);
                    });

                    // Hiệu ứng hover
                    star.addEventListener('mouseover', function () {
                        const rating = this.getAttribute('data-value');
                        stars.forEach(s => {
                            const starValue = parseInt(s.getAttribute('data-value'));
                            if (starValue <= rating) {
                                s.classList.add('hovered');
                            } else {
                                s.classList.remove('hovered');
                            }
                        });
                    });

                    // Trả lại trạng thái ban đầu khi rời chuột
                    star.addEventListener('mouseout', function () {
                        const currentRating = feedbackRatingInput.value;
                        updateStarRating(currentRating);
                        stars.forEach(s => s.classList.remove('hovered'));
                    });
                });

                // Khởi tạo modal đánh giá
                document.querySelectorAll('.rating-trigger').forEach(trigger => {
                    trigger.addEventListener('click', function (e) {
                        e.preventDefault();

                        // Lấy dữ liệu từ thuộc tính data
                        const appointmentId = this.getAttribute('data-appointment-id');
                        const doctorName = this.getAttribute('data-doctor-name');
                        const doctorId = this.getAttribute('data-doctor-id');

                        // Lấy dữ liệu feedback sẵn có từ server (sử dụng EL)
                        const existingFeedbackRating = "${requestScope.feedback != null ? requestScope.feedback.feedback_rating : 0}";
                        const existingFeedbackText = "${requestScope.feedback != null ? requestScope.feedback.feedback_text : ''}";

                        // Điền thông tin vào modal
                        prefillModal(
                                appointmentId,
                                doctorName,
                                doctorId,
                                parseInt(existingFeedbackRating),
                                existingFeedbackText
                                );

                        // Hiển thị modal
                        $('#ratingModal').modal('show');
                    });
                });

                // Xử lý submit đánh giá
                document.getElementById('submitRating').addEventListener('click', function () {
                    const appointmentId = document.getElementById('appointmentId').value;
                    const feedbackRating = document.getElementById('feedbackRating').value;
                    const feedbackText = document.getElementById('feedbackText').value;
                    const doctorId = document.getElementById('doctorId').value;

                    // Kiểm tra đầu vào
                    if (feedbackRating == 0) {
                        alert('Vui lòng chọn số sao đánh giá!');
                        return;
                    }

                    if (!feedbackText.trim()) {
                        alert('Vui lòng nhập nhận xét!');
                        return;
                    }

                    // Submit form
                    document.getElementById('ratingForm').submit();
                });
            });
        </script>
    </body>
</html>