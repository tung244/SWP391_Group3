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
        <style>
            .search-filter-box {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 20px;
                background: #f8f9fa;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            }

            .search-filter-box .form-control {
                flex: 1;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                height: 45px;
                
            }
         

            .search-filter-box .btn-search {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            .search-filter-box .btn-search:hover {
                background-color: #0056b3;
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
                                    <li class="active">Meet Our Dentist</li>
                                </ul> 
                            </div>    
                        </div>
                    </div>

            </section>
            <div style="margin-top: 30px" class="container">
                <div class="search-filter-box">  
                    <select   id="filterSpecialization" class="form-control" onchange="window.location.href = 'specialization?sid=' + this.value">
                        <option  ${param.specialization_id ? 'selected' : ''} value="">All specialization</option>
                        <c:forEach items="${requestScope.listSpecialization}" var="s">
                            <option ${param.sid == s.specialization_id ? 'selected' : ''} value="${s.specialization_id}">${s.specialization_name}</option>
                        </c:forEach>
                    </select>
                        <input type="text" id="searchName" class="form-control" placeholder="Find doctor by name">
                        <button type="submit" class="btn-search">Search</button> 
                </div>
                        
            </div>
        </div>



        <!--End breadcrumb area  -->

        <!--Start team area-->
        <section class="team-area team-page">
            <div class="container">
                <div class="row">

                    <!--Start single team member-->
                    <!-- Start single team member -->
                    <c:forEach items="${requestScope.listDoctor}" var="d">
                        <div class="col-md-3 col-sm-6 col-xs-12">


                            <div class="single-team-member">
                                <div class="img-holder">
                                    <img src="${d.profile_image}" alt="Profile Image">
                                    <div class="overlay-one">
                                        <div class="overlay-inner">
                                            <div class="content"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-holder text-center">
                                    <h3>${d.doctor_name}</h3>
                                    <span>${d.specialization.specialization_name}</span>
                                    <p>Rating: ${d.rating}</p>
                                    <p>Gender: ${d.gender}</p>
                                    <p>Experience years: ${d.experience_years}</p>



                                    <span class="border"></span>
                                    <a href="doctorDetail">View Profile<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                </div>    
                            </div> 

                        </div>
                    </c:forEach>

                    <!--End single team member-->

                </div>



            </div>
        </section>
        <!--End team area-->

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