<%-- 
    Document   : Invoice
    Created on : Mar 6, 2025, 2:13:03 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>EyesCare - Chăm sóc mắt số 1 Hòa Lạc</title>

        <!-- responsive meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- For IE -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- master stylesheet -->

        <link rel="stylesheet" href="homepage/css/style.css">
        <!-- Responsive stylesheet -->
        <link rel="stylesheet" href="homepage/css/responsive.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="homepage/images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="homepage/images/favicon/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="homepage/images/favicon/favicon-16x16.png" sizes="16x16">
        <style>
            body{
                margin-top:20px;
                background:#eee;
            }

            /*Invoice*/
            .invoice .top-left {
                font-size:65px;
                color:#3ba0ff;
                margin-top: 2%;
            }

            .invoice .top-right {
                text-align:right;
                padding-right:20px;
                margin-top: 5%;
            }

            .invoice .table-row {
                margin-left:-15px;
                margin-right:-15px;
                margin-top:25px;
            }

            .invoice .payment-info {
                font-weight:500;
            }

            .invoice .table-row .table>thead {
                border-top:1px solid #ddd;
            }

            .invoice .table-row .table>thead>tr>th {
                border-bottom:none;
            }

            .invoice .table>tbody>tr>td {
                padding:8px 20px;
            }

            .invoice .invoice-total {
                margin-right:-10px;
                font-size:16px;
            }

            .invoice .last-row {
                border-bottom:1px solid #ddd;
            }

            .invoice-ribbon {
                width:85px;
                height:88px;
                overflow:hidden;
                position:absolute;
                top:-1px;
                right:14px;
            }

            .ribbon-inner {
                text-align:center;
                -webkit-transform:rotate(45deg);
                -moz-transform:rotate(45deg);
                -ms-transform:rotate(45deg);
                -o-transform:rotate(45deg);
                position:relative;
                padding:7px 0;
                left:-5px;
                top:11px;
                width:120px;
                background-color:#66c591;
                font-size:15px;
                color:#fff;
            }

            .ribbon-inner:before,.ribbon-inner:after {
                content:"";
                position:absolute;
            }

            .ribbon-inner:before {
                left:0;
            }

            .ribbon-inner:after {
                right:0;
            }

            @media(max-width:575px) {
                .invoice .top-left,.invoice .top-right,.invoice .payment-details {
                    text-align:center;
                }

                .invoice .from,.invoice .to,.invoice .payment-details {
                    float:none;
                    width:100%;
                    text-align:center;
                    margin-bottom:25px;
                }

                .invoice p.lead,.invoice .from p.lead,.invoice .to p.lead,.invoice .payment-details p.lead {
                    font-size:22px;
                }

                .invoice .btn {
                    margin-top:10px;
                }
            }

            @media print {
                .invoice {
                    width:900px;
                    height:800px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container bootstrap snippets bootdeys">
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default invoice" id="invoice">
                        <div class="panel-body">
                            <div class="invoice-ribbon"><div class="ribbon-inner">PAID</div></div>
                            <div class="row">

                                <div class="col-sm-6 top-left">
                                    <img src="homepage/images/resources/logo.png" width="300px" height="100px" alt="alt"/>
                                </div>

                                <div class="col-sm-6 top-right">
                                    <h3 class="marginright">INVOICE-${appointment.appointment_id}</h3>
                                    <span class="marginright"><fmt:formatDate value="${checkout.checkoutTime}" pattern="dd-MM-yyyy"/></span>
                                </div>

                            </div>
                            <hr>
                            <div class="row">

                                <div class="col-xs-4 from">
                                    <p class="lead marginbottom">From : Dynofy</p>
                                    <p>Km29, cao tốc Láng Hòa Lạc</p>
                                    <p>Thạch Thất, Hà Nội</p>
                                    <p>Phone: 415-767-3600</p>
                                    <p>Email: eyecare@gmail.com.com</p>
                                </div>

                                <div class="col-xs-4 to">
                                    <p class="lead marginbottom">To : ${appointment.user.fullname}</p>
                                    <p>${appointment.user.address}</p>
                                    <p>Phone: ${appointment.user.account.phonenumber}</p>
                                    <p>Email: ${appointment.user.account.email}</p>

                                </div>

                                <div class="col-xs-4 text-right payment-details">
                                    <p class="lead marginbottom payment-info">Payment details</p>
                                    <p>Date: <fmt:formatDate value="${checkout.checkoutTime}" pattern="dd/MM/yyyy HH:mm:ss"/></p>
                                    <p>VAT: DK888-777 </p>
                                    <p>Total Amount: <fmt:formatNumber value="${checkout.totalBill}" pattern="#,###"/></p>
<!--                                    <p>Account Name: ${appointment.user.account.username}</p>-->
                                </div>

                            </div>

                            <div class="row table-row">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center" style="width:5%">#</th>
                                            <th class="text-left" style="width:20%">Service</th>
                                            <th class="text-center" style="width:15%">Type</th>
                                            <th class="text-center" style="width:15%">Date</th>
                                            <th class="text-center" style="width:15%">Time</th>
                                            <th class="text-center" style="width:15%">Doctor</th>
                                            <th class="text-center" style="width:15%">Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-center">${checkout.checkoutId}</td>
                                            <td class="text-left">${appointment.service_detail.services.service_name}</td>
                                            <td class="text-center">${appointment.service_detail.serviceType.service_type_name}</td>
                                            <td class="text-center"><fmt:formatDate value="${appointment.appointment_date}" pattern="dd-MM-yyyy"/></td>
                                            <td class="text-center">${appointment.slot.start_time} - ${appointment.slot.end_time}</td>
                                            <td class="text-center">${appointment.doctor.doctor_name}</td>
                                            <td class="text-center"><fmt:formatNumber value="${appointment.service_detail.cost}" pattern="#,###"/></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                            <div class="row">
                                <div class="col-xs-4 margintop">
                                    <p class="lead marginbottom">THANK YOU!</p>

                                    <button class="btn btn-success" id="invoice-print"><i class="fa fa-print"></i> Print Invoice</button>
                                    <button class="btn btn-danger"><i class="fa fa-envelope-o"></i> Mail Invoice</button>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <p><strong>Signature</strong></p>
                                    <img src="homepage/images/resources/signature.png" width="150px" height="80px" alt="Signature">
                                </div>
                                <div class="col-xs-4 text-right pull-right invoice-total">
                                    <p>Subtotal : <fmt:formatNumber value="${appointment.service_detail.cost}" pattern="#,###"/></p>
                                    <p>Discount (${appointment.discount.percent}%)</p>
                                    <p>Total : <fmt:formatNumber value="${appointment.actualCost}" pattern="#,###"/> </p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Thư viện jsPDF và html2canvas -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

        <script>
            document.getElementById("invoice-print").addEventListener("click", function () {
                const {jsPDF} = window.jspdf;
                let invoiceElement = document.getElementById("invoice"); // Chọn phần hóa đơn hiển thị

                html2canvas(invoiceElement, {scale: 2}).then(canvas => {
                    let imgData = canvas.toDataURL("image/png");
                    let pdfWidth = canvas.width * 0.264583; // Chuyển pixel sang mm
                    let pdfHeight = canvas.height * 0.264583 - 20;

                    let doc = new jsPDF({
                        orientation: pdfWidth > pdfHeight ? 'l' : 'p', // Xoay ngang nếu rộng hơn cao
                        unit: 'mm',
                        format: [pdfWidth, pdfHeight] // Kích thước đúng như trên web
                    });

                    doc.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
                    doc.save("Invoice-" + new Date().getTime() + ".pdf");
                });
            });

        </script>

    </body>
</html>
