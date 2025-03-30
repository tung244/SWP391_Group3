<%-- 
    Document   : listdoctors
    Created on : Feb 4, 2025, 6:21:15 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <form action="listDoctors" method="GET">
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


                            <!--Start single sidebar-->
                            <div class="single-sidebar">
                                <ul class="all-service">
                                    <li class="active">
                                        <a href="#">OTHER SERVICES</a>
                                    </li>
                                    <c:forEach items="${listS}" var="s">
                                        <li><a href="loadServiceDetailHomepage?id=${s.service_id}">${s.service_name}</a></li>
                                        </c:forEach>


                                </ul> 
                            </div> 
                            <!--Ens single sidebar--> 
                            <!--Start single sidebar-->
                            <div style="padding: 15px" class="single-sidebar">
                                <div class="title">
                                    <h3>Working Hours</h3>
                                </div>
                                <ul class="opening-time">
                                    <li>Giờ mở cửa: <span>06.00 to 18.00</span></li>

                                </ul>
                            </div> 
                            <!--Ens single sidebar--> 
                            <!--Start single sidebar-->
                            <div style="padding: 15px" class="single-sidebar">
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
                                                <h5>KM29 Láng Hòa Lạc</h5>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="icon-holder">
                                                <span class="flaticon-interface"></span>
                                            </div>
                                            <div class="text-holder">
                                                <h5>supporeyecare@gmail.com</h5>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="icon-holder">
                                                <span class="flaticon-technology-1"></span>
                                            </div>
                                            <div class="text-holder">
                                                <h5>0936971273</h5>
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
                            <div class="row" style="display: flex;">
                                <div class="sec-title">
                                    <h1>Meet Our Dentist</h1>
                                    <span class="border"></span>
                                </div>
                                <div class="pagination-container" style="margin-left: auto;">
                                    <label for="pageSize">Show:</label>
                                    <select name="pageSize" id="pageSize" style="width: 55px; height: 30px">
                                        <option value="6" selected>6</option>
                                        <option value="9">9</option>
                                        <option value="12">12</option>
                                    </select>
                                    <label for="pageSize">doctors per page</label>
                                </div>
                            </div>

                            <div class="row" id="doctorList">
                                <!-- Doctors will be loaded here via AJAX -->
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
                                                <fmt:setLocale value="en" />
                                                <p>Rating: <fmt:formatNumber value="${d.rating}" type="number" maxFractionDigits="1" minFractionDigits="1" /></p>
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

                            <!-- Pagination -->
                            <div class="pagination" id="pagination">
                                <!-- Pagination will be loaded here via AJAX -->

                                <!-- Pagination -->
                                <div class="pagination" id="pagination">
                                    <c:if test="${currentPage > 1}">
                                        <a href="#" data-page="${currentPage - 1}">&laquo; Previous</a>
                                    </c:if>

                                    <c:forEach begin="1" end="${totalPages}" var="page">
                                        <a href="#" data-page="${page}" class="${page == currentPage ? 'active' : ''}">
                                            ${page}
                                        </a>
                                    </c:forEach>

                                    <c:if test="${currentPage < totalPages}">
                                        <a href="#" data-page="${currentPage + 1}">Next &raquo;</a>
                                    </c:if>
                                </div>

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

    <script>
        function loadDoctors(page = 1) {
            let pageSize = document.getElementById("pageSize").value;
            $.ajax({
                url: "listDoctors",
                type: "GET",
                data: {
                    sid: "${param.sid}",
                    deid: "${param.deid}",
                    searchName: "${param.searchName}",
                    sortBy: "${param.sortBy}",
                    option: "${param.option}",
                    page: page,
                    pageSize: pageSize
                },
                success: function (response) {
                    $("#doctorList").html($(response).find("#doctorList").html());
                    $("#pagination").html($(response).find("#pagination").html());
                }
            });
        }

// Lắng nghe sự kiện thay đổi số lượng bác sĩ mỗi trang
        $(document).on("change", "#pageSize", function () {
            loadDoctors();
        });

// Lắng nghe sự kiện click vào các liên kết phân trang
        $(document).on("click", ".pagination a", function (e) {
            e.preventDefault();
            let page = $(this).attr("data-page");
            if (page) {
                loadDoctors(page);
            }
        });

// Tải dữ liệu ban đầu khi trang được load
        $(document).ready(function () {
            loadDoctors();
        });

    </script>
</body>
</html>