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
                                        <li class="breadcrumb-item active" aria-current="page">Create Account Doctor</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <div class="row">
                            <div class="col-xl-7 mx-auto">

                                <h6 class="mb-0 text-uppercase">Step 1: Create Account Doctor</h6>
                                <hr>
                                <div class="card border-top border-0 border-4 border-success">
                                    <div class="card-body p-5">
                                        <div class="card-title d-flex align-items-center">
                                            <div><i class="bx bxs-user me-1 font-22 text-success"></i></div>
                                            <h5 class="mb-0 text-uppercase text-success">Create Account Doctor</h5>                   
                                        </div>
                                        <div>
                                            <h5 class="mb-0 text-success">Progress:</h5>
                                            <% int progress = session.getAttribute("progress") != null ? (int) session.getAttribute("progress") : 0; %>
                                            <div class="progress">

                                                <div class="progress-bar-success" role="progressbar" style="width: <%= progress %>%;" aria-valuenow="<%= progress %>" aria-valuemin="0" aria-valuemax="100">
                                                    <%= progress %>% Completed
                                                </div>
                                            </div>
                                        </div>
                                        <hr>

                                        <!-- Hiển thị thông báo lỗi nếu có -->
                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger">${error}</div>
                                        </c:if>

                                        <form action="createAccount" method="POST" class="row g-3" id="doctorRegisterForm">

                                            <!-- username -->
                                            <div class="col-12">
                                                <label for="inputUserName" class="form-label">User Name</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
                                                    <input name="username" type="text" class="form-control border-start-0"
                                                           id="username" placeholder="User Name" required>                                                  
                                                </div>
                                                <div name = "username-error" id="username-error" ></div>
                                            </div>      
                                            <!-- phonenumber -->
                                            <div class="col-12">
                                                <label for="inputPhoneNumber" class="form-label">Phone Number</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-transparent"><i class="bx bxs-microphone"></i></span>
                                                    <input name="phone" type="tel" class="form-control border-start-0"
                                                           id="phone" placeholder="Phone Number"  required>                                                    
                                                </div>
                                                <div name = "phone-error" id="phone-error" ></div>
                                            </div>
                                            <!-- Email -->
                                            <div class="col-12">
                                                <label for="inputEmailAddress" class="form-label">Email Address</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-transparent"><i class="bx bxs-message"></i></span>
                                                    <input name="email" type="email" class="form-control border-start-0"
                                                           id="email" placeholder="Email Address" required>                                                    
                                                </div>
                                                <div name = "email-error" id="email-error" ></div>
                                            </div>

                                            <input type="hidden" name="action" value="register">
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

    <script>
        $(document).ready(function () {
            function checkUserName() {
                const username = $("#username").val().trim().replace(/\s+/g, "");
                $("#username").val(username); // Cập nhật lại field
                const errorSpan = $("#username-error");

                if (username === "") {
                    errorSpan.text("User name is empty. Please enter username!").css("color", "red");
                    return;
                }

                $.ajax({
                    url: "createAccount",
                    type: 'POST',
                    data: {action: "checkUserName", user_name: username},
                    success: function (response) {
                        if (response.status === "exist") {
                            errorSpan.text("User name is existed. Please try again!").css("color", "red");
                        } else if (response.status === "valid") {
                            errorSpan.text("User name is valid").css("color", "green");
                        } else {
                            errorSpan.text("Unknown error").css("color", "red");
                        }
                    },
                    error: function () {
                        errorSpan.text("Server error.").css("color", "red");
                    }
                });
            }

            function checkPhone() {
                const phone = $("#phone").val().trim();
                const errorSpan = $("#phone-error");

                const phoneRegex = /^0\d{9}$/;

                if (phone === "") {
                    errorSpan.text("Phone number is empty. Please enter phone number!").css("color", "red");
                    return;
                } else if (!phoneRegex.test(phone)) {
                    errorSpan.text("Phone number must start with 0 and contain exactly 10 digits.").css("color", "red");
                    return;
                }

                $.ajax({
                    url: "createAccount",
                    type: 'POST',
                    data: {action: "checkPhone", phone: phone},
                    success: function (response) {
                        if (response.status === "exist") {
                            errorSpan.text("Phone number is existed. Please try again!").css("color", "red");
                        } else if (response.status === "valid") {
                            errorSpan.text("Phone number is valid").css("color", "green");
                        }
                    },
                    error: function () {
                        errorSpan.text("Server error.").css("color", "red");
                    }
                });
            }

            function checkEmail() {
                const email = $("#email").val().trim();
                const errorSpan = $("#email-error");

                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (email === "") {
                    errorSpan.text("Email is empty. Please enter an email!").css("color", "red");
                    return;
                } else if (!emailRegex.test(email)) {
                    errorSpan.text("Invalid email format!").css("color", "red");
                    return;
                }

                $.ajax({
                    url: "createAccount",
                    type: 'POST',
                    data: {action: "checkEmail", email: email},
                    success: function (response) {
                        if (response.status === "exist") {
                            errorSpan.text("Email is existed. Please try again!").css("color", "red");
                        } else if (response.status === "valid") {
                            errorSpan.text("Email is valid").css("color", "green");
                        }
                    },
                    error: function () {
                        errorSpan.text("Server error.").css("color", "red");
                    }
                });
            }

            // Kiểm tra khi người dùng nhập hoặc rời khỏi ô input
            $("#username").on("input blur", checkUserName);
            $("#phone").on("input blur", checkPhone);
            $("#email").on("input blur", checkEmail);

            // Chặn submit nếu có lỗi
            $("#doctorRegisterForm").on("submit", function (event) {
                const usernameError = $("#username-error").text();
                const phoneError = $("#phone-error").text();
                const emailError = $("#email-error").text();

                if (usernameError.includes("Please") || phoneError.includes("Please") || emailError.includes("Please")) {
                    toastr.error("Please fix the error before submitting!");
                    event.preventDefault();
                }
            });
        });

    </script>



</html>