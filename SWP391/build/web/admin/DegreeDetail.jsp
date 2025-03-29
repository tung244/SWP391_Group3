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
                                                Dr.${listDeDoc.get(0).getDoctor().getDoctor_name()}
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">List Degree</li>
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
                                                    <h5 class="text-success border-bottom pb-2">Degree</h5>
                                                    <ul class="list-unstyled">
                                                        <div class="row g-5">
                                                            <c:forEach items="${listDeDoc}" var="lde">
                                                                <div class="col-12 col-lg-3">
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-book'></i>${lde.degree.degree_name}</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bx-time'></i> 
                                                                        <fmt:parseDate value="${lde.date_degree}" pattern="yyyy-MM-dd" var="parsedDate" />
                                                                        <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy"/></h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-map'></i>${lde.issued_by}</h6>
                                                                    <h6 class="text-muted mb-0"><i class='bx bxs-save'></i>${lde.status}</h6>
                                                                        <c:if test="${lde.status eq 'Accept'}">
                                                                        <h6 class="text-muted mb-0">
                                                                            <a href="#" title="Update" 
                                                                               data-bs-toggle="modal" 
                                                                               data-bs-target="#updateModal" 
                                                                               data-degree-id="${lde.degree_id}" 
                                                                               data-doctor-id="${lde.doctor_id}" 
                                                                               data-dateDegree="${lde.date_degree}" 
                                                                               data-degree-image="${lde.degree_image}" 
                                                                               data-issued-by="${lde.issued_by}"
                                                                               data-version="${lde.version}"
                                                                               class="edit-degree">
                                                                                <i class="fas fa-edit">Edit Degree</i>
                                                                            </a>
                                                                        </h6>
                                                                    </c:if>
                                                                    <img src="${lde.degree_image}" class="img-thumbnail" alt="Degree Image">
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

    <!--end page-content-wrapper-->

    <!--Edit modal-->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true"  >
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">Update Degree Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="updateModalContent">
                    <!-- Update form -->
                    <form id="updateForm" enctype="multipart/form-data" >
                        <input type="hidden" id="degreeId" name="degreeId">
                        <input type="hidden" id="doctorId" name="doctorId">
                        <input type="hidden" id="dateDegree" name="dateDegree"/>
                        <input type="hidden" id="version" name="version"/>
                        <div class="mb-3">

                            <img style="margin-left: 35%" id="degreePhoto" src="" width="350" height="350" alt="Degree Photo"/>
                            </br>
                            <label for="updateDegreeImage" class="form-label">Degree Image</label>
                            <input type="file" name="updateDegreeImage" id="updateDegreeImage" class="form-control" >
                        </div>
                        <div class="mb-3">
                            <label for="updateDegreeIssuedBy" class="form-label">Issued By</label>
                            <input type="text" class="form-control" id="updateDegreeIssuedBy" name="updateDegreeIssuedBy" required>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="updateDegree()">Update</button>

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
                        });</script>
<!-- App JS -->
<script src="../admin/assets/js/app.js"></script>
<script>

                        document.addEventListener("DOMContentLoaded", function () {
                            document.querySelectorAll(".edit-degree").forEach(function (button) {
                                button.addEventListener("click", function () {
                                    let degreeId = this.getAttribute("data-degree-id");
                                    let doctorId = this.getAttribute("data-doctor-id");
                                    let degreeImage = this.getAttribute("data-degree-image");
                                    let issuedBy = this.getAttribute("data-issued-by");
                                    let dateDegree = this.getAttribute("data-dateDegree");
                                    let dataVersion = this.getAttribute("data-version");
                                    console.log("Degree ID:", degreeId);
                                    console.log("Doctor ID:", doctorId);
                                    console.log("Degree Image:", degreeImage);
                                    console.log("Issued By:", issuedBy);
                                    console.log("Degree Date:", dateDegree);
                                    console.log("dataVersion", dataVersion);
                                    // Gán giá trị vào modal
                                    document.getElementById("degreeId").value = degreeId;
                                    document.getElementById("doctorId").value = doctorId;
                                    document.getElementById("degreePhoto").src =degreeImage;
                                    document.getElementById("updateDegreeIssuedBy").value = issuedBy;
                                    document.getElementById("dateDegree").value = dateDegree;
                                    document.getElementById("version").value = dataVersion;
                                });
                            });
                        });

                        function updateDegree() {
                            // Lấy giá trị từ modal
                            let degreeId = document.getElementById("degreeId").value;
                            let doctorId = document.getElementById("doctorId").value;
                            let degreeImage = document.getElementById("degreePhoto").src;
                            let issuedBy = document.getElementById("updateDegreeIssuedBy").value;
                            let updateDegreeImageInput = document.getElementById("updateDegreeImage");
                            let updateDegreeImage = updateDegreeImageInput.files[0]; // Lấy file thực tế
                            let dateDegree = document.getElementById("dateDegree").value;
                            let version = document.getElementById("version").value;
                            // Đối tượng dữ liệu gửi lên server
                            let formData = new FormData();
                            formData.append("degreeId", degreeId);
                            formData.append("doctorId", doctorId);
                            formData.append("degreeImage", degreeImage);
                            formData.append("issuedBy", issuedBy);
                            formData.append("version", version);
                            if (updateDegreeImage) {
                                formData.append("updateDegreeImage", updateDegreeImage);
                            }
                            formData.append("dateDegree", dateDegree);
                            console.log(updateDegreeImage);
                            fetch("degreeDetail", {
                                method: "POST",
                                body: formData
                            })
                                    .then(response => response.text()) // Thay vì .json()
                                    .then(data => {
                                        try {
                                            let jsonData = JSON.parse(data); // Chuyển đổi thành JSON
                                            if (jsonData.success) {
                                                alert("Send requirement update degree successfully!");
                                                location.reload(); // Load lại trang để hiển thị dữ liệu mới
                                            } else {
                                                alert("Send requirement update degree fail!");
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