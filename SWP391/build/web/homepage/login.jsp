<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <script src="js/jquery.js"></script>
    </head>
    <body>
        <div class="boxed_wrapper">         
            <div class="preloader"></div>
            <div class="form-login-signup">
                <div class="container">
                    <div class="card">
                        <h1 class="title">Login</h1>
                        <div class="col-md-6 image-login">
                            <img src="images/resources/login.svg" width="350px"/>
                        </div>
                        <div class="col-md-6">
                            <form>
                                <div class="input-container">
                                    <input type="text" id="username" required />
                                    <label for="username">Username</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="input-container">
                                    <input type="password" id="password" required />
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
                            <form>
                                <div class="input-container">
                                    <input type="text" id="register-username" required />
                                    <label for="register-username">Username</label>
                                    <div class="bar"></div>
                                </div>

                                <div class="input-container">
                                    <input type="password" id="register-password" required />
                                    <label for="register-password">Password</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="input-container">
                                    <input type="password" id="repeat-password" required />
                                    <label for="repeat-password">Repeat Password</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="input-container">
                                    <input type="text" id="register-name" required />
                                    <label for="register-name">Full Name</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="input-container">
                                    <input type="text" id="register-phone" required />
                                    <label for="register-phone">PhoneNumber</label>
                                    <div class="bar"></div>
                                </div>
                                <div class="button-container">
                                    <button><span>Next</span></button>
                                </div>
                                <div class="register-other-platform" style="margin-top: 15px; text-align: center; font-size: 16px; color: white;">
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
                            </form>
                        </div>
                        <div class="col-md-6 image-signup">
                            <img src="images/resources/register.png" width="450px" height="auto"/>
                        </div>

                    </div>
                </div>
            </div>
            <script>
                $(".toggle").on("click", function () {
                    $(".container").stop().addClass("active");

                });

                $(".close").on("click", function () {
                    $(".container").stop().removeClass("active");

                });
            </script>
            <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
