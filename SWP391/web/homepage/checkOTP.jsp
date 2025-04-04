

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>

    </head>
    <body>

        <div class="">
            <div class="forgot-password-form">
                <div class="forgot-password-card" style="font-size: 14px" id="forgotPasswordStep3">
                    <form action="otp_checking" method="post">
                        <h2 class="forgot-password-title">Enter Verification Code</h2>
                        <div class="forgot-password-input-wrapper">
                            <label class="forgot-password-label" for="verificationCode">Verification Code</label>
                            <input style="font-size: 14px" type="text" id="verificationCode" name="verificationCode" class="forgot-password-input" placeholder="Enter verification code">
                        </div>
                        <button style="font-size: 14px" class="forgot-password-submit" type="submit">Verify Code</button>
                        <a style="
                            display: flex;
                            width: 360px;
                            text-align: center;
                            justify-content: center;
                            font-size: 14px;"
                            class="forgot-password-back-btn" href="forgot_password">Back</a>
                    </form>
                </div>

            </div>
        </div>
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>
        <script>


        </script>
    </body>
</html>
