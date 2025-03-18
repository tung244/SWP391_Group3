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
                min-width: 150px;
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
                <jsp:include page="Common/Navbar.jsp"/>    
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

                                        <a href="createAccount" class="btn btn-primary" style="margin-left:85%;">Add a doctor</a>

                                        <div style="" class="filter">
                                            <!-- Start filter area--> 
                                            <form action="DoctorList" method="GET">

                                                <div style="margin: 0px 50px" class="search-filter-box">

                                                    <select  name="sid" id="filterSpecialization" class="form-control" >
                                                        <option value="">All specialization</option>
                                                        <c:forEach items="${listSpecialization}" var="s">
                                                            <option value="${s.specialization_id}" 
                                                                    ${param.sid == s.specialization_id ? 'selected' : ''}>
                                                                ${s.specialization_name}
                                                            </option>
                                                        </c:forEach>
                                                    </select>

                                                    <select name="deid" id="filterDegree" class="form-control">
                                                        <option value="">All degree</option>
                                                        <c:forEach items="${listDegree}" var="de">
                                                            <option value="${de.degree_id}"
                                                                    ${param.deid == de.degree_id ? 'selected' : ''}>   
                                                                ${de.degree_name}</option>
                                                            </c:forEach>
                                                    </select>

                                                    <input type="text" name="searchName" id="searchName" class="form-control" placeholder="Find doctor by name" 
                                                           value="${param.searchName != null ? param.searchName : ''}">

                                                    <!-- Sort options -->

                                                    <select name="sortBy" class="form-control">
                                                        <option value="">Sort By</option>
                                                        <option value="sortByName" ${param.sortBy == 'sortByName' ? 'selected' : ''}>Sort by name</option>
                                                        <option value="sortByExperience" ${param.sortBy == 'sortByExperience' ? 'selected' : ''}>Sort by experience</option>
                                                        <option value="sortByRating" ${param.sortBy == 'sortByRating' ? 'selected' : ''}>Sort by rating</option>
                                                    </select>
                                                    <select name="option" class="form-control">
                                                        <option value="asc" ${param.option == 'asc' ? 'selected' : ''}>Low - High</option>
                                                        <option value="desc" ${param.option == 'desc' ? 'selected' : ''}>High - Low</option>
                                                    </select>
                                                    <button type="submit" class="btn-search">Search</button>
                                                </div>
                                            </form>

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
                                        <label for="pageSize">doctors per page</label>
                                    </div>
                                    <div class="table-responsive">
                                        <div id="doctorList">
                                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                                <thead style="">
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
                                                <tbody style="">
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
                                                            <td>
                                                                <form action="DoctorList" method="POST">

                                                                    <input type="hidden" name="doctor_id" value="${d.doctor_id}"> 
                                                                    <select style="background-color:#228B22;
                                                                            color: #ffffff" name="status" onchange="confirmStatusChange(this)" data-original="${d.doctor_status}">
                                                                        <option style="background-color:#ffffff;
                                                                                color: #228B22" value="Active" ${d.doctor_status == 'Active' ? 'selected' :''}>Active</option>
                                                                        <option style="background-color:#ffffff;
                                                                                color: #228B22" value="Inactive" ${d.doctor_status == 'Inactive' ? 'selected' :''}>Inactive</option>
                                                                    </select>
                                                                </form>  
                                                            </td>

                                                            <td>                                    
                                                                <a  href="listDoctorDetail?doctor_id=${d.doctor_id}" title="View" data-toggle="modal" data-target="#viewModal">
                                                                    <i class="fas fa-eye"></i>
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
                            <%
                                String succesMessage = (String) session.getAttribute("success");
                                if(succesMessage != null) {
                            %>
                            <script>
                                alert("<%= succesMessage %> ");
                            </script>
                            <%
                             session.removeAttribute("success");
                                }
                            %>
                        </div>
                    </div>
                    <!--end page-content-wrapper-->
                </div>
                <!-- Modal -->         
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
                                function confirmStatusChange(selectedElement) {
                                    if (confirm('Are you sure to change the status of doctor!')) {
                                        selectedElement.form.submit();
                                    } else {
                                        selectedElement.value = selectedElement.getAttribute('data-original');
                                    }
                                }



                                function loadDoctors(page = 1) {
                                    let pageSize = document.getElementById("pageSize").value;
                                    $.ajax({
                                        url: "DoctorList",
                                        type: "GET",
                                        data: {
                                            sid: "${param.sid}",
                                            deid: "${param.deid}",
                                            searchName: "${param.searchName}",
                                            sortBy: "${param.sortBy}",
                                            option: "${param.option}",
                                            page: page,
                                            pageSize: pageSize
                                        },
                                        success: function (response) {
                                            $("#doctorList").html($(response).find("#doctorList").html());
                                            $("#pagination").html($(response).find("#pagination").html());
                                        }
                                    });
                                }


                                $(document).on("change", "#pageSize", function () {
                                    loadDoctors();
                                });


                                $(document).on("click", ".pagination a", function (e) {
                                    e.preventDefault();
                                    let page = $(this).attr("data-page");
                                    if (page) {
                                        loadDoctors(page);
                                    }
                                });


                                $(document).ready(function () {
                                    loadDoctors();
                                });


            </script>
        </body>

    </html>