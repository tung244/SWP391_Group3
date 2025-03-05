<%-- 
    Document   : CreateBlog
    Created on : Mar 4, 2025, 5:04:25 PM
    Author     : fptshop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Soạn thảo bài viết</title>
    <!-- Import CKEditor từ CDN (Decoupled Editor) -->
    <script src="https://cdn.ckeditor.com/ckeditor5/41.1.0/decoupled-document/ckeditor.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        #custom_mail_2024_toolbar {
            background-color: #fff;
            padding: 10px;
            border: 1px solid #ccc;
            border-bottom: none;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        #custom_mail_2024_content {
            min-height: 600px;
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .save-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .save-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Soạn thảo bài viết</h1>
        <form id="postForm" action="<%=request.getContextPath()%>/admin/SavePostServlet" method="POST">
            <div id="custom_mail_2024_toolbar"></div>
            <div id="custom_mail_2024_content" contenteditable="true">
                <p>Nhập nội dung bài viết của bạn tại đây...</p>
            </div>
            <input type="hidden" id="postContent" name="postContent">
            <button type="submit" class="save-button">Lưu bài viết</button>
        </form>
    </div>

    <script>
        let custom_mail_2024_editor;

        function custom_mail_2024_initEditor() {
            if (custom_mail_2024_editor)
                return;

            DecoupledEditor
                .create(document.querySelector('#custom_mail_2024_content'), {
                    language: 'vi',
                    toolbar: [
                        'heading', '|',
                        'fontSize', 'fontFamily', '|',
                        'bold', 'italic', 'underline', '|',
                        'alignment', '|',
                        'bulletedList', 'numberedList', '|',
                        'fontColor', 'fontBackgroundColor', '|',
                        'link', 'blockQuote', 'imageUpload', '|',
                        'undo', 'redo'
                    ],
                    fontSize: {
                        options: [12, 14, 16, 18, 20, 24]
                    },
                    simpleUpload: {
                        // URL của Servlet xử lý upload ảnh (auto submit)
                        uploadUrl: '<%=request.getContextPath()%>/UploadImageServlet',
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest'
                        }
                    }
                })
                .then(editor => {
                    custom_mail_2024_editor = editor;
                    document.querySelector('#custom_mail_2024_toolbar')
                        .appendChild(editor.ui.view.toolbar.element);
                    console.log('CKEditor đã khởi tạo thành công');
                })
                .catch(error => {
                    console.error('CKEditor lỗi:', error);
                });
        }

        // Chuyển dữ liệu CKEditor sang input hidden trước khi submit
        document.getElementById('postForm').onsubmit = function(event) {
            if (custom_mail_2024_editor) {
                const content = custom_mail_2024_editor.getData();
                const hiddenInput = document.getElementById('postContent');
                
                // Gán nội dung CKEditor (bao gồm ảnh đã upload) vào input hidden
                hiddenInput.value = content;

                // (Tùy chọn) Kiểm tra kích thước nội dung
                const contentLength = content.length;
                console.log('Kích thước nội dung: ' + contentLength + ' ký tự');
                if (contentLength > 1000000) {
                    event.preventDefault();
                    alert('Nội dung quá dài (hơn 1 triệu ký tự), vui lòng rút ngắn!');
                    return false;
                }
            }
        };

        // Khởi tạo editor khi trang load
        window.onload = function() {
            custom_mail_2024_initEditor();
        };
    </script>
</body>
</html>
