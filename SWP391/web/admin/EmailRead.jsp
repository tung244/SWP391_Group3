
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <jsp:include page="Common/Css.jsp"/>
        <script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/decoupled-document/ckeditor.js"></script>
        <style>
            .custom_mail_2024_trigger_btn {
                background-color: rgb(34,139,34);
                color: white;
                position: absolute;
                right: 40px;
                bottom: 40px;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .custom_mail_2024_modal {
                display: none;
                position: fixed;
                z-index: 9999;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
                animation: fadeIn 0.3s;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0
                }
                to {
                    opacity: 1
                }
            }

            .custom_mail_2024_form {
                background: white;
                margin: 2% auto;
                padding: 20px;
                border-radius: 8px;
                width: 90%;
                max-width: 800px;
                position: relative;
                animation: slideIn 0.3s;
            }

            @keyframes slideIn {
                from {
                    transform: translateY(-100px);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            .custom_mail_2024_close {
                position: absolute;
                right: 20px;
                top: 10px;
                font-size: 24px;
                cursor: pointer;
                color: #666;
                z-index: 10000;
            }

            .custom_mail_2024_close:hover {
                color: #000;
            }

            .custom_mail_2024_form_group {
                margin-bottom: 15px;
            }

            .custom_mail_2024_label {
                display: block;
                margin-bottom: 5px;
                color: #666;
            }

            .custom_mail_2024_input {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .custom_mail_2024_send_btn {
                background-color: rgb(34,139,34);
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 10px;
            }

            .custom_mail_2024_send_btn:hover {
                background-color: #1557b0;
            }

            #custom_mail_2024_toolbar {
                background: #f8f9fa;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px 4px 0 0;
            }

            #custom_mail_2024_content {
                min-height: 300px;
                max-height: 500px;
                border: 1px solid #ddd;
                border-radius: 0 0 4px 4px;
                padding: 20px;
                overflow-y: auto;
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
                    <div class="page-content">
                        <!--start email wrapper-->
                        <div class="email-wrapper">
                            <div class="email-sidebar">
                                <div class="email-sidebar-header d-grid"> <a href="javascript:;" class="btn btn-primary compose-mail-btn"><i class='bx bx-plus me-2'></i> Compose</a>
                                </div>
                                <div class="email-sidebar-content">
                                    <div class="email-navigation">
                                        <div class="list-group list-group-flush"> <a href="emailbox.html" class="list-group-item active d-flex align-items-center"><i class='bx bxs-inbox me-3 font-20'></i><span>Inbox</span><span class="badge bg-primary rounded-pill ms-auto">7,513</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-star me-3 font-20'></i><span>Starred</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-alarm-snooze me-3 font-20'></i><span>Snoozed</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-send me-3 font-20'></i><span>Sent</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-file-blank me-3 font-20'></i><span>Drafts</span><span class="badge bg-primary rounded-pill ms-auto">4</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-bookmark me-3 font-20'></i><span>Important</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-message-rounded-error me-3 font-20'></i><span>Chats</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bx-mail-send me-3 font-20'></i><span>Scheduled</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-envelope-open me-3 font-20'></i><span>All Mail</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-info-circle me-3 font-20'></i><span>Spam</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-trash-alt me-3 font-20'></i><span>Trash</span></a>
                                        </div>
                                    </div>
                                    <div class="email-meeting">
                                        <div class="list-group list-group-flush">
                                            <div class="list-group-item"><span>Meet</span>
                                            </div> <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-video me-3 font-20'></i><span>Start a meeting</span></a>
                                            <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-group me-3 font-20'></i><span>Join a meeting</span></a>
                                            <div class="list-group-item email-hangout cursor-pointer border-top">
                                                <div class="d-flex align-items-center">
                                                    <div class="chat-user-online">
                                                        <img src="assets/images/avatars/avatar-1.png" width="42" height="42" class="rounded-circle" alt="" />
                                                    </div>
                                                    <div class="flex-grow-1 ms-2">
                                                        <p class="mb-0">Jessica Doe</p>
                                                    </div>
                                                    <div class="dropdown">
                                                        <div class="font-24 dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown"><i class='bx bx-plus'></i>
                                                        </div>
                                                        <div class="dropdown-menu dropdown-menu-right">	<a class="dropdown-item" href="javascript:;">Settings</a>
                                                            <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Help & Feedback</a>
                                                            <a class="dropdown-item" href="javascript:;">Enable Split View Mode</a>
                                                            <a class="dropdown-item" href="javascript:;">Keyboard Shortcuts</a>
                                                            <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Sign Out</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="email-header d-xl-flex align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="email-toggle-btn"><i class='bx bx-menu'></i>
                                    </div>
                                    <div class="btn btn-white">
                                        <input class="form-check-input" type="checkbox">
                                    </div>
                                    <div class="">
                                        <button type="button" class="btn btn-white ms-2"><i class='bx bx-refresh me-0'></i>
                                        </button>
                                    </div>
                                    <div class="">
                                        <button type="button" class="btn btn-white ms-2"><i class='bx bx-downvote me-0'></i>
                                        </button>
                                    </div>
                                    <div class="d-none d-md-flex">
                                        <button type="button" class="btn btn-white ms-2"><i class='bx bx-file me-0'></i>
                                        </button>
                                    </div>
                                    <div class="">
                                        <button type="button" class="btn btn-white ms-2"><i class='bx bx-trash me-0'></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="flex-grow-1 mx-xl-2 my-2 my-xl-0">
                                    <div class="input-group">	<span class="input-group-text bg-transparent"><i class="bx bx-search"></i></span>
                                        <input type="text" class="form-control" placeholder="Search mail">
                                    </div>
                                </div>
                                <div class="ms-auto d-flex align-items-center">
                                    <button class="btn btn-sm btn-light">1-50 of 8,740</button>
                                    <button class="btn btn-white px-2 ms-2"><i class='bx bx-chevron-left me-0'></i>
                                    </button>
                                    <button class="btn btn-white px-2 ms-2"><i class='bx bx-chevron-right me-0'></i>
                                    </button>
                                </div>
                            </div>
                            <div class="email-content">
                                <div class="email-read-box p-3">
                                    <h4>${gmail.subject}</h4>
                                    <hr>
                                    <div class="d-flex align-items-center">
                                        <img src="assets/images/avatars/avatar-1.png" width="42" height="42" class="rounded-circle" alt="" />
                                        <div class="flex-grow-1 ms-2">
                                            <p class="mb-0 font-weight-bold">Support</p>

                                        </div>
                                        <p class="mb-0 chat-time ps-5 ms-auto">${gmail.date}</p>
                                    </div>
                                    <div class="email-read-content px-md-5 py-5">
                                        <p>${gmail.context}</p>

                                    </div>

                                    <!--Phản hồi email-->
                                    <!-- Nút mở modal -->

                                </div>
                            </div>
                            <!--start compose mail-->
                            <div class="compose-mail-popup">
                                <div class="card">
                                    <div class="card-header bg-dark text-white py-2 cursor-pointer">
                                        <div class="d-flex align-items-center">
                                            <div class="compose-mail-title">New Message</div>
                                            <div class="compose-mail-close ms-auto">x</div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <form action="sendmail" method="post">
                                            <div class="email-form">
                                                <div class="mb-3">
                                                    <input type="text" class="form-control" placeholder="To" name="to"/>
                                                </div>
                                                <div class="mb-3">
                                                    <input type="text" class="form-control" placeholder="Subject" name="subject"/>
                                                </div>
                                                <div class="mb-3">
                                                    <textarea class="form-control" name="content" placeholder="Message" rows="10" cols="10"></textarea>
                                                </div>
                                                <div class="mb-0">
                                                    <div class="d-flex align-items-center">
                                                        <div class="">
                                                            <div class="btn-group">
                                                                <button type="submit" class="btn btn-primary">Send</button>
<!--                                                                <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
                                                                </button>
                                                                <div class="dropdown-menu">	<a class="dropdown-item" href="javascript:;">Action</a>
                                                                    <a class="dropdown-item" href="javascript:;">Another action</a>
                                                                    <a class="dropdown-item" href="javascript:;">Something else here</a>
                                                                    <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Separated link</a>
                                                                </div>-->
                                                            </div>
                                                        </div>
                                                        <div class="ms-2">
                                                            <button type="button" class="btn border-0 btn-sm btn-white"><i class="lni lni-text-format"></i>
                                                            </button>
                                                            <button type="button" class="btn border-0 btn-sm btn-white"><i class='bx bx-link-alt'></i>
                                                            </button>
                                                            <button type="button" class="btn border-0 btn-sm btn-white"><i class="lni lni-emoji-tounge"></i>
                                                            </button>
                                                            <button type="button" class="btn border-0 btn-sm btn-white"><i class="lni lni-google-drive"></i>
                                                            </button>
                                                        </div>
                                                        <div class="ms-auto">
                                                            <button type="button" class="btn border-0 btn-sm btn-white"><i class="lni lni-trash"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--end compose mail-->
                            <!--start email overlay-->
                            <div class="overlay email-toggle-btn-mobile"></div>
                            <!--end email overlay-->
                        </div>
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
            let custom_mail_2024_editor = null;

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
                                'link', 'blockQuote', '|',
                                'undo', 'redo'
                            ],
                            fontSize: {
                                options: [12, 14, 16, 18, 20, 24]
                            }
                        })
                        .then(editor => {
                            custom_mail_2024_editor = editor;
                            document.querySelector('#custom_mail_2024_toolbar').appendChild(editor.ui.view.toolbar.element);
                        })
                        .catch(error => {
                            console.error('CKEditor lỗi:', error);
                        });
            }

            // Mở modal + khởi tạo CKEditor
            function custom_mail_2024_openModal() {
                document.getElementById('custom_mail_2024_emailModal').style.display = 'block';
                if (!custom_mail_2024_editor) {
                    custom_mail_2024_initEditor();
                }
                custom_mail_2024_editor.setData(''); // Reset nội dung
            }

            // Đóng modal
            function custom_mail_2024_closeModal() {
                document.getElementById('custom_mail_2024_emailModal').style.display = 'none';
            }

            // Lấy nội dung CKEditor khi submit form
            document.getElementById("custom_mail_2024_emailForm").addEventListener("submit", function (event) {
                document.getElementById("content").value = custom_mail_2024_editor.getData();
            });
        </script>

    </body>

</html>
