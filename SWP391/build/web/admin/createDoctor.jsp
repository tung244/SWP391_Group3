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

                                                <div class="progress-bar" role="progressbar" style="width: <%= progress %>%; color: #228B22 " aria-valuenow="<%= progress %>" aria-valuemin="0" aria-valuemax="100">
                                                    <%= progress %>% Completed
                                                </div>
                                            </div>
                                        </div>
                                        <hr>

                                        <!-- Hiển thị thông báo lỗi nếu có -->
                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger">${error}</div>
                                        </c:if>

                                        <form action="createDoctor" method="POST" class="row g-3">
                                            <div class="col-12">
                                                <label for="inputUserName" class="form-label">Doctor Name</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
                                                    <input name="username" type="text" class="form-control border-start-0"
                                                           id="inputLastName1" placeholder="User Name" value="${param.username}">
                                                </div>
                                            </div>      
                                            <div class="col-12">
                                                <label for="inputExperienceYears:" class="form-label">Experience Years</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-transparent"><i class="bx bxs-microphone"></i></span>
                                                    <input name="phone" type="text" class="form-control border-start-0"
                                                           id="inputPhoneNo" placeholder="Phone Number" value="${param.phone}">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label for="inputEmailAddress" class="form-label">Email Address</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-transparent"><i class="bx bxs-message"></i></span>
                                                    <input name="email" type="text" class="form-control border-start-0"
                                                           id="inputEmailAddress" placeholder="Email Address" value="${param.email}">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label for="inputChoosePassword" class="form-label">Choose Password</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-transparent"><i class="bx bxs-lock-open"></i></span>
                                                    <input name="pass" type="password" class="form-control border-start-0"
                                                           id="inputChoosePassword" placeholder="Choose Password">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label for="inputConfirmPassword" class="form-label">Confirm Password</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-transparent"><i class="bx bxs-lock"></i></span>
                                                    <input name="pass_repeat" type="password" class="form-control border-start-0"
                                                           id="inputConfirmPassword" placeholder="Confirm Password">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <button type="submit" class="btn btn-success px-5">CREATE</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

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
