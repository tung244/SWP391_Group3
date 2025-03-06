<%-- 
    Document   : ListCustomer
    Created on : Feb 20, 2025, 2:29:54 PM
    Author     : Nguyen Phu Thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Syndash - Bootstrap4 Admin Template</title>
        <!--favicon-->
        <link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
        <!--plugins-->
        <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
        <!--Data Tables -->
        <link href="assets/plugins/datatable/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/datatable/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
        <!--plugins-->
        <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
        <link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
        <link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
        <!-- loader-->
        <link href="assets/css/pace.min.css" rel="stylesheet" />
        <script src="assets/js/pace.min.js"></script>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&family=Roboto&display=swap" />
        <!-- Icons CSS -->
        <link rel="stylesheet" href="assets/css/icons.css" />
        <!-- App CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/dark-sidebar.css" />
        <link rel="stylesheet" href="assets/css/dark-theme.css" />
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
                        <!--breadcrumb-->
                        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                            <div class="breadcrumb-title pe-3">Tables</div>
                            <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">List Customers</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="ms-auto">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary">Settings</button>
                                    <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end">	<a class="dropdown-item" href="javascript:;">Action</a>
                                        <a class="dropdown-item" href="javascript:;">Another action</a>
                                        <a class="dropdown-item" href="javascript:;">Something else here</a>
                                        <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Separated link</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end breadcrumb-->
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4 class="mb-0">List Customers </h4>
                                </div>
                                <hr/>
                                <form action="searchcustomer" method="get">
                                    
                                    <input type="text" name="search" class="form-control mb-3" placeholder="Search Customer"/>
                                </form>
          
                                
                                       
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Full Name</th>
                                                <th>Gender</th>
                                                <th>Username</th>
                                                <th>Action</th>


                                            </tr>
                                        </thead>
                                        <tbody id="customerTable">
                                            <c:forEach var="list" items="${list}">
                                                <tr>
                                                    <td>${list.account_id}</td>
                                                    <td>
                                                    <c:set var="image" value="${list.image_profile_user}"/>
                                                    <c:choose>
                                                        <c:when test="${empty image or image == null}">
                                                            <img src="https://cdn.kona-blue.com/upload/kona-blue_com/post/images/2024/09/18/457/avatar-mac-dinh-10.jpg" width="50"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${image}" width="50"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                            ${list.full_name}
                                                    </td>
                                                    <td>${empty list.gender ? "Unknown" : list.gender}</td>
                                                    <td>${list.username}</td>
                                                    <td>
                                                        <div class="col">
                                                            <button type="button" onclick='loadUser(${list.account_id})' class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">View Detail</button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Customer Information</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <p><strong>Full Name:</strong> <span id="full_name"></span></p>
                                                                            <p><strong>Date of birth:</strong> <span id="dob"></span></p>
                                                                            <p><strong>Gender:</strong> <span id="gender"></span></p>
                                                                            <p><strong>Address:</strong> <span id="address"></span></p>
                                                                            <p><strong>Phone Number:</strong> <span id="phonenumber"></span></p>
                                                                            <p><strong>Email:</strong> <span id="email"></span></p>
                                                                            <p><strong>Join Date:</strong> <span id="created_date"></span></p>
                                                                            <p><strong>Role:</strong> <span id="role_id"></span></p>
                                                                            <p><strong>Profile Image:</strong></p>
                                                                            <div>
                                                                                <img id="image_profile_user" width="120" src="" alt="Avatar" class="img-fluid rounded">
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
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
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!--plugins-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <!--Data Tables js-->
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

                                                                

                                                                function loadUser(accountId) {
                                                                    $.ajax({
                                                                        url: "CustomerDetail",
                                                                        type: "post",
                                                                        data: {id: accountId},
                                                                        dataType: "json",
                                                                        success: function (response) {
                                                                            if (response.success) {

                                                                                $("#full_name").text(response.data.full_name);
                                                                                $("#dob").text(response.data.dob);
                                                                                $("#gender").text(response.data.gender);
                                                                                $("#address").text(response.data.address);
                                                                                $("#phonenumber").text(response.data.phonenumber);
                                                                                $("#email").text(response.data.email);
                                                                                $("#created_date").text(response.data.created_date);
                                                                                $("#role_id").text(response.data.role_id);
                                                                                $("#image_profile_user").attr("src", response.data.image_profile_user);
                                                                            } else {
                                                                                alert("Không thể tải thông tin khách hàng.");
                                                                            }
                                                                        },
                                                                        error: function () {
                                                                            alert("Lỗi khi gọi API.");
                                                                        }
                                                                    });
                                                                }
        </script>
        <!-- App JS -->
        <script src="assets/js/app.js"></script>
    </body>

</html>