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
        <style>
            button {
                background: #E8E7E6; /* Màu xanh lá */
                border: solid #000 1px;
                border-radius: 2%;
                font-size: 20px;
                font-weight: 100;
                color: #000;
                cursor: pointer;
                transition: all 0.3s ease;
                min-width: 100px; /* Đảm bảo nút có kích thước đồng đều */
                margin-right: 1%;
            }

            /* Hiệu ứng hover */
            button:hover {
                background: #009933; /* Xanh đậm hơn khi hover */
                box-shadow: 0 4px 6px rgba(34, 139, 34, 0.3);
                transform: translateY(-2px);
            }
        </style>
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
                                                                    <img src=".${lde.degree_image}" class="img-thumbnail" alt="Degree Image">
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
</body>

</html>