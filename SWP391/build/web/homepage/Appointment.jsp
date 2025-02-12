<%-- 
    Document   : Appointment
    Created on : Feb 10, 2025, 12:12:21 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>
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
                                <ul style="text-align: center">
                                    <li class="col-md-4">
                                        <div class="iocn-holder">
                                            <span class="flaticon-signs"></span>
                                        </div>
                                        <div class="text-holder">
                                            <h3>KM29_Láng Hòa Lạc</h3>
                                        </div>
                                    </li>
                                    <li class="col-md-4">
                                        <div class="iocn-holder">
                                            <span class="flaticon-interface"></span>
                                        </div>
                                        <div class="text-holder">
                                            <h3>Group3_SWP391@fpt.edu.vn</h3>
                                        </div>
                                    </li>
                                    <li class="col-md-4">
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
                                    <h1>Appointment</h1>
                                </div>
                            </div>
                            <div class="right pull-right">
                                <ul>
                                    <li><i class="fa fa-home home" aria-hidden="true"></i><a href="index.html">Home</a></li>
                                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                                    <li class="active">Appointment</li>
                                </ul> 
                            </div>    
                        </div>
                    </div>
                </div>
            </section>
            <!--End breadcrumb area-->  

            <!--Start appointment area-->
            <section class="appointment-page">
                <div class="container">
                    <div class="sec-title text-center">
                        <h1>Make an Appointment</h1>
                        <span class="border"></span>
                        <div class="text-box">
                            <p>Select your prefer specialist after select the dental service then, the calendar is going to<br> be enable to select your appointment.</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="appointment-box">
                            <div class="col-md-12">
                                <div class="form">
                                    <form action="appointment" method="post">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-box">
                                                    <input type="text" value="${sessionScope.user.fullname}" placeholder="Your Name" required="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="input-box">
                                                    <input type="email"  value="${sessionScope.user.account.email}" placeholder="Your Email" required="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-box">
                                                    <input type="text" value="${sessionScope.user.account.phonenumber}" placeholder="Your Phone" required="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="input-box">
                                                    <input type="date" name="date" placeholder="Date" id="datepicker">
                                                    <div class="icon-box">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-box">
                                                    <select name="doctor" class="selectmenu">
                                                        <option  selected="selected">Select Doctor</option>
                                                        <c:forEach var="s" items="${listD}">
                                                            <option value="${s.doctor_id}">${s.doctor_name}</option> 
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="input-box">
                                                    <select name="slot" class="selectmenu">
                                                        <option selected="selected">Select Time</option>
                                                        <c:forEach var="s" items="${requestScope.slots}">
                                                            <option value="${s.slot_id}">${s.start_time} - ${s.end_time}</option> 
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="input-box">
                                                    <input type="text"  placeholder="Service Name" value="${s.services.service_name}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-box">
                                                    <input type="text" placeholder="Service Type" value="${s.serviceType.service_type_name}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-box">
                                                    <input type="text" name="cost" placeholder="Cost" value="${s.cost}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <textarea name="form_message" placeholder="Your Message.." required=""></textarea>
                                            </div>
                                        </div>
                                        <input type="hidden" name="service" value="${s.service_detail_id}">
                                        <input type="hidden" name="patient" value="${sessionScope.user.account.account_id}">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button class="thm-btn bg-1" type="submit">submit</button>   
                                            </div>
                                        </div>
                                    </form>  
                                </div>
                            </div>
                        </div>    
                    </div>
                </div>
            </section>
            <!--End appointment area-->

            <!--Start newsletter area-->
            <section class="newsletter-area" style="background-image:url(images/resources/newsletter-bg.jpg);">
                <div class="container">
                    <div class="sec-title center text-center">
                        <h1>Subscribe for Offers, Coupons and Deals</h1>
                        <p>We list all these discount coupons, deals and offers on various treatments. Get the latest and up-to-date coupons & cashback offers</p>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="newsletter">
                                <form class="newsletter-form">
                                    <div class="row">
                                        <div class="col-md-3">   
                                            <div class="field-input">
                                                <input type="text" name="form_name" value="" placeholder="Your Name" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">   
                                            <div class="field-input">
                                                <input type="email" name="form_email" value="" placeholder="Email Address" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">   
                                            <div class="field-input">
                                                <input type="text" name="form_phn" value="" placeholder="Ph Num" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <button class="#" type="submit">Subscibe Us</button>
                                        </div>
                                    </div>
                                </form>    
                            </div>    
                        </div>
                    </div>
                </div>
            </section>     
            <!--End newsletter area--> 

            <!--Start about us area-->
            <section class="about-us-area choose-area">
                <div class="container">
                    <div class="sec-title text-center">
                        <h1>Why Choose Us</h1>
                        <span class="border"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="right-content choose-carousel">
                                <!--Start single item-->
                                <div class="single-item">
                                    <div class="icon-holder">
                                        <span class="flaticon-social"></span>
                                    </div>
                                    <div class="text">
                                        <h3>Quality Doctors</h3>
                                        <p>Undertakes laborious physically exercise advantage.</p>
                                    </div>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <div class="icon-holder">
                                        <span class="flaticon-edit"></span>
                                    </div>
                                    <div class="text">
                                        <h3>Free Checkup</h3>
                                        <p>Undertakes laborious physically exercise advantage.</p>
                                    </div>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <div class="icon-holder">
                                        <span class="flaticon-book"></span>
                                    </div>
                                    <div class="text">
                                        <h3>Affordable Clinic</h3>
                                        <p>Undertakes laborious physically exercise advantage.</p>
                                    </div>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <div class="icon-holder">
                                        <span class="flaticon-tool"></span>
                                    </div>
                                    <div class="text">
                                        <h3>Latest Technology</h3>
                                        <p>Undertakes laborious physically exercise advantage.</p>
                                    </div>
                                </div>
                                <!--End single item-->
                            </div>    
                        </div>  
                    </div>
                </div>
            </section>
            <!--End about us area-->  

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
        <!-- main jQuery -->
        <jsp:include page="Common/Message.jsp"/>

        <!-- main jQuery -->
        <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
