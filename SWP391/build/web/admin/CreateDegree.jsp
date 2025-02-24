<%-- 
    Document   : CreateDegree
    Created on : Feb 24, 2025, 10:19:47 PM
    Author     : PC
--%>

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
                                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page"><a href="createAccount"><i>Create Account Doctor</i></a></li>
                                        <li class="breadcrumb-item active" aria-current="page"><a href="createDoctor"><i>Create Doctor</i></a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Create Degree</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <div class="row">
                            <div class="col-xl-7 mx-auto">

                                <h6 class="mb-0 text-uppercase">Step 3: Create Degree</h6>
                                <hr>
                                <div class="card border-top border-0 border-4 border-success">
                                    <div class="card-body p-5">
                                        <div class="card-title d-flex align-items-center">
                                            <div><i class="bx bxs-user me-1 font-22 text-success"></i></div>
                                            <h5 class="mb-0 text-uppercase text-success">Create Degree</h5>                   
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

                                        <!-- Hiển thị thông báo lỗi -->
                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger">${error}</div>
                                        </c:if>

                                        <c:if test="${not empty message}">
                                            <div class="alert alert-success">${message}</div>
                                        </c:if>

                                        <form action="AddDegreeDoctorServlet" method="POST" class="row g-3" enctype="multipart/form-data">
                                            <div class="col-12">
                                                <label class="form-label">Doctor ID</label>
                                                <input type="text" name="doctorId" class="form-control" placeholder="Doctor ID" required>
                                            </div>

                                            <div id="degreeFields">
                                                <div class="col-12 degree-entry">
                                                    <label class="form-label">Degree Name</label>
                                                    <input name="degreeName" type="text" class="form-control" placeholder="Degree Name" required>
                                                </div> 

                                                <div class="col-12 degree-entry">
                                                    <label class="form-label">Degree Image:</label>
                                                    <input type="file" name="degreeImage" class="form-control">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <button type="button" class="btn btn-secondary px-5" onclick="addDegreeField()">Add More</button>
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
                <script>
                                                    function addDegreeField() {
                                                        let container = document.getElementById("degreeFields");
                                                        let newField = document.createElement("div");
                                                        newField.classList.add("col-12", "degree-entry");
                                                        newField.innerHTML = '<label class="form-label">Degree Name:</label>' +
                                                                '<input type="text" name="degreeName" class="form-control" placeholder="Degree Name" required>' +
                                                                '<label class="form-label">Degree Image:</label>' +
                                                                '<input type="file" name="degreeImage" class="form-control">';
                                                        container.appendChild(newField);
                                                    }
                </script>
                </body>

                </html>
