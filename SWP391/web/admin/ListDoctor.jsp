<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/>  
    </head>

    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <jsp:include page="Common/Sidebar.jsp"/>    
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
                                        <li class="breadcrumb-item active" aria-current="page"><a href="DoctorList">List Doctor</a></li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                        <!--end breadcrumb-->
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4 class="mb-0">Doctor Table</h4>
                                    
                                    <a href="createAccount" class="btn btn-primary" style="margin-left: 85%;">Add a doctor</a>
                                    
                                    
                                </div>
                                <hr/>
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="color: green">#</th>
                                                <th scope="col" style="color: green">Name</th>
                                                <th scope="col" style="color: green">Experience year</th>
                                                <th scope="col" style="color: green">Specialization</th>
                                                <th scope="col" style="color: green">Rating</th>
                                                <th scope="col" style="color: green">Gender</th>
                                                <th scope="col" style="color: green">DOB</th>
                                                <th scope="col" style="color: green">Address</th>
                                                <th scope="col" style="color: green">Status</th>
                                                <th scope="col" style="color: green">Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="d" items="${listDoctor}">
                                                <tr>
                                                    <td>${d.doctor_id}</td>
                                                    <td>${d.doctor_name}</td>
                                                    <td>${d.experience_years} years</td>
                                                    <td>${d.specialization.specialization_name}</td>
                                                    <td>${d.rating}</td>
                                                    <td>${d.gender}</td>
                                                    <td>${d.dob}</td>
                                                    <td>${d.address}</td>
                                                    <td>${d.doctor_status}</td>


                                                    <td>

                                                        <a href="updateDoctor?doctorId=${d.doctor_id}" onsubmit="return confirm('Are you sure you want to update this doctor?');" title="Update">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <a href="listDoctorDetail?doctor_id=${d.doctor_id}" title="View" data-toggle="modal" data-target="#viewModal">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                    </td>


                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--end page-content-wrapper-->
            </div>
            <!-- Modal -->
            <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">

                <div class="modal-dialog modal-xl"> <!-- Thêm lớp modal-lg -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalLabel">Doctor Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="modalContent">
                            <!-- Nội dung chi tiết đơn hàng sẽ được cập nhật ở đây -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" style="background-color: green" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Update Doctor Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="updateModalContent">
                            <form id="updateForm">
                                <div class="mb-3">
                                    <label for="serviceName" class="form-label">Doctor Name</label>
                                    <input type="text" class="form-control" id="serviceName" name="name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="serviceDescription" class="form-label">Service Description</label>
                                    <input type="text" class="form-control" id="serviceDescription" name="description" required>
                                </div>
                                <div class="mb-3">
                                    <label for="specialization_name" class="form-label">Specialization Name</label>
                                    <input type="text" class="form-control" id="specialization_name" name="specialization_name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="serviceCost" class="form-label">Cost</label>
                                    <input type="number" class="form-control" id="serviceCost" name="cost" required>
                                </div>
                                <div class="mb-3">
                                    <label for="serviceCost" class="form-label">Cost</label>
                                    <input type="number" class="form-control" id="serviceCost" name="cost" required>
                                </div>
                                <div class="mb-3">
                                    <label for="specialization_status" class="form-label">Specialization Status</label>
                                    <input type="text" class="form-control" id="specialization_status" name="specialization_status" required>
                                </div>
                                <input type="hidden" id="serviceId" name="id">
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="">Update</button>
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
<!--        <script src="../admin/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>-->
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