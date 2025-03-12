<%-- 
    Document   : Payment
    Created on : Feb 24, 2025, 9:24:26 PM
    Author     : fptshop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán QR</title>
        <jsp:include page="Common/Css.jsp"/>
        <style>

            .thanhtoan {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: start;

                height: 100vh;
                background-color: #f4f4f4;
                margin: 0;
            }
            .card-qr {
                background: white;
                padding: 20px;
                margin-top: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 600px;
                height: 500px;
            }
            .qr-code img {
                width: 300px;
                height: 300px;
            }
            .status-qr {
                margin-top: 15px;
                font-size: 18px;
                font-weight: bold;
                color: red;
            }
        </style>
    </head>
    <body>
        <div style="overflow-y: auto;" class="boxed_wrapper">  
            <jsp:include page="Common/Navbar.jsp"/>
            <div class="thanhtoan">
                <div class="card-qr">
                    <h2 style="margin-bottom: 30px">Quét mã để thanh toán</h2>
                    <div class="qr-code">   
                        <img src="https://img.vietqr.io/image/MB-0828959442-compact2.png?amount=${sessionScope.amount}&addInfo=eyecare${sessionScope.aid}%20thanh%20toan%20chi%20phi%20kham" alt="QR Code">  
                    </div>
                    <span>Quý khách vui lòng không thay đổi bất kì nội dung nào trên hóa đơn. Nếu thay đổi chúng tôi không chịu trách nhiệm</span>
                    <div class="status-qr">Chưa thanh toán</div>
                </div>
            </div>
        </div>
        <jsp:include page="Common/Js.jsp"/>
    </body>
</html>

