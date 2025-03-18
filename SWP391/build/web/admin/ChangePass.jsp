<%-- 
    Document   : ChangePass
    Created on : Mar 2, 2025, 11:49:16 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/>  
        <style>
            .custom-password-requirements {
                margin-top: 2px;
            }

            .custom-requirement {
                display: block;
                font-size: 14px;
                color: #FF0000; /* Mặc định là màu đỏ khi không hợp lệ */
                transition: color 0.3s ease-in-out;
            }

            .custom-requirement.valid {
                color: #228B22; /* Màu xanh khi hợp lệ */
            }

            .custom-requirement i {
                margin-right: 5px;
            }

        </style>
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <div class="authentication-reset-password d-flex align-items-center justify-content-center">
                <div class="row">
                    <div class="col-12 col-lg-10 mx-auto">
                        <div class="card radius-15">
                            <div class="row g-0">
                                <div class="col-lg-5">
                                    <div class="card-body p-md-5">
                                        <div class="text-left">
                                            <img src="assets/images/logo-img.png" width="180" alt="">
                                        </div>
                                        <h4 class="mt-5 font-weight-bold">Genrate New Password</h4>
                                        <p class="text-muted">We received your reset password request. Please enter your new password!</p>
                                        <form action="changePass" method="POST">
                                            <div class="mb-3 mt-5">
                                                <label class="form-label">New Password</label>
                                                <input type="password" name="new-pass" id="new-pass" class="form-control" placeholder="Enter new password" />
                                                <div name="new-pass-error" id="new-pass-error"></div>

                                                <div class="custom-password-requirements">
                                                    <span class="custom-requirement" id="length">
                                                        <i class="fas fa-circle"></i> Minimum 8 characters
                                                    </span>
                                                    <span class="custom-requirement" id="capital">
                                                        <i  class="fas fa-circle"></i> Contains uppercase letter
                                                    </span>
                                                    <span class="custom-requirement" id="special">
                                                        <i class="fas fa-circle"></i> Contains special character
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Confirm Password</label>
                                                <input  type="password" name="re-pass" id="re-pass" class="form-control" placeholder="Confirm password" />
                                                <div name="re-pass-error" id="re-pass-error"></div>
                                            </div>

                                            <div class="d-grid gap-2">
                                                <button type="submit" class="btn btn-primary">Change Password</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <img src="assets/images/login-images/forgot-password-frent-img.jpg" class="card-img login-img h-100" alt="...">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end wrapper -->
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            function checkFormatPassword() {
                const newPassword = document.getElementById("new-pass");
                const errorSpan = document.getElementById("new-pass-error");
                const requirements = {
                    length: document.getElementById("length"),
                    capital: document.getElementById("capital"),
                    special: document.getElementById("special"),
                };

                const value = newPassword.value.trim();
                let valid = true;

                // Reset lỗi trước khi kiểm tra
                errorSpan.textContent = "";
                errorSpan.style.display = "none";

                // Kiểm tra độ dài mật khẩu (ít nhất 8 ký tự)
                if (value.length >= 8) {
                    requirements.length.classList.add("valid");
                    requirements.length.querySelector("i").classList.remove("fa-circle");
                    requirements.length.querySelector("i").classList.add("fa-check-circle");
                } else {
                    requirements.length.classList.remove("valid");
                    requirements.length.querySelector("i").classList.remove("fa-check-circle");
                    requirements.length.querySelector("i").classList.add("fa-circle");
                    valid = false;
                }

                // Kiểm tra chữ cái viết hoa
                if (/[A-Z]/.test(value)) {
                    requirements.capital.classList.add("valid");
                    requirements.capital.querySelector("i").classList.remove("fa-circle");
                    requirements.capital.querySelector("i").classList.add("fa-check-circle");
                } else {
                    requirements.capital.classList.remove("valid");
                    requirements.capital.querySelector("i").classList.remove("fa-check-circle");
                    requirements.capital.querySelector("i").classList.add("fa-circle");
                    valid = false;
                }

                // Kiểm tra ký tự đặc biệt
                if (/[!@#$%^&*(),.?":{}|<>]/.test(value)) {
                    requirements.special.classList.add("valid");
                    requirements.special.querySelector("i").classList.remove("fa-circle");
                    requirements.special.querySelector("i").classList.add("fa-check-circle");
                } else {
                    requirements.special.classList.remove("valid");
                    requirements.special.querySelector("i").classList.remove("fa-check-circle");
                    requirements.special.querySelector("i").classList.add("fa-circle");
                    valid = false;
                }

                return valid;
            }

            function checkRepeatPassword() {
                const newPassword = document.getElementById("new-pass").value.trim();
                const rePassword = document.getElementById("re-pass").value.trim();
                const errorSpan = document.getElementById("re-pass-error");

                // Reset lỗi trước khi kiểm tra
                errorSpan.textContent = "";
                errorSpan.style.display = "none";

                // Kiểm tra mật khẩu nhập lại có trùng khớp không
                if (rePassword !== newPassword) {
                    errorSpan.textContent = "Repeat password is incorrect!";
                    errorSpan.style.display = "block";
                    errorSpan.style.color = "red";
                    return false;
                } else {
                    errorSpan.textContent = "Repeat password is correct!";
                    errorSpan.style.display = "block";
                    errorSpan.style.color = "green";
                    return true;
                }


            }

            // Gán sự kiện khi nhập mật khẩu mới để kiểm tra định dạng
            document.getElementById("new-pass").addEventListener("input", function () {
                checkFormatPassword();
            });

            // Gán sự kiện khi nhập lại mật khẩu để kiểm tra trùng khớp
            document.getElementById("re-pass").addEventListener("input", function () {
                if (!checkRepeatPassword()) {
                    document.getElementById("re-pass-error").style.display = "block";
                }
            });

            // Kiểm tra trước khi gửi form
            document.getElementById("customRegisterForm").addEventListener("submit", function (event) {
                const isPasswordValid = checkFormatPassword();
                const isRepeatValid = checkRepeatPassword();

                if (!isPasswordValid || !isRepeatValid) {
                    event.preventDefault(); // Ngăn form gửi nếu có lỗi
                    toastr.error("Please fix the errors before submitting!");
                }
            });
        });

    </script>


</html>