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
            #content figcaption{
                text-align: center;
                margin: 5px 0px;
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

            .comment-section {
                margin-top: 40px;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            }

            .comment-section h3 {
                font-size: 22px !important;
                margin-bottom: 20px !important;
                color: #333 !important;
                font-weight: 600 !important;
            }

            .comment-tabs {
                display: flex;
                margin-bottom: 20px;
                border-bottom: 1px solid #eee;
            }

            .tab-btn {
                padding: 10px 20px;
                background: none;
                border: none;
                font-size: 16px;
                font-weight: 500;
                color: #666;
                cursor: pointer;
                transition: all 0.3s;
            }

            .tab-btn.active {
                color: rgb(34,139,34);
                border-bottom: 2px solid rgb(34,139,34);
            }

            .comment-form {
                display: flex;
                margin-bottom: 30px;
                gap: 15px;
            }

            .user-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: #f0f0f0;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
            }

            .user-avatar i {
                font-size: 20px;
                color: #aaa;
            }

            .form-input {
                flex-grow: 1;
                display: flex;
                flex-direction: column;
            }

            .form-input textarea {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 12px;
                height: 100px;
                resize: vertical;
                margin-bottom: 10px;
                font-size: 16px;
            }

            .submit-comment {
                align-self: flex-end;
                padding: 8px 20px;
                background-color: rgb(34,139,34);
                color: white;
                border: none;
                border-radius: 20px;
                cursor: pointer;
                font-weight: 500;
                transition: all 0.3s;
            }

            .submit-comment:hover {
                background-color: #1b7e1b;
            }

            .comment-list {
                display: none;
            }

            .comment-list.active {
                display: block;
            }

            .comment {
                display: flex;
                margin-bottom: 25px;
                gap: 15px;
            }

            .comment.reply {
                margin-top: 15px;
                margin-left: 20px;
            }

            .comment-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                overflow: hidden;
                flex-shrink: 0;
            }

            .comment-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .comment-content {
                flex-grow: 1;
            }

            .comment-header {
                margin-bottom: 5px;
            }

            .comment-author {
                font-weight: 600;
                color: #333;
                margin-right: 10px;
            }

            .comment-time {
                color: #999;
                font-size: 14px;
            }

            .comment-text {
                margin-bottom: 10px;
            }

            .comment-text p {
                font-size: 16px !important;
                line-height: 1.5 !important;
                margin-bottom: 0 !important;
            }

            .comment-actions {
                display: flex;
                gap: 15px;
            }

            .like-btn, .reply-btn {
                background: none;
                border: none;
                padding: 5px 10px;
                color: #666;
                font-size: 14px;
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 5px;
                transition: all 0.2s;
            }

            .like-btn:hover, .reply-btn:hover {
                color: rgb(34,139,34);
            }

            .like-btn.active {
                color: rgb(34,139,34);
            }

            .like-btn i, .reply-btn i {
                font-size: 16px;
            }

            .comment-replies {
                margin-top: 15px;
            }

            .load-more {
                text-align: center;
                margin-top: 20px;
            }

            #load-more-btn {
                padding: 10px 25px;
                background-color: #f5f5f5;
                border: 1px solid #ddd;
                border-radius: 20px;
                color: #666;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.3s;
            }

            #load-more-btn:hover {
                background-color: #eee;
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

                                    <img style="margin-right: 20px; border-radius: 50%" src="${author[1]}" width="50px" height="50px" alt="alt"/>

                                    <div>
                                        <div class="author-name">${author[0]}</div>
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
                        <div class="comment-section">
                            <h3>Bình luận</h3>

                            <!--                             Comment tabs 
                                                        <div class="comment-tabs">
                                                            <button class="tab-btn active" data-tab="newest">Mới nhất</button>
                                                            <button class="tab-btn" data-tab="popular">Quan tâm nhất</button>
                                                        </div>-->
                            <c:if test="${not empty sessionScope.user}">
                                <form id="commentBlog" action="comment" method="post">
                                    <!-- New comment form -->
                                    <div class="comment-form">
                                        <div class="user-avatar">
                                            <i class="fas fa-user"></i>
                                        </div>
                                        <input type="hidden" name="method" value="basicComment"/>
                                        <input type="hidden" id="blog-id" name="blog-id" value=""/>
                                        <input type="hidden" id="account_id" name="account_id" value=""/>
                                        <div class="form-input">
                                            <textarea name="comment" placeholder="Viết bình luận của bạn..."></textarea>
                                            <button class="submit-comment">Gửi</button>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${empty sessionScope.user}">
                                <div style="display: flex; justify-content: center; margin: 40px 0px; font-size: 20px">
                                <label>Vui lòng đăng nhập để có thể bình luận</label>
                                </div>
                            </c:if>
                            <!-- Comment list - Newest -->
                            <div class="comment-list active" id="newest-comments">
                                <!-- Comment 1 -->
                                <div class="comment">
                                    <div class="comment-avatar">
                                        <img src="" alt="User">
                                    </div>
                                    <div class="comment-content">
                                        <div class="comment-header">
                                            <span class="comment-author">Nguyễn Văn A</span>
                                            <span class="comment-time">2 giờ trước</span>
                                        </div>
                                        <div class="comment-text">
                                            <p>Bài viết rất hay và bổ ích. Cảm ơn tác giả đã chia sẻ!</p>
                                        </div>
                                        <div class="comment-actions">
                                            <button class="like-btn"><i class="far fa-thumbs-up"></i> <span>23</span></button>
                                            <button class="reply-btn"><i class="far fa-comment"></i> Trả lời</button>
                                        </div>

                                        <!-- Replies -->
                                        <div class="comment-replies">
                                            <div class="comment reply">
                                                <div class="comment-avatar">
                                                    <img src="" alt="User">
                                                </div>
                                                <div class="comment-content">
                                                    <div class="comment-header">
                                                        <span class="comment-author">Trần Thị B</span>
                                                        <span class="comment-time">1 giờ trước</span>
                                                    </div>
                                                    <div class="comment-text">
                                                        <p>Tôi hoàn toàn đồng ý với bạn!</p>
                                                    </div>
                                                    <div class="comment-actions">
                                                        <button class="like-btn"><i class="far fa-thumbs-up"></i> <span>5</span></button>
                                                        <button class="reply-btn"><i class="far fa-comment"></i> Trả lời</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Comment 2 -->
                                <div class="comment">
                                    <div class="comment-avatar">
                                        <img src="" alt="User">
                                    </div>
                                    <div class="comment-content">
                                        <div class="comment-header">
                                            <span class="comment-author">Phạm Văn C</span>
                                            <span class="comment-time">15 phút trước</span>
                                        </div>
                                        <div class="comment-text">
                                            <p>Tôi có vài câu hỏi về nội dung này. Làm thế nào để áp dụng những điều này vào thực tế?</p>
                                        </div>
                                        <div class="comment-actions">
                                            <button class="like-btn"><i class="far fa-thumbs-up"></i> <span>7</span></button>
                                            <button class="reply-btn"><i class="far fa-comment"></i> Trả lời</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Comment list - Popular -->
                            <div class="comment-list" id="popular-comments">
                                <!-- Comment 1 (Most liked) -->
                                <div class="comment">
                                    <div class="comment-avatar">
                                        <img src="" alt="User">
                                    </div>
                                    <div class="comment-content">
                                        <div class="comment-header">
                                            <span class="comment-author">Lê Thị D</span>
                                            <span class="comment-time">1 ngày trước</span>
                                        </div>
                                        <div class="comment-text">
                                            <p>Đây là một trong những phân tích hay nhất về chủ đề này mà tôi từng đọc. Tôi đặc biệt thích cách tác giả đưa ra các ví dụ thực tế để minh họa cho quan điểm của mình.</p>
                                        </div>
                                        <div class="comment-actions">
                                            <button class="like-btn active"><i class="fas fa-thumbs-up"></i> <span>127</span></button>
                                            <button class="reply-btn"><i class="far fa-comment"></i> Trả lời</button>
                                        </div>

                                        <!-- Replies -->
                                        <div class="comment-replies">
                                            <div class="comment reply">
                                                <div class="comment-avatar">
                                                    <img src="" alt="User">
                                                </div>
                                                <div class="comment-content">
                                                    <div class="comment-header">
                                                        <span class="comment-author">Hoàng Văn E</span>
                                                        <span class="comment-time">12 giờ trước</span>
                                                    </div>
                                                    <div class="comment-text">
                                                        <p>Tôi cũng nghĩ vậy! Rất ấn tượng với cách tác giả trình bày vấn đề.</p>
                                                    </div>
                                                    <div class="comment-actions">
                                                        <button class="like-btn"><i class="far fa-thumbs-up"></i> <span>43</span></button>
                                                        <button class="reply-btn"><i class="far fa-comment"></i> Trả lời</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Comment 2 -->
                                <div class="comment">
                                    <div class="comment-avatar">
                                        <img src="" alt="User">
                                    </div>
                                    <div class="comment-content">
                                        <div class="comment-header">
                                            <span class="comment-author">Trương Minh F</span>
                                            <span class="comment-time">2 ngày trước</span>
                                        </div>
                                        <div class="comment-text">
                                            <p>Tôi đã theo dõi chủ đề này từ lâu và phải nói rằng quan điểm của tác giả rất đáng suy ngẫm. Mong được đọc thêm nhiều bài viết như thế này!</p>
                                        </div>
                                        <div class="comment-actions">
                                            <button class="like-btn"><i class="far fa-thumbs-up"></i> <span>89</span></button>
                                            <button class="reply-btn"><i class="far fa-comment"></i> Trả lời</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Load more comments button -->
                            <div class="load-more">
                                <button id="load-more-btn">Xem thêm bình luận</button>
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
                        responsiveVoice.speak(textToSpeak, "Vietnamese Female");
                    } else {
                        responsiveVoice.speak("Không có nội dung để đọc!", "Vietnamese Female");
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
            document.getElementById("commentBlog").addEventListener("submit", function () {
                let link = window.location.search;
                var blog_id = parseInt(link.get("blog"));
                document.getElementById("blog-id").value = blog_id;
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
        <script>

            const replyButtons = document.querySelectorAll('.reply-btn');
            replyButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const parentComment = this.closest('.comment-content');

                    // check lặp form
                    if (parentComment.querySelector('.reply-form')) {
                        parentComment.querySelector('.reply-form').remove();
                        return;
                    }
                    const isUserLoggedIn = ${not empty sessionScope.user ? 'true' : 'false'};
                    if (!isUserLoggedIn) {
                        
                    const replyForm = document.createElement('div');
                    replyForm.className = 'reply-form';
                    replyForm.innerHTML = `
            <div class="comment-form" style="margin-top: 15px;">
                <div class="user-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div class="form-input">
                    <textarea placeholder="Viết trả lời của bạn..."></textarea>
                    <div style="display: flex; gap: 10px; align-self: flex-end;">
                        <button class="cancel-reply" style="padding: 8px 15px; background: #f1f1f1; border: none; border-radius: 20px; cursor: pointer;">Hủy</button>
                        <button class="submit-reply" style="padding: 8px 15px; background: rgb(34,139,34); color: white; border: none; border-radius: 20px; cursor: pointer;">Gửi</button>
                    </div>
                </div>
            </div>
        `;
        
                    // Add reply form after comment actions
                    const commentActions = this.parentElement;
                    commentActions.insertAdjacentElement('afterend', replyForm);

                    // Focus on textarea
                    replyForm.querySelector('textarea').focus();

                    // Handle cancel reply
                    replyForm.querySelector('.cancel-reply').addEventListener('click', function () {
                        replyForm.remove();
                    });
                }
                    

                });
            });
        </script>
    </body>
</html>