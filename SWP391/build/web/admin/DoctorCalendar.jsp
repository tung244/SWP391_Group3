<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lịch Trình Bác Sĩ</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <jsp:include page="Common/Css.jsp"/>
        <style>
            .calendar-day {
                height: 120px;
                border: 1px solid #dee2e6;
                padding: 5px;
                vertical-align: top;
                overflow-y: auto;
            }
            .calendar-day:hover {
                background-color: #f8f9fa;
            }
            .calendar-day.today {
                background-color: #e2f0ff;
            }
            .calendar-day.has-appointments {
                position: relative;
            }
            .calendar-day.has-appointments::after {
                content: '';
                position: absolute;
                right: 5px;
                top: 5px;
                width: 10px;
                height: 10px;
                background-color: #0d6efd;
                border-radius: 50%;
            }
            .appointment-item {
                font-size: 0.8rem;
                padding: 2px 4px;
                margin-bottom: 2px;
                background-color: #e7f5ff;
                border-left: 3px solid #0d6efd;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                cursor: pointer;
            }
            .appointment-item:hover {
                background-color: #cce5ff;
            }
            .appointment-count {
                font-size: 0.75rem;
                color: #0d6efd;
                font-weight: bold;
                margin-top: 2px;
            }
            .day-number {
                font-weight: bold;
                margin-bottom: 4px;
            }
            .doctor-info {
                background-color: #f8f9fa;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                height: 100%;
            }
            .doctor-image {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                object-fit: cover;
            }
        </style>
    </head>
    <body> 
        <jsp:include page="Common/Navbar.jsp"/>
        <div class="page-wrapper">
            <div class="container mt-6 mb-6" style="width: 80%; margin-left: 20%">
                <h1 class="text-center mb-4">Lịch Trình Bác Sĩ</h1>

                <!--                <div class="row">-->
                <!-- Doctor Information (Left side) -->
                <!--                    <div class="col-md-3">
                                        <div class="doctor-info">
                                            <div class="text-center mb-3">
                                                <img src="${doctor.profile_image}" 
                                                     alt="Doctor's Photo" class="doctor-image">
                                            </div>
                                            <h3 style="text-align: center">${doctor.doctor_name}</h3>
                                            <p><strong>Chuyên khoa:</strong> ${doctor.specialization.specialization_name}</p>
                                            <p><strong>Giờ làm việc:</strong> 08:00 - 17:00 (Thứ 2 - Thứ 6)</p>
                                            <p><strong>Địa chỉ phòng khám:</strong> 123 Nguyễn Văn A, Quận 1, TP. HCM</p>
                                            <p><strong>Liên hệ:</strong> 0123 456 789</p>
                                        </div>
                                    </div>-->

                <!-- Calendar (Right side) -->
                <div class="col-md-12">
                    <!-- Calendar Controls -->
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <button id="prev-month" class="btn btn-outline-primary">
                                <i class="bi bi-chevron-left"></i> Tháng trước
                            </button>
                            <button id="next-month" class="btn btn-outline-primary">
                                Tháng sau <i class="bi bi-chevron-right"></i>
                            </button>
                            <select id="doctor_select">
                                <c:forEach var="d" items="${listD}">
                                    <option value="${d.doctor_id}">${d.doctor_name}</option>
                                </c:forEach>
                            </select>

                        </div>
                        <div class="col-md-4 text-center">
                            <h4 id="current-month-year">Tháng 6, 2023</h4>
                        </div>
                        <div class="col-md-4 text-end">
                            <button id="today" class="btn btn-primary">Hôm nay</button>
                        </div>
                    </div>

                    <!-- Calendar -->
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">CN</th>
                                    <th class="text-center">T2</th>
                                    <th class="text-center">T3</th>
                                    <th class="text-center">T4</th>
                                    <th class="text-center">T5</th>
                                    <th class="text-center">T6</th>
                                    <th class="text-center">T7</th>
                                </tr>
                            </thead>
                            <tbody id="calendar-body">
                                <!-- Calendar days will be generated here by JavaScript -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Appointment Details Modal -->
            <div class="modal fade" id="appointmentModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Chi Tiết Lịch Hẹn</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="appointment-details">
                            <!-- Appointment details will be loaded here -->
                        </div>
                        <div class="modal-footer">
                            <button id="recordMedicalNoteBtn" class="btn btn-primary">Medical Note</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--        </div>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Khởi tạo mảng appointments rỗng
            var appointments = [];

            <%-- Tạo dữ liệu từ Java --%>
            <% 
                if (request.getAttribute("listA") != null) {
                    java.util.List listA = (java.util.List)request.getAttribute("listA");
                    for (int i = 0; i < listA.size(); i++) {
                        Object app = listA.get(i);
                        try {
                            String date = app.getClass().getMethod("getAppointment_date").invoke(app).toString();
                            Object slot = app.getClass().getMethod("getSlot").invoke(app);
                            String startTime = slot.getClass().getMethod("getStart_time").invoke(slot).toString();
                            String endTime = slot.getClass().getMethod("getEnd_time").invoke(slot).toString();
                            Object user = app.getClass().getMethod("getUser").invoke(app);
                            String fullname = user.getClass().getMethod("getFullname").invoke(user).toString();
                            Object serviceDetail = app.getClass().getMethod("getService_detail").invoke(app);
                            Object service = serviceDetail.getClass().getMethod("getServices").invoke(serviceDetail);
                            String serviceName = service.getClass().getMethod("getService_name").invoke(service).toString();
                            String status = app.getClass().getMethod("getAppointment_status").invoke(app).toString();
                            int id = Integer.parseInt(app.getClass().getMethod("getAppointment_id").invoke(app).toString());
            %>
            appointments.push({
                date: "<%= date %>",
                time: "<%= startTime %>",
                endTime: "<%= endTime %>",
                patient: "<%= fullname.replace("\"", "\\\"") %>",
                purpose: "<%= serviceName.replace("\"", "\\\"") %>",
                status: "<%= status %>",
                id: <%= id %>
            });
            <%
                        } catch (Exception e) {
                            e.printStackTrace(new java.io.PrintWriter(out));
                        }
                    }
                }
            %>

            // In ra console để debug
            console.log("Database appointments:", appointments);
        </script>

        <%-- Script chính --%>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                let currentDate = new Date();

                // Tạo hàm để thay thế padStart
                function padZero(num) {
                    return num < 10 ? '0' + num : num;
                }

                // Thêm dữ liệu mẫu chỉ khi không có dữ liệu
                if (appointments.length === 0) {
                    const today = new Date();
                    const currentMonth = today.getMonth() + 1;
                    const currentYear = today.getFullYear();

                    appointments = [
                        // Dữ liệu mẫu cho tháng hiện tại
                        {
                            date: currentYear + '-' + padZero(currentMonth) + '-10',
                            time: '09:30',
                            patient: 'Nguyễn Văn X',
                            purpose: 'Khám định kỳ',
                            status: 'Completed'
                        },
                                // ... các dữ liệu mẫu khác
                    ];
                }

                // Đảm bảo định dạng ngày tháng nhất quán
                appointments.forEach(app => {
                    console.log("Processing appointment:", app);
                    // Kiểm tra nếu ngày không có dấu gạch ngang, thêm vào
                    if (app.date && app.date.indexOf('-') === -1) {
                        // Giả sử định dạng là yyyyMMdd
                        const year = app.date.substring(0, 4);
                        const month = app.date.substring(4, 6);
                        const day = app.date.substring(6, 8);
                        app.date = year + '-' + month + '-' + day;
                        console.log("Reformatted date:", app.date);
                    }
                });

                console.log("Final appointments data:", appointments);

                function renderCalendar(year, month) {
                    // Ghi log để kiểm tra tham số gọi hàm
                    console.log("Rendering calendar for:", year, month + 1);

                    const firstDay = new Date(year, month, 1);
                    const lastDay = new Date(year, month + 1, 0);
                    const daysInMonth = lastDay.getDate();
                    const startingDayOfWeek = firstDay.getDay();

                    // Cập nhật tiêu đề tháng - lưu ý dòng này
                    const monthTitle = document.getElementById('current-month-year');
                    monthTitle.textContent = 'Tháng ' + (month + 1) + ', ' + year;
                    console.log("Updated month title to:", monthTitle.textContent);

                    const calendarBody = document.getElementById('calendar-body');
                    calendarBody.innerHTML = '';

                    let date = 1;
                    for (let i = 0; i < 6; i++) {
                        // Tạo hàng tuần
                        const row = document.createElement('tr');

                        for (let j = 0; j < 7; j++) {
                            const cell = document.createElement('td');
                            cell.className = 'calendar-day';

                            if (i === 0 && j < startingDayOfWeek) {
                                // Các ô trống trước ngày đầu tiên của tháng
                                cell.textContent = '';
                            } else if (date > daysInMonth) {
                                // Các ô trống sau ngày cuối cùng của tháng
                                cell.textContent = '';
                            } else {
                                // Ngày hợp lệ trong tháng
                                const dayDiv = document.createElement('div');
                                dayDiv.textContent = date;
                                dayDiv.className = 'day-number';
                                cell.appendChild(dayDiv);

                                // Định dạng chuỗi ngày tháng để so sánh với dữ liệu cuộc hẹn
                                const dateStr = year + '-' + padZero(month + 1) + '-' + padZero(date);

                                // Kiểm tra xem có phải là hôm nay không
                                const today = new Date();
                                if (date === today.getDate() && month === today.getMonth() && year === today.getFullYear()) {
                                    cell.classList.add('today');
                                }

                                // Tìm các cuộc hẹn cho ngày này
                                const dayAppointments = appointments.filter(app => {
                                    console.log("Comparing:", app.date, "with", dateStr);
                                    return app.date === dateStr;
                                });

                                console.log("Appointments for", dateStr, ":", dayAppointments.length);

                                if (dayAppointments.length > 0) {
                                    cell.classList.add('has-appointments');

                                    // Hiển thị số lượng cuộc hẹn nếu nhiều hơn 3
                                    const maxVisibleAppointments = 3;
                                    const showCount = dayAppointments.length > maxVisibleAppointments;

                                    // Hiển thị các cuộc hẹn có thể nhìn thấy
                                    const visibleAppointments = showCount ?
                                            dayAppointments.slice(0, maxVisibleAppointments) :
                                            dayAppointments;

                                    visibleAppointments.forEach(app => {
                                        const appDiv = document.createElement('div');
                                        appDiv.className = 'appointment-item';
                                        appDiv.textContent = app.time + ' - ' + app.patient;
                                        appDiv.title = app.time + ' - ' + app.patient + ' (' + app.purpose + ')';
                                        appDiv.dataset.appointmentDate = dateStr;
                                        appDiv.dataset.appointmentTime = app.time;
                                        appDiv.addEventListener('click', function () {
                                            showAppointmentDetails(app);
                                        });
                                        cell.appendChild(appDiv);
                                    });

                                    // Hiển thị số lượng các cuộc hẹn bổ sung
                                    if (showCount) {
                                        const countDiv = document.createElement('div');
                                        countDiv.className = 'appointment-count';
                                        const remaining = dayAppointments.length - maxVisibleAppointments;
                                        countDiv.textContent = '+ ' + remaining + ' cuộc hẹn khác';
                                        countDiv.addEventListener('click', function () {
                                            showDayAppointments(dateStr, dayAppointments);
                                        });
                                        cell.appendChild(countDiv);
                                    }
                                }

                                date++;
                            }

                            row.appendChild(cell);
                        }

                        calendarBody.appendChild(row);

                        if (date > daysInMonth) {
                            break;
                        }
                    }
                }

                function showAppointmentDetails(appointment) {
                    console.log("Showing appointment details for:", appointment);

                    const modalBody = document.getElementById('appointment-details');

                    // Sửa hàm hiển thị chi tiết cuộc hẹn
                    const appointmentHTML =
                            '<p><strong>Ngày:</strong> ' + formatDate(appointment.date) + '</p>' +
                            '<p><strong>Thời gian:</strong> ' + appointment.time +
                            (appointment.endTime ? ' - ' + appointment.endTime : '') + '</p>' +
                            '<p><strong>Bệnh nhân:</strong> ' + appointment.patient + '</p>' +
                            '<p><strong>Dịch vụ:</strong> ' + appointment.purpose + '</p>' +
                            '<p><strong>Trạng thái:</strong> <span class="badge ' +
                            (appointment.status === 'Completed' ? 'bg-success' :
                                    appointment.status === 'Payed' ? 'bg-warning' : 'bg-primary') +
                            '">' + appointment.status + '</span></p>';

                    modalBody.innerHTML = appointmentHTML;
                    document.getElementById('recordMedicalNoteBtn').addEventListener('click', function () {
                        const id = appointment.id; // Giả sử bạn có thuộc tính id trong appointment
                        window.location.href = '/SWP391/admin/NoteMedical?id=' + id; // Gọi đến servlet NoteMedical với id
                    });
                    const modal = new bootstrap.Modal(document.getElementById('appointmentModal'));
                    modal.show();
                }


                function showDayAppointments(dateStr, appointments) {
                    const modalBody = document.getElementById('appointment-details');
                    const formattedDate = formatDate(dateStr);

                    // Sử dụng cú pháp nối chuỗi thay vì template literals
                    let appointmentsHTML = '<h5>Các cuộc hẹn ngày ' + formattedDate + '</h5><hr>';

                    appointments.forEach(app => {
                        appointmentsHTML +=
                                '<div class="card mb-2">' +
                                '<div class="card-body">' +
                                '<h6 class="card-title">' + app.time + ' - ' + app.patient + '</h6>' +
                                '<p class="card-text mb-1"><strong>Mục đích:</strong> ' + app.purpose + '</p>' +
                                '<p class="card-text mb-0"><strong>Trạng thái:</strong> ' +
                                '<span class="badge ' + (app.status === 'Đã xác nhận' ? 'bg-success' : 'bg-warning') + '">' +
                                app.status + '</span>' +
                                '</p>' +
                                '</div>' +
                                '</div>';
                    });

                    modalBody.innerHTML = appointmentsHTML;

                    // Update modal title
                    document.querySelector('#appointmentModal .modal-title').textContent = 'Lịch hẹn ngày ' + formattedDate;

                    const modal = new bootstrap.Modal(document.getElementById('appointmentModal'));
                    modal.show();
                }

                function formatDate(dateString) {
                    if (!dateString)
                        return "N/A";

                    try {
                        const [year, month, day] = dateString.split('-');
                        if (!year || !month || !day)
                            return "Invalid date";
                        return day + '/' + month + '/' + year;
                    } catch (e) {
                        console.error("Error formatting date:", e);
                        return "Error";
                    }
                }

                // Initialize calendar với tháng hiện tại
                renderCalendar(currentDate.getFullYear(), currentDate.getMonth());

                // Xử lý các sự kiện điều hướng
                document.getElementById('prev-month').addEventListener('click', function () {
                    currentDate.setMonth(currentDate.getMonth() - 1);
                    renderCalendar(currentDate.getFullYear(), currentDate.getMonth());
                });

                document.getElementById('next-month').addEventListener('click', function () {
                    currentDate.setMonth(currentDate.getMonth() + 1);
                    renderCalendar(currentDate.getFullYear(), currentDate.getMonth());
                });

                document.getElementById('today').addEventListener('click', function () {
                    currentDate = new Date();
                    renderCalendar(currentDate.getFullYear(), currentDate.getMonth());
                });
            });
        </script>
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>
    </body>
</html> 