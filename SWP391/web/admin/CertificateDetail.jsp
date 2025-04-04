<%-- 
    Document   : DoctorDetail
    Created on : Feb 11, 2025, 4:43:42 AM
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
            <jsp:include page="Common/Navbar.jsp"/> 
            <!--end header-->
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <!--breadcrumb-->
                        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                            <div class="breadcrumb-title pe-3">Tables</div>
                            <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            <a href="doctorProfile?accId=${accId}">
                                                Dr.${listCer.get(0).getDoctor().getDoctor_name()}
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">List Certificate</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <!--Start doctor detail area-->
                        <section class="doctor-details-area">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="doctor-details bg-white p-4 rounded-lg shadow-sm">
                                            <div class="row">

                                                <div class="col-md-12">
                                                    <h5 class="text-success border-bottom pb-2">Certificate</h5>
                                                    <ul class="list-unstyled">
                                                        <div class="row g-5">
                                                            <c:forEach items="${listCer}" var="lce">
                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i>${lce.certificate.certificate_name}</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> 
                                                                        <fmt:parseDate value="${lce.date_certificate}" pattern="yyyy-MM-dd" var="parsedDate" />
                                                                        <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" /></h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i>${lce.issued_by}</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-save'></i>${lce.status}</h6>
                            
                                                                        <c:if test="${lce.status eq 'Accept'}">
                                                                        <h6 class="text-muted mb-0">
                                                                            <a href="#" title="Update" 
                                                                               data-bs-toggle="modal" 
                                                                               data-bs-target="#updateModal" 
                                                                               data-certificate-id="${lce.certificate_id}" 
                                                                               data-doctor-id="${lce.doctor_id}" 
                                                                               data-dateCertificate="<fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy"/>"
                                                                               data-certificate-image="${lce.certificate_image}" 
                                                                               data-issued-by="${lce.issued_by}"
                                                                               data-version="${lce.version}"
                                                                               class="edit-certificate">
                                                                                <i class="fas fa-edit">Edit Certificate</i>
                                                                            </a>
                                                                        </h6>
                                                                    </c:if>
                                                                    <img src="${lce.certificate_image}" class="img-thumbnail" alt="Certificate Image">
                                                                </div> 

                                                            </c:forEach>



                                                        </div>


                                                    </ul>
                                                </div>


                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End doctor detail area-->

    </div>

    <!--Edit modal-->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true"  >
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">Update Certificate Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="updateModalContent">
                    <!-- Update form -->
                    <form id="updateForm" enctype="multipart/form-data" >
                        <input type="hidden" id="certificateId" name="certificateId">
                        <input type="hidden" id="doctorId" name="doctorId">
                        <input type="hidden" id="version" name="version"/>
                        <div class="mb-3">

                            <img style="margin-left: 35%" id="certificatePhoto" src="" width="350px" height="350px" alt="Certificate Photo"/>
                            </br>
                            <label for="updateCertificateImage" class="form-label">Certificate Image</label>
                            <input accept=".jpg, .jpeg, .webp, .png" type="file" name="updateCertificateImage" id="updateCertificateImage" class="form-control" >
                        </div>
                        <div class="mb-3">
                            <label for="dateCertificate" class="form-label">Date Certificate</label>
                            <input name="dateCertificate" id="dateCertificate" type="text" class="form-control"  required>
                        </div>
                        <div class="mb-3">
                            <label for="updateCertificateIssuedBy" class="form-label">Issued By</label>
                            <input type="text" class="form-control" id="updateCertificateIssuedBy" name="updateCertificateIssuedBy" required>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="updateCertificate()">Update</button>

                </div>
            </div>
        </div>
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
<script src="../admin/assets/js/bootstrap.bundle.min.js"></script>

<!--plugins-->
<script src="../admin/assets/js/jquery.min.js"></script>
<script src="../admin/assets/plugins/simplebar/js/simplebar.min.js"></script>
<script src="../admin/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="../admin/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<!--Data Tables js-->
<script src="../admin/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
<script>
                        $(document).ready(function () {
                            //Default data table
                            $('#example').DataTable();
                            var table = $('#example2').DataTable({
                                lengthChange: false,
                                buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
                            });
                            table.buttons().container().appendTo('#example2_wrapper .col-md-6:eq(0)');
                        });
</script>
<!-- App JS -->
<script src="../admin/assets/js/app.js"></script>

<script>
                        document.addEventListener("DOMContentLoaded", function () {
                            document.querySelectorAll(".edit-certificate").forEach(function (button) {
                                button.addEventListener("click", function () {
                                    let certificateId = this.getAttribute("data-certificate-id");
                                    let doctorId = this.getAttribute("data-doctor-id");
                                    let dateCertificate = this.getAttribute("data-dateCertificate");
                                    let certificateImg = this.getAttribute("data-certificate-image");
                                    let issuedBy = this.getAttribute("data-issued-by");
                                    let dataVersion = this.getAttribute("data-version");
                                    console.log("certificateId:", certificateId);
                                    console.log("Doctor ID:", doctorId);
                                    console.log("dateCertificate:", dateCertificate);
                                    console.log("Issued By:", issuedBy);
                                    console.log("certificateImg:", certificateImg);
                                    console.log("dataVersion", dataVersion);

                                    let formattedDate = "";
                                    if (dateCertificate) {
                                        // Extract just the date part
                                        formattedDate = dateCertificate.split(' ')[0];
                                    }
                                    // Gán giá trị vào modal
                                    document.getElementById("certificateId").value = certificateId;
                                    document.getElementById("doctorId").value = doctorId;
                                    document.getElementById("certificatePhoto").src =  certificateImg;
                                    document.getElementById("updateCertificateIssuedBy").value = issuedBy;
                                    document.getElementById("dateCertificate").value = formattedDate;
                                    document.getElementById("version").value = dataVersion;
                                });
                            });
                        });
                        
                        function updateCertificate() {
                            // Lấy giá trị từ modal
                            let certificateId = document.getElementById("certificateId").value;
                            let doctorId = document.getElementById("doctorId").value;                 
                            let certificatePhoto = document.getElementById("certificatePhoto").src;
                            let issuedBy = document.getElementById("updateCertificateIssuedBy").value;
                            let updateCertificateImageInput = document.getElementById("updateCertificateImage");
                            let updateCertificateImage = updateCertificateImageInput.files[0]; // Lấy file thực tế
                            let dateCertificate = document.getElementById("dateCertificate").value;
                            let version = document.getElementById("version").value;
                            // Đối tượng dữ liệu gửi lên server
                            let formData = new FormData();
                            formData.append("certificateId", certificateId);
                            formData.append("doctorId", doctorId);
                            formData.append("certificatePhoto", certificatePhoto);
                            formData.append("issuedBy", issuedBy);
                            formData.append("version", version);
                            if (updateCertificateImage) {
                                formData.append("updateCertificateImage", updateCertificateImage);
                            }
                            formData.append("dateCertificate", dateCertificate);
                            console.log(version);
                            fetch("certificateDetail", {
                                method: "POST",
                                body: formData
                            })
                                    .then(response => response.text()) // Thay vì .json()
                                    .then(data => {
                                        try {
                                            let jsonData = JSON.parse(data); // Chuyển đổi thành JSON
                                            if (jsonData.success) {
                                                alert("Send requirement update certificate successfully!");
                                                location.reload(); // Load lại trang để hiển thị dữ liệu mới
                                            } else {
                                                alert("Send requirement update certificate fail!");
                                            }
                                        } catch (error) {
                                            console.error("Response is not valid JSON:", data); // Debug phản hồi từ server
                                        }
                                    })
                                    .catch(error => console.error("Fail to update:", error));
                        }
                        
                        

</script>
</body>

</html>