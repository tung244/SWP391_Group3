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
<p> <script> window.addEventListener("load", function () { // Change right desktop block image var adBlockRight = document.getElementById('docosan_blog_ad-3'); var imgBlockRight = adBlockRight.getElementsByTagName('img'); var imgLinkRight = "https://www.docosan.com/blog/wp-content/uploads/2024/12/MSG-KV2-Mobile-PC-1000-1000.jpg"; imgBlockRight[0].setAttribute("src", imgLinkRight); imgBlockRight[0].setAttribute("data-src", imgLinkRight); }); </script><br><em><strong>Viêm bờ mi mắt</strong> là tình trạng phổ biến gây khó chịu cho người mắc phải. Nếu không được chữa trị kịp thời, viêm bờ mi mắt có thể gây ra các vấn đề nghiêm trọng về mắt. Bài viết này sẽ chia sẻ những cách chữa viêm bờ mi mắt tại nhà hiệu quả và nhanh chóng giúp bạn dễ dàng cải thiện tình trạng này.</em><em> Hãy cùng <strong><a href="https://www.docosan.com/blog/"><span style="color: #33cccc;">Docosan</span></a></strong> <i><span style="font-weight: 400;">tìm hiểu</span></i> về chủ đề này nhé.</em></p><div id="toc_container" class="no_bullets"> <p class="toc_title">Tóm tắt nội dung</p> <ul class="toc_list"> <li><a href="#Viem_bo_mi_mat_la_gi"><span class="toc_number toc_depth_1">1</span> Viêm bờ mi mắt là gì?</a> <ul> <li><a href="#Nguyen_nhan_gay_viem_bo_mi_mat"><span class="toc_number toc_depth_2">1.1</span> Nguyên nhân gây viêm bờ mi mắt</a></li> <li><a href="#Trieu_chung_viem_bo_mi_mat"><span class="toc_number toc_depth_2">1.2</span> Triệu chứng viêm bờ mi mắt</a></li> </ul></li> <li><a href="#Cach_chua_viem_bo_mi_mat_tai_nha"><span class="toc_number toc_depth_1">2</span> Cách chữa viêm bờ mi mắt tại nhà</a></li> <li><a href="#Phong_ngua_viem_bo_mi_mat"><span class="toc_number toc_depth_1">3</span> Phòng ngừa viêm bờ mi mắt</a></li> <li><a href="#Cac_cau_hoi_lien_quan"><span class="toc_number toc_depth_1">4</span> Các câu hỏi liên quan</a> <ul> <li><a href="#Viem_bo_mi_co_the_tu_khoi_khong"><span class="toc_number toc_depth_2">4.1</span> Viêm bờ mi có thể tự khỏi không?</a></li> <li><a href="#Khong_nen_lam_gi_de_khien_viem_bo_mi_nang_hon"><span class="toc_number toc_depth_2">4.2</span> Không nên làm gì để khiến viêm bờ mi nặng hơn?</a></li> </ul></li> </ul></div><h2><span id="Viem_bo_mi_mat_la_gi">Viêm bờ mi mắt là gì?</span></h2><p>Viêm bờ mi mắt là tình trạng viêm ở vùng bờ mi, thường xảy ra khi các tuyến bã nhờn bị tắc nghẽn hoặc bị nhiễm khuẩn. Bệnh có thể gây khó chịu và ảnh hưởng đến thị lực nếu không được điều trị kịp thời.</p><h3><span id="Nguyen_nhan_gay_viem_bo_mi_mat"><strong>Nguyên nhân gây viêm bờ mi mắt</strong></span></h3><figure id="attachment_151822" aria-describedby="caption-attachment-151822" style="width: 800px" class="wp-caption alignnone"> <img decoding="async" loading="lazy" class="size-full wp-image-151822" src="https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-1-1.png" alt="Viêm bờ mi mắt do vi khuẩn xâm nhập gây tình trạng bít tắc và kích ứng" width="800" height="450" title="Cách chữa viêm bờ mi mắt tại nhà hiệu quả nhanh chóng 1" srcset="https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-1-1.png 800w, https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-1-1-300x169.png 300w, https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-1-1-768x432.png 768w" sizes="auto, (max-width: 800px) 100vw, 800px"> <figcaption id="caption-attachment-151822" class="wp-caption-text"> Viêm bờ mi mắt do vi khuẩn xâm nhập gây tình trạng bít tắc và kích ứng </figcaption></figure><p>Viêm bờ mi mắt có thể do nhiều nguyên nhân khác nhau. Một trong những nguyên nhân phổ biến là sự tắc nghẽn hoặc viêm ở tuyến bã nhờn trên mí mắt, gây ra tình trạng bít tắc và kích ứng.</p><p>Vi khuẩn, đặc biệt là loại <a href="https://www.docosan.com/blog/truyen-nhiem/tu-cau-vang/"><span style="color: #33cccc;">Staphylococcus</span></a>, cũng có thể gây ra viêm, làm cho tình trạng trở nên nghiêm trọng hơn. Ngoài ra, dị ứng với mỹ phẩm hoặc các yếu tố môi trường cũng có thể là tác nhân gây bệnh. Việc điều trị kịp thời là rất quan trọng để kiểm soát tình trạng này.</p><h3><span id="Trieu_chung_viem_bo_mi_mat"><strong style="font-size: 16px;">Triệu chứng viêm bờ mi mắt</strong></span></h3><figure id="attachment_150411" aria-describedby="caption-attachment-150411" style="width: 800px" class="wp-caption alignnone"> <img decoding="async" loading="lazy" class="size-full wp-image-150411" src="https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-2.png" alt="Sưng đỏ vùng bờ mi mắt là triệu chứng của tình trạng viêm bờ mi mắt" width="800" height="450" title="Cách chữa viêm bờ mi mắt tại nhà hiệu quả nhanh chóng 2" srcset="https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-2.png 800w, https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-2-300x169.png 300w, https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-2-768x432.png 768w" sizes="auto, (max-width: 800px) 100vw, 800px"> <figcaption id="caption-attachment-150411" class="wp-caption-text"> Sưng đỏ vùng bờ mi mắt là triệu chứng của tình trạng viêm bờ mi mắt </figcaption></figure><p>Viêm bờ mi mắt là tình trạng viêm nhiễm ở vùng bờ mi, nơi có các tuyến bã nhờn giúp tiết dầu bảo vệ mắt. Triệu chứng chính của viêm bờ mi mắt bao gồm đỏ và sưng tấy ở vùng bờ mi, khiến mí mắt trở nên nặng nề và khó mở.</p><p><span style="font-weight: 400;">Người bệnh có thể cảm thấy ngứa ngáy, rát và khô ở mắt, kèm theo cảm giác cộm như có vật lạ trong mắt. Bên cạnh đó, có thể xuất hiện vảy hoặc vết mủ ở bờ mi, đặc biệt là khi thức dậy vào buổi sáng. Mắt thường xuyên bị chảy nước, mờ hoặc đau nhức nhẹ, đặc biệt khi nhìn lâu hoặc khi tiếp xúc với ánh sáng.</span></p><p><span style="font-weight: 400;">Các triệu chứng này có thể nặng hơn nếu có sự tắc nghẽn ở tuyến bã nhờn, hoặc do nhiễm vi khuẩn từ các tác nhân bên ngoài.<span style="color: #33cccc;"> <a style="color: #33cccc;" href="https://www.docosan.com/blog/da-lieu/di-ung-my-pham/">Dị ứng với mỹ phẩm</a> </span>hay các yếu tố môi trường cũng có thể làm tăng nguy cơ viêm bờ mi mắt. Nếu không được điều trị đúng cách, triệu chứng có thể kéo dài và gây khó chịu cho người bệnh.</span><span style="font-weight: 400;"><br></span></p><h2><span id="Cach_chua_viem_bo_mi_mat_tai_nha"><strong>Cách chữa viêm bờ mi mắt tại nhà</strong></span></h2><figure id="attachment_150412" aria-describedby="caption-attachment-150412" style="width: 800px" class="wp-caption alignnone"> <img decoding="async" loading="lazy" class="size-full wp-image-150412" src="https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-3.png" alt="Chường ấm, vệ sinh mắt và massage mắt là các cách có thể làm giảm biểu hiện sưng đau của tình trạng viêm bở mi mắt" width="800" height="450" title="Cách chữa viêm bờ mi mắt tại nhà hiệu quả nhanh chóng 3" srcset="https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-3.png 800w, https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-3-300x169.png 300w, https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-3-768x432.png 768w" sizes="auto, (max-width: 800px) 100vw, 800px"> <figcaption id="caption-attachment-150412" class="wp-caption-text"> Chường ấm, vệ sinh mắt và massage mắt là các cách có thể làm giảm biểu hiện sưng đau của tình trạng viêm bở mi mắt </figcaption></figure><p><span style="font-weight: 400;">Viêm bờ mi mắt có thể được điều trị hiệu quả ngay tại nhà bằng các biện pháp đơn giản giúp giảm triệu chứng và hỗ trợ quá trình phục hồi. Dưới đây là một số cách chữa viêm bờ mi mắt tại nhà mà bạn có thể tham khảo:</span></p><ul> <li style="font-weight: 400;"><b>Vệ sinh mí mắt bằng nước muối sinh lý</b><span style="font-weight: 400;">: Dùng nước muối sinh lý để rửa sạch vùng bờ mi mắt, giúp loại bỏ bụi bẩn và vi khuẩn. Bạn có thể sử dụng tăm bông để thấm nước muối và nhẹ nhàng lau quanh mí mắt.</span></li> <li style="font-weight: 400;"><b>Chườm ấm</b><span style="font-weight: 400;">: Chườm một khăn ấm lên mắt trong khoảng 10-15 phút giúp làm mềm các vảy và giảm sưng tấy. Nhiệt độ ấm giúp thư giãn các tuyến bã nhờn và làm thông thoáng bờ mi.</span></li> <li style="font-weight: 400;"><b>Massage mí mắt</b><span style="font-weight: 400;">: Sau khi chườm ấm, có thể thực hiện massage nhẹ nhàng vùng mí mắt để kích thích tuyến bã nhờn và làm giảm cảm giác cộm hay ngứa.</span></li> <li style="font-weight: 400;"><b>Sử dụng dầu dừa</b><span style="font-weight: 400;">: Dầu dừa có tính kháng khuẩn và dưỡng ẩm, có thể dùng để bôi lên vùng bờ mi mắt để làm mềm da và giảm viêm. Dùng tăm bông thấm dầu dừa và nhẹ nhàng xoa lên mí mắt.</span></li> <li style="font-weight: 400;"><b>Lô hội (Aloe Vera)</b><span style="font-weight: 400;">: Lô hội có tác dụng làm dịu và giảm viêm. Bạn có thể dùng gel lô hội tự nhiên bôi lên vùng bờ mi để giảm ngứa ngáy và sưng tấy.</span></li> <li style="font-weight: 400;"><b>Giữ vệ sinh mắt thường xuyên</b><span style="font-weight: 400;">: Thực hiện vệ sinh mí mắt hàng ngày để ngăn ngừa sự tích tụ của bụi bẩn, dầu thừa và vi khuẩn. Điều này rất quan trọng để tránh tình trạng viêm tái phát.</span></li></ul><p><span style="font-weight: 400;">Các cách chữa viêm bờ mi mắt tại nhà nêu trên có thể giúp giảm tạm thời các triệu chứng viêm bờ mi mắt. Tuy nhiên, nếu tình trạng không cải thiện hoặc có dấu hiệu nặng hơn, bạn nên tham khảo ý kiến bác sĩ.</span><span style="font-weight: 400;"><br></span></p><h2><span id="Phong_ngua_viem_bo_mi_mat"><strong>Phòng ngừa viêm bờ mi mắt</strong></span></h2><figure id="attachment_151825" aria-describedby="caption-attachment-151825" style="width: 800px" class="wp-caption alignnone"> <img decoding="async" loading="lazy" class="size-full wp-image-151825" src="https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-4-1.png" alt="Sử dụng dụng cụ trang điểm cá nhân để bảo vệ mắt" width="800" height="450" title="Cách chữa viêm bờ mi mắt tại nhà hiệu quả nhanh chóng 4" srcset="https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-4-1.png 800w, https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-4-1-300x169.png 300w, https://www.docosan.com/blog/wp-content/uploads/2024/12/cach-chua-viem-bo-mi-mat-tai-nha-4-1-768x432.png 768w" sizes="auto, (max-width: 800px) 100vw, 800px"> <figcaption id="caption-attachment-151825" class="wp-caption-text"> Sử dụng dụng cụ trang điểm cá nhân để bảo vệ mắt </figcaption></figure><p><span style="font-weight: 400;">Ngoài biết cách chữa viêm bờ mi mắt tại nhà, bạn cần trang bị thêm một số thông tin về phòng ngừa viêm bờ mi mắt. Dưới đây là các cách giúp bảo vệ đôi mắt khỏi viêm bờ mi:</span></p><ul> <li style="font-weight: 400;"><b>Vệ sinh mắt sạch sẽ</b><span style="font-weight: 400;">: Hãy vệ sinh vùng mắt và mí mắt mỗi ngày để loại bỏ bụi bẩn, dầu thừa và vi khuẩn. Dùng nước muối sinh lý hoặc các dung dịch vệ sinh mắt chuyên dụng để làm sạch mí mắt và bờ mi.</span></li> <li style="font-weight: 400;"><b>Không dùng chung đồ trang điểm mắt</b><span style="font-weight: 400;">: Đồ trang điểm mắt như mascara, eyeliner và cọ trang điểm dễ bị nhiễm khuẩn và gây viêm bờ mi mắt. Bạn nên sử dụng đồ trang điểm riêng và tránh chia sẻ với người khác để hạn chế nguy cơ nhiễm khuẩn.</span></li> <li style="font-weight: 400;"><b>Tẩy trang sạch sẽ</b><span style="font-weight: 400;">: Sau khi sử dụng mỹ phẩm, đặc biệt là mascara và eyeliner, cần tẩy trang mắt thật sạch để không còn sót lại mỹ phẩm gây tắc nghẽn tuyến bã nhờn hoặc kích ứng mắt.</span></li> <li style="font-weight: 400;"><b>Không chạm tay vào mắt</b><span style="font-weight: 400;">: Tránh chạm tay vào mắt, đặc biệt khi tay chưa được rửa sạch. Vi khuẩn từ tay có thể gây nhiễm trùng và viêm bờ mi mắt.</span></li> <li style="font-weight: 400;"><b>Thường xuyên thay chăn gối và khăn mặt</b><span style="font-weight: 400;">: Vải tiếp xúc trực tiếp với mặt, đặc biệt là khăn mặt và gối, có thể là nguồn chứa bụi bẩn và vi khuẩn. Việc thay chúng định kỳ sẽ giúp giảm nguy cơ viêm nhiễm.</span></li> <li style="font-weight: 400;"><b>Duy trì độ ẩm cho mắt</b><span style="font-weight: 400;">: Sử dụng các sản phẩm dưỡng ẩm cho mắt nếu bạn cảm thấy mắt khô, giúp bảo vệ mắt khỏi các tác nhân gây kích ứng và giảm nguy cơ viêm.</span></li> <li style="font-weight: 400;"><b>Kiểm soát dị ứng</b><span style="font-weight: 400;">: Nếu bạn có tiền sử bị dị ứng, đặc biệt là dị ứng với mỹ phẩm hoặc các yếu tố môi trường, cần chú ý kiểm soát và tránh tiếp xúc với các tác nhân gây dị ứng.</span></li></ul><p><span style="font-weight: 400;"><strong><a href="https://www.docosan.com/phong-kham/benh-vien-mat-sai-gon-cach-mang-thang-8-917?utm_source=google&amp;utm_medium=banner&amp;utm_campaign=booking-phong-kham&amp;utm_id=MSGCMT8"><span style="color: #33cccc;">Bệnh viện Mắt Sài Gòn</span></a></strong> là một trong những cơ sở y tế hàng đầu tại TP.HCM chuyên về chăm sóc và điều trị các bệnh lý về mắt. Với đội ngũ bác sĩ chuyên khoa mắt giàu kinh nghiệm, cùng trang thiết bị hiện đại, bệnh viện cung cấp các dịch vụ chăm sóc mắt toàn diện, bao gồm điều trị viêm bờ mi mắt.</span></p><p><span style="font-weight: 400;">Bệnh viện Mắt Sài Gòn sử dụng các phương pháp điều trị tiên tiến, kết hợp với các liệu pháp chăm sóc mắt tại nhà, nhằm giảm nhanh các triệu chứng viêm, sưng tấy và ngứa ngáy ở bờ mi mắt. Ngoài ra, bệnh viện cũng chú trọng đến công tác phòng ngừa, giúp bệnh nhân duy trì sức khỏe mắt lâu dài.</span><span style="font-weight: 400;"><br></span></p><h2><span id="Cac_cau_hoi_lien_quan"><strong>Các câu hỏi liên quan</strong></span></h2><h3><span id="Viem_bo_mi_co_the_tu_khoi_khong"><strong>Viêm bờ mi có thể tự khỏi không?</strong></span></h3><p><span style="font-weight: 400;">Viêm bờ mi có thể tự khỏi trong những trường hợp nhẹ, nhưng nếu không điều trị kịp thời, bệnh có thể kéo dài và tái phát. Việc vệ sinh mắt đúng cách và điều trị sớm sẽ giúp bệnh nhanh khỏi hơn.</span><span style="font-weight: 400;"><br></span></p><h3><span id="Khong_nen_lam_gi_de_khien_viem_bo_mi_nang_hon"><strong>Không nên làm gì để khiến viêm bờ mi nặng hơn?</strong></span></h3><p><span style="font-weight: 400;">Không nên chà xát, cọ sát hay dụi mắt vì có thể làm tăng sự kích ứng và vi khuẩn phát triển. Ngoài ra, tránh dùng chung mỹ phẩm mắt hoặc đồ trang điểm, vì chúng có thể gây nhiễm trùng và làm tình trạng viêm trở nên nghiêm trọng hơn.</span></p><p><span style="font-weight: 400;"><br></span> <i><span style="font-weight: 400;">Viêm bờ mi mắt nếu được phát hiện sớm có thể áp dụng cách chữa viêm bờ mi mắt tại nhà để giảm nhẹ triệu chứng như vệ sinh sạch sẽ và chườm ấm. Tuy nhiên, nếu tình trạng viêm nặng hoặc kéo dài, bạn nên đi khám bác sĩ để được chẩn đoán và điều trị kịp thời, tránh biến chứng và bảo vệ sức khỏe mắt lâu dài.</span></i></p><p><span style="font-weight: 400;">&gt;&gt;&gt; Xem thêm</span></p><ul> <li><a style="color: #33cccc;" href="https://www.docosan.com/blog/mat/benh-ve-mat/">Các bệnh về mắt thường gặp ai cũng nên biết!</a></li> <li><a style="color: #33cccc;" href="https://www.docosan.com/blog/bac-si/bac-si-chua-viem-ket-mac/">Top 7 Bác sĩ chữa viêm kết mạc giỏi ở TP.HCM</a></li> <li><a href="https://www.docosan.com/blog/mat/dau-mat-do/"><span style="font-weight: 400; color: #33cccc;">Đau mắt đỏ là gì? Nguyên nhân và dấu hiệu đau mắt đỏ</span></a></li></ul><p>&nbsp;</p>

                            </div>
                        </div>
                        <div class="comment-section">
                            <h3>Bình luận</h3>

                            <!-- Comment tabs -->
                            <div class="comment-tabs">
                                <button class="tab-btn active" data-tab="newest">Mới nhất</button>
                                <button class="tab-btn" data-tab="popular">Quan tâm nhất</button>
                            </div>
                            <form action="comment" method="post">
                                <!-- New comment form -->
                                <div class="comment-form">
                                    <div class="user-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <input type="hidden" name="method" value="basicComment"/>
                                    <input type="hidden" name="blog" value=""/>
                                    <div class="form-input">
                                        <textarea name="comment" placeholder="Viết bình luận của bạn..."></textarea>
                                        <button class="submit-comment">Gửi</button>
                                    </div>
                                </div>
                            </form>
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



                });
            });
        </script>
    </body>
</html>