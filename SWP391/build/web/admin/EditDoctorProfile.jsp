<%-- 
    Document   : createDoctor
    Created on : Feb 24, 2025, 12:30:15 AM
    Author     : PC
--%>

<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/>  
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <jsp:include page="Common/Sidebar.jsp"/>    
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <!--breadcrumb-->
                        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                            <div class="breadcrumb-title pe-3">Forms</div>
                            <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0 p-0">
                                        <li class="breadcrumb-item"><a href=""><i class="bx bx-home-alt"></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page"><a href="doctorProfile?accId=${accId}">Dr.${doctor.doctor_name}</a></li>
                                        <li class="breadcrumb-item active" aria-current="page"> Edit Doctor Profile</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <div class="row">
                            <div class="col-xl-7 mx-auto">


                                <hr>
                                <div class="card border-top border-0 border-4 border-success">
                                    <div class="card-body p-5">
                                        <div class="card-title d-flex align-items-center">
                                            <div><i class="bx bxs-user me-1 font-22 text-success"></i></div>
                                            <h5 class="mb-0 text-uppercase text-success">Edit Doctor Profile</h5>                   
                                        </div>

                                        <hr>

                                        <form action="editDoctorProfile" method="POST" class="row g-3"  enctype="multipart/form-data" >

                                            <div class="col-12">                                            
                                                <input name="doctorId" id="doctorId" value="${doctor.doctor_id}" type="hidden" class="form-control" placeholder="Doctor Name" required>
                                                <span id="error-doctorName" name="error-doctorName"></span>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label">Doctor Name</label>
                                                <input name="doctorName" id="doctorName" value="${doctor.doctor_name}" type="text" class="form-control" placeholder="Doctor Name" required>
                                                <span id="error-doctorName" name="error-doctorName"></span>
                                            </div> 

                                                <div class="col-12">

                                                    <label class="form-label">Profile Image:</label>
                                                    <img style="width: 150px" src=".${doctor.profile_image}" alt="Doctor Photo" class=" img-fluid mb-3"/>
                                                    <input type="hidden" name="imageProfile" value="${doctor.profile_image}">
                                                    <input type="file" id="profileImage" name="profileImage"  class="form-control" >
                                                    <span id="error-profileImage" name="error-profileImage"></span>
                                                </div>

                                            <div class="col-12">
                                                <label class="form-label">Experience Years</label>
                                                <input type="number" min="1" value="${doctor.experience_years}" id="experienceYears" name="experienceYears" class="form-control" placeholder="Experience Years"  required>
                                                <span id="error-experienceYears" name="error-experienceYears"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Specialization</label>                                               
                                                <select id="specializationId" name="specializationId" class="form-select" required>
                                                    <c:forEach items="${listSpe}" var="lsp">
                                                        <option value="${lsp.specialization_id}" ${doctor.specialization.specialization_id == lsp.specialization_id ? 'selected' : ''}>${lsp.specialization_name}</option>
                                                    </c:forEach>
                                                </select>
                                                <span id="error-specializationId" name="error-specializationId"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Gender</label>
                                                <input type="radio" name="gender" id="Female" value="Female" ${doctor.gender == 'Female' ? 'checked' : ''} required> Female
                                                <input type="radio" name="gender" id="Male" value="Male" ${doctor.gender == 'Male' ? 'checked' : ''} required> Male
                                                <span id="error-gender" name="error-gender"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Date of Birth</label>
                                                <input name="dob" id="dob" type="date" class="form-control" value="${doctor.dob}" required>
                                                <span id="error-dob" name="error-dob"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Address</label>
                                                <input type="text" name="address" id="address" value="${doctor.address}" class="form-control" placeholder="Address" required>
                                                <span id="error-address" name="error-address"></span>
                                            </div>



                                            <div class="col-12">
                                                <button type="submit" class="btn btn-success px-5">UPDATE</button>
                                            </div>
                                        </form>


                                    </div>
                                </div>
                                <!--end row-->

                                <!--end row-->
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

                <!-- App JS -->
                <script src="../admin/assets/js/app.js"></script>

                <!-- JavaScript -->

                </body>

                </html>
