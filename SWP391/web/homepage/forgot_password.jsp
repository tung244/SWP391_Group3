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
                    <img src="homepage/images/resources/logoicon.png" style="margin: 0px 0px  15px 115px" width="140px"/>
                    <h2 class="forgot-password-title">Forgot Password</h2>
                    <div class="forgot-password-input-wrapper">
                        <label class="forgot-password-label" for="forgotPasswordUsername">Username</label>
                        <input type="text" id="forgotPasswordUsername" class="forgot-password-input" placeholder="Enter your username"/>
                    </div>
                    <button class="forgot-password-submit" onclick="goToVerificationMethod()">Continue</button>
                    <a href="login" class="forgot-password-back">Back to Login</a>
                </div>


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
        <script>
            function backToUsername() {
                document.getElementById('forgotPasswordStep1').classList.remove('forgot-password-hidden');
                document.getElementById('forgotPasswordStep2').classList.add('forgot-password-hidden');
                document.getElementById('forgotPasswordStep3').classList.add('forgot-password-hidden');
            }

            function goToVerificationMethod() {
                const username = document.getElementById('forgotPasswordUsername').value;
                
                if (username=== null) {
                    toarst.error('Please enter your username');
                    return;
                }
                document.getElementById('forgotPasswordStep1').classList.add('forgot-password-hidden');
                document.getElementById('forgotPasswordStep2').classList.remove('forgot-password-hidden');
                document.getElementById('forgotPasswordStep3').classList.add('forgot-password-hidden');
            }
            
            function sendVerificationCode() {
                const method = document.querySelector('input[name="verificationMethod"]:checked').value;
                alert(`Verification code will be sent via ${method}`);
                document.getElementById('forgotPasswordStep1').classList.add('forgot-password-hidden');
                document.getElementById('forgotPasswordStep2').classList.add('forgot-password-hidden');
                document.getElementById('forgotPasswordStep3').classList.remove('forgot-password-hidden');
            }

            function backToVerificationMethod() {
                document.getElementById('forgotPasswordStep1').classList.add('forgot-password-hidden');
                document.getElementById('forgotPasswordStep2').classList.remove('forgot-password-hidden');
                document.getElementById('forgotPasswordStep3').classList.add('forgot-password-hidden');
            }

            function verifyCode() {
                const code = document.getElementById('verificationCode').value;
                if (!code) {
                    toarst.success("Sending otp...");
                    return;
                }
                alert('Verification in progress...');
                
            }
        </script>
    </body>
</html>
