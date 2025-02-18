<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <script src="homepage/js/jquery.js"></script>
    </head>
    <body>
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <p style="color: red;"><%= error %></p>
        <% } %>

        <div style="overflow-y: auto;" class="boxed_wrapper">         
<!--            <div class="preloader"></div>-->
            <div class="form-login-signup">
                <div class="container">
                    <div class="card">
                        <h1 class="title">Login</h1>
                        <div class="col-md-6 image-login">
                            <img src="homepage/images/resources/login.svg" width="350px"/>
                        </div>
                        <div class="col-md-6">
                            <form method="post" action="login">

                                <div class="input-container">
                                    <input type="text" name="username" id="username" required/>
                                    <label for="username">Username</label>
                                    <div class="bar"></div>
                                </div>


                                <div class="input-container">
                                    <input type="password" name="password" id="password" required/>
                                    <label for="password">Password</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="footer">
                                    <div class="col-md-6" style="text-align: start; padding-left: 35px;">
                                        <input style="scale: 1.5;margin-right: 10px;" type="checkbox" id="saveUser" name="saveUser" value="save"/>
                                        <label for="saveUser"><a>Remember me</a></label>
                                    </div>

                                    <a class="col-md-6" style="padding: 0;" href="forgot_password">Forgot password?</a>

                                </div>
                                <div class="button-container">
                                    <button type="submit"><span>Go</span></button>
                                </div>
                                <div style="margin-top: 20px">
                                <span style="padding-left: 30px; font-size: 15px">Don’t have an account? <a href="register">Sign up.</a></span>
                                </div>
                                <div class="d-flex" style="margin-top: 15px; text-align: center; font-size: 16px;">
                                    <span style="color: #bfb9b9;">&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;  </span>Or login with
                                    <span style="color: #bfb9b9;">&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</span>
                                    <!--                                    <div class="button-container" style="display: flex;justify-content: center;">
                                                                            <a style="background-color: #1877F2;border-radius: 60px;padding: 3px 10px;display: block;width: 320px;margin-top: 20px;"><span style=" font-size: 14px; color: white !important;"><i style="margin-right: 10px;" class='bx bxl-facebook'></i>Continue with facebook</span></a>
                                                                        </div>-->
                                    <div class="button-container" style="display: flex;justify-content: center;">
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/SWP391/login_google&response_type=code&client_id=145515751218-1me7sleh0t92gmt599s2vnrh7bct77th.apps.googleusercontent.com&approval_prompt=force"
                                           style="background-color: red;border-radius: 60px;padding: 3px 10px;display: block;width: 320px;margin-top: 10px;"><span style=" font-size: 14px; color: white !important;"><i style="margin-right: 10px;" class='bx bxl-google'></i>Continue with google</span></a>
                                    </div>
                                    <div class="button-container" style="display: flex;justify-content: center;">
                                        <a href="trangchu"
                                           style="background-color: #4EB09B;border-radius: 60px;padding: 3px 10px;display: block;width: 320px;margin-top: 10px;"><span style=" font-size: 14px; color: white !important;"><i style="margin-right: 10px;" class="bx bx-home"></i>Back to home page</span></a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
            <jsp:include page="Common/Message.jsp"/>
            <script>

                $(document).ready(function () {
//                    function togglePassword(element) {
//                        Console.log("hehe");
//                        const inputId = element.getAttribute("data-password");
//                        const passwordField = document.getElementById(inputId);
//                        const icon = element.querySelector("i");
//
//                        if (passwordField.type === "password") {
//                            passwordField.type = "text";
//                            icon.classList.remove("bx-show");
//                            icon.classList.add("bx-hide");
//                        } else {
//                            passwordField.type = "password";
//                            icon.classList.remove("bx-hide");
//                            icon.classList.add("bx-show");
//                        }
//                    }



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
                                    errorSpan.style.color = "white";

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
//                         else {
//                            phoneError.textContent = "Số điện thoại hợp lệ!";  
//                            phoneError.style.color = "white";
//                            phoneError.style.display = "block";
//                        }
                    }


                    $(".toggle").on("click", toggleContainer);
                    $(".close").on("click", closeContainer);

                    $("#register-phone").on("blur", function () {
                        checkPhone(this);
                    });

                    $("#register-username").on("blur", function () {
                        checkUser(this);
                    });
                    $("#repeat-password").on("blur", function () {
                        checkRepeatPassword(this);
                    });
                    $(".toggle-password").on("click", function () {
                        togglePassword(this);
                    });
                    document.getElementById("register-form").addEventListener('submit', (event) => {
                        const usernamespan = document.getElementById("username-error").textContent;
                        const repeatspan = document.getElementById("repeat-error").textContent;
                        const phonespan = document.getElementById("phone-error").textContent;
                        if (usernamespan.includes("existed") || repeatspan.includes("incorrect")
                                || phonespan.includes("incorrect format!")) {
                            toastr.error("Please fix the error before submit!!");
                            event.preventDefault();
                        }
                    });

                });

            </script>


            <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
