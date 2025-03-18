<%-- 
    Document   : UpdateAppointment
    Created on : Feb 20, 2025, 2:30:57 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>
    </head>
    <body>
        <jsp:include page="Common/Navbar.jsp"/>
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="row">
                        <div class="col-xl-7 mx-auto">
                            <h6 class="mb-0 text-uppercase">Basic Form</h6>
                            <hr>
                            <div class="card border-top border-0 border-4 border-primary">
                                <div class="card-body p-5">
                                    <form action="UpdateAppointment" method="post">
                                        <div class="text-center mt-4">
                                            <c:if test="${not empty mess}">
                                                <p style="color: green;">${mess}</p>
                                            </c:if>
                                        </div>
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Appointment Id</label>
                                                    <input type="text" class="form-control" name="id" value="${appointment.appointment_id}" readonly />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Doctors</label> <br>
                                                    <select class="form-control" name="doctor_select" id="doctor_${appointment.appointment_id}" 
                                                            onchange="selectDoctor(${appointment.appointment_id}, this.value, '${appointment.service_detail.serviceType.service_type_id}', '${appointment.appointment_date}');">
                                                        <option value="">-Select Doctor-</option>
                                                        <c:forEach var="doctor" items="${listD}">
                                                            <option value="${doctor.doctor_id}" ${doctor.doctor_id == appointment.doctor.doctor_id ? "selected" : ""}>
                                                                ${doctor.doctor_name}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Slots</label> <br>
                                                    <select class="form-control" name="slot" id="slot_${appointment.appointment_id}">
                                                        <c:if test="${not empty appointment.slot.slot_id}">
                                                            <option value="${appointment.slot.slot_id}" selected>${appointment.slot.start_time} - ${appointment.slot.end_time}</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Status</label>
                                                    <select class="form-control" name="status" required>
                                                        <option value="" disabled>Select Status</option>
                                                        <option value="Waiting Scheduled" ${"Waiting Scheduled".equals(appointment.appointment_status) ? "selected" : ""}>Waiting Scheduled</option>
                                                        <option value="Scheduled" ${"Scheduled".equals(appointment.appointment_status) ? "selected" : ""}>Scheduled</option>
                                                        <option value="Completed" ${"Completed".equals(appointment.appointment_status) ? "selected" : ""}>Completed</option>
                                                        <option value="Canceled" ${"Canceled".equals(appointment.appointment_status) ? "selected" : ""}>Canceled</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-update">Update Appointment</button>
                                            <a href="ListStaff" class="btn btn-secondary ms-2">Cancel</a>
                                        </div>
                                    </form>
                                    </body>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
        <jsp:include page="Common/Js.jsp"/>    

        <script>
            function selectDoctor(appointmentId, doctorId, serviceTypeId, appointmentDate) {
                console.log('selectDoctor called with appointmentId:', appointmentId);
                console.log('doctorId:', doctorId);
                console.log('serviceTypeId:', serviceTypeId);
                console.log('appointmentDate:', appointmentDate);

                if (doctorId) {
                    const slotSelect = document.getElementById('slot_' + appointmentId);
                    if (!slotSelect) {
                        console.error('Could not find slot select by ID:', "${appointmentId}");
                        return; // Thoát nếu không tìm thấy dropdown
                    }

                    const url = `getAvailableSlots?doctorId=` + doctorId + ` &serviceTypeId=` + serviceTypeId + `&date=` + appointmentDate;
                    console.log(`Fetching data from URL:` + url);

                    fetch(url)
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.json();
                            })
                            .then(data => {
                                console.log('Received data:', data);
                                updateSlotOptions(slotSelect, data);
                            })
                            .catch(error => console.error('Error fetching data:', error));
                }
            }

            function updateSlotOptions(selectElement, slots) {
                selectElement.innerHTML = '<option value="">-Select Slot-</option>';

                if (!Array.isArray(slots)) {
                    console.error('Slots data is not an array:', slots);
                    return;
                }
                console.log('Appending option:', slots);
                slots.forEach(function (slot) {
                    const option = document.createElement('option');
                    option.value = slot.slot_id; // Gán giá trị cho tùy chọn
                    var start_time = slot.start_time ? slot.start_time.trim() : '';
                    var end_time = slot.end_time ? slot.end_time.trim() : '';
                    console.log('Id:', slot.slot_id);
                    console.log('start_time:', start_time);
                    console.log('end_time:', end_time);
                    option.textContent = start_time + "-" + end_time; // Gán văn bản cho tùy chọn
                    console.log('Appending option:', option); // In ra tùy chọn đang thêm vào
                    selectElement.appendChild(option); // Thêm tùy chọn vào phần tử select
                });

                console.log('All options appended to select element');
            }
            ;
        </script>
    </body>
</html>
