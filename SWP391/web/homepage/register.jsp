<%-- 
    Document   : register
    Created on : Feb 16, 2025, 4:57:38 PM
    Author     : fptshop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            .custom-register-container {
                max-width: 900px;  /* Increased width for 2 columns */
                margin: 2rem auto;
                padding: 2rem;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                font-size: 15px;

            }

            .custom-register-title {
                color: #333;
                font-size: 40px;
                margin-bottom: 2rem;
                margin-top: 1.5rem;
                text-align: center;
            }

            .custom-register-form .form-group {
                margin-bottom: 1.5rem;
                position: relative;
            }

            .custom-input-group {
                position: relative;
                display: flex;
                align-items: center;

            }

            .custom-input-group .form-control {
                padding-right: 40px;
                font-size: 15px;
            }

            .custom-input-group .password-toggle {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                color: #666;
                background: none;
                border: none;
                padding: 0;
                z-index: 10;
            }

            .custom-password-requirements {
                margin-top: 0.5rem;
            }

            .custom-requirement {
                display: block;
                font-size: 1.5rem;
                color: #666;
                margin-bottom: 0.2rem;
            }

            .custom-requirement.valid {
                color: #4EB09B;
            }

            .custom-requirement i {
                margin-right: 5px;
            }

            .custom-register-form .form-control:focus {
                box-shadow: none;
                border-color: #80bdff;
            }

            .custom-gender-group .btn-check + .btn {
                padding: 8px 20px;
                border-radius: 5px;
                margin-right: 10px;
                font-size: 15px;
                color: black;
                border-color: #4EB09B;
            }
            .custom-gender-group .btn-check + .btn:active{
                background-color: #4EB09B;
            }
            .custom-gender-group .btn-check + .btn:checked{
                background-color: #4EB09B;
            }
            .btn-check:checked+.btn, .btn.active, .btn.show, .btn:first-child:active, :not(.btn-check)+.btn:active{
                background-color: #4EB09B;
            }
            .custom-register-container input{
                font-size: 15px;
            }

            #toast-container > .toast {
                font-size: 18px; /* Điều chỉnh kích thước */
            }
            @media (max-width: 768px) {
                .custom-register-container {
                    max-width: 100%;
                    margin: 1rem;
                    padding: 1rem;
                }
            }
        </style>
    </head>
    <body style="background-image: url(homepage/images/resources/v870-tang-36.jpg);" class="bg-light">
        <div style="background-color: white; margin-top: 50px" class="custom-register-container">
            <h2 style="color: #4EB09B" class="custom-register-title">Create Account</h2>
            <form style="padding: 0 20px;" action="register" method="post" class="custom-register-form" id="customRegisterForm" novalidate>
                <div class="row">
                    <!-- Left Column -->
                    <div class="col-md-6">
                        <!-- Full Name -->
                        <div class="form-group">
                            <label for="customName">Full Name</label>
                            <input type="text" class="form-control" id="customName" name="register-name" required>
                            <div class="invalid-feedback">Please enter your name.</div>

                        </div>

                        <!-- Username -->
                        <div class="form-group">
                            <label for="customUsername">Username</label>
                            <input type="text" name="register-username" class="form-control" id="register-username" required>
                            <div class="invalid-feedback">Please choose a username.</div> 
                            <span name="username-error" id="username-error"></span>
                        </div>

                        <!-- Email -->
                        <div class="form-group">
                            <label for="customEmail">Email</label>
                            <input type="email" class="form-control" id="register-email" name="register-email" required>
                            <span name="email-error" id="email-error"></span>
                        </div>

                        <!-- Phone -->
                        <div class="form-group">
                            <label for="customPhone">Phone Number</label>
                            <input type="tel" class="form-control" id="register-phone" name="register-phone" required>
                            <span name="phone-error" id="phone-error"></span>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6">
                        <!-- Gender -->
                        <div class="form-group">
                            <label class="d-block mb-2">Gender</label>
                            <div class="custom-gender-group">
                                <input type="radio" class="btn-check" name="customGender" id="male" value="male" required>
                                <label class="btn btn-outline-primary" for="male">Male</label>

                                <input type="radio" class="btn-check" name="customGender" id="female" value="female">
                                <label class="btn btn-outline-primary" for="female">Female</label>

                                <input type="radio" class="btn-check" name="customGender" id="other" value="other">
                                <label class="btn btn-outline-primary" for="other">Prefer not to say</label>
                            </div>
                            <div class="invalid-feedback">Please select your gender.</div>
                        </div>

                        <!-- Password -->
                        <div class="form-group">
                            <label for="customPassword">Password</label>
                            <div class="custom-input-group">
                                <input type="password" class="form-control" id="register-password" name="register-password" required>
                                <button type="button" class="password-toggle" data-target="register-password">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                            <div class="custom-password-requirements">
                                <span class="custom-requirement" id="length">
                                    <i class="fas fa-circle"></i> Minimum 8 characters
                                </span>
                                <span class="custom-requirement" id="capital">
                                    <i class="fas fa-circle"></i> Contains uppercase letter
                                </span>
                                <span class="custom-requirement" id="special">
                                    <i class="fas fa-circle"></i> Contains special character
                                </span>
                            </div>
                        </div>

                        <!-- Repeat Password -->
                        <div class="form-group">
                            <label for="customRepeatPassword">Repeat Password</label>
                            <div class="custom-input-group">
                                <input type="password" class="form-control" id="repeat-password" name="repeat-password" required>
                                <button  type="button" class="password-toggle" data-target="repeat-password">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                            <span name="repeat-error" id="repeat-error"></span>
                        </div>
                    </div>
                </div>

                <!-- Submit Button - Full Width -->
                <div style="display: flex; justify-content: center" class="row mt-4">
                    <div  class="col-12">
                        <button style="font-size: 20px; background-color: #4EB09B; border: none; padding: 10px" type="submit" class="btn btn-primary w-100">Register</button>
                    </div>
                </div>
                <input type="hidden" value="register" name="action"/>
            </form>
            <div style="margin-top: 20px">
                <span style="padding-left: 20px;padding-top: 30px">Already have an account?<a href="login"> Log in</a></span>
            </div>
            <div class="register-other-platform" style="margin-top: 15px;margin-bottom: 20px; text-align: center; font-size: 16px;">
                <span style="color: #bfb9b9;">&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;  </span>Or register with
                <span style="color: #bfb9b9;">&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</span>
                <div class="d-flex justify-content-center align-items-center register-with">
                    <!--                                    <div class="">
                                                            <a href="https://www.facebook.com/v19.0/dialog/oauth?fields=id,name,email,profile_pic&client_id=1277437356785264&redirect_uri=http://localhost:8080/SWP391/login_facebook" class="circle-btn facebook">
                                                                <i class='bx bxl-facebook'></i>
                                                            </a>
                                                        </div>-->
                    <div class="">
                        <a style="text-decoration: none" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/SWP391/login_google&response_type=code&client_id=145515751218-1me7sleh0t92gmt599s2vnrh7bct77th.apps.googleusercontent.com&approval_prompt=force" class="circle-btn google">
                            <i class='bx bxl-google'></i>
                        </a>
                    </div>
                </div>

            </div>
        </div>

        <!-- Scripts remain the same -->
        <jsp:include page="Common/Message.jsp"/>

        <script>

            $(document).ready(function () {

                function toggleContainer() {
                    $(".container").stop().addClass("active");
                }

                function closeContainer() {
                    $(".container").stop().removeClass("active");
                }
                function checkUser() {
                    const username = document.getElementById("register-username").value;
                    const errorSpan = document.getElementById("username-error");

                    $.ajax({
                        url: "register",
                        type: "POST",
                        data: {
                            action: "checkUser",
                            user_name: username
                        },
                        success: function (response) {
                            if (response.status === "exist") {
                                errorSpan.textContent = "Username is existed. Please try again!!";
                                errorSpan.style.color = "#EA4335";
//                                    document.getElementById("register-button").style.display='none';

                            } else if (response.status === "oke") {
                                errorSpan.textContent = "Username is valid";
                                errorSpan.style.color = "black";

//                                    document.getElementById("register-button").style.display='inline-block';
                            } else {
                                toastr.error("Error.");
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("Error");
                        }
                    });
                }
                function checkEmail() {
                    const email = document.getElementById("register-email").value;
                    const errorSpan = document.getElementById("email-error");

                    $.ajax({
                        url: "register",
                        type: "POST",
                        data: {
                            action: "checkEmail",
                            email: email
                        },
                        success: function (response) {
                            if (response.status === "exist") {
                                errorSpan.textContent = "Email is used by other account. Please try other email!!";
                                errorSpan.style.color = "#EA4335";
//                                    document.getElementById("register-button").style.display='none';

                            } else if (response.status === "oke") {
                                errorSpan.textContent = "Email is valid";
                                errorSpan.style.color = "black";

//                                    document.getElementById("register-button").style.display='inline-block';
                            } else {
                                toastr.error("Error.");
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("Error");
                        }
                    });
                }
                function checkPhoneNumber() {
                    const phone_number = document.getElementById("register-phone").value;
                    const errorSpan = document.getElementById("phone-error");
//                        if(!phone_number.startwidth(0)){
//                           errorSpan.textContent = "PhoneNumber is incorrect format. Please try other phone";
//                           errorSpan.style.color = "#EA4335"; 
//                        }
                    $.ajax({
                        url: "register",
                        type: "POST",
                        data: {
                            action: "checkPhone",
                            phone_number: phone_number
                        },
                        success: function (response) {
                            if (response.status === "exist") {
                                errorSpan.textContent = "PhoneNumber is used by other account. Please try other phone!!";
                                errorSpan.style.color = "#EA4335";
//                                    document.getElementById("register-button").style.display='none';

                            } else if (response.status === "oke") {
                                errorSpan.textContent = "PhoneNumber is valid";
                                errorSpan.style.color = "black";

//                                    document.getElementById("register-button").style.display='inline-block';
                            } else {
                                toastr.error("Error.");
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("Error");
                        }
                    });
                }



                function checkRepeatPassword() {
                    const repeatpassword = document.getElementById("repeat-password").value.trim();
                    const registerpassword = document.getElementById("register-password").value.trim();
                    const errorSpan = document.getElementById("repeat-error");
                    if (registerpassword !== repeatpassword) {
                        errorSpan.textContent = "Repeat password is incorrect";
                        errorSpan.style.display = "block";
                        errorSpan.style.color = "red";
                    }
//                        else{
//                            errorSpan.textContent ="Mật khẩu trùng khớp!";
//                            errorSpan.style.display = "block";
//                            errorSpan.style.color = "white";
//                        }

                }


                function checkPhone() {
                    const phonenumber = document.getElementById("register-phone").value.trim();
                    const phoneError = document.getElementById("phone-error");

                    const regex = /^(?:\+84|0)(3[2-9]|5[2689]|7[0-9]|8[1-9]|9[0-9])\d{7}$/;

                    if (!regex.test(phonenumber)) {
                        phoneError.textContent = "The phonenumber is incorrect format!";
                        phoneError.style.display = "block";
                        phoneError.style.color = "red";
                    }

                }

                function checkFormatPassword() {
                    const password = document.getElementById("register-password");
                    const requirements = {
                        length: document.getElementById('length'),
                        capital: document.getElementById('capital'),
                        special: document.getElementById('special')
                    };

                    const value = password.value;
                    let valid = true;

                    // Check length
                    if (value.length >= 8) {
                        requirements.length.classList.add('valid');
                        requirements.length.querySelector('i').classList.remove('fa-circle');
                        requirements.length.querySelector('i').classList.add('fa-check-circle');
                    } else {
                        requirements.length.classList.remove('valid');
                        requirements.length.querySelector('i').classList.remove('fa-check-circle');
                        requirements.length.querySelector('i').classList.add('fa-circle');
                        valid = false;
                    }

                    // Check uppercase
                    if (/[A-Z]/.test(value)) {
                        requirements.capital.classList.add('valid');
                        requirements.capital.querySelector('i').classList.remove('fa-circle');
                        requirements.capital.querySelector('i').classList.add('fa-check-circle');
                    } else {
                        requirements.capital.classList.remove('valid');
                        requirements.capital.querySelector('i').classList.remove('fa-check-circle');
                        requirements.capital.querySelector('i').classList.add('fa-circle');
                        valid = false;
                    }

                    // Check special character
                    if (/[!@#$%^&*(),.?":{}|<>]/.test(value)) {
                        requirements.special.classList.add('valid');
                        requirements.special.querySelector('i').classList.remove('fa-circle');
                        requirements.special.querySelector('i').classList.add('fa-check-circle');
                    } else {
                        requirements.special.classList.remove('valid');
                        requirements.special.querySelector('i').classList.remove('fa-check-circle');
                        requirements.special.querySelector('i').classList.add('fa-circle');
                        valid = false;
                    }

                    return valid;
                }

                document.getElementById("customRegisterForm").addEventListener("submit", function (event) {
                    if (!checkFormatPassword()) {
                        event.preventDefault();
                        toastr.error("The password is wrong format. Please check and try again!");
                    }
                });


                document.getElementById("register-password").addEventListener("input", checkFormatPassword);


                $("#register-password").on("input", function () {
                    checkFormatPassword();
                });

                $("#register-phone").on("blur", function () {
                    checkPhoneNumber(this);
                });

                $("#register-email").on("blur", function () {
                    checkEmail(this);
                });

                $("#register-username").on("blur", function () {
                    checkUser(this);
                });
                $("#repeat-password").on("blur", function () {
                    checkRepeatPassword(this);
                });

                document.getElementById("register-form").addEventListener('submit', (event) => {
                    const usernamespan = document.getElementById("username-error").textContent;
                    const repeatspan = document.getElementById("repeat-error").textContent;
                    const phonespan = document.getElementById("phone-error").textContent;
                    const emailspan = document.getElementById("email-error").textContent;


                    if (usernamespan.includes("existed") || repeatspan.includes("incorrect")
                            || phonespan.includes("used by other account") ||
                            emailspan.includes("used by other account")) {
                        toastr.error("Please fix the error before submit!!");
                        event.preventDefault();
                    }
                });

            });

        </script>

        <jsp:include page="Common/Js.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {

                document.querySelectorAll(".password-toggle").forEach(function (toggleButton) {
                    toggleButton.addEventListener("click", function () {
                        let targetId = this.getAttribute("data-target");
                        let passwordInput = document.getElementById(targetId);
                        let icon = this.querySelector("i");

                        if (passwordInput.type === "password") {
                            passwordInput.type = "text";
                            icon.classList.remove("fa-eye");
                            icon.classList.add("fa-eye-slash");
                        } else {
                            passwordInput.type = "password";
                            icon.classList.remove("fa-eye-slash");
                            icon.classList.add("fa-eye");
                        }
                    });
                });


            });
        </script>

    </body>
</html>
