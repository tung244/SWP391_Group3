<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="Common/Css.jsp"/>  
        <style>
            .filter {
                margin: 20px 80px;

                border-radius: 8px;
            }

            .search-filter-box {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                align-items: center;
                justify-content: space-between;
            }

            .search-filter-box select,
            .search-filter-box input {
                flex: 1;
                min-width: 225px;
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                outline: none;
                transition: all 0.3s;
            }

            .search-filter-box select:focus,
            .search-filter-box input:focus {
                border-color: #228B22;
                box-shadow: 0 0 0 2px rgba(34, 139, 34, 0.2);
            }

            .btn-search {
                background-color: #228B22;
                color: white;
                border: none;
                padding: 8px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .btn-search:hover {
                background-color: #1a6b1a;
            }

            /* Pagination styling */
            .pagination-container {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .pagination-container label {
                margin: 0 8px;
            }

            .pagination-container select {
                border: 1px solid #ccc;
                border-radius: 4px;
                padding: 4px;
                outline: none;
            }

            .pagination-container select:focus {
                border-color: #228B22;
            }

            .pagination {
                display: flex;
                justify-content: center;
                margin: 20px 0;
                gap: 5px;
            }

            .pagination a {
                color: #333;
                padding: 8px 12px;
                text-decoration: none;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .pagination a:hover {
                background-color: rgba(34, 139, 34, 0.2);
                border-color: #228B22;
            }

            .pagination a.active {
                background-color: #228B22;
                color: white;
                border-color: #228B22;
            }

            /* Additional styling for the table and card */
            .card {
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border: none;
            }

            .card-title {
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
            }

            .card-title h4 {
                color: #228B22;
                font-weight: bold;
            }

            .btn-primary {
                background-color: #228B22;
                border-color: #228B22;
            }

            .btn-primary:hover {
                background-color: #1a6b1a;
                border-color: #1a6b1a;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .search-filter-box {
                    flex-direction: column;
                }

                .search-filter-box select,
                .search-filter-box input {
                    width: 100%;
                }

                .card-title {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .card-title a {
                    margin: 10px 0;
                    margin-left: 0 !important;
                }
            </style>
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
                                            <li class="breadcrumb-item active" aria-current="page"><a>List Specialization</a></li>
                                        </ol>
                                    </nav>
                                </div>

                            </div>
                            <!--end breadcrumb-->
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 style="margin-left: 2%" class="mb-0">Specialization Table</h4>



                                        <div style="margin-left: 20%" class="filter">
                                            <!-- Start filter area--> 
                                            <form action="listSpecialization" method="GET">
                                                <div style="margin: 0px 20px" class="search-filter-box">

                                                    <input type="text" name="searchName" id="searchName" class="form-control" placeholder="Find specialization by name" 
                                                           value="${param.searchName != null ? param.searchName : ''}">

                                                    <select name="option" class="form-control">
                                                        <option value="">Sort By Name</option>
                                                        <option value="asc" ${param.option == 'asc' ? 'selected' : ''}>A-Z</option>
                                                        <option value="desc" ${param.option == 'desc' ? 'selected' : ''}>Z-A</option>
                                                    </select>

                                                    <button type="submit" class="btn-search">Search</button>
                                                </div>
                                            </form>

                                        </div>

                                    </div>

                                </div>
                                <hr/>
                                <div class="pagination-container" style="margin-left: auto;">
                                    <label for="pageSize">Show:</label>
                                    <select name="pageSize" id="pageSize" style="width: 55px;
                                            height: 30px">
                                        <option value="5" selected >5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
                                    </select>
                                    <label for="pageSize">specializations per page</label>
                                </div>
                                <div class="table-responsive">
                                    <div id="specializationList">
                                        <table id="example" class="table table-striped table-bordered" style="width:96%;
                                               margin: 0px 2%">
                                            <thead style="text-align: center">
                                                <tr>
                                                    <th scope="col" style="color: green">ID</th>
                                                    <th scope="col" style="color: green">Name</th>
                                                    <th scope="col" style="color: green">Status</th> 
                                                    <th scope="col" style="color: green">Action</th>

                                                </tr>
                                            </thead>
                                            <tbody style="text-align: center">
                                                <c:forEach var="lsp" items="${listSpe}">
                                                    <tr>

                                                        <td>${lsp.specialization_id}</td>
                                                        <td>${lsp.specialization_name}</td>
                                                        <td>${lsp.specialization_status}</td>

                                                        <td>  
                                                            <a href="#" title="Update" data-bs-toggle="modal" data-bs-target="#updateModal" 
                                                               onclick="loadUpdateModal('${lsp.specialization_id}', '${lsp.specialization_name}', '${lsp.specialization_status}')">
                                                                <i class="fas fa-edit"></i>
                                                            </a>

                                                            <a style="margin-left: 5%" href="#" title="View" data-bs-toggle="modal" data-bs-target="#viewModal"
                                                               onclick="loadSpecializationDetails('${lsp.specialization_id}')">
                                                                <i class="fas fa-eye"></i>
                                                            </a>

                                                            <a style="margin-left: 5%"  href="#" title="Add" data-bs-toggle="modal" data-bs-target="#addModal">
                                                                <i class="fas fa-plus-circle"></i> 
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Pagination -->
                                    <div class="pagination" id="pagination">
                                        <!-- Pagination will be loaded here via AJAX -->

                                        <!-- Pagination -->
                                        <div class="pagination" id="pagination">
                                            <c:if test="${currentPage > 1}">
                                                <a href="#" data-page="${currentPage - 1}">&laquo; Previous</a>
                                            </c:if>

                                            <c:forEach begin="1" end="${totalPages}" var="page">
                                                <a href="#" data-page="${page}" class="${page == currentPage ? 'active' : ''}">
                                                    ${page}
                                                </a>
                                            </c:forEach>

                                            <c:if test="${currentPage < totalPages}">
                                                <a href="#" data-page="${currentPage + 1}">Next &raquo;</a>
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
                            <h5 class="modal-title" id="modalLabel">Specialization Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="modalContent">

                        </div>
                        <div class="modal-footer">
                            <button type="button" style="background-color: green" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Add Degree -->
            <!-- Modal Add Specialization -->
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Specialization</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Form thêm Specialization -->
                            <form id="addSpecializationForm" method="post">
                                <div class="mb-3">
                                    <label for="speName" class="form-label">Specialization Name</label>
                                    <input type="text" class="form-control" id="speName" name="speName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="speStatus" class="form-label">Specialization Status</label>
                                    <select class="form-select" id="speStatus" name="speStatus">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <input type="hidden" id="speId" name="speId">
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="addSpe()">Save</button>
                        </div>
                    </div>
                </div>
            </div>



            <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Update Specialization Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Update form -->
                            <form id="updateSpecializationForm">
                                <input type="hidden" id="specializationId" name="specializationId">

                                <div class="mb-3">
                                    <label for="updateSpecializationName" class="form-label">Specialization Name</label>
                                    <input type="text" class="form-control" id="updateSpecializationName" name="specializationName" required>
                                </div>

                                <div class="mb-3">
                                    <label for="updateSpecializationStatus" class="form-label">Specialization Status</label>
                                    <select class="form-control" id="updateSpecializationStatus" name="specializationStatus">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="updateSpecialization()">Update</button>
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
        <script>

                                function loadSpe(page = 1) {
                                    let pageSize = document.getElementById("pageSize").value;
                                    $.ajax({
                                        url: "listSpecialization",
                                        type: "GET",
                                        data: {

                                            searchName: "${param.searchName}",
                                            option: "${param.option}",
                                            page: page,
                                            pageSize: pageSize
                                        },
                                        success: function (response) {
                                            $("#specializationList").html($(response).find("#specializationList").html());
                                            $("#pagination").html($(response).find("#pagination").html());
                                        }
                                    });
                                }


                                $(document).on("change", "#pageSize", function () {
                                    loadSpe();
                                });


                                $(document).on("click", ".pagination a", function (e) {
                                    e.preventDefault();
                                    let page = $(this).attr("data-page");
                                    if (page) {
                                        loadSpe(page);
                                    }
                                });


                                $(document).ready(function () {
                                    loadSpe();
                                });

                                function loadSpecializationDetails(specializationId) {
                                    console.log("Loading specialization ID:", specializationId);

                                    $.ajax({
                                        url: 'listSpecialization',
                                        type: 'POST',
                                        data: {action: "loadSpecializationDetails", specializationId: specializationId},
                                        success: function (response) {
                                            console.log("Response received:", response);
                                            $('#modalContent').html(response);
                                            $('#viewModal').modal('show');
                                        },
                                        error: function () {
                                            console.log("Error loading data");
                                            $('#modalContent').html('<p style="color: red">Error loading data</p>');
                                        }
                                    });
                                }


                                function addSpe() {
                                    var speName = document.getElementById("speName").value;
                                    var speStatus = document.getElementById("speStatus").value;

                                    if (speName.trim() === "") {
                                        alert("Please enter a specialization name!");
                                        return;
                                    }

                                    $.ajax({
                                        url: 'listSpecialization',
                                        type: 'POST',
                                        data: {
                                            action: "addSpecialization",
                                            speName: speName,
                                            speStatus: speStatus
                                        },
                                        success: function (response) {
                                            alert("Specialization added successfully!");
                                            $("#addModal").modal("hide");
                                            location.reload(); // Load lại danh sách
                                        },
                                        error: function (xhr) {
                                            alert(xhr.responseText || "Error adding specialization!");
                                        }
                                    });
                                }


                                function loadUpdateModal(specializationId, specializationName, specializationStatus) {
                                    document.getElementById("specializationId").value = specializationId;
                                    document.getElementById("updateSpecializationName").value = specializationName;
                                    document.getElementById("updateSpecializationStatus").value = specializationStatus;
                                }

                                function updateSpecialization() {
                                    var specializationId = document.getElementById("specializationId").value;
                                    var specializationName = document.getElementById("updateSpecializationName").value;
                                    var specializationStatus = document.getElementById("updateSpecializationStatus").value;

                                    if (specializationName.trim() === "") {
                                        alert("Please enter a specialization name!");
                                        return;
                                    }

                                    $.ajax({
                                        url: 'listSpecialization',
                                        type: 'POST',
                                        data: {
                                            action: "updateSpecialization",
                                            specializationId: specializationId,
                                            specializationName: specializationName,
                                            specializationStatus: specializationStatus
                                        },
                                        success: function (response) {
                                            alert("Specialization updated successfully!");
                                            $("#updateModal").modal("hide");
                                            location.reload(); // Load lại danh sách
                                        },
                                        error: function () {
                                            alert("Error updating specialization!");
                                        }
                                    });
                                }




        </script>
    </body>

</html>