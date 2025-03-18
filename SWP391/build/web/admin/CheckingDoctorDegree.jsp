<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                                            <li class="breadcrumb-item active" aria-current="page"><a>List Censor Doctor Degree</a></li>
                                        </ol>
                                    </nav>
                                </div>

                            </div>
                            <!--end breadcrumb-->
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4  class="mb-0">Censor Doctor Degree Table</h4>
                                    </div>                                   
                                </div>
                                <h4 style="color: #228B22;
                                    margin-left: 3%"  class="mb-0">Checking Add Degree List</h4>
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
                                    <label for="pageSize">degrees per page</label>
                                </div>
                                <div class="table-responsive">
                                    <div id="degreeList">
                                        <table id="example" class="table table-striped table-bordered" style="width:96%;
                                               margin: 0px 2%">
                                            <thead style="text-align: center">
                                                <tr>
                                                    <th scope="col" style="color: green">Doctor ID</th>
                                                    <th scope="col" style="color: green">Degree Id</th>
                                                    <th scope="col" style="color: green">Degree Image</th>
                                                    <th scope="col" style="color: green">Degree Name</th>         
                                                    <th scope="col" style="color: green">Date Degree</th>
                                                    <th scope="col" style="color: green">Issued By</th>
                                                    <th scope="col" style="color: green">Status </th>

                                                </tr>
                                            </thead>
                                            <tbody style="text-align: center">
                                                <c:forEach var="ldd" items="${listDeDoc}">
                                                    <tr>

                                                        <td>${ldd.doctor_id}</td>
                                                        <td>${ldd.degree_id}</td>
                                                        <td><img src=".${ldd.degree_image}" width="150px" height="150px" alt="Degree Image"/></td>
                                                        <td>${ldd.degree.degree_name}</td>
                                                        <td>
                                                            <fmt:parseDate value="${ldd.date_degree}" pattern="yyyy-MM-dd" var="parsedDate" />
                                                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy"/> 
                                                        </td>

                                                        <td>${ldd.issued_by}</td>

                                                        <td>  
                                                            <form action="checkingDoctorDegree" method="POST">
                                                                <input type="hidden" name="doctor_id" value="${ldd.doctor_id}"> 
                                                                <input type="hidden" name="degree_id" value="${ldd.degree_id}"> 
                                                                <select style="background-color:#228B22;
                                                                        color: #ffffff" name="status" onchange="confirmStatusChange(this)" data-original="${ldd.status}">
                                                                    <option style="background-color:#ffffff;
                                                                            color: #228B22" value="Accept" ${ldd.status == 'Accept' ? 'selected' :''}>Accept</option>
                                                                    <option style="background-color:#ffffff;
                                                                            color: #228B22" value="InProgress" ${ldd.status == 'InProgress' ? 'selected' :''}>In Progress</option>
                                                                    <option style="background-color:#ffffff;
                                                                            color: #228B22" value="Reject" ${ldd.status == 'Reject' ? 'selected' :''}>Reject</option>
                                                                </select>
                                                            </form> 
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

                                <h4 style="color: #228B22;
                                    margin-left: 3%" class="mb-0">History Censor Doctor Degree</h4>
                                <hr/>
                                <div class="pagination-container" style="margin-left: auto;">
                                    <label for="historyPageSize">Show:</label>
                                    <select name="historyPageSize" id="historyPageSize" style="width: 55px;
                                            height: 30px">
                                        <option value="5" ${historyPageSize == 5 ? 'selected' : ''}>5</option>
                                        <option value="10" ${historyPageSize == 10 ? 'selected' : ''}>10</option>
                                        <option value="15" ${historyPageSize == 15 ? 'selected' : ''}>15</option>
                                        <option value="20" ${historyPageSize == 20 ? 'selected' : ''}>20</option>
                                    </select>
                                    <label for="historyPageSize">degrees per page</label>
                                </div>
                                <div class="table-responsive">
                                    <div id="historyDegreeList">
                                        <table id="historyTable" class="table table-striped table-bordered" style="width:96%;
                                               margin: 0px 2%">
                                            <thead style="text-align: center">
                                                <tr>
                                                    <th scope="col" style="color: green">Doctor ID</th>
                                                    <th scope="col" style="color: green">Degree Id</th>
                                                    <th scope="col" style="color: green">Degree Image</th>
                                                    <th scope="col" style="color: green">Degree Name</th>         
                                                    <th scope="col" style="color: green">Date Degree</th>
                                                    <th scope="col" style="color: green">Issued By</th>          
                                                    <th scope="col" style="color: green">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody style="text-align: center">
                                                <c:forEach var="hist" items="${historyDeDoc}">
                                                    <tr>
                                                        <td>${hist.doctor_id}</td>
                                                        <td>${hist.degree_id}</td>
                                                        <td><img src=".${hist.degree_image}" width="150px" height="150px" alt="Degree Image"/></td>
                                                        <td>${hist.degree.degree_name}</td>
                                                        <td>
                                                            <fmt:parseDate value="${hist.date_degree}" pattern="yyyy-MM-dd" var="parsedDate" />
                                                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy"/> 
                                                        </td>
                                                        <td>${hist.issued_by}</td>
                                                        
                                                        <td style="color: #228B22"><strong>${hist.status}</strong></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Pagination for History -->
                                    <div class="pagination" id="historyPagination">
                                        <c:if test="${currentHistoryPage > 1}">
                                            <a href="#" data-history-page="${currentHistoryPage - 1}">&laquo; Previous</a>
                                        </c:if>

                                        <c:forEach begin="1" end="${totalHistoryPages}" var="page">
                                            <a href="#" data-history-page="${page}" class="${page == currentHistoryPage ? 'active' : ''}">
                                                ${page}
                                            </a>
                                        </c:forEach>

                                        <c:if test="${currentHistoryPage < totalHistoryPages}">
                                            <a href="#" data-history-page="${currentHistoryPage + 1}">Next &raquo;</a>
                                        </c:if>
                                    </div>
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
                        if (confirm('Are you sure to change the status of degree doctor!')) {
                            selectedElement.form.submit();
                        } else {
                            selectedElement.value = selectedElement.getAttribute('data-original');
                        }
                    }

                    function loadDegree(page = 1) {
                        let pageSize = document.getElementById("pageSize").value;
                        $.ajax({
                            url: "checkingDoctorDegree",
                            type: "GET",
                            data: {

                                page: page,
                                pageSize: pageSize
                            },
                            success: function (response) {
                                $("#degreeList").html($(response).find("#degreeList").html());
                                $("#pagination").html($(response).find("#pagination").html());
                            }
                        });
                    }

                    $(document).on("change", "#pageSize", function () {
                        loadDegree();
                    });


                    $(document).on("click", ".pagination a", function (e) {
                        e.preventDefault();
                        let page = $(this).attr("data-page");
                        if (page) {
                            loadDegree(page);
                        }
                    });


                    // Function to load history degrees
                    function loadHistoryDegrees(page = 1) {
                        let pageSize = document.getElementById("historyPageSize").value;
                        $.ajax({
                            url: "checkingDoctorDegree",
                            type: "GET",
                            data: {
                                historyPage: page,
                                historyPageSize: pageSize,
                                checkPage: $("#pagination a.active").attr("data-page") || 1,
                                checkPageSize: $("#pageSize").val()
                            },
                            success: function (response) {
                                $("#historyDegreeList").html($(response).find("#historyDegreeList").html());
                                $("#historyPagination").html($(response).find("#historyPagination").html());
                            }
                        });
                    }

                    // Event handler for history degrees pagination
                    $(document).on("change", "#historyPageSize", function () {
                        loadHistoryDegrees();
                    });

                    $(document).on("click", "#historyPagination a", function (e) {
                        e.preventDefault();
                        let page = $(this).attr("data-history-page");
                        if (page) {
                            loadHistoryDegrees(page);
                        }
                    });


                    $(document).ready(function () {
                        loadDegree();
                        loadHistoryDegrees();
                    });







</script>
</body>

</html>