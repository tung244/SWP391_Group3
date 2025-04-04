<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Soạn thảo bài viết</title>
        <jsp:include page="Common/Css.jsp"/>
        <script src="https://cdn.ckeditor.com/ckeditor5/41.1.0/decoupled-document/ckeditor.js"></script>
        <style>
            .custom-file-upload {
                position: relative;
                display: inline-block;
                width: 100%;
                margin-bottom: 20px;
            }

            .custom-file-upload .file-upload-label {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 120px;
                border: 2px dashed #ccc;
                border-radius: 8px;
                background-color: #f8f9fa;
                cursor: pointer;
                transition: all 0.3s;
                overflow: hidden;
            }

            .custom-file-upload .file-upload-label:hover {
                border-color: #228B22;
                background-color: #f0f8f0;
            }

            .custom-file-upload .file-upload-label .upload-icon {
                font-size: 24px;
                color: #666;
                margin-right: 10px;
            }

            .custom-file-upload .file-upload-label .upload-text {
                font-size: 16px;
                color: #666;
            }

            .custom-file-upload input[type="file"] {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
                cursor: pointer;
            }

            .image-preview-container {
                margin-top: 15px;
                display: none;
            }

            .image-preview-container img {
                max-width: 100%;
                max-height: 200px;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }

            .preview-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .preview-title {
                font-weight: bold;
                color: #333;
            }

            .remove-image {
                background-color: #ff5252;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 4px 8px;
                cursor: pointer;
                font-size: 12px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-control {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: border-color 0.3s;
            }

            .form-control:focus {
                border-color: #228B22;
                outline: none;
                box-shadow: 0 0 0 2px rgba(34,139,34,0.2);
            }

            .form-label {
                display: block;
                font-weight: bold;
                margin-bottom: 8px;
                color: #333;
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
                <div style="padding: 0" class="page-content-wrapper">
                    <div style="background-color: white" class="page-content">
                        <!--start email wrapper-->
                        <form id="formSubmitBlog" action="update_blog" method="post" enctype="multipart/form-data">
                            <!-- Title/Meta Input -->
                            <div class="form-group">
                                <label for="title_meta" class="form-label">Tiêu đề bài viết:</label>
                                <input type="text" id="title_meta" name="title_meta" class="form-control" value="${blog.title_meta}" placeholder="Nhập tiêu đề bài viết"/>
                            </div>

                            <!-- Thumbnail Image Upload -->
                            <div class="form-group">
                                <label class="form-label">Ảnh đại diện bài viết:</label>
                                <div class="custom-file-upload">
                                    <label for="thumbnail_image" class="file-upload-label">
                                        <span class="upload-icon"><i class='bx bx-upload'></i></span>
                                        <c:if test="${empty blog.title_image_blog}">
                                            <span class="upload-text">Chọn ảnh hoặc kéo thả vào đây</span></c:if>
                                        <c:if test="${not empty blog.title_image_blog}">
                                            <span class="upload-text">${blog.title_image_blog}</span>

                                        </c:if>
                                        
                                    </label>
                                    <input type="hidden" name="blog_id" value="${blog.blog_id}"/>
                                    <input type="hidden" id="thumb_old" name="thumb_old" value="${blog.title_image_blog}"/>
                                    <input type="file" id="thumbnail_image" name="thumbnail_image"/>
                                </div>

                                <div id="image_preview" class="image-preview-container">
                                    <div class="preview-header">
                                        
                                        <span class="preview-title">Ảnh xem trước:</span>
                                        <button type="button" id="remove_image" class="remove-image">Xóa ảnh</button>
                                    </div>
                                    <img id="preview" src="" alt="Preview"/>
                                </div>
                            </div>

                            <div id="toolbar-container"></div>
                            <div style="height: 800px; border: 1px solid lightslategray" id="editor"></div>
                            <input type="hidden" id="postContent" name="postContent"/>
                            <button style="margin-top: 20px; padding: 10px 15px; background-color: rgb(34,139,34);
                                    color: white; border: none; border-radius: 5px; display: flex; align-items: center; gap: 8px;" 
                                    type="submit">
                                <i class='bx bx-play'></i> Lưu thay đổi
                            </button>
                        </form>

                        
                        <!--end email wrapper-->
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
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>
        <!-- Import file adapter -->
        <script src="assets/js/ckeditor5_adapter/ckeditor-adapter.js"></script>
        <script>
            DecoupledEditor
                    .create(document.querySelector('#editor'), {
                        extraPlugins: [MyCustomUploadAdapterPlugin],
                        toolbar: [
                            'heading', '|',
                            'fontSize', 'fontFamily', 'highlight', '|',
                            'bold', 'italic', 'underline', 'strikethrough', '|',
                            'alignment', '|',
                            'bulletedList', 'numberedList', '|',
                            'fontColor', 'fontBackgroundColor', '|',
                            'link', 'blockQuote', 'imageUpload', '|',
                            'undo', 'redo'
                        ]
                    })
                    .then(editor => {
                        editorInstance = editor;
                        document.querySelector('#toolbar-container')
                                .appendChild(editor.ui.view.toolbar.element);
                        let postContent = '${blog.blog_content}';
                        if (postContent.trim() !== "") {
                            editorInstance.setData(postContent);
                        }
                    })
                    .catch(error => {
                        console.error('CKEditor lỗi:', error);
                    });

            document.getElementById('formSubmitBlog').addEventListener('submit', function () {
                document.getElementById('postContent').value = editorInstance.getData();
            });


            document.getElementById('thumbnail_image').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    const preview = document.getElementById('preview');
                    const previewContainer = document.getElementById('image_preview');
                    const uploadLabel = document.querySelector('.file-upload-label');
                    const oldThumb = document.getElementById('thumb_old');

                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        oldThumb.value = '';
                        previewContainer.style.display = 'block';
                        uploadLabel.innerHTML = '<span class="upload-text">' + file.name + '</span>';
                    };

                    reader.readAsDataURL(file);
                }
            });


            document.getElementById('remove_image').addEventListener('click', function () {
                const fileInput = document.getElementById('thumbnail_image');
                const previewContainer = document.getElementById('image_preview');
                const uploadLabel = document.querySelector('.file-upload-label');

                fileInput.value = '';
                previewContainer.style.display = 'none';
                uploadLabel.innerHTML = '<span class="upload-icon"><i class="bx bx-upload"></i></span><span class="upload-text">Chọn ảnh hoặc kéo thả vào đây</span>';
            });
            
            document.getElementById('formSaveDraft').addEventListener('submit',function (){
                document.getElementById('tieude_draft').value = document.getElementById('title_meta').value;
                document.getElementById('content_draft').value = editorInstance.getData();
            });
        </script>
    </body>
</html>
