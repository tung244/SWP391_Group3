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

            <!--Start rev slider wrapper-->     
            <section class="rev_slider_wrapper">
                <div id="slider1" class="rev_slider"  data-version="5.0">
                    <ul>
                        <li data-transition="random">
                            <img src="images/slides/1.jpg"  alt="" width="1920" height="600" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >

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
                                    <h3>Welcome to the Dentalcare</h3>
                                    <h1>Your smiles with us</h1>
                                    <p>Explain to you how all this mistaken idea  denouncing  was<br>born in our clinic you a complete.</p>
                                    <div class="button">
                                        <a class="thm-btn" href="#">Read More</a>       
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
                                        <img src="images/slides/slide-1-img.png" alt="Awesome Image">   
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li data-transition="fade">
                            <img src="images/slides/2.jpg"  alt="" width="1920" height="600" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >

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
                                        <img src="images/slides/slide-2-img.png" alt="Awesome Image">   
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li data-transition="random">
                            <img src="images/slides/3.jpg"  alt="" width="1920" height="600" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >

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
                                        <img src="images/slides/slide-3-img.png" alt="Awesome Image">   
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
            <!--End rev slider wrapper-->

            <!--Start welcome area-->
            <section class="welcome-area">
                <div class="container">
                    <div class="sec-title text-center">
                        <h1>Welcome to Dentalcare</h1>
                        <span class="border"></span>
                    </div>
                    <div class="row">
                        <!--Start single item-->
                        <div class="col-md-4">
                            <div class="single-item text-center">
                                <div class="icon-holder">
                                    <span class="flaticon-medical-6"></span>
                                </div>
                                <div class="text-holder">
                                    <h3>General & Cosmetic</h3>
                                    <p>The master-builder of human happiness one reject, dislikes avoid all our pleasure itself because it is pleasure pursue.</p>
                                </div>
                            </div>
                        </div>
                        <!--End single item-->
                        <!--Start single item-->
                        <div class="col-md-4">
                            <div class="single-item text-center">
                                <div class="icon-holder">
                                    <span class="flaticon-medical-8"></span>
                                </div>
                                <div class="text-holder">
                                    <h3>Dental Surgeries</h3>
                                    <p>Pleasure and praising pain was born will give a complete account the systems expound eachings of great explorer.</p>
                                </div>
                            </div>
                        </div>
                        <!--End single item-->
                        <!--Start single item-->
                        <div class="col-md-4">
                            <div class="single-item text-center">
                                <div class="icon-holder">
                                    <span class="flaticon-factory"></span>
                                </div>
                                <div class="text-holder">
                                    <h3>Laser Treatments</h3>
                                    <p>There anyone who loves or pursues desire too obtain pain of itself, because it is pain, but occasionally sed circumstances.</p>
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
                                    <h1>Special Services</h1>
                                    <span class="border"></span>
                                    <div class="text-box">
                                        <h3>Affortable and Quality Dental Care</h3>
                                        <p>How all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer.</p>
                                    </div>
                                </div>
                                <div class="icon-box pull-right">
                                    <img src="images/services/icon.png" alt="Icon">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="service-carousel">
                                <!--Start single item-->
                                <div class="single-service-item text-center wow fadeInUp" data-wow-delay="0.5s" data-wow-duration="1s" data-wow-offset="0">
                                    <div class="img-holder">
                                        <img src="images/services/1.jpg" alt="Awesome Image">
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
                                                <span class="flaticon-medical-2"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="title-holder">
                                        <a href="#"><h3>Root Canel</h3></a>
                                    </div>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-service-item text-center wow fadeInUp" data-wow-delay="0.5s" data-wow-duration="1s" data-wow-offset="0">
                                    <div class="img-holder">
                                        <img src="images/services/2.jpg" alt="Awesome Image">
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
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-service-item text-center wow fadeInUp" data-wow-delay="0.5s" data-wow-duration="1s" data-wow-offset="0">
                                    <div class="img-holder">
                                        <img src="images/services/3.jpg" alt="Awesome Image">
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
                                </div>
                                <!--End single item-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--End special services area-->

            <!--Start appoinment area-->
            <section class="appoinment-area" style="background-image:url(images/resources/appoinment-bg.jpg);">
                <div class="container inner-content">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="img-holder">
                                <img src="images/resources/appoinment.png" alt="Awesome Image">
                            </div>    
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="appoinment">
                                <div class="sec-title">
                                    <h1>Make an Appointment</h1>
                                    <span class="border"></span>
                                    <div class="text-box">
                                        <p>We donât want you to think what is the best for you. We know what it is and will make everything to help.</p>
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
            <!--End appoinment area-->

            <!--Start about us area-->
            <section class="about-us-area">
                <div class="container">
                    <div class="sec-title text-center">
                        <h1>About Dentalcare</h1>
                        <span class="border"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="left-content">
                                <div class="row">
                                    <!--Start single item-->
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="single-item">
                                            <img src="images/about/1.jpg" alt="Awesome Image">
                                        </div>
                                    </div>
                                    <!--End single item-->
                                    <!--Start single item-->
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="single-item">
                                            <img src="images/about/2.jpg" alt="Awesome Image">
                                        </div>
                                    </div>
                                    <!--End single item-->
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text">
                                            <p>We have built an enviable reputation in the consumer goods, heavy industry, high-tech, manufacturing, medical, recreational vehicle, and transportation sectors. multidisciplinary team of engineering experts.</p>
                                            <p class="mar-top">Who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain.</p>
                                            <div class="button">
                                                <a class="thm-btn bg-1" href="#">Meet Doctors</a>
                                                <div class="signature">
                                                    <img src="images/about/signature.jpg" alt="Signature">
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
                                                <h3>Quality Doctors</h3>
                                                <p>Undertakes laborious physically exercise advantage.</p>
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
                                                <h3>Free Checkup</h3>
                                                <p>Undertakes laborious physically exercise advantage.</p>
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
                                                <h3>Affordable Clinic</h3>
                                                <p>Undertakes laborious physically exercise advantage.</p>
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
                                                <h3>Latest Technology</h3>
                                                <p>Undertakes laborious physically exercise advantage.</p>
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

            <!--Start team area-->
            <section class="team-area">
                <div class="container">
                    <div class="sec-title">
                        <h1>Meet Our Dentist</h1>
                        <span class="border"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="team-carousel">
                                <!--Start single team member-->
                                <div class="single-team-member">
                                    <div class="img-holder">
                                        <img src="images/team/1.jpg" alt="Awesome Image">
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
                                        <h3>Dr.Eliot Aldwin</h3>
                                        <span>Hygienist</span>
                                        <p>Denouncing pleasure and praising pain was born expound.</p>
                                        <span class="border"></span>
                                        <a href="#">View Profile<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                    </div>    
                                </div> 
                                <!--End single team member-->
                                <!--Start single team member-->
                                <div class="single-team-member">
                                    <div class="img-holder">
                                        <img src="images/team/2.jpg" alt="Awesome Image">
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
                                        <h3>Dr.Barie Findlay</h3>
                                        <span>Orthodontist</span>
                                        <p>Great explorer of the truth master builder human happiness.</p>
                                        <span class="border"></span>
                                        <a href="#">View Profile<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                    </div>    
                                </div> 
                                <!--End single team member-->
                                <!--Start single team member-->
                                <div class="single-team-member">
                                    <div class="img-holder">
                                        <img src="images/team/3.jpg" alt="Awesome Image">
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
                                        <h3>Dr.Fred Calvin</h3>
                                        <span>Dentist</span>
                                        <p>Circumstances occurs in which toil all pain great pleasure.</p>
                                        <span class="border"></span>
                                        <a href="#">View Profile<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                    </div>    
                                </div> 
                                <!--End single team member-->
                                <!--Start single team member-->
                                <div class="single-team-member">
                                    <div class="img-holder">
                                        <img src="images/team/4.jpg" alt="Awesome Image">
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
                                        <h3>Dr.Noel Orson</h3>
                                        <span>Hygienist</span>
                                        <p>Undertakes laborious physically all exercise, except to obtain.</p>
                                        <span class="border"></span>
                                        <a href="#">View Profile<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                    </div>    
                                </div>
                                <!--End single team member-->
                            </div> 
                        </div>
                    </div>
                </div>
            </section>
            <!--End team area-->

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

            <!--Start testimonial area-->
            <section class="testimonial-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="left-content">
                                <div class="sec-title">
                                    <h1>Words From<br> Our Happy Clients</h1>
                                    <span class="border"></span>
                                </div>
                                <div class="text-holder">
                                    <p>How all this mistaken idea of denouncing pleasure and praising pain was bornd and I will give you a completed account of the system, and expound.</p>
                                    <a class="thm-btn bg-1" href="#">More Reviews</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="testimonial-carousel">
                                <!--Start single item-->
                                <div class="single-item">
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-12">
                                            <div class="img-holder">
                                                <img src="images/testimonial/large-testimonial.jpg" alt="Awesome Image">
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
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-12">
                                            <div class="img-holder">
                                                <img src="images/testimonial/large-testimonial.jpg" alt="Awesome Image">
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
                                </div>
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
                                    <a href="#"><img src="images/brand/1.png" alt="Awesome Brand Image"></a>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <a href="#"><img src="images/brand/2.png" alt="Awesome Brand Image"></a>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <a href="#"><img src="images/brand/3.png" alt="Awesome Brand Image"></a>
                                </div>
                                <!--End single item-->
                                <!--Start single item-->
                                <div class="single-item">
                                    <a href="#"><img src="images/brand/4.png" alt="Awesome Brand Image"></a>
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

        <!-- main jQuery -->
        <jsp:include page="Common/Js.jsp"/>

    </body>
</html>