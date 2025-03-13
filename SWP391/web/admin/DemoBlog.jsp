<%-- 
    Document   : DemoBlog
    Created on : Mar 5, 2025, 8:10:19 PM
    Author     : fptshop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Trang Tin Tức</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Thêm Font Awesome -->

        <style>
            .wrapper {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px 20px 0px 0px;
                display: flex;
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

            .main-content {
                background-color: white;
                padding: 20px;
                border-radius: 5px;

                margin-left: 40px;

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
        </style>
    </head>
    <body>
        <div style="padding-bottom: 200px;" class="boxed_wrapper">
            <div class="container-fluid py-5">
                <div>
                    <img src="../admin/assets/images/anhDemoPost.png" style="width: 100%"/>
                </div>
                <div class="wrapper">

                    <div class="content-left">
                        <div class="share-buttons">
                            <a href="#" class="share-btn fb"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="share-btn tw"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="share-btn ln"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                        <div class="main-content">
                            ${postContent}
                        </div>
                        <form id="saveBlog" style="display: flex; justify-content: center" action="save_blog" method="post">
                            <input type="hidden" id="content_blog_submit" name="content"/>
                            <button style="background-color: rgb(34,139,34);
                                    width: 500px; color: white;
                                    border-radius: 10px;border: none;padding: 10px;
                                    cursor: pointer; font-size: 20px" type="submit">Đăng Bài</button>
                        </form>
                        <!--                        <button style="background-color: rgb(34,139,34);
                                                        width: 500px; color: white;
                                                        border-radius: 10px;padding: 15px;
                                                        cursor: pointer; font-size: 20px" type="submit">Đăng Bài</button>-->
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
            </div></div>
        <script>
             let postContent = `<%= request.getSession().getAttribute("postContent") %>`;
            document.getElementById('saveBlog').addEventListener('submit', function (){
               document.getElementById('content_blog_submit').value = postContent;
            });

        </script>
    </body>
</html>