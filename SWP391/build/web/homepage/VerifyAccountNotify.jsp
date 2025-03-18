<%-- 
    Document   : VerifyAccount
    Created on : Feb 25, 2025, 1:23:48 PM
    Author     : fptshop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="Common/Css.jsp"/>
    <title>Cảm ơn quý khách</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            padding: 50px;
        }
        .container {
            background: white;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #27ae60;
        }
        p {
            font-size: 18px;
            color: #333;
        }
        .email-check {
            color: #3498db;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="margin-bottom: 30px">Cảm ơn quý khách!</h1>
        <p>Cảm ơn quý khách đã đăng ký sử dụng dịch vụ của chúng tôi.</p>
        <p>Vui lòng kiểm tra <span class="email-check">email</span> để xác minh tài khoản.</p>
    </div>
</body>
</html>

