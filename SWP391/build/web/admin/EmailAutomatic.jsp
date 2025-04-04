<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="Common/Css.jsp"/>
    <script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/decoupled-document/ckeditor.js"></script>
    <style>
        /* Giữ nguyên CSS cũ của bạn */
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
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .mei-preview span {
            margin: 2px 0;
        }

        /* Style cho nút xóa */
        .mei-clear-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 5px;
            font-size: 0.9em;
            transition: all 0.3s;
        }

        .mei-clear-btn:hover {
            background: #c0392b;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <jsp:include page="Common/Navbar.jsp"/>
        <div class="page-wrapper">
            <div class="page-content-wrapper">
                <div class="mei-container">
                    <h1 class="mei-title">📧 Chiến Dịch Email - Bệnh Viện Mắt</h1>

                    <form action="sendMailAuto" method="post" id="massEmailForm" enctype="multipart/form-data">
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
                                    <textarea name="group-patient" style="height: 200px; width: 420px; padding: 10px; border-radius: 10px;" id="emailList" placeholder="Nhập email, mỗi dòng một email..."></textarea>
                                </div>
                            </div>

                            <!-- Card Import khách hàng -->
                            
                        </div>

                        <!-- Card Soạn tin nhắn mới -->
                        <div class="mei-card" id="customTemplateSection">
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
                            <div class="mei-form-group">
                                <label class="mei-label">Tệp đính kèm</label>
                                <input type="file" id="attachmentInput" name="attachment" class="mei-file-input" multiple>
                                <label for="attachmentInput" class="mei-file-label">
                                    <span class="mei-icon">📎</span>
                                    Chọn tệp (có thể chọn nhiều)
                                </label>
                                <div id="attachmentPreview" class="mei-preview" style="display: none; flex-direction: column; align-items: flex-start;">
                                    <span class="mei-icon">📄</span>
                                    <span id="attachmentName"></span>
                                    <button type="button" class="mei-clear-btn" id="clearAttachment">Xóa tệp</button>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="mei-submit-btn">
                            <span class="mei-icon">✈️</span>
                            Gửi Chiến Dịch
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="overlay toggle-btn-mobile"></div>
        <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
    </div>

    <jsp:include page="Common/Js.jsp"/>
    <script>
        // Hiển thị tên file Excel
        document.getElementById('fileInput').addEventListener('change', function () {
            const preview = document.getElementById('filePreview');
            const fileName = document.getElementById('fileName');
            if (this.files && this.files[0]) {
                fileName.textContent = this.files[0].name;
                preview.style.display = 'flex';
            } else {
                preview.style.display = 'none';
            }
        });

        // Hiển thị tên các file đính kèm và xử lý nút xóa
        const attachmentInput = document.getElementById('attachmentInput');
        const attachmentPreview = document.getElementById('attachmentPreview');
        const attachmentName = document.getElementById('attachmentName');
        const clearAttachmentBtn = document.getElementById('clearAttachment');

        attachmentInput.addEventListener('change', function () {
            if (this.files && this.files.length > 0) {
                attachmentName.innerHTML = ''; // Xóa nội dung cũ
                for (let i = 0; i < this.files.length; i++) {
                    const fileSpan = document.createElement('span');
                    fileSpan.textContent = this.files[i].name;
                    attachmentName.appendChild(fileSpan);
                }
                attachmentPreview.style.display = 'flex';
            } else {
                attachmentPreview.style.display = 'none';
            }
        });

        // Xử lý nút xóa tệp
        clearAttachmentBtn.addEventListener('click', function () {
            attachmentInput.value = ''; // Reset input file
            attachmentName.innerHTML = ''; // Xóa danh sách tên file
            attachmentPreview.style.display = 'none'; // Ẩn preview
        });
    </script>
</body>
</html>