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
                <!--                <div class="language-switcher">
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
                                </div> -->
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="logo text-center">
                    <a href="trangchu">
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
                                <a href="register" style="color: rgb(34,139,34)">Register</a>
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
                            <img src="${user.image_profile_user}" alt="Icon" style="width: 35px; height: 35px; border-radius: 40px">
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
                                        <li style="padding: 4px; cursor: pointer;" ><a href="changeNewpassword"><i style="margin-right: 10px" class='bx bxs-edit'></i>Đổi mật khẩu</a></li>
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
                                                                    <li class="current"><a href="trangchu">Home</a></li>
                                                                    <li class="dropdown"><a href="about.html">About Us</a>
                                                                        <ul>
                                                                            <li><a href="about.html">About Dentalcare</a></li>

                                                                            <li><a href="listDoctors">Meet Our Dentist</a></li>
                                                                            <li><a href="list_machine">Machine</a></li>
                                                                            <!--                                                                            <li><a href="special-offers.html">Special Offers</a></li>
                                                                                                                                                        <li><a href="faq.html">FAQâs</a></li>
                                                                                                                                                        <li><a href="testimonials.html">Testimonials</a></li>-->
                                                                        </ul>
                                                                    </li>

                                                                    <li class="dropdown">
                                                                        <a href="loadService">Services</a>
                                                                        <ul class="mega-menu-container" 
                                                                            style="display: flex; position: absolute; top: 100%; left: 0; width: 400px;
                                                                            background: #f5f5f5; border-radius: 6px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                                                                            overflow: hidden; display: none; padding: 15px;">

                                                                            <!-- Cột menu trái -->
                                                                            <li class="menu-left" style="width: 100%; padding: 10px;">

                                                                                <!-- Phẫu thuật khúc xạ -->
                                                                                <ul class="menu-item" data-target="surgery1"
                                                                                    style="padding: 12px; cursor: pointer; font-size: 16px; font-weight: 500;
                                                                                    display: flex; justify-content: space-between; align-items: center;">
                                                                                    <span>Phẫu thuật khúc xạ</span> 
                                                                                    <i class="fas fa-chevron-right"></i>
                                                                                </ul>
                                                                                <ul class="menu-right submenu" id="surgery1" style="padding-left: 30px; display: none;">
                                                                                    <li>Phẫu thuật Phakic</li>
                                                                                    <li>Phẫu thuật Relex Smile</li>
                                                                                    <li>Phẫu thuật Femtosecond Lasik</li>
                                                                                    <li>Phẫu thuật SBK Lasik</li>
                                                                                </ul>

                                                                                <!-- Phẫu thuật đục thủy tinh thể -->
                                                                                <ul class="menu-item" data-target="surgery2"
                                                                                    style="padding: 12px; cursor: pointer; font-size: 16px; font-weight: 500;
                                                                                    display: flex; justify-content: space-between; align-items: center;">
                                                                                    <span>Phẫu thuật đục thủy tinh thể</span> 
                                                                                    <i class="fas fa-chevron-right"></i>
                                                                                </ul>
                                                                                <ul class="menu-right submenu" id="surgery2" style="padding-left: 30px; display: none;">
                                                                                    <li>Phẫu thuật nội nhãn</li>
                                                                                    <li>Phẫu thuật laser</li>
                                                                                </ul>

                                                                                <!-- Điều trị bệnh võng mạc -->
                                                                                <ul class="menu-item" data-target="treatment1"
                                                                                    style="padding: 12px; cursor: pointer; font-size: 16px; font-weight: 500;
                                                                                    display: flex; justify-content: space-between; align-items: center;">
                                                                                    <span>Điều trị bệnh võng mạc</span> 
                                                                                    <i class="fas fa-chevron-right"></i>
                                                                                </ul>
                                                                                <ul class="menu-right submenu" id="treatment1" style="padding-left: 30px; display: none;">
                                                                                    <li>Điều trị Glôcôm</li>
                                                                                    <li>CrossLinking - Gia cố giác mạc</li>
                                                                                </ul>

                                                                            </li>
                                                                        </ul>

                                                                    </li>


                                                                    <li><a href="appointment">Appointment</a></li>
                                                                    <!--                                                                    <li class="dropdown"><a href="gallery.html">Gallery</a>
                                                                                                                                            <ul>
                                                                                                                                                <li><a href="gallery.html">Gallery Before After</a></li>
                                                                                                                                                <li><a href="gallery-grid.html">Gallery Grid View</a></li>
                                                                                                                                            </ul>
                                                                                                                                        </li>-->
                                                                    <li class="dropdown"><a href="bloghome">Blog</a>

                                                                    </li>
                                                                    <li><a href="contact.html">Contact Us</a></li>
                                                                </ul>
                                                            </div>
                                                        </nav>
                                                        <!--End mainmenu-->
                                                        <!--Start outer serach box-->
                                                        <!--                                                        <div class="outer-search-box">
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
                                                                                                                </div>-->
                                                        <!--End outer serach box-->
                                                    </div>
                                                    <div class="right pull-right">
                                                        <div class="icon-box">
                                                            <span class="flaticon-technology-1"></span>
                                                        </div>
                                                        <div class="title-box">
                                                            <h3>093-697-1273</h3>
                                                        </div>    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>

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
                                                                    <h3>KM29 Láng Hòa Lạc</h3>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="iocn-holder">
                                                                    <span class="flaticon-interface"></span>
                                                                </div>
                                                                <div class="text-holder">
                                                                    <h3>supporeyecare@gmail.com</h3>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="iocn-holder">
                                                                    <span class="flaticon-clock"></span>
                                                                </div>
                                                                <div class="text-holder">
                                                                    <h3>Giờ mở cửa: 07.00am đến 18.00pm</h3>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </header>  
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
                                        document.querySelectorAll('.menu-item').forEach(item => {
                                            item.addEventListener('mouseover', function () {
                                                // Ẩn tất cả submenu
                                                document.querySelectorAll('.menu-right').forEach(sub => sub.style.display = 'none');

                                                // Hiển thị submenu của mục đang hover
                                                const targetMenu = document.getElementById(this.getAttribute('data-target'));
                                                if (targetMenu) {
                                                    targetMenu.style.display = 'block';
                                                }
                                            });
                                        });

                                    </script>


