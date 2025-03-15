<%-- 
    Document   : DoctorCalendar
    Created on : Feb 26, 2025, 11:35:00 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                    <!--breadcrumb-->
                    <div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
                        <div class="breadcrumb-title pe-3">Calendar</div>
                        <div class="ps-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="javascript:;"><i class='bx bx-home-alt'></i></a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Calendar of ${doctor.doctor_name}</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <!--end breadcrumb-->


                    <div class="card">
                        <div class="card-body">
                            <div>
                                <div style="display: flex; align-items: center;">
                                    <h4 style="color: green; font-weight: bold; margin: 0;">Appointment Table</h4>
                                    <form action="GetDoctorCalendar" method="post" style="display: flex; align-items: center; margin-top: 10px; margin-left: auto;">
                                        <input class="form-control"  name="name" value="${name}" style="margin-left: 10px; padding: 5px; border-radius: 5px; border: 1px solid #ccc; font-size: 14px; " type="text" placeholder="Choose the name">
                                        <!--                                        <select class="form-control" name="service_name" style="margin-left: 10px; padding: 5px; border-radius: 5px; border: 1px solid #ccc; font-size: 14px;">
                                                                                    <option value="">-Select Service_Name-</option>
                                        <c:forEach var="s" items="${listS}">
                                            <option value="${s.service_id}" ${s.service_id==service_id?'selected':''}>${s.service_name}</option>  
                                        </c:forEach>    
                                    </select>-->
                                        <input class="form-control"  name="doctor_id" value="${doctor.doctor_id}" type="hidden">
                                        <input class="form-control"  name="date" value="${date}" style="margin-left: 10px; padding: 5px; border-radius: 5px; border: 1px solid #ccc; font-size: 14px; " type="date">
                                        <button type="submit" style="margin-left: 10px; padding: 5px 10px; border-radius: 5px; border: 1px solid #ccc; background-color: green; cursor: pointer; color: white; display: flex; align-items: center;">
                                            <img src="https://img.icons8.com/material-outlined/24/ffffff/search.png" alt="Search" style="filter: brightness(0) invert(1);" />
                                        </button>
                                    </form>
                                </div>

                                <hr>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered mb-0" id="table3">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col" style="color: green">#</th>
                                                <th scope="col" style="color: green">CusId</th>
                                                <th scope="col" style="color: green">CusName</th>
                                                <th scope="col" style="color: green">Service_Name</th>
                                                <th scope="col" style="color: green">Type</th>
                                                <th scope="col" style="color: green">Time</th>
                                                <th scope="col" style="color: green">Date</th>
                                                <th scope="col" style="color: green">Cost</th>
                                                <th scope="col" style="color: green">Status</th>
                                                <th scope="col" style="color: green">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="a" items="${listA}">
                                                <tr>
                                                    <td>${a.appointment_id}</td>
                                                    <td>${a.user.account.account_id}</td>
                                                    <td>${a.user.fullname}</td>
                                                    <td>${a.service_detail.services.service_name}</td>
                                                    <td>${a.service_detail.serviceType.service_type_name}</td>
                                                    <td>
                                                        <span>${a.slot.start_time} - ${a.slot.end_time}</span>
                                                    </td>
                                                    <td><fmt:formatDate value="${a.appointment_date}" pattern="dd/MM/yyyy"/></td>
                                                    <td>
                                                        <fmt:formatNumber value="${a.service_detail.cost}" pattern="#,###" />
                                                    </td>
                                                    <td style="font-weight: bold">
                                                        <c:choose>
                                                            <c:when test="${a.appointment_status == 'Waiting Scheduled'}">
                                                                <span style="color: orange;">${a.appointment_status}</span>
                                                            </c:when>
                                                            <c:when test="${a.appointment_status == 'Scheduled'}">
                                                                <span style="color: blue;">${a.appointment_status}</span>
                                                            </c:when>
                                                            <c:when test="${a.appointment_status == 'Completed'}">
                                                                <span style="color: green;">${a.appointment_status}</span>
                                                            </c:when>
                                                            <c:when test="${a.appointment_status == 'Canceled'}">
                                                                <span style="color: red;">${a.appointment_status}</span>
                                                            </c:when>
                                                            <c:when test="${a.appointment_status == 'Payed'}">
                                                                <span style="color: purple;">${a.appointment_status}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>${a.appointment_status}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a href="NoteMedical?id=${a.appointment_id}" title="Delete">
                                                            <i class="fas fa-file-alt icon"></i>
                                                        </a>    
                                                        <a href="#" title="View" onclick="loadMedicalHistory(${a.appointment_id});" data-toggle="modal" data-target="#viewModal">
                                                            <i class="fas fa-eye icon"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <c:forEach var="i" begin="1" end="${requestScope.number}">
                                            <li class="page-item ${i == page ? 'active' : ''}">
                                                <a class="page-link" href="ServiceList?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end page-content-wrapper-->
        </div>
        <!-- Modal -->
        <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">

            <div class="modal-dialog modal-xl"> <!-- Thêm lớp modal-lg -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">Medical History</h5>
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
        <!--end page-wrapper-->
        <!--start overlay-->
        <div class="overlay toggle-btn-mobile"></div>
        <!--end overlay-->
        <!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
        <!--End Back To Top Button-->
        <!--footer -->
        <div class="footer">
            <p class="mb-0">Syndash @2020 | Developed By : <a href="https://themeforest.net/user/codervent" target="_blank">codervent</a>
            </p>
        </div>
        <!-- end footer -->
    </div>
    <!-- end wrapper -->
    <!--start switcher-->
    <div class="switcher-body">
        <button class="btn btn-primary btn-switcher shadow-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bx bx-cog bx-spin"></i></button>
        <div class="offcanvas offcanvas-end shadow border-start-0 p-2" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling">
            <div class="offcanvas-header border-bottom">
                <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Theme Customizer</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body">
                <h6 class="mb-0">Theme Variation</h6>
                <hr>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="lightmode" value="option1" checked>
                    <label class="form-check-label" for="lightmode">Light</label>
                </div>
                <hr>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="darkmode" value="option2">
                    <label class="form-check-label" for="darkmode">Dark</label>
                </div>
                <hr>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="darksidebar" value="option3">
                    <label class="form-check-label" for="darksidebar">Semi Dark</label>
                </div>
                <hr>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="ColorLessIcons" value="option3">
                    <label class="form-check-label" for="ColorLessIcons">Color Less Icons</label>
                </div>
            </div>
        </div>
    </div>
    <script>
        function loadMedicalHistory(id) {
            console.log("Loading medical history for ID:", id);
            var modalContent = document.getElementById("modalContent");
            modalContent.innerHTML = "Loading...";

            // Send request to servlet
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/SWP391/LoadMedicalHistory?aId=" + id, true);
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
    <jsp:include page="Common/Js.jsp"/>
</body>
</html>
