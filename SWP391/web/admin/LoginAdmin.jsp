<%-- 
    Document   : LoginAdmin
    Created on : Mar 2, 2025, 3:48:59 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/>  
    </head>

    <body class="bg-login">
        <!-- wrapper -->
        <div class="wrapper">
            <div class="section-authentication-login d-flex align-items-center justify-content-center mt-4">
                <div class="row">
                    <div class="col-12 col-lg-8 mx-auto">
                        <div class="card radius-15 overflow-hidden">
                            <div class="row g-0">
                                <div class="col-xl-6">
                                    <div class="card-body p-5">
                                        <div class="text-center">
                                            <img src="assets/images/logo-icon.png" width="80" alt="">
                                            <h3 class="mt-4 font-weight-bold">Welcome Back</h3>
                                        </div>
                                        <div class="">                                 
                                            <div class="form-body">                                           
                                                <form action="login" method="POST" id="loginForm" class="row g-3">
                                                    <input type="hidden" name="action" value="login">
                                                    <div class="col-12">
                                                        <label for="inputEmailAddress" class="form-label">Email Address</label>
                                                        <input type="email" name="email" class="form-control" id="email" value="${sessionScope.email}" placeholder="Email Address" required>
                                                        <div name = "email-error" id="email-error" ></div>
                                                    </div>
                                                    <div class="col-12">
                                                        <label for="inputChoosePassword" class="form-label">Enter Password</label>
                                                        <div class="input-group" id="show_hide_password">
                                                            <input type="password" class="form-control" name="pass" id="pass" value="" placeholder="Enter Password"> <a href="javascript:;" class="input-group-text bg-transparent"><i class="bx bx-hide"></i></a>      
                                                        </div>
                                                        <div name = "pass-error" id="pass-error" ></div>
                                                    </div>

                                                    <div class="col-12">

                                                        <div class="d-grid">
                                                            <button type="submit" class="btn btn-primary"><i class="bx bxs-lock-open"></i>Sign in</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 bg-login-color d-flex align-items-center justify-content-center">
                                    <img src="assets/images/login-images/login-frent-img.jpg" class="img-fluid" alt="...">
                                </div>
                            </div>
                            <%
                                                      String succesMessage = (String) session.getAttribute("error");
                                                      if(succesMessage != null) {
                            %>
                            <script>
                                                        alert("<%= succesMessage %> ");
                            </script>
                            <%
                                                        session.removeAttribute("error");
                                                                                }
                            %>
                            <!--end row-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end wrapper -->
    </body>

    <!--plugins-->
    <script src="assets/js/jquery.min.js"></script>
    <!--Password show & hide js -->
    <script>
                                                        $(document).ready(function () {
                                                            $("#show_hide_password a").on('click', function (event) {
                                                                event.preventDefault();
                                                                if ($('#show_hide_password input').attr("type") == "text") {
                                                                    $('#show_hide_password input').attr('type', 'password');
                                                                    $('#show_hide_password i').addClass("bx-hide");
                                                                    $('#show_hide_password i').removeClass("bx-show");
                                                                } else if ($('#show_hide_password input').attr("type") == "password") {
                                                                    $('#show_hide_password input').attr('type', 'text');
                                                                    $('#show_hide_password i').removeClass("bx-hide");
                                                                    $('#show_hide_password i').addClass("bx-show");
                                                                }
                                                            });
                                                        });
    </script>
    <script>
        $(document).ready(function () {
            function checkEmail() {
                const email = $("#email").val();
                const errorSpan = $("#email-error");

                if (!email) {
                    errorSpan.text("Email is empty. Please enter an email!").css("color", "red");
                    return;
                }

                // Regular expression to validate email format
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;


                if (!emailRegex.test(email)) {
                    errorSpan.text("Invalid email format!").css("color", "red");
                    return;
                }



                // If client-side validation passes, check with server
                $.ajax({
                    url: "login",
                    type: 'POST',
                    data: {action: "checkEmail", email: email},
                    success: function (response) {
                        console.log(response); // Debug
                        if (response.status === "empty") {
                            errorSpan.text("Email is empty. Please enter an email!").css("color", "red");
                        } else if (response.status === "invalid_format") {
                            errorSpan.text("Invalid email format!").css("color", "red");
                        } else if (response.status === "valid") {
                            errorSpan.text("Email is valid").css("color", "green");
                        } else {
                            toastr.error("Error.");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", error);
                        toastr.error("Server error occurred while validating email.");
                    }
                });
            }

            function checkPass() {
                const pass = $("#pass").val();
                const errorSpan = $("#pass-error");
                $.ajax({
                    url: "login",
                    type: 'POST',
                    data: {action: "checkPass", pass: pass},
                    success: function (response) {
                        console.log(response); // Debug
                        if (response.status === "empty") {
                            errorSpan.text("Password is empty. Please enter password!").css("color", "red");
                        } else if (response.status === "valid") {
                            errorSpan.text("Password is valid").css("color", "green");
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
            $("#pass").on("input blur", checkPass);
            $("#email").on("input blur", checkEmail);

            // Chặn submit nếu có lỗi
            $("#loginForm").on("submit", function (event) {
                const passError = $("#pass-error").text();
                const emailError = $("#email-error").text();
                if (passError.includes("Please") || emailError.includes("Please")) {
                    toastr.error("Please fix the error before submitting!");
                    event.preventDefault();
                }
            });
        });

    </script>

</html>
