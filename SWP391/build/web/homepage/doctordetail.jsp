<%-- 
    Document   : listdoctors
    Created on : Feb 4, 2025, 6:21:15 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="Common/Css.jsp"/>  

        <!--Style -->
        <jsp:include page="Common/StyleDocDetail.jsp"/>
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

            <!-- Start breadcrumb area-->                        
            <section class="breadcrumb-area" style="background-image: url(images/resources/breadcrumb-bg.jpg);">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="left pull-left">
                                <div class="title">
                                    <h1>Meet Our Dentist</h1>
                                </div>
                            </div>
                            <div class="right pull-right">
                                <ul>
                                    <li><i class="fa fa-home home" aria-hidden="true"></i><a href="trangchu">Home</a></li>
                                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                                    <li><i class="" aria-hidden="true"></i><a href="listDoctors">Meet Our Dentist</a></li>
                                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                                    <li class="active">Dr.${d.doctor_name}</li>
                                </ul> 
                            </div>    
                        </div>
                    </div>

            </section>
        </div>
        <!--End breadcrumb area  -->

        <!--Start doctor detail area-->
        <section class="doctor-details-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="doctor-details bg-white p-4 rounded-lg shadow-sm">
                            <div class="row">
                                <!-- Doctor Profile Image -->
                                <div class="col-lg-3 col-md-4">
                                    <div class="doctor-thumb text-center">
                                        <img  src="${d.profile_image}" alt="Doctor Photo" class="rounded-circle img-fluid mb-3">
                                        <div class="star-rating text-warning mb-2">
                                            <span class="text-muted ml-2">Rating: ${d.rating}</span> ★
                                            </br>
                                            <span class="text-muted ml-2">(45 reviews)</span>

                                        </div>
                                    </div>
                                </div>

                                <!-- Doctor Information -->
                                <div class="col-lg-9 col-md-8">
                                    <div class="doctor-info">
                                        <h2 class="text-success mb-3">${d.doctor_name}</h2>
                                        <h4 class="text-muted mb-4">Specialization: ${d.specialization.specialization_name}</h4>

                                        <!-- Personal Details -->
                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <h5 class="text-success border-bottom pb-2">Personal Information</h5>
                                                <ul class="list-unstyled">
                                                    <li class="mb-2"><strong>Gender:</strong>${d.gender}</li>

                                                    <li class="mb-2"><strong>Certificate:</strong> ${d.certificate.certificate_name}</li>
                                                    <li class="mb-2"><strong>Certificate issued by:</strong> ${d.certificate.cer_doct.issued_by}</li>
                                                    <li class="mb-2"><strong>Experience:</strong> ${d.experience_years} years</li>
                                                    <li class="mb-2"><strong>Workplace:</strong> EyeCare hospital</li>
                                                </ul>
                                            </div>

                                            <div class="col-md-6">
                                                <h5 class="text-success border-bottom pb-2">Specialties</h5>
                                                <ul class="list-unstyled">
                                                    <c:forEach items="${listSpecById}" var="spec">
                                                        <li class="mb-2">🦷 ${spec.specialization_name}</li>
                                                        </c:forEach>

                                                </ul>
                                            </div>
                                                    <div class="col-md-6">
                                                <h5 class="text-success border-bottom pb-2">Degree</h5>
                                                <ul class="list-unstyled">
                                                    <c:forEach items="${listDegree}" var="de">
                                                        <li class="mb-2">- ${de.degree_name}</li>
                                                        </c:forEach>

                                                </ul>
                                            </div>
                                        </div>

                                        <!-- Biography -->
                                        <div class="doctor-bio mb-4">
                                            <h5 class="text-success border-bottom pb-2">Professional Biography</h5>
                                            <p class="text-muted">Certificate: ${d.certificate.certificate_name}</p>
                                            <p class="text-muted">Working at: EyeCare hospital</p>
                                            <p class="text-muted">Experience years: ${d.experience_years} years</p>
                                        </div>

                                        <!-- Action Buttons -->
                                        <div class="doctor-actions text-center">
                                            <a href="appointment" class="btn btn-success btn-lg mr-3">Book Appointment</a>
                                            <!--                                            <a href="consultation?id=#" class="btn btn-outline-success btn-lg">Free Consultation</a>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End doctor detail area-->

        <!-- Start Related Doctors Section -->
        <section style="margin-top: 50px; margin-bottom: 50px" class="related-doctors">
            <div class="container">
                <div class="section-title text-center mb-5">
                    <h2 class="text-success">Related Doctors</h2>
                    
                </div>

                <div class="row">
                    <!--  <c:forEach items="${listRelated}" begin="0" end="3" var="related">-->
                        <div style="margin: 20px; justify-content: space-between" class="col-lg-3 col-md-6 mb-4">
                            <div class="doctor-card bg-white rounded-lg shadow-sm">
                                <div class="doctor-image position-relative">
                                    <img src="${related.profile_image}" alt="Doctor Profile" class="img-fluid w-100">
                                    <div class="doctor-social">
                                        <a href="#" class="text-success"><i class="fa fa-facebook"></i></a>
                                        <a href="#" class="text-success"><i class="fa fa-twitter"></i></a>
                                        <a href="#" class="text-success"><i class="fa fa-linkedin"></i></a>
                                    </div>
                                </div>
                                <div class="doctor-info p-3 text-center">
                                    <h4><a href="doctorDetail?doctorid=${related.doctor_id}" class="text-dark">${related.doctor_name}</a></h4>
                                    <p class="text-success mb-2">${related.specialization.specialization_name}</p>
                                    <div class="star-rating text-warning mb-2">
                                            <span class="text-muted ml-2">Rating: ${d.rating}</span> ★
                                            </br>
                                            <!--                                            <span class="text-muted ml-2">(45 reviews)</span>-->

                                        </div>
                                </div>
                            </div>
                        </div>
                        <!-- </c:forEach>-->
                    </div>
                </div>
            </section>

            
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