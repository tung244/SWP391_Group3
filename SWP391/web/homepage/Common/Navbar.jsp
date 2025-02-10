<%-- 
    Document   : Navbar
    Created on : Jan 13, 2025, 5:00:19 PM
    Author     : fptshop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<section class="top-bar-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="language-switcher">
                    <div id="polyglotLanguageSwitcher">
                        <form action="#">
                            <select id="polyglot-language-options">
                                <option id="en" value="en" selected>English</option>
                                <option id="fr" value="fr">French</option>
                                <option id="de" value="de">German</option>
                                <option id="it" value="it">Italian</option>
                                <option id="es" value="es">Spanish</option>
                            </select>
                        </form>
                    </div>
                </div> 
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="logo text-center">
                    <a href="index.html">
                        <img src="homepage/images/resources/logo.png" alt="Awesome Logo">
                    </a>
                </div>   
            </div>
            <c:if test="${empty sessionScope.user}">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="top-social-links">
                        <ul style="font-size: 16px; margin-top: 15px">
                            <!-- <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li> -->

                            <li>
                                <a href="login" style="color: rgb(34,139,34)">
                                    <i style="margin-right: 5px;vertical-align: middle;" class="bx bxs-user"></i>Login /
                                </a>
                            </li>
                            <li style="margin-left: 0;">
                                <a href="login" style="color: rgb(34,139,34)">Register</a>
                            </li>


                        </ul>
                    </div>     
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="display: flex; justify-content: end; margin-top: 10px;">
                <div style="position: relative; display: inline-block; width: 225px;">
                    
                    <div id="dropdown-title" 
                         style="background-color: white; border: white; padding: 8px;
                         border-radius: 6px; display: flex; align-items: center;
                         gap: 10px; cursor: pointer; box-shadow: none;">
                        <img src="${userProfile.image_profile_user}" alt="Icon" style="width: 35px; height: 35px; border-radius: 40px">
                        <span style="color: black;">Hello ${sessionScope.user.fullname}<i class='bx bx-chevron-down'></i></span>
                    </div>

                    
                    <ul id="dropdown-menu" 
                        style="list-style: none; padding: 0; margin: 0;
                        position: absolute; top: 100%; left: 0; width: 100%;
                        background-color: white; border: 1px solid #ddd;
                        border-radius: 6px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                        display: none; z-index: 1000; padding: 20px; color:black; font-size: 16px">
                        <li style="padding: 4px; cursor: pointer;" ><a href="userprofile"><i style="margin-right: 10px" class='bx bxs-user'></i>Thông tin tài khoản</a></li>
                        <li style="padding: 4px; cursor: pointer;" ><a href="transactionhistoryy"><i style="margin-right: 10px" class='bx bx-history' ></i>Lịch sử dịch vụ<a></li>
                        <li style="padding: 4px; cursor: pointer;" ><a href="changepassword.jsp"><i style="margin-right: 10px" class='bx bxs-edit'></i>Đổi mật khẩu</a></li>
                        <li style="border-top: 1px solid #ddd; margin: 4px 0;"></li>
                        <li style="padding: 4px; cursor: pointer;" ><a href="logout"><i style="margin-right: 10px" class='bx bx-log-in'></i>Đăng xuất</a></li>
                    </ul>
                </div>
                </div>
            </c:if>

        </div>
    </div>
</section>
<!--End Top bar area -->

<!--Start mainmenu area-->
<section class="mainmenu-area stricky">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="left pull-left">
                    <!--Start mainmenu-->
                    <nav class="main-menu">
                        <div class="navbar-header">   	
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="navbar-collapse collapse clearfix">
                            <ul class="navigation clearfix">
                                <li class="current"><a href="index.html">Home</a></li>
                                <li class="dropdown"><a href="about.html">About Us</a>
                                    <ul>
                                        <li><a href="about.html">About Dentalcare</a></li>
                                        <li><a href="listdoctor.jsp">Meet Our Dentist</a></li>
                                        <li><a href="special-offers.html">Special Offers</a></li>
                                        <li><a href="faq.html">FAQâs</a></li>
                                        <li><a href="testimonials.html">Testimonials</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="services.html">Services</a>
                                    <ul>
                                        <li><a href="root-canel.html">Root Canel</a></li>
                                        <li><a href="clips-braces.html">Clips & Braces</a></li>
                                        <li><a href="dental-implant.html">Dental Implant</a></li>
                                        <li><a href="teeth-whitening.html">Teeth Whitening</a></li>
                                        <li><a href="tooth-jewellery.html">Tooth Jewellery</a></li>
                                        <li><a href="teeth-filling.html">Teeth Filling</a></li>
                                    </ul>
                                </li>
                                <li><a href="appointment.html">Appointment</a></li>
                                <li class="dropdown"><a href="gallery.html">Gallery</a>
                                    <ul>
                                        <li><a href="gallery.html">Gallery Before After</a></li>
                                        <li><a href="gallery-grid.html">Gallery Grid View</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="blog.html">Blog</a>
                                    <ul>
                                        <li><a href="blog.html">Blog Default</a></li>
                                        <li><a href="blog-with-sidebar.html">Blog With Sidebar</a></li>
                                        <li><a href="blog-single.html">Blog Single Post</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                        </div>
                    </nav>
                    <!--End mainmenu-->
                    <!--Start outer serach box-->
                    <div class="outer-search-box">
                        <div class="seach-toggle"><i class="fa fa-search"></i></div>
                        <ul class="search-box">
                            <li>
                                <form method="post" action="index.html">
                                    <div class="form-group">
                                        <input type="search" name="search" placeholder="Search Here" required>
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                    </div>
                    <!--End outer serach box-->
                </div>
                <div class="right pull-right">
                    <div class="icon-box">
                        <span class="flaticon-technology-1"></span>
                    </div>
                    <div class="title-box">
                        <h3>Call Us: 1-800-901-234</h3>
                    </div>    
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    const dropdownTitle = document.getElementById('dropdown-title');
    const dropdownMenu = document.getElementById('dropdown-menu');

    dropdownTitle.addEventListener('click', () => {
        const isMenuVisible = dropdownMenu.style.display === 'block';
        dropdownMenu.style.display = isMenuVisible ? 'none' : 'block';
    });

    document.addEventListener('click', (event) => {
        if (!dropdownTitle.contains(event.target) && !dropdownMenu.contains(event.target)) {
            dropdownMenu.style.display = 'none';
        }
    });
</script>

