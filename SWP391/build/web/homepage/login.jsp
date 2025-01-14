<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <script src="homepage/js/jquery.js"></script>
    </head>
    <body>
        <div class="boxed_wrapper">         
            <div class="preloader"></div>
            <div class="form-login-signup">
                <div class="container">
                    <div class="card">
                        <h1 class="title">Login</h1>
                        <div class="col-md-6 image-login">
                            <img src="homepage/images/resources/login.svg" width="350px"/>
                        </div>
                        <div class="col-md-6">
                            <form>
                                <div class="input-container">
                                    <input type="text" id="username" required/>
                                    <label for="username">Username</label>
                                    <div class="bar"></div>
                                </div>

                                <div class="input-container">
                                    <input type="password" id="password" required/>
                                    <label for="password">Password</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="footer">
                                    <div class="col-md-6" style="text-align: start; padding-left: 35px;">
                                        <input style="scale: 1.5;margin-right: 10px;" type="checkbox"/>
                                        <a>Remember me</a>
                                    </div>

                                    <a class="col-md-6" style="padding: 0;" href="#">Forgot password?</a>

                                </div>
                                <div class="button-container">
                                    <button><span>Go</span></button>
                                </div>
                                <div class="d-flex" style="margin-top: 15px; text-align: center; font-size: 16px;">
                                    <span style="color: #bfb9b9;">&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;  </span>Or login with
                                    <span style="color: #bfb9b9;">&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</span>
                                    <div class="button-container">
                                        <button style="background-color: #1877F2;"><span style=" font-size: 14px; color: white !important;"><i style="margin-right: 10px;" class='bx bxl-facebook'></i>Continue with facebook</span></button>
                                    </div>
                                    <div class="button-container">
                                        <button style="background-color: #EA4335;margin-top: 5px;"><span style=" font-size: 14px; color: white !important;"><i style="margin-right: 10px;" class='bx bxl-google'></i>Continue with google</span></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card alt">
                        <div class="toggle"></div>
                        <h1 class="title">Register
                            <div class="close"></div>
                        </h1>
                        <div class="col-md-6">
                            <form method="post" action="register" id="register-form">
                                <div class="input-container">
                                    <input type="text" id="register-username" name="register-username" onblur="checkUser()" required />
                                    <label for="register-username">Username</label>
                                    <div class="bar"></div>
                                    <span id="username-error" style="font-size: 14px;"></span>
                                </div>


                                <div class="input-container">
                                    <input type="password" id="register-password" name="register-password" required />
                                    <label for="register-password">Password</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="input-container">
                                    <input type="password" id="repeat-password" name="repeat-password" onblur="checkRepeatPassword()" required />
                                    <label for="repeat-password">Nhập lại mật khẩu</label>
                                    <div class="bar"></div>
                                    <span id="repeat-error" style="font-size: 14px;"></span>
                                </div>
                                <div class="input-container">
                                    <input type="text" id="register-name" name="register-name" required />
                                    <label for="register-name">FullName</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="input-container">
                                    <input type="text" id="register-phone" name="register-phone" required />
                                    <label for="register-phone">PhoneNumber</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="input-container">
                                    <select style="width: 360px; height: 35px; border-radius: 7px; font-size: 14px; padding: 5px 10px" 
                                            id="register-gender" 
                                            name="register-gender" 
                                            required>
                                        <option value="">Choose your gender</option> <!-- Giá trị trống -->
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>


                                <div class="button-container">
                                    <button name="resigter-button" id="register-button" type="submit"><span>Next</span></button>
                                </div>
                                <input type="hidden" name="action" id ="action" value="register"/>
                            </form>
                            <div class="register-other-platform" style="margin-top: 15px;margin-bottom: 20px; text-align: center; font-size: 16px; color: white;">
                                <span style="color: #bfb9b9;">&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;  </span>Or resigter with
                                <span style="color: #bfb9b9;">&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</span>
                                <div class="d-flex justify-content-center align-items-center register-with">
                                    <div class="">
                                        <button class="circle-btn facebook">
                                            <i class='bx bxl-facebook'></i>
                                        </button>
                                    </div>
                                    <div class="">
                                        <button class="circle-btn google">
                                            <i class='bx bxl-google'></i>
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6 image-signup">
                            <img src="homepage/images/resources/register.png" width="450px" height="auto"/>
                        </div>

                    </div>
                </div>
            </div>
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
                                    document.getElementById("register-button").style.display='none';
                                } else if (response.status === "oke") {
                                    errorSpan.textContent = "Username is valid";
                                    errorSpan.style.color = "white";
                                    document.getElementById("register-button").style.display='inline-block';
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
                        const repeatpassword = document.getElementById("repeat-password").value; 
                        const registerpassword = document.getElementById("register-password").value;
                        const errorSpan = document.getElementById("repeat-error");

                        $.ajax({
                            url: "register", 
                            type: "POST",
                            data: {
                                action: "checkRepeat", 
                                password : registerpassword,
                                repeat_password : repeatpassword,
                            },
                            success: function (response) {
                                if (response.status === "wrong") {
                                    errorSpan.textContent = "Password is incorrect!!";
                                    errorSpan.style.color = "#EA4335";
                                    document.getElementById("register-button").style.display='none';
                                }
                                else{
                                    document.getElementById("register-button").style.display='inline-block';
                                }
                            },
                            error: function (xhr, status, error) {
                                alert("Error");
                            }
                        });
                    }

                    
                    $(".toggle").on("click", toggleContainer);
                    $(".close").on("click", closeContainer);

                    
                    $("#register-username").on("blur", function () {
                        checkUser(this); 
                    });
                    $("#repeat-password").on("blur", function () {
                        checkRepeatPassword()(this); 
                    });
                });

            </script>
            <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
