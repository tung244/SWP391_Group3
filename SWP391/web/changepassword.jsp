

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Arial', sans-serif;
            }

            body {
                background-color: #f3f4f6;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .login-container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: center;
            }

            h1 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #333;
            }

            .error-message {
                color: red;
                font-size: 16px;
                margin-bottom: 20px;
            }

            .input-group {
                margin-bottom: 15px;
                text-align: left;
            }

            .input-group label {
                display: block;
                font-size: 14px;
                margin-bottom: 5px;
                color: #555;
            }

            .input-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
            }

            .checkbox-group {
                text-align: left;
                margin-bottom: 20px;
            }

            .checkbox-group input {
                margin-right: 5px;
            }

            .buttons {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .login-button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 48%;
            }

            .login-button:hover {
                background-color: #45a049;
            }

            .signup-link {
                text-decoration: none;
                color: #4CAF50;
                font-size: 16px;
            }

            .signup-link:hover {
                text-decoration: underline;
            }

        </style>
        <script>
            
            document.addEventListener("DOMContentLoaded", function() {
                const inputs = document.querySelectorAll("input");
                inputs.forEach((input, index) => {
                    input.addEventListener("keydown", function(event) {
                        if (event.key === "Enter") {
                            
                            event.preventDefault();
                           
                            if (inputs[index + 1]) {
                                inputs[index + 1].focus();
                            }
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <div class="login-container">
        <h1>Change Password Form</h1>
        <c:if test="${requestScope.error != null}">
            <h3 class="error-message">${requestScope.error}</h3>
        </c:if>
        <form action="changepassword" method="get">
            <div class="input-group">
                <label>Username :</label>
                <input type="text" name="usernameTest" "/>
            </div>
            <div class="input-group">
                <label>Current Password:</label>
                <input type="text" name="current_password" "/>
            </div>
            <div class="input-group">
                <label>New Password:</label>
                <input type="password" name="newpassword" "/>
            </div>
            <div class="input-group">
                <label>Confirm New Password: </label>
                <input type="password" name="newpassword2" "/>
            </div>
            <div class="buttons">
                <button type="submit" class="login-button">Submit</button>
                <a href="userprofile" class="return-button">Return</a>
            </div>
        </form>
    </div>
    </body>
</html>
