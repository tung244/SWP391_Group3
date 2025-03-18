<%-- 
    Document   : createDoctor
    Created on : Feb 24, 2025, 12:30:15 AM
    Author     : PC
--%>

<%-- 
    Document   : createAccDoctor
    Created on : Feb 23, 2025, 10:28:54 PM
    Author     : PC
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
            <jsp:include page="Common/Navbar.jsp"/>    
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
                                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page"><a href="createAccount"><i>Create Account Doctor</i></a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Create Doctor</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <div class="row">
                            <div class="col-xl-7 mx-auto">

                                <h6 class="mb-0 text-uppercase">Step 2: Create Doctor</h6>
                                <hr>
                                <div class="card border-top border-0 border-4 border-success">
                                    <div class="card-body p-5">
                                        <div class="card-title d-flex align-items-center">
                                            <div><i class="bx bxs-user me-1 font-22 text-success"></i></div>
                                            <h5 class="mb-0 text-uppercase text-success">Create Doctor</h5>                   
                                        </div>

                                        <div>
                                            <h5 class="mb-0 text-success">Progress:</h5>
                                            <% int progress = session.getAttribute("progress") != null ? (int) session.getAttribute("progress") : 0; %>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" style="width: <%= progress %>%" aria-valuenow="<%= progress %>" aria-valuemin="0" aria-valuemax="100">
                                                    <%= progress %>% Completed
                                                </div>
                                            </div>
                                        </div>
                                        <hr>

                                        

                                        <form action="createDoctor" method="POST" id="createDoctorform" class="row g-3" enctype="multipart/form-data">
                                            <div class="col-12">
                                                <label class="form-label">Doctor Name</label>
                                                <input name="doctorName" id="doctorName" type="text" class="form-control" placeholder="Doctor Name" required>
                                                <span id="error-doctorName" name="error-doctorName"></span>
                                            </div> 

                                            <div class="col-12">
                                                <label class="form-label">Profile Image:</label>
                                                <input type="file" id="profileImage" name="profileImage" class="form-control" required>
                                                <span id="error-profileImage" name="error-profileImage"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Experience Years</label>
                                                <input type="number" min="1" id="experienceYears" name="experienceYears" class="form-control" placeholder="Experience Years"  required>
                                                <span id="error-experienceYears" name="error-experienceYears"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Specialization</label>                                               
                                                <select id="specializationId" name="specializationId" class="form-select" required>
                                                    <c:forEach items="${listSpe}" var="lsp">
                                                        <option value="${lsp.specialization_id}">${lsp.specialization_name}</option>
                                                    </c:forEach>
                                                </select>
                                                <span id="error-specializationId" name="error-specializationId"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Gender</label>
                                                <input type="radio" name="gender" id="Female" value="Female" required> Female
                                                <input type="radio" name="gender" id="Male" value="Male" required> Male
                                                <span id="error-gender" name="error-gender"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Date of Birth</label>
                                                <input name="dob" id="dob" type="date" class="form-control" required>
                                                <span id="error-dob" name="error-dob"></span>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Address</label>
                                                <input type="text" name="address" id="address" class="form-control" placeholder="Address" required>
                                                <span id="error-address" name="error-address"></span>
                                            </div>


                                            <input type="hidden" name="action" value="createDoctor" >
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-success px-5">CREATE</button>
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
                <script>
                    $(document).ready(function () {
                        function checkDoctorName() {
                            const doctorname = $("#doctorName").val();
                            const errorSpan = $("#error-doctorName");

                            $.ajax({
                                url: "createDoctor",
                                type: 'POST',
                                data: {action: "checkDoctorName", doctor_name: doctorname},
                                success: function (response) {
                                    console.log(response); // Debug
                                    if (response.status === "empty") {
                                        errorSpan.text("Doctor name is empty. Please enter username!").css("color", "red");
                                    } else if (response.status === "valid") {
                                        errorSpan.text("Doctor name is valid").css("color", "green");
                                    } else {
                                        toastr.error("Error.");
                                    }
                                },
                                error: function (xhr, status, error) {
                                    alert("Error.");
                                }
                            });
                        }

                        function checkExperienceYears() {
                            const experienceYears = $("#experienceYears").val();
                            const errorSpan = $("#error-experienceYears");

                            $.ajax({
                                url: "createDoctor",
                                type: 'POST',
                                data: {action: "checkExperienceYears", experienceYears: experienceYears},
                                success: function (response) {
                                    console.log(response); // Debug
                                    if (response.status === "empty") {
                                        errorSpan.text("Experience Years is empty. Please enter experience years!").css("color", "red");
                                    } else if (response.status === "invalid") {
                                        errorSpan.text("Experience Years must be greater than 0. Please try again!").css("color", "red");
                                    } else if (response.status === "valid") {
                                        errorSpan.text("Experience Years is valid").css("color", "green");
                                    } else {
                                        toastr.error("Error.");
                                    }
                                },
                                error: function (xhr, status, error) {
                                    alert("Error.");
                                }
                            });
                        }

                        function checkProfileImage() {
                            const profileImage = $("#profileImage").val();
                            const errorSpan = $("#error-profileImage");

                            $.ajax({
                                url: "createDoctor",
                                type: 'POST',
                                data: {action: "checkProfileImage", profileImage: profileImage},
                                success: function (response) {
                                    console.log(response); // Debug
                                    if (response.status === "empty") {
                                        errorSpan.text("Profile image is empty. Please enter an profile image!").css("color", "red");
                                    } else if (response.status === "valid") {
                                        errorSpan.text("Profile image is valid").css("color", "green");
                                    } else {
                                        toastr.error("Error.");
                                    }
                                },
                                error: function (xhr, status, error) {
                                    alert("Error.");
                                }
                            });
                        }

                        function checkDOB() {
                            const dob = $("#dob").val();
                            const errorSpan = $("#error-dob");

                            $.ajax({
                                url: "createDoctor",
                                type: 'POST',
                                data: {action: "checkDOB", dob: dob},
                                success: function (response) {
                                    console.log(response); // Debug
                                    if (response.status === "empty") {
                                        errorSpan.text("Date of birth is empty. Please enter an date of birth!").css("color", "red");
                                    } else if (response.status === "valid") {
                                        errorSpan.text("Date of birth is valid").css("color", "green");
                                    } else {
                                        toastr.error("Error.");
                                    }
                                },
                                error: function (xhr, status, error) {
                                    alert("Error.");
                                }
                            });
                        }

                        function checkAddress() {
                            const address = $("#address").val();
                            const errorSpan = $("#error-address");

                            $.ajax({
                                url: "createDoctor",
                                type: 'POST',
                                data: {action: "checkAddress", address: address},
                                success: function (response) {
                                    console.log(response); // Debug
                                    if (response.status === "empty") {
                                        errorSpan.text("Address is empty. Please enter the address!").css("color", "red");
                                    } else if (response.status === "valid") {
                                        errorSpan.text("Address is valid").css("color", "green");
                                    } else {
                                        toastr.error("Error.");
                                    }
                                },
                                error: function (xhr, status, error) {
                                    alert("Error.");
                                }
                            });
                        }

                        // Kiểm tra khi người dùng nhập hoặc rời khỏi ô input
                        $("#doctorName").on("input blur", checkDoctorName);
                        $("#experienceYears").on("input blur", checkExperienceYears);
                        $("#profileImage").on("input blur", checkProfileImage);
                        $("#dob").on("input blur", checkDOB);
                        $("#address").on("input blur", checkAddress);

                        // Chặn submit nếu có lỗi
                        $("#createDoctorform").on("submit", function (event) {
                            const doctorNameError = $("#error-doctorName").text();
                            const ExperienceYearsError = $("#error-experienceYears").text();
                            const ProfileImagelError = $("#error-profileImage").text();
                            const DOBError = $("#error-dob").text();
                            const AddressError = $("#error-address").text();

                            if (doctorNameError.includes("Please") || ExperienceYearsError.includes("Please") || ProfileImagelError.includes("Please") || AddressError.includes("Please") || DOBError.includes("Please")) {
                                toastr.error("Please fix the error before submitting!");
                                event.preventDefault();
                            }
                        });
                    });

                </script>
                </html>
