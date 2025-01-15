<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>

    </head>
    <body>
        <div class="">     
            <div class="preloader"></div>
            <div class="forgot-password-form">
                <div class="forgot-password-card" id="forgotPasswordStep1">
                    <h2 class="forgot-password-title">Forgot Password</h2>
                    <div class="forgot-password-input-wrapper">
                        <label class="forgot-password-label" for="forgotPasswordUsername">Username</label>
                        <input type="text" id="forgotPasswordUsername" class="forgot-password-input" placeholder="Enter your username">
                    </div>
                    <button class="forgot-password-submit" onclick="goToVerificationMethod()">Continue</button>
                    <a href="#" class="forgot-password-back" onclick="goToLogin()">Back to Login</a>
                </div>

                <!-- Page 2: Verification Method Selection -->
                <div class="forgot-password-card forgot-password-hidden" id="forgotPasswordStep2">
                    <h2 class="forgot-password-title">Verification Method</h2>
                    <div class="verification-method-group">
                        <div class="verification-method-option">
                            <input type="radio" id="verificationEmail" name="verificationMethod" value="email" checked>
                            <label for="verificationEmail">Email (user@example.com)</label>
                        </div>
                        <div class="verification-method-option">
                            <input type="radio" id="verificationPhone" name="verificationMethod" value="phone">
                            <label for="verificationPhone">Phone Number (+1234567890)</label>
                        </div>
                    </div>
                    <button class="forgot-password-submit" onclick="sendVerificationCode()">Send Verification Code</button>
                    <button class="forgot-password-back-btn" onclick="backToUsername()">Back</button>
                </div>

                <!-- Page 3: Verification Code Input -->
                <div class="forgot-password-card forgot-password-hidden" id="forgotPasswordStep3">
                    <h2 class="forgot-password-title">Enter Verification Code</h2>
                    <div class="forgot-password-input-wrapper">
                        <label class="forgot-password-label" for="verificationCode">Verification Code</label>
                        <input type="text" id="verificationCode" class="forgot-password-input" placeholder="Enter verification code">
                    </div>
                    <button class="forgot-password-submit" onclick="verifyCode()">Verify Code</button>
                    <button class="forgot-password-back-btn" onclick="backToVerificationMethod()">Back</button>
                </div>
            </div>
        </div>  

        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>

    </body>
</html>
