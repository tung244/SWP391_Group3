<%-- 
    Document   : ServiceDetail
    Created on : Feb 6, 2025, 2:01:32 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <style>
            .img-holder img {
                width: 100%; /* Hoặc chiều rộng cụ thể tùy vào yêu cầu */
                height: 250px; /* Đảm bảo tỉ lệ khung hình giữ nguyên */
            }
            .single-item {
                text-align: center; /* Căn giữa các phần tử bên trong */
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
            <!--End mainmenu area-->

            <!--Start header area-->
            <header class="mainmenu-bottom-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="header-contact-info">
                                <ul>
                                    <li>
                                        <div class="iocn-holder">
                                            <span class="flaticon-signs"></span>
                                        </div>
                                        <div class="text-holder">
                                            <h3>45 West Dental Street, Newyork 1003</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="iocn-holder">
                                            <span class="flaticon-interface"></span>
                                        </div>
                                        <div class="text-holder">
                                            <h3>Supportuteam@Dentalcare.com</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="iocn-holder">
                                            <span class="flaticon-clock"></span>
                                        </div>
                                        <div class="text-holder">
                                            <h3>Weekdays: 09.00am to 18.00pm</h3>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </header>  
            <!--End header area-->    

            <!--Start breadcrumb area-->     
            <section class="breadcrumb-area" style="background-image: url(images/resources/breadcrumb-bg.jpg);">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="left pull-left">
                                <div class="title">
                                    <h1 style="width: 80%">${service.service_name}</h1>
                                </div>
                            </div>
                            <div class="right pull-right">
                                <ul>
                                    <li><i class="fa fa-home home" aria-hidden="true"></i><a href="index.html">Home</a></li>
                                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                                    <li><a href="services.html">Services</a></li>
                                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                                    <li class="active" >${service.service_name}</li>
                                </ul> 
                            </div>    
                        </div>
                    </div>
                </div>
            </section>
            <!--End breadcrumb area-->  

            <!--Start services single area-->
            <section class="services-single-area">
                <div class="container">
                    <div class="row">

                    </div>
                </div>
            </section>
            <!--End services single area-->

            <!--Start service single area-->
            <section id="service-single-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12 pull-right"> 

                            <div class="top-content-box">
                                <div class="sec-title">
                                    <h1 style="color: green;font-weight: bold">${service.service_name}</h1>
                                    <span class="border"></span>
                                </div>
                                <div class="text-box" >
                                    <h4 style="margin-bottom: 5px;color: green">Introduce</h4>
                                    <p style="color: black">${introducePart1}.</p>
                                    <p style="color: black">${introducePart2}.</p>
                                </div>
                                <div class="text-box">
                                    <h4 style="margin-bottom: 5px;color: green">Benefit</h4>
                                    <p style="color: black">${benefitPart1}.</p>
                                    <p style="color: black">${benefitPart2}.</p>
                                </div>
                                <div class="img-box">
                                    <div class="row">
                                        <!--Start single item-->
                                        <div class="col-md-6">
                                            <div class="single-item">
                                                <div class="img-holder">
                                                    <img src="${imageService.image_before}" alt="Awesome Image">
                                                </div>
                                                <h3>Before</h3>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="single-item">
                                                <div class="img-holder">
                                                    <img src="${imageService.image_after}" alt="Awesome Image">
                                                </div>
                                                <h3>After</h3>
                                            </div>
                                        </div>
                                        <!--End single item-->
                                    </div>
                                </div> 
                            </div>

                            <div class="service-plan">
                                <div class="sec-title">
                                    <h1 style="color: green">Types of Procedures</h1>
                                    <span class="border"></span>
                                </div>
                                <div class="row">
                                    <!--Start single box-->
                                    <div class="col-md-6">
                                        <div class="single-box">
                                            <div class="icon-holder">
                                                <span class="flaticon-medical-6"></span>
                                            </div>
                                            <div class="text-box">
                                                <h3>Professional</h3>
                                                <p>How all this mistaken idea denoucing pleasure and praisings pain was born complete account expound.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End single box-->
                                    <!--Start single box-->
                                    <div class="col-md-6">
                                        <div class="single-box">
                                            <div class="icon-holder">
                                                <span class="flaticon-church"></span>
                                            </div>
                                            <div class="text-box">
                                                <h3>Laser Procedure</h3>
                                                <p>There anyone who loves or pursues or to obtain pain of itself, because it is but because occasionally.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End single box-->
                                    <!--Start single box-->
                                    <div class="col-md-6">
                                        <div class="single-box">
                                            <div class="icon-holder">
                                                <span class="flaticon-avatar"></span>
                                            </div>
                                            <div class="text-box">
                                                <h3>At Home Procedure</h3>
                                                <p>Undertakes laborious physical exercise, except to obtain some advantage from it but who has any right.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End single box-->
                                    <!--Start single box-->
                                    <div class="col-md-6">
                                        <div class="single-box">
                                            <div class="icon-holder">
                                                <span class="flaticon-medical-7"></span>
                                            </div>
                                            <div class="text-box">
                                                <h3>General Procedure</h3>
                                                <p>Pursues or desires to obtain pain itself, because is pain, because occasionally circumstances occur procure.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End single box-->
                                </div>
                            </div>

                            <div class="pricing-box">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="single-box">
                                            <h3>Pricing & Plans for Teeth Whitening</h3>
                                            <ul>
                                                <li>Oral Consultation(Includes Full Mouth X-Ray & Treatment Plan) <span>Free</span></li>
                                                <li>Exam & Cleaning (Includes Full Mouth Cleaning) <span>$120</span></li>
                                                <li>White Filling(Includes One Composite Filling) <span>$175</span></li>
                                                <li>Laser Teeth Whitening (Minimally Invasive Technology) <span>$340</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                            <div class="pricing-box">
                                <h3 style="text-align: center; background-color: #e8ffe8; padding: 18px ">Pricing & Plans for Teeth Whitening</h3>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="color: green">Name</th>
                                            <th style="color: green">Type</th>
                                            <th style="color: green">Duration</th>
                                            <th style="color: green">Specialization</th>
                                            <th style="color: green">Cost</th>
                                            <th style="color: green">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="sd" items="${listSD}">
                                            <tr>
                                                <td style="color: black">${sd.services.service_name}</td>
                                                <td style="color: black">${sd.serviceType.service_type_name}</td>
                                                <td style="color: black">${sd.serviceType.duration_service}</td>
                                                <td style="color: black">${sd.services.specialization.specialization_name}</td>
                                                <td style="color: black"><fmt:formatNumber value="${sd.cost}" pattern="#,###" />VNĐ</td>
                                                <td>
                                                    <a href="appointment?id=${sd.service_detail_id}&type=${sd.serviceType.service_type_id}" class="btn btn-success">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i> Book
                                                    </a>
                                                </td>
                                            </tr>  
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <div class="team-area-single-ser clearfix">
                                <div class="sec-title">
                                    <h1 style="color: green">Meet Our Dentist</h1>
                                    <span class="border"></span>
                                </div>
                                <div class="row">
                                    <c:forEach var="d" items="${doctors}">
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="single-team-member">
                                                <div class="img-holder">
                                                    <img  src="${d.profile_image}" alt="Awesome Image">
                                                </div>
                                                <div class="text-holder text-center">
                                                    <h3>Dr. ${d.doctor_name}</h3>
                                                    <span>Doctor</span>
                                                    <p>${d.specialization.specialization_name}</p>
                                                    <span class="border"></span>
                                                    <span class="text-muted ml-2">Rating: ${d.rating}</span> ★
                                                    <br>
                                                    <hr>
                                                    <a href="doctorDetail?doctorid=${d.doctor_id}">View Profile<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                                </div>    
                                            </div> 
                                        </div>  
                                    </c:forEach>

                                </div>
                            </div>

                        </div> 
                        <div class="col-lg-3 col-md-4 col-sm-7 col-xs-12 pull-left">
                            <div class="service-sidebar">
                                <!--Start single sidebar-->
                                <div class="single-sidebar">
                                    <ul class="all-service">
                                        <c:forEach var="s" items="${listS}">
                                            <li ><a href="loadServiceDetailHomepage?id=${s.service_id}" style="color: grey" >${s.service_name}</a></li> 
                                            </c:forEach>
                                    </ul>            
                                </div> 
                                <!--Ens single sidebar--> 
                                <!--Start single sidebar-->
                                <div class="single-sidebar">
                                    <div class="title">
                                        <h3>Opening Hours</h3>
                                    </div>
                                    <ul class="opening-time">
                                        <li>Mon to Friday: <span>09.00 to 18.00</span></li>
                                        <li>Saturday: <span>10.00 to 16.00</span></li>
                                        <li>Sunday: <span>10.00 to 14.00</span></li>
                                    </ul>
                                </div> 
                                <!--Ens single sidebar--> 
                                <!--Start single sidebar-->
                                <div class="single-sidebar">
                                    <div class="title">
                                        <h3>Quick Contact</h3>
                                    </div>
                                    <div class="contact-us">
                                        <ul class="contact-info">
                                            <li>
                                                <div class="icon-holder map">
                                                    <span class="flaticon-pin"></span>
                                                </div>
                                                <div class="text-holder">
                                                    <h5>Park Drive, Varick 2nd Str <br>NY 10012, USA</h5>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="icon-holder">
                                                    <span class="flaticon-interface"></span>
                                                </div>
                                                <div class="text-holder">
                                                    <h5>Support@Dentalcare.com</h5>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="icon-holder">
                                                    <span class="flaticon-technology-1"></span>
                                                </div>
                                                <div class="text-holder">
                                                    <h5>(123) 0200 12345 & 7890</h5>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div> 
                                <!--Ens single sidebar-->       
                            </div>    
                        </div>

                    </div>
                </div>
            </section>
            <!--End service Single area--> 




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

        </div>
        <!--Scroll to top-->
        <div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-angle-up"></span></div>

        <jsp:include page="Common/Message.jsp"/>

        <!-- main jQuery -->
        <jsp:include page="Common/Js.jsp"/>






    </body>
</html>
