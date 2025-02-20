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

        <jsp:include page="Common/StyleListDoctor.jsp"/>

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
            <!-- End breadcrumb area-->  

        </div>

        <!--Start service single area-->
        <section id="service-single-area">
            <div class="container">
                <div class="row">
                    <div style="margin-bottom: 50px" class="filter">
                        <!-- Start filter area--> 
                        <form action="filter" method="GET">
                            <div style="margin: 0px 50px" class="search-filter-box">

                                <select name="sid" id="filterSpecialization" class="form-control" >
                                    <option value="">All specialization</option>
                                    <c:forEach items="${listSpecialization}" var="s">
                                        <option value="${s.specialization_id}" 
                                                ${param.sid == s.specialization_id ? 'selected' : ''}>
                                            ${s.specialization_name}
                                        </option>
                                    </c:forEach>
                                </select>
                                
                                <select name="deid" id="filterDegree" class="form-control">
                                    <option value="">All degree</option>
                                    <c:forEach items="${listDegree}" var="de">
                                        <option value="${de.degree_id}"
                                                ${param.deid == de.degree_id ? 'selected' : ''}>   
                                            ${de.degree_name}</option>
                                        </c:forEach>
                                </select>

                                <input type="text" name="searchName" id="searchName" class="form-control" placeholder="Find doctor by name" 
                                       value="${param.searchName != null ? param.searchName : ''}">

                                <!-- Sort options -->

                                <select name="sortBy" class="form-control">
                                    <option value="">Sort By</option>
                                    <option value="sortByName" ${param.sortBy == 'sortByName' ? 'selected' : ''}>Sort by name</option>
                                    <option value="sortByExperience" ${param.sortBy == 'sortByExperience' ? 'selected' : ''}>Sort by experience</option>
                                    <option value="sortByRating" ${param.sortBy == 'sortByRating' ? 'selected' : ''}>Sort by rating</option>
                                </select>
                                <select name="option" class="form-control">
                                    <option value="asc" ${param.option == 'asc' ? 'selected' : ''}>Low - High</option>
                                    <option value="desc" ${param.option == 'desc' ? 'selected' : ''}>High - Low</option>
                                </select>


                                <button type="submit" class="btn-search">Search</button>
                            </div>
                        </form>

                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-7 col-xs-12 pull-left">
                        <div class="service-sidebar">
                            <!-- First section: Find Doctor -->
                            <div class="single-sidebar find-doctor">
                                <a href="#" class="sidebar-link">
                                    <span class="icon-holder">
                                        <i class="flaticon-doctor"></i>
                                    </span>
                                    <span class="text-holder">
                                        <h3>FIND DOCTOR</h3>
                                    </span>
                                    <span class="arrow">
                                        <i class="flaticon-right-arrow"></i>
                                    </span>
                                </a>
                            </div>

                            <!-- Second section: Special Offers -->
                            <div class="single-sidebar special-offer">
                                <a href="#" class="sidebar-link">
                                    <span class="icon-holder">
                                        <i class="flaticon-gift"></i>
                                    </span>
                                    <span class="text-holder">
                                        <h3>GET DISCOUNT</h3>
                                    </span>
                                    <span class="arrow">
                                        <i class="flaticon-right-arrow"></i>
                                    </span>
                                </a>
                            </div>

                            <!-- Third section: Contact -->
                            <div class="single-sidebar special-offer">
                                <a href="#" class="sidebar-link">
                                    <span class="icon-holder">
                                        <i class="flaticon-gift"></i>
                                    </span>
                                    <span class="text-holder">
                                        <h3>HOTLINE</h3>
                                        <h4>1900 277 227</h4>
                                    </span>
                                    <span class="arrow">
                                        <i class="flaticon-right-arrow"></i>
                                    </span>
                                </a>
                            </div>

                            <!--Start single sidebar-->
                            <div class="single-sidebar">
                                <ul class="all-service">
                                    <li class="active">
                                        <a href="#">OTHER SERVICES</a>
                                    </li>
                                    <li>
                                        <a href="clips-braces.html">Clips & Braces</a>
                                    </li>
                                    <li>
                                        <a href="dental-implant.html">Dental Implant</a>
                                    </li>
                                    <li>
                                        <a href="teeth-whitening.html">Teeth Whitening</a>
                                    </li>
                                    <li>
                                        <a href="tooth-jewellery.html">Tooth Jewellery</a>
                                    </li>
                                    <li>
                                        <a href="teeth-filling.html">Teeth Filling</a>
                                    </li>
                                </ul> 
                            </div> 
                            <!--Ens single sidebar--> 
                            <!--Start single sidebar-->
                            <div class="single-sidebar">
                                <div class="title">
                                    <h3>Working Hours</h3>
                                </div>
                                <ul class="opening-time">
                                    <li>Mon to Friday: <span>06.00 to 18.00</span></li>
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
                                                <h5>Support@Eyecare.com</h5>
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
                    <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12 pull-right"> 
                        <div class="team-area-single-ser clearfix">
                            <div class="sec-title">
                                <h1>Meet Our Dentist</h1>
                                <span class="border"></span>
                            </div>
                            <div class="row">
                                <!--Start single team member-->
                                <c:forEach items="${requestScope.listDoctor}" var="d">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <div class="single-team-member">
                                            <div class="img-holder">
                                                <img style="height: 270px; object-fit: cover;" src="${d.profile_image}" alt="Profile Image">
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
                                                <p>Experience years: ${d.experience_years} years</p>

                                                <jsp:useBean id="degreeDAO" class="dal.DegreeDAO" />
                                                <c:set var="degrees" value="${degreeDAO.getDegreeByDoctorId(d.doctor_id)}" />
                                                <p>Degree: 
                                                    <c:forEach items="${degrees}" var="degree" varStatus="status">
                                                        ${degree.degree_name}${!status.last ? ', ' : ''}
                                                    </c:forEach>
                                                </p>


                                                <span class="border"></span>
                                                <a href="doctorDetail?doctorid=${d.doctor_id}">View Profile<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                            </div>    
                                        </div> 
                                    </div>
                                </c:forEach>
                                <!--End single team member-->
                            </div>
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
                                        <h5>1900 277 227</h5>
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