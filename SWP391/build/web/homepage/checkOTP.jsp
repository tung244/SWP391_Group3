

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>

    </head>
    <body>
        <div class="">
            <div class="forgot-password-form">
                <div class="forgot-password-card" id="forgotPasswordStep3">
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
