<%-- 
    Document   : DemoBlog
    Created on : Mar 5, 2025, 8:10:19 PM
    Author     : fptshop
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Tin Tức</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <jsp:include page="Common/Css.jsp"/>
        <style>
            .wrapper {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px 20px 0px 0px;
                display: flex;
                color: black;
                line-height: 1.5;
            }
            .content-left {
                flex: 3;
                padding-right: 20px;
                position: relative;
            }
            .share-buttons {
                position: fixed;
                left: 10px;
                top: 50%;
                transform: translateY(-50%);
                display: flex;
                flex-direction: column;
                gap: 5px;
            }
            .share-btn {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 30px;
                height: 30px;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 50%;
                text-decoration: none;
                color: #333;
                font-size: 14px;
                transition: background-color 0.3s;
            }
            .share-btn:hover {
                background-color: #ddd;
            }
            .share-btn.fb {
                background-color: #3b5998;
                color: white;
            }
            .share-btn.tw {
                background-color: #1da1f2;
                color: white;
            }
            .share-btn.ln {
                background-color: #0e76a8;
                color: white;
            }
            .share-btn.copy{
                background-color: rgb(34,139,34);
                color: white;
            }
            .main-content {
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                margin-left: 40px;
            }
            .main-content h2 {
                line-height: 1.6;
            }
            .content-left img {
                max-width: 100%;
                height: auto;
            }
            .content-right {
                flex: 1;
                background-color: white;
                padding: 20px;
                border-radius: 5px;
            }
            .content-right ul {
                list-style: none;
            }
            .content-right li {
                margin-bottom: 10px;
            }
            .blog-meta {
                margin-bottom: 20px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }
            .author-info {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .author-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 10px;
                background-color: #f0f0f0;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .author-avatar i {
                color: #666;
            }
            .author-name {
                font-weight: bold;
                color: #333;
            }
            .post-time {
                color: #777;
                font-size: 0.9em;
                display: flex;
                align-items: center;
            }
            .post-time i {
                margin-right: 5px;
            }
            /* CSS để giữ định dạng CKEditor với !important */
            #content h1 {
                font-size: 45px !important;
                font-weight: bold !important;
                margin-bottom: 10px !important;
            }
            #content h2 {
                font-size: 35px !important;
                font-weight: bold !important;
                margin-bottom: 8px !important;
            }
            #content p {
                font-size: 20px !important;
                line-height: 1.6 !important;
                margin-bottom: 10px !important;
            }
            #content strong {
                font-weight: bold !important;
            }
            #content em {
                font-style: italic !important;
            }
            #content i {
                font-style: italic !important;
            }
            #content * {
                text-transform: inherit !important;
            }
            /* Style mới cho nút Play và Stop */
            .control-buttons {
                margin-top: 10px;
                display: flex;
                gap: 15px;
            }
            .control-buttons button {
                padding: 10px 20px;
                font-size: 16px;
                font-weight: 500;
                border: none;
                border-radius: 25px; /* Bo góc mềm hơn */
                cursor: pointer;
                color: white;
                display: flex;
                align-items: center;
                gap: 8px; /* Khoảng cách giữa icon và chữ */
                transition: all 0.3s ease; /* Hiệu ứng mượt */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Bóng nhẹ */
            }
            .control-buttons #playButton {
                background: rgb(34,139,34); /* Gradient xanh */
            }
            .control-buttons #playButton:hover {
                background: linear-gradient(45deg, #45a049, #5daf63);
                transform: translateY(-2px); /* Nâng nhẹ khi hover */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }
            .control-buttons #playButton:active {
                transform: translateY(1px); /* Hạ xuống khi nhấn */
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .control-buttons #stopButton {
                background: linear-gradient(45deg, #f44336, #ef5350); /* Gradient đỏ */
            }
            .control-buttons #stopButton:hover {
                background: linear-gradient(45deg, #da190b, #e53935);
                transform: translateY(-2px);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }
            .control-buttons #stopButton:active {
                transform: translateY(1px);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div style="padding-bottom: 200px;" class="boxed_wrapper">
            <div class="container-fluid py-5">
                <jsp:include page="Common/Navbar.jsp"/>
                <div class="wrapper">
                    <div class="content-left">
                        <div class="share-buttons">
                            <button id="facebook-share" class="share-btn fb"><i class="fab fa-facebook-f"></i></button>
                            <!--                            <button class="share-btn tw"><i class="fab fa-twitter"></i></button>-->
                            <button id="linkIn-share" class="share-btn ln"><i class="fab fa-linkedin-in"></i></button>
                            <button id="copy-link" class="share-btn copy"><i class="fa-solid fa-copy"></i></button>
                            <span id="copy-message" style="display:none; color: green; margin-left: 10px;">✔ Đã sao chép!</span>
                        </div>
                        <div class="main-content">
                            <div class="blog-meta">
                                <div class="author-info">
                                    <div class="author-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div>
                                        <div class="author-name">${blog.author_id}</div>
                                        <div class="post-time">
                                            <i class="far fa-clock"></i> ${blog.created_date_blog}
                                        </div>
                                    </div>
                                </div>
                                <!-- Nút Play và Stop -->
                                <div class="control-buttons">
                                    <button id="playButton"><i class="fas fa-play"></i> Phát</button>
                                    <button id="stopButton"><i class="fas fa-stop"></i> Dừng</button>
                                </div>
                            </div>
                            <div id="content" class="content">
                                ${blog.blog_content}
                            </div>
                        </div>
                    </div>
                    <div class="content-right">
                        <h2 style="color: rgb(34,139,34)">Bài viết liên quan</h2>
                        <ul>
                            <li>Chuyện ở Ukraine 3/3: Kiev...</li>
                            <li>Ông Zelensky gặp...</li>
                            <li>Tổng Trump tuyên bố...</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Script ResponsiveVoice -->
        <script src="https://code.responsivevoice.org/responsivevoice.js?key=8e2qFdn3"></script>
        <script>


            const playButton = document.getElementById('playButton');
            const stopButton = document.getElementById('stopButton');
            const contentDiv = document.getElementById('content');


            if (playButton && stopButton && contentDiv) {
                // Nút Play
                playButton.addEventListener('click', function () {
                    let textToSpeak = contentDiv.textContent || contentDiv.innerText;
                    console.log("Nội dung để đọc:", textToSpeak);
                    if (textToSpeak.trim() !== "") {
                        responsiveVoice.speak(textToSpeak, "Vietnamese Male", {
                            onstart: function () {
                                console.log("Bắt đầu đọc...");
                            },
                            onend: function () {
                                console.log("Đã đọc xong.");
                            }
                        });
                    } else {
                        responsiveVoice.speak("Không có nội dung để đọc!", "Vietnamese Male");
                    }
                });

                // Nút Stop
                stopButton.addEventListener('click', function () {
                    if (responsiveVoice.isPlaying()) {
                        responsiveVoice.cancel();
                        console.log("Đã dừng đọc.");
                    }
                });
            } else {
                console.error("Không tìm thấy nút hoặc contentDiv.");
            }

        </script>
        <script>
            document.getElementById("facebook-share").addEventListener("click", function () {

                let facebookShareURL = `https://www.facebook.com/sharer/sharer.php?u=<%= request.getRequestURL() %>`;
                window.open(facebookShareURL, "_blank", "width=800,height=600");
            });

        </script>
        <script>
            document.getElementById("linkIn-share").addEventListener("click", function () {
                let linkInShareURL = 'https://www.linkedin.com/sharing/share-offsite/?url=<%= request.getRequestURL() %>';
                window.open(linkInShareURL, "_blank", "width=800,height=600");
            });

        </script>
        <script>
            document.getElementById("copy-link").addEventListener("click", function () {
                navigator.clipboard.writeText(window.location.href).then(() => {
                    let msg = document.getElementById("copy-message");
                    msg.style.display = "inline"; // Hiện thông báo
                    setTimeout(() => {
                        msg.style.display = "none";
                    }, 2000); // Ẩn sau 2s
                });
            });

        </script>
    </body>
</html>