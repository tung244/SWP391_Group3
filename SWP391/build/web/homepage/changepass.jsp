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
            <h2 style="color: #4EB09B" class="custom-register-title">Change Password</h2>
            <form style="padding: 0 20px;" action="/SWP391/changepassword" method="get" class="custom-register-form" id="customRegisterForm" novalidate>
                <div class="row">
                    <!-- Left Column -->
                    <div class="col-md-6">
                        

                        <!-- Username -->
                        <div class="form-group">
                            <label for="customUsername">Username</label>
                            <input type="text" name="usernameTest" class="form-control" id="register-username" required>
                            <div class="invalid-feedback">Please choose a username.</div> 
                            <span name="username-error" id="username-error"></span>
                        </div>

                        <div class="form-group">
                            <label for="customUsername">Current Password</label>
                            <input type="text" name="current_password" class="form-control" id="register-username" required>
                            <div class="invalid-feedback">Please choose a current password.</div> 
                            <span name="username-error" id="username-error"></span>
                        </div>
                        
                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6">
                        

                        <!-- Password -->
                        <div class="form-group">
                            <label for="customPassword">New Password</label>
                            <div class="custom-input-group">
                                <input type="password" class="form-control" id="register-password" name="newpassword" required>
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
                                <input type="password" class="form-control" id="repeat-password" name="newpassword2" required>
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
                        <button style="font-size: 20px; background-color: #4EB09B; border: none; padding: 10px" type="submit" class="btn btn-primary w-100">Change</button>
                    </div>
                </div>
                <input type="hidden" value="register" name="action"/>
            </form>
            
        </div>

        
        <jsp:include page="Common/Message.jsp"/>

        
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
