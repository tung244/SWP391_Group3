
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <jsp:include page="Common/Css.jsp"/>
        <script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/decoupled-document/ckeditor.js"></script>
        <style>
            .mei-container {
                max-width: 1000px;
                margin: 20px auto;
                padding: 20px;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: #f5f6fa;
                min-height: 100vh;
            }

            .mei-title {
                color: #2c3e50;
                text-align: center;
                margin-bottom: 30px;
                font-size: 2em;
            }

            .mei-card {
                background: white;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 25px;
                margin-bottom: 20px;
            }

            .mei-card-title {
                font-size: 1.2em;
                color: #2c3e50;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #f1f1f1;
                display: flex;
                align-items: center;
            }

            .mei-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px;
            }

            .mei-form-group {
                margin-bottom: 20px;
            }

            .mei-label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #34495e;
            }

            .mei-input, .mei-select, .mei-textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #e0e0e0;
                border-radius: 6px;
                margin-bottom: 10px;
                transition: all 0.3s;
            }

            .mei-input:focus, .mei-select:focus, .mei-textarea:focus {
                border-color: #3498db;
                box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
                outline: none;
            }

            .mei-textarea {
                min-height: 150px;
                resize: vertical;
            }

            .mei-file-input {
                display: none;
            }

            .mei-file-label {
                display: inline-block;
                padding: 12px 24px;
                background: #3498db;
                color: white;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s;
                box-shadow: 0 2px 5px rgba(52, 152, 219, 0.2);
            }

            .mei-file-label:hover {
                background: #2980b9;
                transform: translateY(-1px);
            }

            .mei-template-container {
                display: grid;
                gap: 15px;
            }

            .mei-template-option {
                background: #f8f9fa;
                padding: 15px;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s;
                border: 1px solid #e0e0e0;
            }

            .mei-template-option:hover {
                background: #fff;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                transform: translateY(-2px);
            }

            .mei-template-content {
                display: none;
                margin-top: 15px;
                padding: 15px;
                background: #fff;
                border-radius: 4px;
                border: 1px dashed #e0e0e0;
            }

            .mei-template-content.active {
                display: block;
                animation: slideDown 0.3s ease-out;
            }

            @keyframes slideDown {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .mei-template-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .mei-template-toggle {
                background: none;
                border: none;
                color: #3498db;
                cursor: pointer;
                padding: 5px;
                font-size: 1.2em;
            }

            .mei-badge {
                background: #e74c3c;
                color: white;
                padding: 2px 8px;
                border-radius: 12px;
                font-size: 0.8em;
                margin-left: 10px;
            }

            .mei-template-option input[type="radio"] {
                margin-right: 10px;
            }

            .mei-submit-btn {
                background: #27ae60;
                color: white;
                padding: 15px 30px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 16px;
                transition: all 0.3s;
                box-shadow: 0 2px 5px rgba(39, 174, 96, 0.2);
                width: 100%;
                margin-top: 20px;
            }

            .mei-submit-btn:hover {
                background: #219a52;
                transform: translateY(-1px);
            }

            .mei-icon {
                margin-right: 8px;
                font-size: 1.2em;
            }

            .mei-preview {
                background: #f8f9fa;
                padding: 15px;
                border-radius: 6px;
                margin-top: 15px;
                border: 1px dashed #bdc3c7;
            }
        </style>
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <!--sidebar-wrapper-->
            <jsp:include page="Common/Navbar.jsp"/>
            <!--end sidebar-wrapper-->
            <!--header-->
            <jsp:include page="Common/Search.jsp"/>
            <!--end header-->
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="mei-container">
                        <h1 class="mei-title">📧 Chiến Dịch Email - Bệnh Viện Mắt</h1>

                        <form action="sendMailAuto" method="post" id="massEmailForm">
                            <div class="mei-grid">
                                <!-- Card Thông tin chiến dịch -->
                                <div class="mei-card">
                                    <div class="mei-card-title">
                                        <span class="mei-icon">🎯</span>
                                        Thông tin chiến dịch
                                    </div>
                                    <div class="mei-form-group">
                                        <label class="mei-label">Tên chiến dịch</label>
                                        <input name="name-company" type="text" class="mei-input" required placeholder="VD: Tầm soát đục thủy tinh thể">
                                    </div>
                                    <div class="mei-form-group">
                                        <label class="mei-label">Nhóm bệnh nhân</label>
                                        <textarea name="group-patient" style="height: 200px;
                                                  width: 420px;
                                                  padding: 10px;
                                                  border-radius: 10px;" id="emailList" placeholder="Nhập email, mỗi dòng một email..."></textarea>
                                    </div>
                                </div>

                                <!-- Card Import khách hàng -->
                                <div class="mei-card">
                                    <div class="mei-card-title">
                                        <span class="mei-icon">👥</span>
                                        Danh sách bệnh nhân
                                    </div>
                                    <div class="mei-form-group">
                                        <input type="file" id="fileInput" class="mei-file-input" accept=".xlsx,.xls">
                                        <label for="fileInput" class="mei-file-label">
                                            <span class="mei-icon">📎</span>
                                            Import Excel
                                        </label>
                                        <div id="filePreview" class="mei-preview" style="display: none;">
                                            <span class="mei-icon">📄</span>
                                            <span id="fileName"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Card Mẫu tin nhắn -->
                            <div class="mei-card">
                                <div class="mei-card-title">
                                    <span class="mei-icon">✨</span>
                                    Mẫu email thông báo
                                </div>
                                <div class="mei-template-container">
                                    <div class="mei-template-option">
                                        <div class="mei-template-header">
                                            <div>
                                                <input type="radio" name="template" value="template1" id="temp1">
                                                <label for="temp1">Chương Trình Tầm Soát Mắt</label>
                                                <span class="mei-badge">HOT</span>
                                            </div>
                                            <button type="button" class="mei-template-toggle" data-template="temp1">👁️</button>
                                        </div>
                                        <div class="mei-template-content" id="content-temp1">
                                            <strong>Subject:</strong> 👀 Chương Trình Tầm Soát Sức Khỏe Mắt Miễn Phí<br><br>
                                            Kính gửi [Tên bệnh nhân],<br><br>
                                            Bệnh viện Mắt [Tên bệnh viện] trân trọng thông báo chương trình tầm soát sức khỏe mắt miễn phí:<br><br>
                                            📍 Dịch vụ bao gồm:<br>
                                            - Đo thị lực<br>
                                            - Soi đáy mắt<br>
                                            - Đo nhãn áp<br>
                                            - Tư vấn với bác sĩ chuyên khoa<br><br>
                                            ⏰ Thời gian: 8:00 - 16:30 từ 01/03 - 15/03/2024<br>
                                            💝 Ưu đãi đặc biệt: Giảm 30% chi phí điều trị nếu phát hiện bệnh lý<br><br>
                                            👉 Đặt lịch ngay: [Số điện thoại]<br>
                                            * Vui lòng mang theo CMND/CCCD khi đến khám
                                        </div>
                                    </div>

                                    <div class="mei-template-option">
                                        <div class="mei-template-header">
                                            <div>
                                                <input type="radio" name="template" value="template2" id="temp2">
                                                <label for="temp2">Nhắc Lịch Tái Khám</label>
                                                <span class="mei-badge">QT</span>
                                            </div>
                                            <button type="button" class="mei-template-toggle" data-template="temp2">👁️</button>
                                        </div>
                                        <div class="mei-template-content" id="content-temp2">
                                            <strong>Subject:</strong> ⏰ Nhắc Lịch Tái Khám - Bệnh Viện Mắt [Tên BV]<br><br>
                                            Kính gửi [Tên bệnh nhân],<br><br>
                                            Bệnh viện xin nhắc lịch tái khám của quý khách:<br><br>
                                            📅 Ngày tái khám: [Ngày giờ]<br>
                                            👨‍⚕️ Bác sĩ khám: [Tên bác sĩ]<br>
                                            📋 Cần mang theo:<br>
                                            - Sổ khám bệnh<br>
                                            - Các kết quả xét nghiệm/chụp chiếu trước đây<br>
                                            - Đơn thuốc cũ (nếu có)<br><br>
                                            ℹ️ Nếu cần thay đổi lịch, vui lòng liên hệ: [Số điện thoại]<br><br>
                                            Chúc quý khách sức khỏe!
                                        </div>
                                    </div>

                                    <div class="mei-template-option">
                                        <div class="mei-template-header">
                                            <div>
                                                <input type="radio" name="template" value="template3" id="temp3">
                                                <label for="temp3">Hướng Dẫn Trước Phẫu Thuật</label>
                                            </div>
                                            <button type="button" class="mei-template-toggle" data-template="temp3">👁️</button>
                                        </div>
                                        <div class="mei-template-content" id="content-temp3">
                                            <strong>Subject:</strong> 🏥 Hướng Dẫn Chuẩn Bị Phẫu Thuật<br><br>
                                            Kính gửi [Tên bệnh nhân],<br><br>
                                            Để chuẩn bị cho ca phẫu thuật ngày [Ngày giờ], quý khách vui lòng lưu ý các hướng dẫn sau:<br><br>
                                            ⚠️ Trước phẫu thuật:<br>
                                            - Nhịn ăn trước 6 tiếng<br>
                                            - Ngưng các loại thuốc chống đông (nếu có)<br>
                                            - Vệ sinh mắt và vùng quanh mắt sạch sẽ<br><br>
                                            📋 Cần mang theo:<br>
                                            - Giấy tờ tùy thân<br>
                                            - Kết quả xét nghiệm tiền phẫu<br>
                                            - Đồ dùng cá nhân cần thiết<br><br>
                                            ⏰ Có mặt tại bệnh viện: [Giờ]<br>
                                            📞 Hotline hỗ trợ: [Số điện thoại]
                                        </div>
                                    </div>

                                    <div class="mei-template-option">
                                        <div class="mei-template-header">
                                            <div>
                                                <input type="radio" name="template" value="custom" id="tempCustom">
                                                <label for="tempCustom">Tạo mẫu mới</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Card Soạn tin nhắn mới -->
                            <div class="mei-card" id="customTemplateSection" style="display: none;">
                                <div class="mei-card-title">
                                    <span class="mei-icon">✏️</span>
                                    Soạn email mới
                                </div>
                                <div class="mei-form-group">
                                    <label class="mei-label">Tiêu đề email</label>
                                    <input name="subject-mail" type="text" class="mei-input" placeholder="Nhập tiêu đề email...">
                                </div>
                                <div class="mei-form-group">
                                    <label class="mei-label">Nội dung</label>
                                    <textarea name="content-mail" class="mei-textarea" placeholder="Nhập nội dung email của bạn..."></textarea>
                                </div>
                            </div>

                            <button type="submit" class="mei-submit-btn">
                                <span class="mei-icon">✈️</span>
                                Gửi Chiến Dịch
                            </button>
                        </form>
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

            <!-- end footer -->
        </div>
        <!-- end wrapper -->
        <!--start switcher-->

        <!--end switcher-->
        <!-- JavaScript -->
        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!--plugins-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <script>
            new PerfectScrollbar('.email-navigation');
            new PerfectScrollbar('.email-read-box');
        </script>
        <!-- App JS -->
        <script src="assets/js/app.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const customRadio = document.getElementById('tempCustom');
                const customSection = document.getElementById('customTemplateSection');
                const fileInput = document.getElementById('fileInput');
                const filePreview = document.getElementById('filePreview');
                const fileName = document.getElementById('fileName');

                // Xử lý toggle template content
                document.querySelectorAll('.mei-template-toggle').forEach(button => {
                    button.addEventListener('click', function (e) {
                        e.preventDefault();
                        const templateId = this.getAttribute('data-template');
                        const content = document.getElementById('content-' + templateId);

                        // Toggle active class
                        document.querySelectorAll('.mei-template-content').forEach(cont => {
                            if (cont !== content) {
                                cont.classList.remove('active');
                            }
                        });
                        content.classList.toggle('active');
                    });
                });

                // Hiển thị/ẩn phần soạn tin nhắn tùy chỉnh
                document.querySelectorAll('input[name="template"]').forEach(radio => {
                    radio.addEventListener('change', function () {
                        customSection.style.display = customRadio.checked ? 'block' : 'none';
                    });
                });

                

                // Hiển thị tên file đã chọn
                fileInput.addEventListener('change', function (e) {
                    const file = e.target.files[0];
                    if (file) {
                        fileName.textContent = file.name;
                        filePreview.style.display = 'block';
                    } else {
                        filePreview.style.display = 'none';
                    }
                });
            });
        </script>

    </body>

</html>
