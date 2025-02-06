

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>


    </head>
    <body>
        <div class="">
            <div class="forgot-password-form">
                <div class="forgot-password-card" id="forgotPasswordStep2">
                    <h2 class="forgot-password-title">Verification Method</h2>
                    <div class="verification-method-group">
                        <form method="post" action="verification_method">
                            <div class="verification-method-option">
                                <input type="radio" id="verificationEmail" name="verificationMethod" value="email" checked>
                                <label for="verificationEmail">Email: ${encryptUser[1]}</label>
                            </div>
                            <div class="verification-method-option">
                                <input type="radio" id="verificationPhone" name="verificationMethod" value="phone">
                                <label for="verificationPhone">PhoneNumber: ${encryptUser[0]}</label>
                            </div>
                            <button type="submit" class="forgot-password-submit">Send Verification Code</button>
                        </form>
                    </div>
                    
                    <a style="display: block; text-align: center" href="forgot_password" class="forgot-password-back-btn">Back</a>
                </div>
            </div>

        </div>
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
