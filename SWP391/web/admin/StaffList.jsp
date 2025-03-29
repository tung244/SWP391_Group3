<%-- 
    Document   : StaffList
    Created on : Feb 6, 2025, 5:53:02 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <style>
            .icon {
                width: 25px;
                height: 25px;
                font-size: 18px;
                margin-right: 10px; /* Tăng khoảng cách giữa các biểu tượng */
                vertical-align: middle; /* Căn chỉnh với văn bản */
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <!-- wrapper -->
        <div class="wrapper">
            <!--sidebar-wrapper-->
            <jsp:include page="Common/Navbar.jsp"/>
            <!--end header-->
            <!--page-wrapper-->
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <!--breadcrumb-->
                        <!-- Breadcrumb -->
                        <div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
                            <div class="breadcrumb-title pe-3">Tables</div>
                            <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mb-0 p-0">
                                        <li class="breadcrumb-item">
                                            <a href="javascript:;"><i class='bx bx-home-alt'></i></a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">Editable</li>
                                    </ol>
                                </nav>
                            </div>

                            <div class="ms-auto d-flex gap-2">
                                <!-- Sort Role -->
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary"> Role</button>
                                    <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">
                                        <span class="visually-hidden">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start">
                                        <a class="dropdown-item" href="searchstaff?sortrole=Customer Support">Customer Support</a>
                                        <a class="dropdown-item" href="searchstaff?sortrole=Sales">Sale</a>
                                        <div class="dropdown-divider"></div>
                                    </div>
                                </div>

                                <!-- Search by Address -->
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary">Search by Address</button>
                                    <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">
                                        <span class="visually-hidden">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start">
                                        <a class="dropdown-item" href="searchstaff?id=0">All Addresses</a>
                                        <c:forEach var="address" items="${requestScope.addressList}">
                                            <a class="dropdown-item" href="searchstaff?address=${address}">
                                                ${address}
                                            </a>
                                        </c:forEach>
                                        <div class="dropdown-divider"></div>
                                    </div>
                                </div>

                                <!-- Search by Name -->
                                <form action="searchstaff" method="GET" class="d-flex">
                                    <input type="text" name="name" class="form-control" placeholder="Enter name..." required>
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </form>

                                <!-- Search by Phone -->
                                <form action="searchstaff" method="GET" class="d-flex">
                                    <input type="text" name="phone" class="form-control" placeholder="Enter phone..." required>
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </form>
                            </div>
                        </div>


                        <!--end breadcrumb-->


                        <!--                        <div class="card">
                                                    <div class="card-body">
                                                        <div>
                                                            <h4 style="color:green; font-weight: bold">Services Table</h4>
                                                            <hr>
                                                            <a href="AddService">
                                                                <button id="table2-new-row-button" class="btn btn-outline-success btn-sm mb-2" style="font-size: 20px; font-weight: bold" >Add Service</button>
                                                            </a>
                        
                                                            <div class="table-responsive">
                                                                <table class="table table-striped table-bordered mb-0" id="table3">
                                                                    <thead class="thead-dark">
                                                                        <tr>
                        
                                                                            <th scope="col" style="color: green">Name</th>
                                                                            <th scope="col" style="color: green">Address</th>
                                                                            <th scope="col" style="color: green">Phone</th>
                                                                            <th scope="col" style="color: green">DOB</th>
                                                                            <th scope="col" style="color: green">Image</th>
                        
                                                                            
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>-->
                        <div class="card">
                            <div class="card-body">
                                <div>
                                    <h4 style="color:green; font-weight: bold" ><a href="ListStaff">Staff Table</a></h4>
                                    <hr>
                                    <a href="AddStaff">
                                        <button id="table2-new-row-button" class="btn btn-outline-success btn-sm mb-2" style="font-size: 20px; font-weight: bold" >Add Staff</button>
                                    </a>

                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered mb-0" id="table3">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col" style="color: green">#</th>
                                                    <th scope="col" style="color: green">Name</th>
                                                    <th scope="col" style="color: green">Phone</th>
                                                    <th scope="col" style="color: green">Address</th>
                                                    <th scope="col" style="color: green">DOB</th>
                                                    <th scope="col" style="color: green">Gender</th>
                                                    <th scope="col" style="color: green">Role</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="a" items="${staffs}">
                                                    <tr>
                                                        <td>${a.account.account_id}</td>
                                                        <td>${a.admin_fullname}</td>
                                                        <td>${a.account.phonenumber}</td>
                                                        <td>${a.admin_address}</td>
                                                        <td>${a.admin_dob}</td>
                                                        <td>${a.admin_gender}</td> 
                                                        <td>${a.account.role.role_name}</td> 
                                                        <td>
                                                            <a href="UpdateStaff?id=${a.account.account_id}" title="Update">
                                                                <i class="fas fa-edit icon"></i>
                                                            </a>
                                                            <a href="#" onclick="confirmDelete(${a.account.account_id}, '${a.account.username}'); return false;" title="Delete">
                                                                <i class="fas fa-trash-alt icon"></i>
                                                            </a>    
                                                            <a href="#" title="View" onclick="loadServiceDetails(${a.account.account_id});" data-toggle="modal" data-target="#viewModal">
                                                                <i class="fas fa-eye icon"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="pagination">
                                            <c:if test="${page > 1}">
                                                <a href="${type == 'search' ? 'searchstaff' : 'ListStaff'}?page=${page - 1}&sortrole=${param.sortrole}&address=${param.address}&name=${param.name}">«</a>
                                            </c:if>

                                            <c:forEach var="i" begin="1" end="${numpage}">
                                                <a href="${type == 'search' ? 'searchstaff' : 'ListStaff'}?page=${i}&sortrole=${param.sortrole}&address=${param.address}&name=${param.name}"
                                                   class="${i == page ? 'active' : ''}">${i}</a>
                                            </c:forEach>

                                            <c:if test="${page < numpage}">
                                                <a href="${type == 'search' ? 'searchstaff' : 'ListStaff'}?page=${page + 1}&sortrole=${param.sortrole}&address=${param.address}&name=${param.name}">»</a>
                                            </c:if>
                                        </div>
                                    </div>
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
                            <h5 class="modal-title" id="modalLabel">Staff Details</h5>
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
                            <h5 class="modal-title" id="updateModalLabel">Update Service Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="updateModalContent">
                            <form id="updateForm">
                                <div class="mb-3">
                                    <label for="serviceName" class="form-label">Service Name</label>
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
                            <button type="button" class="btn btn-primary" onclick="updateService();">Update</button>
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
        <script>
            function loadServiceDetails(id) {
                console.log("Loading service details for ID:", id);
                var modalContent = document.getElementById("modalContent");
                modalContent.innerHTML = "Loading...";

                // Send request to servlet
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "loadstaffdetail?staffId=" + id, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        console.log("Response from server:", xhr.responseText);
                        modalContent.innerHTML = xhr.responseText;
                        // Show the modal after content is loaded
                        var modal = new bootstrap.Modal(document.getElementById('viewModal'));
                        modal.show();
                    }
                };
                xhr.send();
            }
        </script>  
        <script>
            function confirmDelete(account_id, username) {
                Swal.fire({
                    title: 'Xác nhận xóa',
                    html: `Bạn có chắc chắn muốn xóa dịch vụ <b>${a.account.username}</b>?`,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Xóa',
                    cancelButtonText: 'Hủy',
                    customClass: {
                        popup: 'animated fadeInDown'
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Gửi yêu cầu xóa
                        fetch('${pageContext.request.contextPath}/deletestaff?id=' + account_id)
                                .then(response => response.text())
                                .then(data => {
                                    // Hiển thị thông báo thành công
                                    Swal.fire({
                                        title: 'Thành công!',
                                        text: 'Đã xóa dịch vụ thành công',
                                        icon: 'success',
                                        showConfirmButton: false,
                                        timer: 1500,
                                        customClass: {
                                            popup: 'animated fadeInDown'
                                        }
                                    }).then(() => {
                                        window.location.reload();
                                    });
                                })
                                .catch(error => {
                                    // Hiển thị thông báo lỗi
                                    Swal.fire({
                                        title: 'Lỗi!',
                                        text: 'Có lỗi xảy ra khi xóa dịch vụ',
                                        icon: 'error',
                                        customClass: {
                                            popup: 'animated fadeInDown'
                                        }
                                    });
                                });
                    }
                });
            }

            // Show success/error message if exists in session
            <% 
    String message = (String) session.getAttribute("message");
    if(message != null) {
        session.removeAttribute("message"); // Clear the message
            %>
            Swal.fire({
                title: '<%= message.contains("success") ? "Thành công!" : "Lỗi!" %>',
                html: '<%= message %>',
                icon: '<%= message.contains("success") ? "success" : "error" %>',
                timer: 2000,
                showConfirmButton: false,
                customClass: {
                    popup: 'animated fadeInDown'
                }
            });
            <% } %>
        </script>
        <!-- JavaScript -->
        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!--plugins-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <!--        <script src="assets/plugins/edittable/bstable.js"></script>-->
        <!-- App JS -->
        <script src="assets/js/app.js"></script>
    </body>
</html>
