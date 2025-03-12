<%-- 
    Document   : DoctorDetail
    Created on : Feb 11, 2025, 4:43:42 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/> 
        <style>
            button {
                background: #E8E7E6; /* Màu xanh lá */
                border: solid #000 1px;
                border-radius: 2%;
                font-size: 20px;
                font-weight: 100;
                color: #000;
                cursor: pointer;
                transition: all 0.3s ease;
                min-width: 100px; /* Đảm bảo nút có kích thước đồng đều */
                margin-right: 1%;
            }

            /* Hiệu ứng hover */
            button:hover {
                background: #009933; /* Xanh đậm hơn khi hover */
                box-shadow: 0 4px 6px rgba(34, 139, 34, 0.3);
                transform: translateY(-2px);
            }
        </style>
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <!--sidebar-wrapper-->

            <!--end sidebar-wrapper-->
            <!--header-->
            <jsp:include page="Common/Sidebar.jsp"/> 
            <!--end header-->
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <!--breadcrumb-->
                        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                            <div class="breadcrumb-title pe-3">Tables</div>
                            <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                        </li>

                                        <li class="breadcrumb-item active" aria-current="page">Dr.${doctor.doctor_name}</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <!--Start doctor detail area-->
                        <section class="doctor-details-area">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="doctor-details bg-white p-4 rounded-lg shadow-sm">
                                            <div class="row">
                                                <!-- Doctor Profile Image -->
                                                <div class="col-lg-3 col-md-4">
                                                    <div class="doctor-thumb text-center">

                                                        <img style="width: 250px" src=".${doctor.profile_image}" alt="Doctor Photo" class="rounded-circle img-fluid mb-3"/>
                                                        <div class="star-rating text-warning mb-2">
                                                            <span class="text-muted ml-2">Rating: ${doctor.rating}</span> ★
                                                            </br>
                                                            <span class="text-muted ml-2">(45 reviews)</span>
                                                        </div>

                                                    </div>
                                                </div>

                                                <!-- Doctor Information -->
                                                <div class="col-lg-9 col-md-8">
                                                    <div class="doctor-info">
                                                        <h2 class="text-success mb-3">${doctor.doctor_name}</h2>
                                                        <h4 class="text mb-4">Specialization: ${doctor.specialization.specialization_name}</h4>
                                                        <div style="margin-bottom: 2%">
                                                            <button><a style="color: black" href="degreeDetail?did=${doctor.doctor_id}">Degree Detail</a></button>
                                                            <button><a style="color: black" href="certificateDetail?did=${doctor.doctor_id}">Certificate Detail</a></button>
                                                            <button><a style="color: black" href="editDoctorProfile?did=${doctor.doctor_id}">Edit Profile</a></button>
                                                            <button><a style="color: black" href="addDegree?did=${doctor.doctor_id}">Add Degree</a></button>
<!--                                                            <button><a style="color: black" href="">Edit Certificate</a></button>-->
                                                        </div>
                                                        <!-- Personal Details -->
                                                        <div class="row mb-4">
                                                            <div class="col-md-6">
                                                                <h5 class="text-success border-bottom pb-2">Personal Information</h5>
                                                                <ul class="list-unstyled">
                                                                    <li class="mb-2"><strong>Gender:</strong>${doctor.gender}</li>

                                                                    <li class="mb-2"><strong>Date of birth:</strong>
                                                                        <fmt:parseDate value="${doctor.dob}" pattern="yyyy-MM-dd" var="parsedDob" />
                                                                        <fmt:formatDate value="${parsedDob}" pattern="dd/MM/yyyy"/> </li>

                                                                    <li class="mb-2"><strong>Address:</strong>${doctor.address}</li>
                                                                    <li class="mb-2"><strong>Experience:</strong> ${doctor.experience_years} years</li>
                                                                    <li class="mb-2"><strong>Workplace:</strong> EyeCare hospital</li>
                                                                </ul>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <h5 class="text-success border-bottom pb-2">Specialties</h5>
                                                                <ul class="list-unstyled">
                                                                    <c:forEach items="${listSpecById}" var="spec">
                                                                        <li class="mb-2">🦷 ${spec.specialization_name}</li>
                                                                        </c:forEach>

                                                                </ul>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <h5 class="text-success border-bottom pb-2">Degree</h5>
                                                                <ul class="list-unstyled">
                                                                    <c:forEach items="${listDegree}" var="de">
                                                                        <li class="mb-2">- ${de.degree_name}</li>
                                                                        </c:forEach>

                                                                </ul>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <h5 class="text-success border-bottom pb-2">Certificate</h5>
                                                                <ul class="list-unstyled">
                                                                    <c:forEach items="${listCer}" var="cer">
                                                                        <li class="mb-2"><strong>Certificate:</strong> ${cer.certificate_name}</li>
                                                                        <li class="mb-2"><strong>Certificate issued by:</strong> ${cer.cer_doct.issued_by}</li>
                                                                        </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <!-- Biography -->
                                                        <div class="doctor-bio mb-4">
                                                            <h5 class="text-success border-bottom pb-2">Professional Biography</h5>
                                                            <c:forEach items="${listCer}" var="cer">
                                                                <p class="text-muted">Certificate: ${cer.certificate_name}</p>
                                                            </c:forEach>                                                         
                                                            <p class="text-muted">Working at: EyeCare hospital</p>
                                                            <p class="text-muted">Experience years: ${d.experience_years} years</p>
                                                        </div>

                                                        <!-- Action Buttons -->

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!--End doctor detail area-->
                        <%
                              String errorMessage = (String) session.getAttribute("error");
                              String successMessage = (String) session.getAttribute("success");
                              if(errorMessage != null) {
                        %>
                        <script>
                            alert("<%= errorMessage %> ");
                        </script>
                        <%
                         session.removeAttribute("error");       
                            }else if(successMessage != null){
                        %>
                        <script>
                             alert("<%= successMessage %> ");
                        </script>
                        <%
                         session.removeAttribute("success");       
                            }
                        %>
                    </div>
                </div>
                <!--end page-content-wrapper-->
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
        <!--end switcher-->
        <!-- JavaScript -->
        <!-- Bootstrap JS -->
        <script src="../admin/assets/js/bootstrap.bundle.min.js"></script>

        <!--plugins-->
        <script src="../admin/assets/js/jquery.min.js"></script>
        <script src="../admin/assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="../admin/assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="../admin/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <!--Data Tables js-->
        <script src="../admin/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
        <script>
                             $(document).ready(function () {
                                 //Default data table
                                 $('#example').DataTable();
                                 var table = $('#example2').DataTable({
                                     lengthChange: false,
                                     buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
                                 });
                                 table.buttons().container().appendTo('#example2_wrapper .col-md-6:eq(0)');
                             });
        </script>
        <!-- App JS -->
        <script src="../admin/assets/js/app.js"></script>
    </body>

</html>