<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="Common/Css.jsp"/>

        <style>
          .blog-card {
            border: 1px solid #e0e0e0; /* Viền nhạt hơn */
            margin-bottom: 20px;
            padding: 15px;
            display: flex;
            align-items: center;
            background-color: #fff; /* Nền trắng để nổi shadow */
            border-radius: 10px; /* Bo góc mịn */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Đổ shadow nhẹ */
            transition: all 0.3s ease; /* Hiệu ứng mượt mà */
        }
        .blog-card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); /* Shadow đậm hơn khi hover */
            transform: translateY(-2px); /* Nhích lên chút khi hover */
        }
        .blog-card img {
            width: 200px;
            height: 150px;
            object-fit: cover;
            margin-right: 20px;
            border-radius: 8px; /* Bo góc cho ảnh */
        }
        .blog-card h3 {
            margin: 0;
            font-size: 1.8rem;
            color: #333;
            font-weight: 500; /* Font nhẹ hơn chút */
        }
            
        </style>
    </head>
    <body>
        <div class="boxed_wrapper">
            <!--Start Preloader -->
            <div class="preloader"></div>
            <!--End Preloader -->  

            <!--Start Top bar area -->  
            <jsp:include page="Common/Navbar.jsp"/>
            <!--End header area-->    

            <!--Start breadcrumb area-->     
            <section class="breadcrumb-area" style="background-image: url(images/resources/breadcrumb-bg.jpg);">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="left pull-left">
                                <div class="title">
                                    <h1>Blog</h1>
                                </div>
                            </div>
                            <div class="right pull-right">
                                <ul>
                                    <li><i class="fa fa-home home" aria-hidden="true"></i><a href="trangchu">Home</a></li>
                                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                                    <li class="active">Blog</li>
                                </ul> 
                            </div>    
                        </div>
                    </div>
                </div>
            </section>
            <!--End breadcrumb area-->  

            <!--Start blog area-->
            <section id="blog-area" class="blog-v1-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="blog-post">
                                <div class="row">
                                    <c:forEach items="${blogs}" var="blog">
                                        <div class="col-md-12">
                                            <a href="blog?blog=${blog.blog_id}" style="text-decoration: none;">
                                                <div class="blog-card">
                                                    <img src="${blog.title_image_blog}" alt="Blog Image">
                                                    <h3>${blog.title_meta}</h3>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!--End single latest blog--> 
                            </div>


                            <!--Start post pagination-->
                            <div class="row">
                                <div class="col-md-12"> 
                                    <ul class="post-pagination text-center">
                                        <!-- Previous -->
                                        <c:if test="${currentPage > 1}">
                                            <li><a href="bloghome?page=${currentPage - 1}"><i class="fa fa-caret-left" aria-hidden="true"></i></a></li>
                                                </c:if>

                                        
                                        <c:forEach begin="${currentPage}" end="${totalPages}" var="i">
                                            <c:choose>
                                                <c:when test="${i == currentPage}">
                                                    <li class="active"><a href="#">${i}</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <li><a href="bloghome?page=${i}">${i}</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                       
                                        <c:if test="${currentPage < totalPages}">
                                            <li><a href="bloghome?page=${currentPage + 1}"><i class="fa fa-caret-right" aria-hidden="true"></i></a></li>
                                                </c:if>
                                    </ul>
                                </div> 
                            </div>
                            <!--End post pagination-->
                        </div>
                    </div>
                </div>
        </div>
    </section> 
    <!--End blog area-->                                                                        

    <!--Start footer area-->  
    <footer class="footer-area">
        <div class="container">
            <div class="row">
                <!--Start single footer widget-->
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="single-footer-widget mar-btm">
                        <div class="title">
                            <h3>About Us</h3>
                            <span class="border"></span>
                        </div>
                        <div class="our-info">
                            <p>How all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound.</p>
                            <ul class="footer-social-links">
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--End single footer widget-->
                <!--Start single footer widget-->
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="single-footer-widget mar-lft mar-btm">
                        <div class="title">
                            <h3>Quick Links</h3>
                            <span class="border"></span>
                        </div>
                        <ul class="quick-links">
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">About Dentalcare</a></li>
                            <li><a href="#">Customer Words</a></li>
                            <li><a href="#">Expert Dentist</a></li>
                            <li><a href="#">Make Appointment</a></li>
                        </ul>
                    </div>
                </div>
                <!--Start single footer widget-->
                <!--Start single footer widget-->
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="single-footer-widget martop">
                        <div class="title">
                            <h3>Contact Us</h3>
                            <span class="border"></span>
                        </div>
                        <ul class="footer-contact-info">
                            <li>
                                <div class="icon-holder">
                                    <span class="flaticon-pin map-marker"></span>
                                </div>
                                <div class="text-holder">
                                    <h5>45 West Dental Street, NY 1003</h5>
                                </div>
                            </li>
                            <li>
                                <div class="icon-holder">
                                    <span class="flaticon-technology-1"></span>
                                </div>
                                <div class="text-holder">
                                    <h5>+800 901 2345 & 67</h5>
                                </div>
                            </li>
                            <li>
                                <div class="icon-holder">
                                    <span class="flaticon-interface"></span>
                                </div>
                                <div class="text-holder">
                                    <h5>Mail4u@Dentalcare.com</h5>
                                </div>
                            </li>
                            <li>
                                <div class="icon-holder">
                                    <span class="flaticon-clock"></span>
                                </div>
                                <div class="text-holder">
                                    <h5>Mon - Satday: 9.00am to 18.00pm</h5>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--End single footer widget-->
                <!--Start single footer widget-->
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="single-footer-widget margintop50">
                        <div class="title">
                            <h3>Latest Works</h3>
                            <span class="border"></span>
                        </div>
                        <ul class="latest-work-list">
                            <li>
                                <div class="image-holder">
                                    <img src="images/footer/latest-work-1.jpg" alt="Awesome Image">
                                    <div class="overlay-style-one">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="image-holder">
                                    <img src="images/footer/latest-work-2.jpg" alt="Awesome Image">
                                    <div class="overlay-style-one">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="image-holder">
                                    <img src="images/footer/latest-work-3.jpg" alt="Awesome Image">
                                    <div class="overlay-style-one">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="image-holder">
                                    <img src="images/footer/latest-work-4.jpg" alt="Awesome Image">
                                    <div class="overlay-style-one">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="image-holder">
                                    <img src="images/footer/latest-work-5.jpg" alt="Awesome Image">
                                    <div class="overlay-style-one">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="image-holder">
                                    <img src="images/footer/latest-work-6.jpg" alt="Awesome Image">
                                    <div class="overlay-style-one">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--End single footer widget-->

            </div>
        </div>
    </footer>   
    <!--End footer area-->

    <!--Start footer bottom area--> 
    <section class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="footer-bottom">
                        <div class="copyright-text pull-left">
                            <p>Copyrights © 2017 All Rights Reserved by <a href="#">Dentalcare.</a></p> 
                        </div>
                        <div class="footer-menu pull-right">
                            <ul>
                                <li><a href="#">Legal</a></li>
                                <li><a href="#">Sitemap</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div>
                    </div>    
                </div>
            </div>
        </div>    
    </section> 
    <!--End footer bottom area-->  

    <jsp:include page="Common/Js.jsp"/>






</body>
</html> 
