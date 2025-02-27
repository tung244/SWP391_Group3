<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <style>
            html{
                scroll-behavior: smooth;
            }
            body {
                background-color: #f8f9fa;
                color: #333;
            }

            .section-machine {
                padding: 3rem 0;
                transition: all 0.3s ease;
            }

            h1 {
                color: #2c3e50;
                font-weight: 700;
                position: relative;
                padding-bottom: 15px;
                margin-bottom: 3rem;
            }

            h1::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                width: 100px;
                height: 4px;
                background: linear-gradient(to right, #3498db, #2ecc71);
                border-radius: 2px;
            }

            .machine-title {
                color: rgb(34,139,34);
                font-weight: 600;
                margin-bottom: 1.5rem;
                position: relative;
                padding-left: 15px;
            }

            .machine-title::before {
                content: '';
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                width: 4px;
                height: 25px;
                background: rgb(34,139,34);
                border-radius: 2px;
            }

            .img-fluid {
                border-radius: 15px;
                transition: all 0.3s ease;
            }

            .machine-description {
                color: #666;
                line-height: 1.8;
                margin-bottom: 1.5rem;
            }

            .machine-row {
                margin-bottom: 5rem;
                scroll-margin-top: 100px;
            }

            /* Compact Table of Contents Styles */
            .table-of-contents {
                position: fixed;
                left: 0;
                /*                top: 200px;*/
                background: white;
                padding: 15px;
                /*                border-radius: 0 10px 10px 0;*/
                /*                box-shadow: 2px 0 10px rgba(0,0,0,0.1);*/
                max-width: 330px;
                /*                z-index: 100;*/
            }

            .table-of-contents h3 {
                color: #2c3e50;
                font-size: 1rem;
                margin-bottom: 10px;
                padding-bottom: 5px;
                border-bottom: 2px solid rgb(34,139,34);
            }

            .toc-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .toc-list li {
                margin-bottom: 5px;
            }

            .toc-list a {
                color: #666;
                text-decoration: none;
                transition: all 0.3s ease;
                display: block;
                padding: 0px 8px;
                border-radius: 4px;
                font-size: 1.2rem;
            }

            .toc-list a:hover {
                color: rgb(34,139,34);
                background: #f8f9fa;
            }

            .toc-list a.active {
                color: #fff;
                background: rgb(34,139,34);
            }

            /* Adjust main content margin */
            .main-content {
                margin-left: 220px;
                padding-top: 10px;
            }

            @media (max-width: 992px) {
                .table-of-contents {
                    display: none;
                }
                .main-content {
                    margin-left: 0;
                }
            }
        </style>
    </head>
    <body style="background-color: white">
        <div style="padding-bottom: 200px;" class="boxed_wrapper">
            <div class="container-fluid py-5">
                <jsp:include page="Common/Navbar.jsp"/>

                <!-- Table of Contents -->
                <div class="table-of-contents">
                    <h3 style="font-size: 20px; margin-top: 50px">Danh sách máy</h3>
                    <c:if test="${machine.size()== 1}">
                        <a style="margin-left: 10px; color:rgb(34,139,34) " href="list_machine">Xem tất cả</a>
                    </c:if>
                    <ul class="toc-list">
                        <c:forEach var="machineItem" items="${machine}" varStatus="status">
                            <li>
                                <a href="#machine-${status.index}">${machineItem.machine_name}</a>
                            </li>
                        </c:forEach>

                    </ul>
                </div>

                <header class="mainmenu-bottom-area">
                    <!-- Your existing header content -->
                </header>

                <div class="container main-content">
                    <h1 class="text-center" style="color: rgb(34,139,34); margin-top: 20px">Trang thiết bị của chúng tôi</h1>

                    <c:forEach var="machine" items="${machine}" varStatus="status">
                        <div id="machine-${status.index}" class="machine-row">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <img src="${machine.machine_img}" style="height: 200px; margin-right: 20px; margin-left: 140px" alt="${machine.machine_name}" class="img-fluid">
                                </div>
                                <div class="col-md-6 content-section">
                                    <h3 class="machine-title">${machine.machine_name}</h3>
                                    <p class="machine-description">${machine.machine_description}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>

        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>

        <!-- Add this script before closing body tag -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const tocLinks = document.querySelectorAll('.toc-list a');
                tocLinks.forEach(link => {
                    link.addEventListener('click', function (e) {
                        e.preventDefault(); // Ngăn chặn hành vi mặc định
                        const target = this.getAttribute('href');
                        const targetElement = document.querySelector(target);
                        targetElement.scrollIntoView(); // Cuộn đến phần tử

                        // Cập nhật trạng thái active
                        tocLinks.forEach(l => l.classList.remove('active'));
                        this.classList.add('active');
                    });
                });

                // Cập nhật trạng thái active khi cuộn
                window.addEventListener('scroll', function () {
                    const scrollPosition = window.scrollY;

                    document.querySelectorAll('.machine-row').forEach((section, index) => {
                        const sectionTop = section.offsetTop - (index === document.querySelectorAll('.machine-row').length - 1 ? 350 : 150);  // phần tử cuối thì trừ đi 350px để hiển thị chuẩn cái 
                        const sectionBottom = sectionTop + section.offsetHeight;
                        
                        if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
                            tocLinks.forEach(link => link.classList.remove('active'));
                            tocLinks[index].classList.add('active');
                        }
                    });
                });
            });
        </script>
    </body>
</html>