<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="en">

    <head>
        <!-- Required meta tags -->

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Syndash - Bootstrap4 Admin Template</title>
        <!--favicon-->
        <link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
        <!-- Vector CSS -->
        <link href="assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
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
            <jsp:include page="Common/Navbar.jsp"></jsp:include>
            <jsp:include page="Common/Search.jsp"></jsp:include>
            <div class="page-wrapper">
                <!--page-content-wrapper-->
                <div class="page-content-wrapper">
                    <div class="page-content">


                        <div class="card radius-15">
                            <div class="card-header border-bottom-0">
                                <div class="d-lg-flex align-items-center">
                                    <div>
                                        <h5 class="mb-2 mb-lg-0">Sales Update</h5>
                                    </div>


                                    <div class="ms-lg-auto mb-2 mb-lg-0">
                                        <form action="dashboardcustomersupport" method="get">
                                            <label for="staffName">Customer Support:</label>
                                            <select id="staffName" name="staffName" required>
                                                <option value="">-- Chose Customer Support --</option>
                                                <c:forEach items="${requestScope.listFWP}" var="feedback_customer_support">
                                                    <option value="${feedback_customer_support.appointment.staffs.admin_fullname}">
                                                        ${feedback_customer_support.appointment.staffs.admin_fullname}
                                                    </option>
                                                </c:forEach>
                                            </select>

                                            <label for="year">Year:</label>
                                            <input type="number" id="year" name="year" required min="2000" max="2100" value="<%= java.time.Year.now().getValue() %>">
                                            <button type="submit">View</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div id="chart1"></div>
                            </div>
                        </div>




                        <div class="row">
                            <div class="col-12 col-lg-4 d-flex">
                                <div class="card radius-15 w-100">
                                    <div class="card-body">
                                        <div class="d-lg-flex align-items-center">
                                            <div>
                                                <h5 class="mb-4">Top Rating</h5>
                                            </div>
                                            <div class="dropdown ms-auto">
                                                <div class="cursor-pointer font-24 dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown"><i class="bx bx-dots-horizontal-rounded"></i>
                                                </div>
                                                <div class="dropdown-menu dropdown-menu-right">	<a class="dropdown-item" href="javascript:;">Action</a>
                                                    <a class="dropdown-item" href="javascript:;">Another action</a>
                                                    <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Something else here</a>
                                                </div>
                                            </div>
                                        </div>
                                        <c:forEach items="${requestScope.listFWP}" var="feedback_customer_support">
                                            <div class="progress-wrapper mb-4">
                                                <p class="mb-1">${feedback_customer_support.appointment.staffs.admin_fullname} <span class="float-end">${feedback_customer_support.average_rating}</span>
                                                </p>
                                                <div class="progress radius-15" style="height:5px;">
                                                    <div class="progress-bar" role="progressbar" style="width: ${feedback_customer_support.average_rating}%;"></div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--end row-->

                        <!--end row-->
                        <div class="card radius-15">
                            <div class="card-header border-bottom-0">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h5 class="mb-0">Feedback Customer Support</h5>
                                    </div>
                                    <div class="ms-auto">
                                        <button type="button" class="btn btn-white btn-sm px-4 radius-15">View More</button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="searchdashboardcustomersupport" method="GET" class="d-flex align-items-center mb-3">
                                    <label for="rating" class="me-2">Rating:</label>
                                    <select id="rating" name="rating" class="form-select me-2">
                                        <option value="">All</option>
                                        <option value="1">1 Star</option>
                                        <option value="2">2 Stars</option>
                                        <option value="3">3 Stars</option>
                                        <option value="4">4 Stars</option>
                                        <option value="5">5 Stars</option>
                                    </select>

                                    <label for="support" class="me-2">Support:</label>
                                    <select id="support" name="name_support" class="form-select me-2">
                                        <option value="">All</option>
                                        <c:forEach items="${requestScope.listFWP}" var="feedback_customer_support">
                                            <option value="${feedback_customer_support.appointment.staffs.admin_fullname}">
                                                ${feedback_customer_support.appointment.staffs.admin_fullname}
                                            </option>
                                        </c:forEach>
                                    </select>

                                    <label for="startdate" class="me-2">Start Date:</label>
                                    <input type="date" id="startdate" name="start_date" class="form-control me-2">

                                    <label for="enddate" class="me-2">End Date:</label>
                                    <input type="date" id="enddate" name="end_date" class="form-control me-2">

                                    <button type="submit" class="btn btn-primary">Search</button>
                                </form>



                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th>Feedback ID</th>
                                                <th>Feedback Content</th>
                                                <th>Rating</th>
                                                <th>Customer</th>
                                                <th>Customer Support</th>
                                                <th>Feedback Date</th>
                                            </tr>
                                        </thead>
                                        <tbody id="feedbackTable">
                                            <c:forEach items="${requestScope.listF}" var="listF">
                                                <tr>
                                                    <td>${listF.feedback_id}</td>
                                                    <td>${listF.status}</td>
                                                    <td>${listF.rating}</td>
                                                    <td>${listF.full_name}</td>
                                                    <td>${listF.appointment.staffs.admin_fullname}</td>
                                                    <td>${listF.feedback_date}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                    <div class="pagination">
                                        <c:if test="${page > 1}">
                                            <a href="${type == 'search' ? 'searchdashboardcustomersupport' : 'dashboardcustomersupport'}?page=${page - 1}&name_support=${param.name_support}&start_date=${param.start_date}&end_date=${param.end_date}&rating=${param.rating}">?</a>
                                        </c:if>

                                        <c:forEach var="i" begin="1" end="${numpage}">
                                            <a href="${type == 'search' ? 'searchdashboardcustomersupport' : 'dashboardcustomersupport'}?page=${i}&name_support=${param.name_support}&start_date=${param.start_date}&end_date=${param.end_date}&rating=${param.rating}"
                                               class="${i == page ? 'active' : ''}">${i}</a>
                                        </c:forEach>

                                        <c:if test="${page < numpage}">
                                            <a href="${type == 'search' ? 'searchdashboardcustomersupport' : 'dashboardcustomersupport'}?page=${page + 1}&name_support=${param.name_support}&start_date=${param.start_date}&end_date=${param.end_date}&rating=${param.rating}">?</a>
                                        </c:if>
                                    </div>


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
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!--plugins-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <!-- Vector map JavaScript -->
        <script src="assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-in-mill.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-us-aea-en.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-uk-mill-en.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-au-mill.js"></script>
        <script src="assets/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>

        <!--        <script src="assets/js/index2.js"></script>-->
        <!-- App JS -->
        <script src="assets/js/app.js"></script>

        <script>
            $(function () {
                var feedbackData = [];
                var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

            <c:forEach var="feedback" items="${requestScope.listFM}">
                feedbackData.push({month: ${feedback.month}, rating: ${feedback.average_rating}});
            </c:forEach>

                var ratings = new Array(12).fill(0);
                feedbackData.forEach(function (data) {
                    ratings[data.month - 1] = data.rating;
                });

                var options = {
                    series: [{
                            name: 'Average Rating',
                            data: ratings
                        }],
                    chart: {
                        foreColor: '#9ba7b2',
                        type: 'area',
                        height: 340,
                        toolbar: {show: false},
                        zoom: {enabled: false}
                    },
                    legend: {
                        position: 'top',
                        horizontalAlign: 'left',
                        offsetX: -25
                    },
                    dataLabels: {enabled: false},
                    stroke: {show: true, width: 3, curve: 'smooth'},
                    tooltip: {
                        theme: 'dark',
                        y: {
                            formatter: function (val) {
                                return val + '%';
                            }
                        }
                    },
                    fill: {
                        type: 'gradient',
                        gradient: {
                            shade: 'light',
                            gradientToColors: ['#377dff'],
                            shadeIntensity: 1,
                            type: 'vertical',
                            inverseColors: false,
                            opacityFrom: 0.4,
                            opacityTo: 0.1
                        }
                    },
                    grid: {show: true, borderColor: '#f8f8f8', strokeDashArray: 5},
                    colors: ["rgb(34,139,34)"],
                    yaxis: {
                        labels: {
                            formatter: function (value) {
                                return value + '%';
                            }
                        }
                    },
                    xaxis: {categories: months}
                };

                var chart = new ApexCharts(document.querySelector("#chart1"), options);
                chart.render();
            });
        </script>
    </body>

</html>