

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
            <jsp:include page="Common/Navbar.jsp"/>    
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <!--breadcrumb-->
                        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                            <div class="breadcrumb-title pe-3">Forms</div>
                            <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page"><a href="doctorProfile?accId=${accId}">Doctor Profile</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Add Certificate</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <div class="row">
                            <div class="col-xl-7 mx-auto">


                                <hr>
                                <div class="card border-top border-0 border-4 border-success">
                                    <div class="card-body p-5">
                                        <div class="card-title d-flex align-items-center">
                                            <div><i class="bx bxs-user me-1 font-22 text-success"></i></div>
                                            <h5 class="mb-0 text-uppercase text-success">Add Certificate</h5>                   
                                        </div>
                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger" role="alert">
                                                ${errorMessage}
                                            </div>
                                        </c:if>
                                        <%
                                         session.removeAttribute("errorMessage");       
                                        %>
                                        <hr>                                    
                                        <form id="addCertificate" action="addCertificate" method="POST" class="row g-3" enctype="multipart/form-data">
                                            <input type="hidden" name="did" value="${did}"/>
                                            <input type="hidden" id="isNewCertificate" name="isNewCertificate" value="false"/>

                                            <div class="col-12 mb-3">
                                                <label class="form-label">Certificate Name</label>
                                                <div class="d-flex align-items-center">
                                                    <select id="certificateSelect" name="certificateName" class="form-control me-2" >
                                                        <option value="" selected disabled>Select a certificate</option>
                                                        <c:forEach items="${listCer}" var="lce">
                                                            <option value="${lce.certificate_id}">${lce.certificate_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <button type="button" id="addNewCertificateBtn" class="btn btn-primary btn-sm">Add New</button>
                                                </div>
                                                <div id="newCertificateInput" style="display: none;" class="mt-2">
                                                    <input type="text" name="newCertificateName" class="form-control" placeholder="Enter new certificate name">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Certificate Image</label>
                                                <input type="file" name="certificateImage" class="form-control" required>
                                            </div>
                                            
                                            <div class="col-12">
                                                <label class="form-label">Date Certificate:</label>
                                                <input type="date" name="dateCertificate" class="form-control" required>
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Issued By</label>
                                                <input type="text" name="issuedBy" class="form-control" placeholder="Institution that issued the certificate" required>
                                            </div>

                                            <div class="col-12">
                                                <button type="submit" class="btn btn-success px-5">CREATE</button>
                                                <a href="doctorProfile?accId=${accId}" class="btn btn-danger px-5 me-2">CANCEL</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!--end row-->

                                <!--end row-->
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

                <!-- JavaScript -->
                <!-- Bootstrap JS -->
                <script src="../admin/assets/js/bootstrap.bundle.min.js"></script>

                <!--plugins-->
                <script src="../admin/assets/js/jquery.min.js"></script>
                <script src="../admin/assets/plugins/simplebar/js/simplebar.min.js"></script>
                <script src="../admin/assets/plugins/metismenu/js/metisMenu.min.js"></script>
                <script src="../admin/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>

                <!-- App JS -->
                <script src="../admin/assets/js/app.js"></script>

                <!-- JavaScript -->

                <script>

                    document.addEventListener('DOMContentLoaded', function () {
                        let select = document.querySelector('#certificateSelect');
                        let addNewBtn = document.querySelector('#addNewCertificateBtn');
                        let newCertInput = document.querySelector('#newCertificateInput');
                        let isNewCertificate = document.querySelector('#isNewCertificate');

                        addNewBtn.addEventListener('click', function () {
                            if (isNewCertificate.value === "false") {
                                select.style.display = "none";
                                newCertInput.style.display = "block";
                                addNewBtn.textContent = "Use Existing";
                                isNewCertificate.value = "true";
                            } else {
                                select.style.display = "block";
                                newCertInput.style.display = "none";
                                addNewBtn.textContent = "Add New";
                                isNewCertificate.value = "false";
                            }
                        });
                    });

                  

                    document.getElementById("addCertificate").addEventListener("submit", function (event) {
                        var certificateSelect = document.getElementById("certificateSelect");
                        var newCertificateInput = document.getElementById("newCertificateInput");
                        var isNewCertificate = document.getElementById("isNewCertificate").value;

                        if (isNewCertificate === "true") {
                            certificateSelect.removeAttribute("required");
                            newCertificateInput.setAttribute("required", "required");
                        } else {
                            certificateSelect.setAttribute("required", "required");
                            newCertificateInput.removeAttribute("required");
                        }
                    });



                </script>
                </body>

                </html>
