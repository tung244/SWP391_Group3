<%-- 
    Document   : DoctorProfile
    Created on : Mar 2, 2025, 5:36:18 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/>  
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <!--sidebar-wrapper-->

            <!--end sidebar-wrapper-->
            <!--header-->
            <jsp:include page="Common/Sidebar.jsp"/> 
            <!--end header-->
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <!--breadcrumb-->
                        <div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
                            <div class="breadcrumb-title pe-3">Doctor Profile</div>
                            <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="javascript:;"><i class='bx bx-home-alt'></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">Doctor Profile</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <div class="user-profile-page">
                            <div class="card radius-15">
                                <div class="card-body">

                                    <div class="row">

                                        <div class="col-12 col-lg-7 border-right">
                                            <div class="d-md-flex align-items-center">
                                                <div class="mb-md-0 mb-3">
                                                    <img src="${doctor.profile_image}" class="rounded-circle shadow" width="200" height="200" alt="Profile Image" />
                                                </div>
                                                <div class="ms-md-4 flex-grow-1">
                                                    <div class="d-flex align-items-center mb-1">
                                                        <h4 class="mb-0">Dr.${doctor.doctor_name}</h4>

                                                    </div>
                                                    <p class="mb-0 text-muted">Dr.${doctor.specialization.specialization_name}</p>
                                                    <p class="text-primary"><i class='bx bx-buildings'></i> EyeCare</p>

                                                </div>
                                            </div>
                                        </div>
                                        <div  class="col-12 col-lg-5">
                                            <table class="table table-sm table-borderless mt-md-0 mt-3">
                                                <tbody>
                                                    <tr>
                                                        <th style="color: green">Availability:</th>
                                                        <td>Full-time (40hr/wk) <span class="badge badge-success">available</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th  style="color: green">Rating:</th>
                                                        <td>${doctor.rating}    <i style="color: #ffcf09" class="lni lni-star-filled"></i>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th  style="color: green">Experience years:</th>
                                                        <td>${doctor.experience_years} years</td>
                                                    </tr>
                                                    <tr>
                                                        <th style="color: green">Location:</th>
                                                        <td>${doctor.address}</td>
                                                    </tr>


                                                    </td>

                                                    <tr>
                                                        <th style="color: green">Date of birth:</th>
                                                        <td>
                                                            <fmt:parseDate value="${doctor.dob}" pattern="yyyy-MM-dd" var="parsedDob" />
                                                            <fmt:formatDate value="${parsedDob}" pattern="dd/MM/yyyy"/>   
                                                        </td>
                                                        
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>

                                    </div>


                                    <!--end row-->
                                    <ul class="nav nav-pills">
                                        <li class="nav-item"> <a class="nav-link active" data-bs-toggle="tab" href="#Experience"><span class="p-tab-name">Experience</span><i class='bx bx-donate-blood font-24 d-sm-none'></i></a>
                                        </li>

                                        <li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#Edit-Profile"><span class="p-tab-name">Edit Profile</span><i class='bx bx-message-edit font-24 d-sm-none'></i></a>
                                        </li>
                                        <li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#Edit-Degree"><span class="p-tab-name">Edit Degree</span><i class='bx bx-message-edit font-24 d-sm-none'></i></a>                                           
                                        </li>
                                        <li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#Edit-Certificate"><span class="p-tab-name">Edit Certificate</span><i class='bx bx-message-edit font-24 d-sm-none'></i></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content mt-3">
                                        <div class="tab-pane fade show active" id="Experience">
                                            <div class="card shadow-none border mb-0 radius-15">
                                                <div class="card-body">
                                                    <div class="d-sm-flex align-items-center mb-3">
                                                        <h4 class="mb-0">Job Experience</h4>
                                                        <p class="mb-0 ms-sm-3 text-muted">Degrees and Certificates</p> 
                                                    </div>
                                                    <div class="d-flex"> 
                                                        <div class="ms-3">
                                                            <div class="row align-items-center">
                                                                <div class="col-lg-4">
                                                                    <h5 class="mb-0">All of Degrees</h5>
                                                                    </br>     
                                                                </div>

                                                            </div>

                                                            <div class="row g-3">
                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i> Name of degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> date-degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i> issue by</h6>
                                                                    <img src="assets/images/gallery/35.jpg" class="img-thumbnail" alt="Degree Image">
                                                                </div>    

                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i> Name of degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> date-degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i> issue by</h6>
                                                                    <img src="assets/images/gallery/35.jpg" class="img-thumbnail" alt="Degree Image">
                                                                </div>    
                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i> Name of degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> date-degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i> issue by</h6>
                                                                    <img src="assets/images/gallery/35.jpg" class="img-thumbnail" alt="Degree Image">
                                                                </div>    
                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i> Name of degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> date-degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i> issue by</h6>
                                                                    <img src="assets/images/gallery/35.jpg" class="img-thumbnail" alt="Degree Image">
                                                                </div>    

                                                            </div>
                                                            <hr/>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex"> 
                                                        <div class="ms-3">
                                                            <div class="row align-items-center">
                                                                <div class="col-lg-4">
                                                                    <h5 class="mb-0">All of Certificates</h5>
                                                                    </br>     
                                                                </div>

                                                            </div>

                                                            <div class="row g-3">
                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i> Name of degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> date-degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i> issue by</h6>
                                                                    <img src="assets/images/gallery/35.jpg" class="img-thumbnail" alt="Degree Image">
                                                                </div>    

                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i> Name of degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> date-degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i> issue by</h6>
                                                                    <img src="assets/images/gallery/35.jpg" class="img-thumbnail" alt="Degree Image">
                                                                </div>    
                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i> Name of degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> date-degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i> issue by</h6>
                                                                    <img src="assets/images/gallery/35.jpg" class="img-thumbnail" alt="Degree Image">
                                                                </div>    
                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i> Name of degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> date-degree</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i> issue by</h6>
                                                                    <img src="assets/images/gallery/35.jpg" class="img-thumbnail" alt="Degree Image">
                                                                </div>    

                                                            </div>
                                                            <hr/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="Edit-Profile">
                                            <div class="card shadow-none border mb-0 radius-15">
                                                <div class="card-body">
                                                    <div class="form-body">
                                                        <div class="row">
                                                            <div class="col-12 col-lg-5 border-right">
                                                                <form class="row g-3">
                                                                    <div class="col-12">
                                                                        <label class="form-label">Doctor Name</label>
                                                                        <input type="text" name="doctorName" id="doctorName" value="" class="form-control" required>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <label class="form-label">Experience Years</label>
                                                                        <input type="number" min="1" name="experienceYears" id="experienceYears" value="" class="form-control" required>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <label class="form-label">Profile Image</label>
                                                                        <input type="file" name="profileimage" id="profileimage" value="" class="form-control" enctype="multipart/form-data" required>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <label class="form-label">Gender</label> 
                                                                        <input type="radio" name="gender" id="Female" value="Female" required>Female
                                                                        <input type="radio" name="gender" id="Male" value="Male" required>Male
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <label class="form-label">Date of Birth</label>
                                                                        <input name="dob" id="dob" type="date" class="form-control" required>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <label class="form-label">Address</label>
                                                                        <input type="text" name="address" id="address" class="form-control" placeholder="Address" required>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <label class="form-label">Specialization</label>                                               
                                                                        <select id="specializationId" name="specializationId" class="form-select" required>

                                                                            <option value="">specialization</option>
                                                                        </select>
                                                                    </div>
                                                                </form>														
                                                            </div>
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!--plugins-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <!-- App JS -->
        <script src="assets/js/app.js"></script>
    </body>

</html>