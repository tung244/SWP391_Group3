
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <style>
            .email-campaign-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            width: 400px;
            text-align: center;
        }
        .email-campaign-title {
            margin: 0 0 15px;
            font-size: 22px;
            color: #333;
        }
        .email-campaign-info {
            margin: 8px 0;
            font-size: 15px;
            color: #444;
            display: flex;
            justify-content: space-between;
            padding: 6px 12px;
            background: #f8f9fa;
            border-radius: 6px;
        }
        .email-campaign-label {
            font-weight: bold;
            color: #222;
        }
        </style>
        <jsp:include page="Common/Css.jsp"/>
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <!--sidebar-wrapper-->
            <jsp:include page="Common/Navbar.jsp"/>

            <!--end header-->
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="row">
                            <div class="col-12 col-lg-3">
                                <div class="card radius-15 bg-voilet">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <h2 class="mb-0 text-white">${support}<i class='bx bxs-up-arrow-alt font-14 text-white'></i> </h2>
                                            </div>
                                            <div class="ms-auto font-35 text-white"><i class="bx bx-help-circle"></i>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-white">Yêu cầu hỗ trợ</p>
                                            </div>
                                            <!--										<div class="ms-auto font-14 text-white">+23.4%</div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-lg-3">
                                <div class="card radius-15 bg-primary-blue">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <h2 class="mb-0 text-white">${appointment} <i class='bx bxs-down-arrow-alt font-14 text-white'></i> </h2>
                                            </div>
                                            <div class="ms-auto font-35 text-white"><i class="bx bx-support"></i>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-white">Mail xác nhận lịch hẹn</p>
                                            </div>
                                            <!--										<div class="ms-auto font-14 text-white">+14.7%</div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-3">
                                <div class="card radius-15 bg-rose">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <h2 class="mb-0 text-white">${verify} <i class='bx bxs-up-arrow-alt font-14 text-white'></i> </h2>
                                            </div>
                                            <div class="ms-auto font-35 text-white"><i class="bx bx-tachometer"></i>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-white">Email xác minh tài khoản</p>
                                            </div>
                                            <!--										<div class="ms-auto font-14 text-white">-12.9%</div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-3">
                                <div class="card radius-15 bg-sunset">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <h2 class="mb-0 text-white">${all} <i class='bx bxs-up-arrow-alt font-14 text-white'></i> </h2>
                                            </div>
                                            <div class="ms-auto font-35 text-white"><i class="bx bx-user"></i>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-white">Email đã được gửi trong tháng</p>
                                            </div>
                                            <!--										<div class="ms-auto font-14 text-white">+13.6%</div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end row-->

                        <!--end row-->
                        <div class="email-campaign-card">
                            <h2 class="email-campaign-title">📧 Chiến Dịch Email</h2>
                            <p class="email-campaign-info"><span class="email-campaign-label">📌 Tên:</span> Khuyến mãi hè</p>
                            <p class="email-campaign-info"><span class="email-campaign-label">👤 Người tạo:</span> Nguyễn Văn A</p>
                            <p class="email-campaign-info"><span class="email-campaign-label">📤 Số email gửi:</span> 1000</p>
                            <p class="email-campaign-info"><span class="email-campaign-label">✅ Đã gửi:</span> <span id="sentEmails">250</span></p>
                            <p class="email-campaign-info"><span class="email-campaign-label">📅 Ngày tạo:</span> 2024-03-28</p>
                        </div>
                    </div>
                </div>
                <!--end page-content-wrapper-->
            </div>
            <!--end page-wrapper-->
            <!--start overlay-->
            <div class="overlay toggle-btn-mobile"></div>
            <!--end overlay-->
            <!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
            <!--End Back To Top Button-->
            <!--footer -->
            <div class="footer">
                <p class="mb-0">Syndash @2020 | Developed By : <a href="https://themeforest.net/user/codervent" target="_blank">codervent</a>
                </p>
            </div>
            <!-- end footer -->
        </div>
        <!--start switcher-->
        <div class="switcher-body">
            <button class="btn btn-primary btn-switcher shadow-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bx bx-cog bx-spin"></i></button>
            <div class="offcanvas offcanvas-end shadow border-start-0 p-2" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling">
                <div class="offcanvas-header border-bottom">
                    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Theme Customizer</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <h6 class="mb-0">Theme Variation</h6>
                    <hr>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="lightmode" value="option1" checked>
                        <label class="form-check-label" for="lightmode">Light</label>
                    </div>
                    <hr>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="darkmode" value="option2">
                        <label class="form-check-label" for="darkmode">Dark</label>
                    </div>
                    <hr>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="darksidebar" value="option3">
                        <label class="form-check-label" for="darksidebar">Semi Dark</label>
                    </div>
                    <hr>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="ColorLessIcons" value="option3">
                        <label class="form-check-label" for="ColorLessIcons">Color Less Icons</label>
                    </div>
                </div>
            </div>
        </div>
        <!--end switcher-->
        <!-- JavaScript -->
        <!-- Bootstrap JS -->
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>

    </body>

</html>
