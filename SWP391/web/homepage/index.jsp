<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

            <!--Start rev slider wrapper-->     
            <section class="rev_slider_wrapper">
                <div id="slider1" class="rev_slider"  data-version="5.0">
                    <ul>
                        <c:forEach var="blist" items="${blist}">
                            <li data-transition="random">
                                <img src="${blist.link_banner}"  alt="" width="1920" height="600" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >

                                <div class="tp-caption  tp-resizeme" 
                                     data-x="left" data-hoffset="0" 
                                     data-y="top" data-voffset="165" 
                                     data-transform_idle="o:1;"         
                                     data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                                     data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                                     data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                                     data-splitin="none" 
                                     data-splitout="none"
                                     data-responsive_offset="on"
                                     data-start="1500">
                                    <div class="slide-content-box content-box mar-lft">
                                        <h1>${blist.banner_title}</h1>
                                        <p style="max-width: 650px; word-wrap: break-word; white-space: normal;">${blist.banner_description}</p>
                                        <div class="button">
                                            <a class="thm-btn" href="#">Read More</a>       
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                        <!--                            <div class="tp-caption tp-resizeme" 
                                                         data-x="right" data-hoffset="0" 
                                                         data-y="bottom" data-voffset="0" 
                                                         data-transform_idle="o:1;"                         
                                                         data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                                                         data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                                                         data-splitin="none" 
                                                         data-splitout="none" 
                                                         data-responsive_offset="on"
                                                         data-start="2900">
                                                        <div class="slide-content-box">
                                                            <div class="img-holder">  
                                                                <img src="homepage/images/slides/slide-1-img.png" alt="Awesome Image">   
                                                            </div>
                                                        </div>
                                                    </div>-->

                        <!--                        <li data-transition="fade">
                                                    <img src="homepage/images/slides/2.jpg"  alt="" width="1920" height="600" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                        
                                                    <div class="tp-caption  tp-resizeme" 
                                                         data-x="right" data-hoffset="0" 
                                                         data-y="top" data-voffset="165" 
                                                         data-transform_idle="o:1;"         
                                                         data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                                                         data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                                                         data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                                                         data-splitin="none" 
                                                         data-splitout="none"
                                                         data-responsive_offset="on"
                                                         data-start="700">
                                                        <div class="slide-content-box content-box">
                                                            <h3>World Class Treatments With</h3>
                                                            <h1>Quality & Affortable</h1>
                                                            <p>Explain to you how all this mistaken idea  denouncing  was<br>born in our clinic you a complete.</p>
                                                            <div class="button">
                                                                <a class="thm-btn bgclr-1" href="#">Special Offers</a>       
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tp-caption tp-resizeme" 
                                                         data-x="left" data-hoffset="0" 
                                                         data-y="bottom" data-voffset="0" 
                                                         data-transform_idle="o:1;"                         
                                                         data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                                                         data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                                                         data-splitin="none" 
                                                         data-splitout="none" 
                                                         data-responsive_offset="on"
                                                         data-start="2900">
                                                        <div class="slide-content-box">
                                                            <div class="img-holder">  
                                                                <img src="homepage/images/slides/slide-2-img.png" alt="Awesome Image">   
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>-->
                        <!--                        <li data-transition="random">
                                                    <img src="homepage/images/slides/3.jpg"  alt="" width="1920" height="600" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                        
                                                    <div class="tp-caption  tp-resizeme" 
                                                         data-x="left" data-hoffset="0" 
                                                         data-y="top" data-voffset="165" 
                                                         data-transform_idle="o:1;"         
                                                         data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                                                         data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                                                         data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                                                         data-splitin="none" 
                                                         data-splitout="none"
                                                         data-responsive_offset="on"
                                                         data-start="1500">
                                                        <div class="slide-content-box content-box mar-lft">
                                                            <h3>Regain your confidence with</h3>
                                                            <h1>Dental Implants</h1>
                                                            <p>Explain to you how all this mistaken idea  denouncing  was <br>born in our clinic you a complete.</p>
                                                            <div class="button">
                                                                <a class="thm-btn bgclr-1" href="#">Meet Dentist</a>       
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tp-caption tp-resizeme" 
                                                         data-x="right" data-hoffset="0" 
                                                         data-y="bottom" data-voffset="0" 
                                                         data-transform_idle="o:1;"                         
                                                         data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                                                         data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                                                         data-splitin="none" 
                                                         data-splitout="none" 
                                                         data-responsive_offset="on"
                                                         data-start="2900">
                                                        <div class="slide-content-box">
                                                            <div class="img-holder">  
                                                                <img src="homepage/images/slides/slide-3-img.png" alt="Awesome Image">   
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>-->
                    </ul>
                </div>
            </section>
            <!--End rev slider wrapper-->

            <!--Start welcome area-->
            <section class="welcome-area">
                <div class="container">
                    <div class="sec-title text-center">
                        <h1>Chào mừng đến với Eyecare</h1>
                        <span class="border"></span>
                    </div>
                    <div class="row">
                        <!--Start single item-->
                        <div class="col-md-4">
                            <div class="single-item text-center">
                                <div class="icon-holder">
                                    <img src="homepage/images/icon/crown.png" style="margin-bottom: 25px; height: 50px!important"/>
                                    <!--                                    <span><i style="font-size: 65px; color: rgb(228, 173, 19); margin-bottom: 25px;" class='bx bx-crown'></i></span>-->
                                </div>
                                <div class="text-holder">
                                    <h3>Dịch vụ cao cấp</h3>
                                    <p>Chúng tôi mang đến dịch vụ nhãn khoa tiêu chuẩn quốc tế, đảm bảo mỗi bệnh nhân được chăm sóc tận tâm với phương pháp điều trị tiên tiến.</p>
                                </div>
                            </div>
                        </div>
                        <!--End single item-->
                        <!--Start single item-->
                        <div class="col-md-4">
                            <div class="single-item text-center">
                                <div class="icon-holder">
                                    <!--                                    <span><i style="font-size: 65px; color: rgb(228, 173, 19); margin-bottom: 25px" class='bx bx-user-check'></i></span>-->
                                    <img src="homepage/images/icon/checked.png" style="margin-bottom: 25px; height: 50px!important"/>
                                </div>
                                <div class="text-holder">
                                    <h3>Bác sĩ chuyên môn cao</h3>
                                    <p>Đội ngũ bác sĩ giàu kinh nghiệm, luôn áp dụng những phương pháp hiện đại nhất để bảo vệ và cải thiện thị lực cho bệnh nhân.</p>
                                </div>
                            </div>
                        </div>
                        <!--End single item-->
                        <!--Start single item-->
                        <div class="col-md-4">
                            <div class="single-item text-center">
                                <div class="icon-holder">

                                    <img src="homepage/images/icon/machine.png" style="margin-bottom: 25px; height: 50px!important"/>
                                </div>
                                <div class="text-holder">
                                    <h3>Trang thiết bị hiện đại</h3>
                                    <p>Hệ thống máy móc tiên tiến giúp chẩn đoán chính xác và điều trị hiệu quả, mang lại đôi mắt sáng khỏe cho mọi bệnh nhân.</p>
                                </div>
                            </div>
                        </div>
                        <!--End single item-->
                    </div>
                </div>
            </section>
            <!--End welcome area-->

            <!--Start special services area-->
            <section class="special-services-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="top">
                                <div class="sec-title pull-left">
                                    <h1>Hệ thống trang thiết bị tân tiếng</h1>
                                    <span class="border"></span>
                                    <div class="text-box">
                                        <h3>Trải nghiệm dịch vụ y tế Nhật Bản ngay tại Việt Nam</h3>
                                        <p>“Là bệnh viện chuyên khoa mắt với 100% vốn đầu tư từ Nhật Bản, hệ thống máy móc hiện đại cùng đội ngũ Bác sỹ giàu kinh nghiệm, chúng tôi mang đến những phương pháp điều trị tiên tiến và dịch vụ chuẩn quốc tế ngay tại Việt Nam. Hỗ trợ chi phí tối đa cho bệnh nhân với chương trình trả góp.”</p>
                                    </div>
                                </div>
                                <div class="icon-box pull-right">
                                    <img src="homepage/images/services/icon.png" alt="Icon">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="service-carousel">
                                <!--Start single item-->
                                <c:forEach var="machine" items="${machine}">
                                    <div class="single-service-item text-center wow fadeInUp" data-wow-delay="0.5s" data-wow-duration="1s" data-wow-offset="0">
                                        <div class="img-holder">
                                            <img src="${machine.machine_img}"style="width: 300px; height: 300px" alt="Awesome Image">
                                            <div class="overlay-style-one">
                                                <div class="box">
                                                    <div class="content">
                                                        <p style="display: -webkit-box;
                                                           -webkit-line-clamp: 6;
                                                           -webkit-box-orient: vertical;
                                                           overflow: hidden;
                                                           text-overflow: ellipsis;font-size: 15px; line-height: 1.5">${machine.machine_description}</p>
                                                        <a href="#">Read More<i class="fa fa-caret-right" aria-hidden="true"></i></a>    
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="title-holder">
                                            <a href="#"><h3>${machine.machine_name}</h3></a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--End single item-->
                                <!--                                Start single item
                                                                <div class="single-service-item text-center wow fadeInUp" data-wow-delay="0.5s" data-wow-duration="1s" data-wow-offset="0">
                                                                    <div class="img-holder">
                                                                        <img src="homepage/images/services/2.jpg" alt="Awesome Image">
                                                                        <div class="overlay-style-one">
                                                                            <div class="box">
                                                                                <div class="content">
                                                                                    <p>Expound the actual teachings the great explorer of the truth, the master  builder of human happiness with smile.</p>
                                                                                    <a href="#">Read More<i class="fa fa-caret-right" aria-hidden="true"></i></a>    
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="icon-box">
                                                                            <div class="icon">
                                                                                <span class="flaticon-medical-3"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="title-holder">
                                                                        <a href="#"><h3>Clips & Braces</h3></a>
                                                                    </div>
                                                                </div>
                                                                End single item
                                                                Start single item
                                                                <div class="single-service-item text-center wow fadeInUp" data-wow-delay="0.5s" data-wow-duration="1s" data-wow-offset="0">
                                                                    <div class="img-holder">
                                                                        <img src="homepage/images/services/3.jpg" alt="Awesome Image">
                                                                        <div class="overlay-style-one">
                                                                            <div class="box">
                                                                                <div class="content">
                                                                                    <p>Expound the actual teachings the great explorer of the truth, the master  builder of human happiness with smile.</p>
                                                                                    <a href="#">Read More<i class="fa fa-caret-right" aria-hidden="true"></i></a>    
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="icon-box">
                                                                            <div class="icon">
                                                                                <span class="flaticon-medical-4"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="title-holder">
                                                                        <a href="#"><h3>Dental Implant</h3></a>
                                                                    </div>
                                                                </div>-->
                                <!--End single item-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--End special services area-->
            <section style="background: white" class="team-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="sec-title">
                                <h1 style="color: rgb(34,139,34)">Chăm sóc tận tình, quan tâm chu đáo</h1>                        
                                <span class="border"></span>
                                <p style="max-width: 800px">“Chúng tôi đặt mình vào vị trí của người bệnh để thấu hiểu, chia sẻ và cảm thông. Đồng thời chúng tôi mang đến dịch vụ y tế toàn diện giúp người bệnh có thể an tâm thăm khám và phẫu thuật ngay cả khi không có người thân đi cùng.”</p>
                                <div style="margin:60px 20px;" class="row">
                                    <div class="col-md-4">
                                        <h3 style="font-weight: 800; font-size: 30px">250000+</h3>
                                        <p>Lượt thăm khám</p>
                                    </div>
                                    <div class="col-md-4">
                                        <h3 style="font-weight: 800; font-size: 30px">30000+</h3>
                                        <p>Ca phẫu thuật</p>
                                    </div>
                                    <div class="col-md-4">
                                        <h3 style="font-weight: 800; font-size: 30px">99%</h3>
                                        <p>Bệnh nhân hài lòng</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <img style="margin-left: 100px" src="https://res.cloudinary.com/djmftornv/image/upload/v1738786681/xtfsxazm9smcqmtcffbh.svg"/>
                            
                        </div>
                    </div>

                </div>
            </section>
            <section class="team-area">
                <div class="container">
                    <div class="sec-title">
                        <h1 >Tận tâm, uyên bác và chu đáo</h1>                        
                        <span class="border"></span>
                        <p style="max-width: 800px">EyeCare hội tụ các bác sỹ nhãn khoa giàu kinh nghiệm đến từ Việt Nam và Nhật Bản, thường xuyên cập nhật các công nghệ, phương pháp điều trị mới trong nhãn khoa thông qua các khóa đào tạo, các hội thảo trong nước và quốc tế.</p>

                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="team-carousel">
                                <!--Start single team member-->
                                <c:forEach var="doctor" items="${doctor}">
                                    <div class="single-team-member">
                                        <div class="img-holder">
                                            <img src="${doctor.profile_image}" alt="Awesome Image">
                                            <div class="overlay-one">
                                                <div class="overlay-inner">
                                                    <div class="content"></div>
                                                </div>
                                            </div>
                                            <ul class="member-social-info">
                                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="text-holder text-center">
                                            <h3>${doctor.doctor_name}</h3>
                                            <span>${doctor.specialization.specialization_name}</span>
                                            <p>Rating: ${doctor.rating}</p>
                                            <p>Gender: ${doctor.gender}</p>
                                            <p>Experience years: ${doctor.experience_years}</p>
                                            <span class="border"></span>
                                            <a href="#">View Profile<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        </div>    
                                    </div> 
                                </c:forEach>
                                <!--End single team member-->

                            </div> 
                        </div>
                    </div>
                </div>
            </section>
            <!--Start appoinment area-->
            
            <!--End appoinment area-->

            <!--Start about us area-->
            <section class="about-us-area">
                <div class="container">
                    <div class="sec-title text-center">
                        <h1>Về chúng tôi</h1>
                        <span class="border"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="left-content">
                                <div class="row">
                                    <!--Start single item-->
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="single-item">
                                            <img src="https://res.cloudinary.com/djmftornv/image/upload/v1738785321/s2otsvd9tmujvxlvfcov.jpg" style="width: 270px;height:180px" alt="Awesome Image">
                                        </div>
                                    </div>
                                    <!--End single item-->
                                    <!--Start single item-->
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="single-item">
                                            <img src="https://res.cloudinary.com/djmftornv/image/upload/v1738785139/sm5hhfiifljtdg8bqmte.png" alt="Awesome Image">
                                        </div>
                                    </div>
                                    <!--End single item-->
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text">
                                            <p>Chúng tôi đã xây dựng được danh tiếng vững chắc trong lĩnh vực nhãn khoa, với đội ngũ chuyên gia kỹ thuật đa ngành giàu kinh nghiệm.</p>
                                            <p class="mar-top">Không ai mong muốn gặp vấn đề về thị lực, nhưng đôi khi, trong những hoàn cảnh nhất định, việc trải qua điều trị là cần thiết để bảo vệ và cải thiện đôi mắt của bạn.</p>
                                            <div class="button">
                                                <a class="thm-btn bg-1" href="#">Meet Doctors</a>
                                                <div class="signature">
                                                    <img src="homepage/images/about/signature.jpg" alt="Signature">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </div>
                        <div class="col-md-6">
                            <div class="right-content">
                                <div class="row">
                                    <!--Start single item-->
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="single-item">
                                            <div class="icon-holder">
                                                <span class="flaticon-social"></span>
                                            </div>
                                            <div class="text">
                                                <h3>Đội ngũ bác sĩ chất lượng cao</h3>
                                                <p>Mang lại lợi ích từ những nỗ lực chăm sóc sức khỏe tận tâm.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End single item-->
                                    <!--Start single item-->
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="single-item">
                                            <div class="icon-holder">
                                                <span class="flaticon-edit"></span>
                                            </div>
                                            <div class="text">
                                                <h3>Chuẩn đoán chính xác</h3>
                                                <p>Mang lại lợi ích từ những nỗ lực chăm sóc sức khỏe tận tâm.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End single item-->
                                </div>
                                <div class="row">
                                    <!--Start single item-->
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="single-item">
                                            <div class="icon-holder">
                                                <span class="flaticon-book"></span>
                                            </div>
                                            <div class="text">
                                                <h3>Phòng khám giá cả phải chăng </h3>
                                                <p>Mang lại lợi ích từ những nỗ lực chăm sóc sức khỏe tận tâm.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End single item-->
                                    <!--Start single item-->
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="single-item">
                                            <div class="icon-holder">
                                                <span class="flaticon-tool"></span>
                                            </div>
                                            <div class="text">
                                                <h3>Trang thiết bị hiện đại</h3>
                                                <p>Mang lại lợi ích từ những nỗ lực chăm sóc sức khỏe tận tâm.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End single item-->
                                </div>
                            </div>    
                        </div>  

                    </div>
                </div>
            </section>
            <!--End about us area-->
            <section class="appoinment-area" style="background-image:url(homepage/images/resources/appoinment-bg.jpg);">
                <div class="container inner-content">
                    <div class="row">
                        <div class="col-md-7 col-sm-12 col-xs-12">
                            <div class="img-holder">
                                <img src="https://res.cloudinary.com/djmftornv/image/upload/v1738783922/tfuhq2nfw3qpisealypf.png" style="height: 450px; margin-top: 25px" alt="Awesome Image">
                            </div>    
                        </div>
                        <div class="col-md-5 col-sm-12 col-xs-12">
                            <div class="appoinment">
                                <div class="sec-title">
                                    <h1 style="font-weight: 700">Đặt lịch ngay !</h1>
                                    <span class="border"></span>
                                    <div class="text-box">
                                        <p>"Chúng tôi không cần bạn phải lo nghĩ điều gì là tốt nhất cho mình. Chúng tôi đã biết và sẽ làm mọi thứ để hỗ trợ bạn."</p>
                                    </div>
                                </div>
                                <form class="appoinment-form">
                                    <div class="row">
                                        <div class="col-md-6">   
                                            <div class="field-input">
                                                <input type="text" name="form_name" value="" placeholder="Name" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">   
                                            <div class="field-input">
                                                <input type="text" name="form_phnnumber" value="" placeholder="Ph Num" required="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">   
                                            <div class="field-input">
                                                <input type="text" name="date" placeholder="Date" id="datepicker">
                                                <div class="icon-box">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">   
                                            <div class="field-input">
                                                <input type="text" name="time" placeholder="Time">
                                                <div class="icon-box">
                                                    <i class="fa fa-clock-o" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button class="thm-btn bg-1" type="submit">Make an Appointment</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--Start team area-->
            
            <!--End team area-->
            
            <!--Start newsletter area-->
<!--            <section class="newsletter-area" style="background-image:url(homepage/images/resources/newsletter-bg.jpg);">
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
            </section>     -->
            <!--End newsletter area-->  

            <!--Start testimonial area-->
            <section class="testimonial-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="left-content">
                                <div class="sec-title">
                                    <h1 style="color: rgb(34,139,34); font-weight: 500">Khách hàng nghĩ gì<br> về chúng tôi</h1>
                                    <span class="border"></span>
                                </div>
                                <div class="text-holder">
                                    <p>Cách mà tất cả những quan niệm sai lầm về việc lên án niềm vui và ca ngợi nỗi đau ra đời, tôi sẽ kể cho bạn nghe một cách đầy đủ về hệ thống này và giải thích rõ ràng.</p>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="testimonial-carousel">
                                <!--Start single item-->
                                <c:forEach var="content" items="${content}">
                                <div class="single-item">
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-12">
                                            <div class="img-holder">
                                                <img src="${content.image_patient}" alt="Awesome Image">
                                                <div class="client-name text-center"> <h3>${content.patient_name}</h3> </div>
                                            </div>
                                        </div>
                                        <div class="col-md-7 col-sm-7 col-xs-12">
                                            <div class="text-holder">
                                                <div class="quote-icon">
                                                    <i class="fa fa-quote-right" aria-hidden="true"></i>
                                                </div>
                                                <h3>Vô cùng thích về chất lượng dịch vụ</h3>
                                                <p>${content.content_stories}</p>
                                                <div class="review-box">
                                                    <ul>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <!--End single item-->
<!--                                Start single item
                                <div class="single-item">
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-12">
                                            <div class="img-holder">
                                                <img src="homepage/images/testimonial/large-testimonial.jpg" alt="Awesome Image">
                                                <div class="client-name text-center"> <h3>Stephan Vanel</h3> <p>Newyork</p> </div>
                                            </div>
                                        </div>
                                        <div class="col-md-7 col-sm-7 col-xs-12">
                                            <div class="text-holder">
                                                <div class="quote-icon">
                                                    <i class="fa fa-quote-right" aria-hidden="true"></i>
                                                </div>
                                                <h3>Surprised at the excellent facilities</h3>
                                                <p>I was pleasantly surprised at the excellent facilities at Dentalcare and the wonderful job they do. They have an answer for all your Dental Care Needs which is very gratifying.</p>
                                                <div class="review-box">
                                                    <ul>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                                <!--End single item-->
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!--End testimonial area-->

            <!--Start Brand area-->  
            <section class="brand-area">
                <div class="container">
                    <div class="sec-title text-center">
                        <h1>Supporting Partners</h1>
                        <span class="border"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="brand">
                                <!--Start single item-->
                                <div class="single-item">
                                    <a href="#"><img src="homepage/images/brand/1.png" alt="Awesome Brand Image"></a>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <a href="#"><img src="homepage/images/brand/2.png" alt="Awesome Brand Image"></a>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <a href="#"><img src="homepage/images/brand/3.png" alt="Awesome Brand Image"></a>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <a href="#"><img src="homepage/images/brand/4.png" alt="Awesome Brand Image"></a>
                                </div>
                                <!--End single item-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--End Brand area-->        

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
                                            <img src="homepage/images/footer/latest-work-1.jpg" alt="Awesome Image">
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
                                            <img src="homepage/images/footer/latest-work-2.jpg" alt="Awesome Image">
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
                                            <img src="homepage/images/footer/latest-work-3.jpg" alt="Awesome Image">
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
                                            <img src="homepage/images/footer/latest-work-4.jpg" alt="Awesome Image">
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
                                            <img src="homepage/images/footer/latest-work-5.jpg" alt="Awesome Image">
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
                                            <img src="homepage/images/footer/latest-work-6.jpg" alt="Awesome Image">
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
                                    <p>Copyrights Â© 2017 All Rights Reserved by <a href="#">Dentalcare.</a></p> 
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