<%-- 
    Document   : EmailBox
    Created on : Feb 17, 2025, 3:51:36 PM
    Author     : fptshop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/>
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <!--sidebar-wrapper-->
            <jsp:include page="Common/Navbar.jsp"/>
            <!--end sidebar-wrapper-->
            <!--header-->
            <jsp:include page="Common/Search.jsp"/>
            <!--end header-->
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <!--start email wrapper-->
                        <div class="email-wrapper">
                            <!--                            <div class="email-sidebar">
                                                            <div class="email-sidebar-header d-grid"> <a href="javascript:;" class="btn btn-primary compose-mail-btn"><i class='bx bx-plus me-2'></i> Compose</a>
                                                            </div>-->
                            <!--                                <div class="email-sidebar-content">
                                                                <div class="email-navigation">
                                                                    <div class="list-group list-group-flush"> <a href="emailbox.html" class="list-group-item active d-flex align-items-center"><i class='bx bxs-inbox me-3 font-20'></i><span>Inbox</span><span class="badge bg-primary rounded-pill ms-auto">7,513</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-star me-3 font-20'></i><span>Starred</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-alarm-snooze me-3 font-20'></i><span>Snoozed</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-send me-3 font-20'></i><span>Sent</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-file-blank me-3 font-20'></i><span>Drafts</span><span class="badge bg-primary rounded-pill ms-auto">4</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-bookmark me-3 font-20'></i><span>Important</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-message-rounded-error me-3 font-20'></i><span>Chats</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bx-mail-send me-3 font-20'></i><span>Scheduled</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-envelope-open me-3 font-20'></i><span>All Mail</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-info-circle me-3 font-20'></i><span>Spam</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-trash-alt me-3 font-20'></i><span>Trash</span></a>
                                                                    </div>
                                                                </div>
                                                                <div class="email-meeting">
                                                                    <div class="list-group list-group-flush">
                                                                        <div class="list-group-item"><span>Meet</span>
                                                                        </div> <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-video me-3 font-20'></i><span>Start a meeting</span></a>
                                                                        <a href="javascript:;" class="list-group-item d-flex align-items-center"><i class='bx bxs-group me-3 font-20'></i><span>Join a meeting</span></a>
                                                                        <div class="list-group-item email-hangout cursor-pointer border-top">
                                                                            <div class="d-flex align-items-center">
                                                                                <div class="chat-user-online">
                                                                                    <img src="assets/images/avatars/avatar-1.png" width="42" height="42" class="rounded-circle" alt="" />
                                                                                </div>
                                                                                <div class="flex-grow-1 ms-2">
                                                                                    <p class="mb-0">Jessica Doe</p>
                                                                                </div>
                                                                                <div class="dropdown">
                                                                                    <div class="font-24 dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown"><i class='bx bx-plus'></i>
                                                                                    </div>
                                                                                    <div class="dropdown-menu dropdown-menu-end">	<a class="dropdown-item" href="javascript:;">Settings</a>
                                                                                        <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Help & Feedback</a>
                                                                                        <a class="dropdown-item" href="javascript:;">Enable Split View Mode</a>
                                                                                        <a class="dropdown-item" href="javascript:;">Keyboard Shortcuts</a>
                                                                                        <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Sign Out</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>-->
                            <!--                            </div>-->
                            <div class="email-header d-xl-flex align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="email-toggle-btn"><i class='bx bx-menu'></i>
                                    </div>
                                    <div class="btn btn-white">
                                        <input class="form-check-input" type="checkbox">
                                    </div>
                                    <div class="">
                                        <button onclick="window.location.reload();" type="button" class="btn btn-white ms-2"><i class='bx bx-refresh me-0'></i>
                                        </button>
                                    </div>
                                    <!--                                    <div class="">
                                                                            <button type="button" class="btn btn-white ms-2"><i class='bx bx-downvote me-0'></i>
                                                                            </button>
                                                                        </div>
                                                                        <div class="d-none d-md-flex">
                                                                            <button type="button" class="btn btn-white ms-2"><i class='bx bx-file me-0'></i>
                                                                            </button>
                                                                        </div>-->
                                    <!--                                    <div class="">
                                                                            <button type="button" class="btn btn-white ms-2"><i class='bx bx-trash me-0'></i>
                                                                            </button>
                                                                        </div>-->
                                </div>
                                <form class="flex-grow-1 mx-xl-2 my-2 my-xl-0" action="show_email" method="get">
                                    <div class="input-group">	<span class="input-group-text bg-transparent"><i class="bx bx-search"></i></span>
                                        <input type="text" name="subject" class="form-control" placeholder="Search theo tiêu đề email">
                                    </div>

                                </form>
                                <div class="ms-auto d-flex align-items-center">
                                    <!--                                    <button class="btn btn-sm btn-light">1-50 of 8,740</button>-->
                                    <a href="show_email?next_page_token=${thePreviousToken}" class="btn btn-white px-2 ms-2"><i class='bx bx-chevron-left me-0'></i>
                                    </a>
                                    <a href="show_email?next_page_token=${theNextPageToken}" class="btn btn-white px-2 ms-2"><i class='bx bx-chevron-right me-0'></i>
                                    </a>
                                </div>
                            </div>
                            <div class="email-content">
                                <div class="">
                                    <div class="email-list">
                                        <c:if test="${not empty emailDetails}">
                                            <c:forEach var="emailDetails" items="${emailDetails}">
                                                <a href="read_email?id=${emailDetails.id}">
                                                    <div class="d-md-flex align-items-center email-message px-3 py-1">
                                                        <div class="d-flex align-items-center email-actions">
                                                            <input class="form-check-input" type="checkbox" value="" /> <i class='bx bx-star font-20 mx-2 email-star'></i>
                                                            <p class="mb-0"><b>Support</b>
                                                            </p>
                                                        </div>
                                                        <div class="">
                                                            <p class="mb-0">${emailDetails.subject}</p>
                                                        </div>
                                                        <div class="ms-auto">
                                                            <p class="mb-0 email-time">${emailDetails.date}</p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </c:forEach> 
                                        </c:if>
                                        <c:if test="${empty emailDetails}">
                                            <img style="display: flex; justify-content: center" src="./assets/images/gallery/anhHetTien.jpg"/>
                                            
                                            
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                            <!--start compose mail-->
                            <div class="compose-mail-popup">
                                <div class="card">
                                    <div class="card-header bg-dark text-white py-2 cursor-pointer">
                                        <div class="d-flex align-items-center">
                                            <div class="compose-mail-title">New Message</div>
                                            <div class="compose-mail-close ms-auto">x</div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="email-form">
                                            <div class="mb-3">
                                                <input type="text" class="form-control" placeholder="To" />
                                            </div>
                                            <div class="mb-3">
                                                <input type="text" class="form-control" placeholder="Subject" />
                                            </div>
                                            <div class="mb-3">
                                                <textarea class="form-control" placeholder="Message" rows="10" cols="10"></textarea>
                                            </div>
                                            <div class="mb-0">
                                                <div class="d-flex align-items-center">
                                                    <div class="">
                                                        <div class="btn-group">
                                                            <button type="button" class="btn btn-primary">Action</button>
                                                            <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
                                                            </button>
                                                            <div class="dropdown-menu">	<a class="dropdown-item" href="javascript:;">Action</a>
                                                                <a class="dropdown-item" href="javascript:;">Another action</a>
                                                                <a class="dropdown-item" href="javascript:;">Something else here</a>
                                                                <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Separated link</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ms-2">
                                                        <button type="button" class="btn border-0 btn-sm btn-white"><i class="lni lni-text-format"></i>
                                                        </button>
                                                        <button type="button" class="btn border-0 btn-sm btn-white"><i class='bx bx-link-alt'></i>
                                                        </button>
                                                        <button type="button" class="btn border-0 btn-sm btn-white"><i class="lni lni-emoji-tounge"></i>
                                                        </button>
                                                        <button type="button" class="btn border-0 btn-sm btn-white"><i class="lni lni-google-drive"></i>
                                                        </button>
                                                    </div>
                                                    <div class="ms-auto">
                                                        <button type="button" class="btn border-0 btn-sm btn-white"><i class="lni lni-trash"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end compose mail-->
                            <!--start email overlay-->
                            <div class="overlay email-toggle-btn-mobile"></div>
                            <!--end email overlay-->
                        </div>
                        <!--end email wrapper-->
                    </div>
                </div>
                <!--end page-content-wrapper-->
            </div>
            <!--end page-wrapper-->
            <!--start overlay-->
            <div class="overlay toggle-btn-mobile"></div>
            <!--end overlay-->
            <!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
            <!--End Back To Top Button-->
            <!--footer -->
            <div class="footer">
                <p class="mb-0">Syndash @2020 | Developed By : <a href="https://themeforest.net/user/codervent" target="_blank">codervent</a>
                </p>
            </div>
            <!-- end footer -->
        </div>
        <!-- end wrapper -->
        <!--start switcher-->
        <div class="switcher-body">
            <button class="btn btn-primary btn-switcher shadow-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bx bx-cog bx-spin"></i></button>
            <div class="offcanvas offcanvas-end shadow border-start-0 p-2" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling">
                <div class="offcanvas-header border-bottom">
                    <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Theme Customizer</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <h6 class="mb-0">Theme Variation</h6>
                    <hr>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="lightmode" value="option1" checked>
                        <label class="form-check-label" for="lightmode">Light</label>
                    </div>
                    <hr>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="darkmode" value="option2">
                        <label class="form-check-label" for="darkmode">Dark</label>
                    </div>
                    <hr>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="darksidebar" value="option3">
                        <label class="form-check-label" for="darksidebar">Semi Dark</label>
                    </div>
                    <hr>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="ColorLessIcons" value="option3">
                        <label class="form-check-label" for="ColorLessIcons">Color Less Icons</label>
                    </div>
                </div>
            </div>
        </div>
        <!--end switcher-->
        <!-- JavaScript -->
        <!-- Bootstrap JS -->
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>
    </body>

</html>
