<%-- 
    Document   : AdminDashBoard
    Created on : Mar 3, 2025, 4:58:25 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .chart-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
            /* Đặt container biểu đồ theo hàng ngang */
            .chart-row-container {
                display: flex; /* Đặt Flexbox để căn ngang */
                flex-direction: row; /* Các phần tử hiển thị theo chiều ngang */
                justify-content: space-between; /* Khoảng cách đồng đều giữa các biểu đồ */
                align-items: flex-start; /* Căn đều trên theo độ cao */
                gap: 20px; /* Khoảng cách giữa các biểu đồ */
            }

            .chart-wrapper {
                flex: 1; /* Chia đều chiều rộng cho các biểu đồ */
                min-width: 40%; /* Đảm bảo độ rộng tối thiểu của mỗi biểu đồ */
                max-width: 45%; /* Độ rộng tối đa, đảm bảo không quá lớn */
            }

            .chart-title {
                text-align: center;
                font-size: 16px;
                margin-bottom: 10px;
            }

            #quarter-revenue-chart,
            #month-revenue-chart {
                width: 100%; /* Biểu đồ chiếm toàn bộ khung cha */
                height: 350px; /* Cài đặt chiều cao của biểu đồ */
            }
            #year-select {
                margin-left: 10px;
                width: auto;
            }
            #quarter-select{
                width: auto;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Common/Navbar.jsp"/>
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-voilet">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">${serviceCount}</h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-cart-alt"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Service Actice</p>
                                        </div>
                                        <!--                                        <div class="ms-auto font-14 text-white">+23.4%</div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-wall">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">${doctorCount}</h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-cog"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Doctors</p>
                                        </div>
                                        <!--                                        <div class="ms-auto font-14 text-white">+14.7%</div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-primary-blue">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">${cusCount}</h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-support"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Customers</p>
                                        </div>
                                        <!--                                        <div class="ms-auto font-14 text-white">+14.7%</div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-rose">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">${saleCount} </h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-tachometer"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Sales Staff</p>
                                        </div>
                                        <!--                                        <div class="ms-auto font-14 text-white">-12.9%</div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-sunset">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">${supportCount}</h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-user"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Support Staff</p>
                                        </div>
                                        <!--                                        <div class="ms-auto font-14 text-white">+13.6%</div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end row-->
                    <div class="card radius-15">
                        <div class="card-header border-bottom-0">
                            <div class="d-lg-flex align-items-center">
                                <div>
                                    <h5 class="mb-2 mb-lg-0">Appointment Statistic</h5>
                                </div>
                                <div class="ms-lg-auto mb-2 mb-lg-0">
                                    <div class="d-flex align-items-center">
                                        <label for="start-date" class="me-2">From:</label>
                                        <input type="date" id="start-date" class="form-control me-3">
                                        <label for="end-date" class="me-2">To:</label>
                                        <input type="date" id="end-date" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="chart1"></div>
                            <hr>
                            <h5>Appointment Statistics</h5>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Service</th>
                                        <th>Total Appointments</th>
                                        <th>Total Revenue ($)</th>
                                        <th>Success Rate (%)</th>
                                        <th>Cancel Rate (%)</th>
                                        <th>Average Rating ($)</th>
                                    </tr>
                                </thead>
                                <tbody id="appointment-stats">
                                    <tr><td colspan="3" class="text-center">Select a date range to see data</td></tr>
                                </tbody>
                            </table>
                            <hr>
                            <h5>Doctor Statistics</h5>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Doctor</th>
                                        <th>Total Appointments</th>
                                        <th>Total Revenue ($)</th>
                                        <th>Success Rate (%)</th>
                                        <th>Cancel Rate (%)</th>
                                        <th>Average Rating</th>
                                    </tr>
                                </thead>
                                <tbody id="doctor-stats">
                                    <tr><td colspan="6" class="text-center">Select a date range to see data</td></tr>
                                </tbody>
                            </table>

                        </div>
                    </div>

                    <div class="card radius-15">
                        <div class="card-header">
                            <h5 class="mb-2 mb-lg-0">Revenue Statistics</h5>
                        </div>
                        <div class="card-body">
                            <!-- Dropdown chọn năm -->
                            <div class="row mb-4">
                                <div class="col-6">
                                    <label for="year-select">Select Year:</label>
                                    <select id="year-select" class="form-select">
                                        <option value="2025">2025</option>
                                        <option value="2024">2024</option>
                                        <option value="2023">2023</option>
                                    </select>
                                </div>
                                <div class="col-6">
                                    <label for="quarter-select">Select Quarter:</label>
                                    <select id="quarter-select" class="form-select">
                                        <option value="1">Quarter 1</option>
                                        <option value="2">Quarter 2</option>
                                        <option value="3">Quarter 3</option>
                                        <option value="4">Quarter 4</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Biểu đồ: hiển thị theo hàng ngang -->
                            <div class="chart-row-container">
                                <div class="chart-wrapper">
                                    <h6 class="chart-title">Quarterly Revenue</h6>
                                    <div id="quarter-revenue-chart"></div>
                                </div>
                                <div class="chart-wrapper">
                                    <h6 class="chart-title">Monthly Revenue</h6>
                                    <div id="month-revenue-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="card radius-15">
                        <div class="card-header border-bottom-0">
                            <div class="d-lg-flex align-items-center">
                                <div>
                                    <h5 class="mb-2 mb-lg-0">Service Statistic</h5>
                                </div>
                                <div class="ms-lg-auto mb-2 mb-lg-0">
                                    <div class="d-flex align-items-center">
                                        <select id="year-select2" class="form-select">
                                            <option value="2023">2023</option>
                                            <option value="2024">2024</option>
                                            <option value="2025">2025</option>
                                        </select>
                                        <select id="month-select" class="form-select">
                                            <option value="">All Months</option>
                                            <option value="1">January</option>
                                            <option value="2">February</option>
                                            <option value="3">March</option>
                                            <option value="4">April</option>
                                            <option value="5">May</option>
                                            <option value="6">June</option>
                                            <option value="7">July</option>
                                            <option value="8">August</option>
                                            <option value="9">September</option>
                                            <option value="10">October</option>
                                            <option value="11">November</option>
                                            <option value="12">December</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <hr>
                            <h5>Service Statistics</h5>
                            <div id="service-revenue-chart"></div>
                        </div>
                    </div> 

                    <%@ page import="java.util.List" %>
                    <%@ page import="model.UserProfile" %>
                    <%@ page import="model.Checkout" %>

                    <%
                        List<UserProfile> topCustomers = (List<UserProfile>) request.getAttribute("tList");
                    %>

                    <div class="card radius-15">
                        <div class="card-header border-bottom-0">
                            <h5 class="mb-2 mb-lg-0">Top 10 Customers by Spending</h5>
                        </div>
                        <div class="card-body">
                            <hr>
                            <h5>Top Spenders</h5>
                            <div id="top-spending-customers-chart"></div>
                        </div>
                    </div>

                    <%@ page import="java.util.List" %>
                    <%@ page import="model.AgeGroupStats" %>

                    <%
                        List<AgeGroupStats> ageStats = (List<AgeGroupStats>) request.getAttribute("aList");
                    %>

                    <div class="card radius-15">
                        <div class="card-header border-bottom-0">
                            <h5 class="mb-2 mb-lg-0">Appointments by Age Group</h5>
                        </div>
                        <div class="card-body">
                            <hr>
                            <h5>Age Group Statistics</h5>
                            <div id="appointments-age-group-chart"></div>
                        </div>
                    </div>
                    <!--                    <div class="card radius-15">
                                            <div class="card-header border-bottom-0">
                                                <div class="d-lg-flex align-items-center">
                                                    <div>
                                                        <h5 class="mb-2 mb-lg-0">Crowed Time</h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: flex;justify-content: center; align-items: center" class="card-body">
                                                <canvas id="crowed-chart"></canvas>
                                            </div>
                                        </div>-->
                    <div class="card radius-15">
                        <div class="card-header border-bottom-0">
                            <div class="d-lg-flex align-items-center">
                                <div>
                                    <h5 class="mb-2 mb-lg-0">Crowed Time</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body" 
                             style="display: flex; justify-content: center; align-items: center; height: 300px; max-width: 100%;">
                            <canvas id="crowed-chart" style="width: 100%; height: 100%;"></canvas>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="card radius-15">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h5 class="mb-0">Revenue By Device</h5>
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
                                    <div id="chart2"></div>
                                    <div class="legends">
                                        <div class="row">
                                            <div class="col-12 col-lg-5">
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="text-secondary"><i class='bx bxs-circle font-13 text-primary-blue me-2'></i>Desktop</div>
                                                    <div>$850.04</div>
                                                    <div class="text-secondary">64.4%</div>
                                                </div>
                                                <div class="my-2"></div>
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="text-secondary"><i class='bx bxs-circle font-13 text-shineblue me-2'></i>Mobile</div>
                                                    <div>$755.08</div>
                                                    <div class="text-secondary">48.6%</div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-lg-2">
                                                <div class="vertical-separater"></div>
                                            </div>
                                            <div class="col-12 col-lg-5">
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="text-secondary"><i class='bx bxs-circle font-13 text-primary me-2'></i>Tablet</div>
                                                    <div>$687.03</div>
                                                    <div class="text-secondary">24.7%</div>
                                                </div>
                                                <div class="my-2"></div>
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="text-secondary"><i class='bx bxs-circle font-13 text-red me-2'></i>Unknown</div>
                                                    <div>$142.07</div>
                                                    <div class="text-secondary">14.8%</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="card radius-15">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h5 class="mb-0">Traffic</h5>
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
                                    <div class="row mt-3 g-3">
                                        <div class="col-12 col-lg-6">
                                            <div class="card radius-15 border shadow-none">
                                                <div class="card-body">
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <p class="mb-0">Store Visits</p>
                                                        </div>
                                                        <div class="ms-auto text-success"><span>+22%</span>
                                                        </div>
                                                    </div>
                                                    <h4 class="mb-0">8950</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="card radius-15 border shadow-none">
                                                <div class="card-body">
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <p class="mb-0">Visitors</p>
                                                        </div>
                                                        <div class="ms-auto text-purple"><span>-24%</span>
                                                        </div>
                                                    </div>
                                                    <h4 class="mb-0">1520</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="chart3"></div>
                                </div>
                            </div>
                        </div>
                    </div><!--end row-->


                    <div class="row">
                        <div class="col-12 col-lg-4 d-flex">
                            <div class="card radius-15 w-100">
                                <div class="card-body">
                                    <div class="d-lg-flex align-items-center">
                                        <div>
                                            <h5 class="mb-4">Top Categories</h5>
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
                                    <div class="progress-wrapper mb-4">
                                        <p class="mb-1">Electronics <span class="float-end">45%</span>
                                        </p>
                                        <div class="progress radius-15" style="height:5px;">
                                            <div class="progress-bar" role="progressbar" style="width: 45%"></div>
                                        </div>
                                    </div>
                                    <div class="progress-wrapper mb-4">
                                        <p class="mb-1">Clothing <span class="float-end">55%</span>
                                        </p>
                                        <div class="progress radius-15" style="height:5px;">
                                            <div class="progress-bar bg-voilet" role="progressbar" style="width: 55%"></div>
                                        </div>
                                    </div>
                                    <div class="progress-wrapper mb-4">
                                        <p class="mb-1">Furniture <span class="float-end">64%</span>
                                        </p>
                                        <div class="progress radius-15" style="height:5px;">
                                            <div class="progress-bar bg-red-light" role="progressbar" style="width: 64%"></div>
                                        </div>
                                    </div>
                                    <div class="progress-wrapper mb-4">
                                        <p class="mb-1">Accessories <span class="float-end">78%</span>
                                        </p>
                                        <div class="progress radius-15" style="height:5px;">
                                            <div class="progress-bar bg-sunset" role="progressbar" style="width: 78%"></div>
                                        </div>
                                    </div>
                                    <div class="progress-wrapper mb-4">
                                        <p class="mb-1">Jewellery <span class="float-end">82%</span>
                                        </p>
                                        <div class="progress radius-15" style="height:5px;">
                                            <div class="progress-bar bg-wall" role="progressbar" style="width: 82%"></div>
                                        </div>
                                    </div>
                                    <div class="progress-wrapper">
                                        <p class="mb-1">Mobiles <span class="float-end">89%</span>
                                        </p>
                                        <div class="progress radius-15" style="height:5px;">
                                            <div class="progress-bar bg-dark" role="progressbar" style="width: 89%"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-8 d-flex">
                            <div class="card radius-15 w-100">
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <div>
                                            <h5 class="mb-0">Sales Forecast</h5>
                                        </div>
                                        <div class="dropdown ms-auto">
                                            <div class="cursor-pointer text-dark font-24 dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown"><i class="bx bx-dots-horizontal-rounded"></i>
                                            </div>
                                            <div class="dropdown-menu dropdown-menu-right">	<a class="dropdown-item" href="javascript:;">Action</a>
                                                <a class="dropdown-item" href="javascript:;">Another action</a>
                                                <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row g-3">
                                        <div class="col-12 col-lg-6">
                                            <div class="card radius-15 border shadow-none mb-0">
                                                <div class="card-body">
                                                    <div class="d-flex flex-row align-items-center">
                                                        <div class="">
                                                            <p class="text-secondary mb-0">Revenue</p>
                                                            <h4 class="mb-0 ">+24.5%</h4>
                                                        </div>
                                                        <div class="fs-2 ms-auto">
                                                            <i class='bx bx-wallet-alt'></i>
                                                        </div>
                                                    </div>
                                                    <div id="chart4" class="ms-auto mt-1"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="card radius-15 border shadow-none mb-0">
                                                <div class="card-body">
                                                    <div class="d-flex flex-row align-items-center">
                                                        <div class="">
                                                            <p class="text-secondary mb-0">Net Profit</p>
                                                            <h4 class="mb-0">-2.7%</h4>
                                                        </div>
                                                        <div class="fs-2 ms-auto">
                                                            <i class='bx bx-bar-chart-alt-2' ></i>
                                                        </div>
                                                    </div>
                                                    <div id="chart5" class="ms-auto mt-1"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="card radius-15 border shadow-none mb-0">
                                                <div class="card-body">
                                                    <div class="d-flex flex-row align-items-center">
                                                        <div class="">
                                                            <p class="text-secondary mb-0">Orders</p>
                                                            <h4 class="mb-0">+32.6%</h4>
                                                        </div>
                                                        <div class="fs-2 ms-auto">
                                                            <i class='bx bx-shopping-bag'></i>
                                                        </div>
                                                    </div>
                                                    <div id="chart6" class="ms-auto mt-1"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="card radius-15 border shadow-none mb-0">
                                                <div class="card-body">
                                                    <div class="d-flex flex-row align-items-center">
                                                        <div class="">
                                                            <p class="text-secondary mb-0">Visitors</p>
                                                            <h4 class="mb-0">+60.2%</h4>
                                                        </div>
                                                        <div class="fs-2 ms-auto">
                                                            <i class='bx bx-group'></i>
                                                        </div>
                                                    </div>
                                                    <div id="chart7" class="ms-auto mt-1"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end row-->
                    <!--end row-->
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!--    <script>
            function fetchAppointmentStats() {
                let startDate = document.getElementById("start-date").value;
                let endDate = document.getElementById("end-date").value;
    
                if (!startDate || !endDate)
                    return;
    
                $.ajax({
                    url: "AppointmentStats",
                    type: "GET",
                    data: {start: startDate, end: endDate},
                    dataType: "json",
                    success: function (data) {
                        let tableBody = $("#appointment-stats");
                        tableBody.empty();
    
                        if (data.length === 0) {
                            tableBody.append("<tr><td colspan='3' class='text-center'>No data available</td></tr>");
                            return;
                        }
    
                        data.forEach(row => {
                            let stars = '';
                            let rating = Math.round(row.average_rating); // Làm tròn số sao
    
                            if (!rating || rating === 0) {
                                stars = `<span class="text-muted">Chưa có đánh giá</span>`;
                            } else {
                                for (let i = 0; i < 5; i++) {
                                    if (i < rating) {
                                        stars += `<i class="fa-solid fa-star text-warning"></i>`; // Sao vàng
                                    } else {
                                        stars += `<i class="fa-regular fa-star text-muted"></i>`; // Sao xám
                                    }
                                }
                            }
                            tableBody.append(`<tr>
                                <td>` + row.service + `</td>
                                <td>` + row.totalAppointments + `</td>
                                <td>` + row.totalRevenue.toLocaleString("vi-VN") + ` đ</td>
                                <td>` + row.success_rate + `%</td>
                                <td>` + row.cancel_rate + `%</td>
                                <td>` + stars + `</td>
                            </tr>`);
                        });
                    },
                    error: function () {
                        alert("Error fetching data.");
                    }
                });
            }
    
            $("#start-date, #end-date").change(fetchAppointmentStats);
    
        </script> -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Lấy ngày hiện tại và ngày đầu năm
            const today = new Date();
            const firstDayOfYear = new Date(today.getFullYear(), 0, 1);

            // Chuyển đổi thành định dạng YYYY-MM-DD
            function formatDate(date) {
                return date.toISOString().split("T")[0];
            }

            document.getElementById("start-date").value = formatDate(firstDayOfYear);
            document.getElementById("end-date").value = formatDate(today);

            // Gọi thống kê ngay khi trang load
            fetchStatistics();
        });
        function fetchStatistics() {
            let startDate = document.getElementById("start-date").value;
            let endDate = document.getElementById("end-date").value;
            if (!startDate || !endDate)
                return;
            // Gọi dữ liệu thống kê lịch hẹn
            $.ajax({
                url: "AppointmentStats",
                type: "GET",
                data: {start: startDate, end: endDate},
                dataType: "json",
                success: function (data) {
                    let tableBody = $("#appointment-stats");
                    tableBody.empty();
                    if (data.length === 0) {
                        tableBody.append("<tr><td colspan='6' class='text-center'>No data available</td></tr>");
                        return;
                    }

                    data.forEach(row => {
                        let stars = getStarRating(row.average_rating);
                        tableBody.append(`<tr>
                    <td>` + row.service + `</td>
                    <td>` + row.totalAppointments + `</td>
                    <td>` + row.totalRevenue.toLocaleString("vi-VN") + ` đ</td>
                    <td>` + row.success_rate + `%</td>
                    <td>` + row.cancel_rate + `%</td>
                    <td>` + stars + `</td>
                </tr>`);
                    });
                },
                error: function () {
                    alert("Error fetching appointment stats.");
                }
            });
            // Gọi dữ liệu thống kê bác sĩ
            $.ajax({
                url: "DoctorStats",
                type: "GET",
                data: {start: startDate, end: endDate},
                dataType: "json",
                success: function (data) {
                    let tableBody = $("#doctor-stats");
                    tableBody.empty();
                    if (data.length === 0) {
                        tableBody.append("<tr><td colspan='6' class='text-center'>No data available</td></tr>");
                        return;
                    }

                    data.forEach(row => {
                        let stars = getStarRating(row.average_rating);
                        tableBody.append(`<tr>
                    <td>` + row.doctor_name + `</td>
                    <td>` + row.total_appointments + `</td>
                    <td>` + row.total_revenue.toLocaleString("vi-VN") + ` đ</td>
                    <td>` + row.success_rate + `%</td>
                    <td>` + row.cancel_rate + `%</td>
                    <td>` + stars + `</td>  
                </tr>`);
                    });
                },
                error: function () {
                    alert("Error fetching doctor stats.");
                }
            });
        }

        // Hàm tạo icon sao cho rating
        function getStarRating(rating) {
            let stars = "";
            let rounded = Math.round(rating);
            if (!rating || rounded === 0) {
                return `<span class="text-muted">Chưa có đánh giá</span>`;
            }
            for (let i = 0; i < 5; i++) {
                if (i < rounded) {
                    stars += `<i class="fa-solid fa-star text-warning"></i>`;
                } else {
                    stars += `<i class="fa-regular fa-star text-muted"></i>`;
                }
            }
            return stars;
        }

        $("#start-date, #end-date").change(fetchStatistics);
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const contextPath = "/" + window.location.pathname.split("/")[1];
            // Khởi tạo biểu đồ doanh thu theo quý
            const quarterRevenueChart = new ApexCharts(document.querySelector("#quarter-revenue-chart"), {
                chart: {
                    type: 'line',
                    height: 350
                },
                series: [],
                xaxis: {
                    categories: []
                },
                yaxis: {
                    min: 0 // Luôn bắt đầu từ 0
                },
                title: {
                    //                    text: "Quarterly Revenue",
                    align: "center",
                    style: {fontSize: "16px"}
                }
            });
            quarterRevenueChart.render();
            // Khởi tạo biểu đồ doanh thu theo tháng
            const monthRevenueChart = new ApexCharts(document.querySelector("#month-revenue-chart"), {
                chart: {
                    type: "line",
                    height: 350
                },
                series: [],
                xaxis: {
                    categories: []
                },
                yaxis: {
                    min: 0 // Luôn bắt đầu từ 0
                },
                title: {
                    align: "center",
                    style: {fontSize: "16px"}
                }
            });
            monthRevenueChart.render();
            // Load dữ liệu
            function loadQuarterRevenueStats(year) {
                fetch(`/SWP391/admin/RevenueStat?type=quarterly&year=` + year)
                        .then(response => {
                            console.log("Request URL:", response.url);
                            console.log("HTTP Status:", response.status);
                            if (!response.ok)
                                throw new Error("Failed to fetch quarterly revenue data.");
                            return response.json();
                        })
                        .then(data => {
                            console.log("Quarterly Revenue Data:", data); // Kiểm tra dữ liệu từ API
                            if (data.length === 0) {
                                alert("No quarterly revenue data available.");
                                return;
                            }

                            // Chuyển đổi dữ liệu và kiểm tra
                            const quarters = data.map(item => `Quarter ` + item.quarter); // Trả về danh sách quý
                            const revenues = data.map(item => parseFloat(item.revenue || 0)); // Đảm bảo doanh thu là số hợp lệ

                            console.log("Quarters:", quarters); // Kiểm tra chuỗi danh mục (categories)
                            console.log("Revenues:", revenues); // Kiểm tra dữ liệu series

                            // Cập nhật ApexCharts
                            quarterRevenueChart.updateSeries([{name: 'Quarterly Revenue', data: revenues}]);
                            quarterRevenueChart.updateOptions({xaxis: {categories: quarters}});
                        })
                        .catch(error => {
                            console.error("Error loading quarterly revenue stats:", error);
                            alert("Error loading quarterly revenue stats. Check console for details.");
                            quarterRevenueChart.updateSeries([]);
                            quarterRevenueChart.updateOptions({xaxis: {categories: []}});
                        });
            }
            function loadMonthlyRevenueStats(year, quarter) {
                fetch(`/SWP391/admin/RevenueStat?type=monthly&year=` + year + `&quarter=` + quarter)
                        .then(response => {
                            console.log("Request URL:", response.url);
                            console.log("HTTP Status:", response.status);
                            if (!response.ok)
                                throw new Error("Failed to fetch monthly revenue data.");
                            return response.json();
                        })
                        .then(data => {
                            console.log("Monthly Revenue Data:", data); // Log dữ liệu từ API
                            if (!Array.isArray(data) || data.length === 0) {
                                alert("No monthly revenue data available.");
                                // Cập nhật biểu đồ rỗng nếu không có dữ liệu
                                monthRevenueChart.updateSeries([]);
                                monthRevenueChart.updateOptions({xaxis: {categories: []}});
                                return;
                            }


                            const months = data.map(item => `Month ` + item.month);
                            const revenues = data.map(item => parseFloat(item.revenue));
                            console.log("Months:", months); // Kiểm tra danh mục tháng
                            console.log("Revenues:", revenues); // Kiểm tra dữ liệu doanh thu

                            monthRevenueChart.updateSeries([{name: 'Monthly Revenue', data: revenues}]);
                            monthRevenueChart.updateOptions({xaxis: {categories: months}});
                        })
                        .catch(error => {
                            console.error("Error loading monthly revenue stats:", error);
                            alert("Error loading monthly revenue stats. Check console for details.");
                            monthRevenueChart.updateSeries([]);
                            monthRevenueChart.updateOptions({xaxis: {categories: []}});
                        });
            }

            // Gọi hàm ban đầu
//            window.onload = function () {
//                loadQuarterRevenueStats(2025);
//                loadMonthlyRevenueStats(2025, 1);
//            };
            const yearSelect = document.getElementById("year-select");
            const quarterSelect = document.getElementById("quarter-select");
            if (!yearSelect) {
                console.error("Element with id 'year-select' not found in DOM!");
                return;
            }
            if (!quarterSelect) {
                console.error("Element with id 'quarter-select' not found in DOM!");
                return;
            }

            yearSelect.addEventListener("change", function () {
                const selectedYear = yearSelect.value; // Lấy giá trị năm từ dropdown
                console.log("Selected Year:", selectedYear);
                loadQuarterRevenueStats(selectedYear); // Gọi hàm xử lý dữ liệu quý
                resetChart(monthRevenueChart); // Reset biểu đồ tháng
            });
            quarterSelect.addEventListener("change", function () {
                const selectedYear = yearSelect.value; // Lấy giá trị năm từ dropdown
                const selectedQuarter = quarterSelect.value; // Lấy giá trị quý từ dropdown
                console.log("Selected Year:", selectedYear);
                console.log("Selected Quarter:", selectedQuarter);
                // Gọi hàm xử lý dữ liệu tháng
                loadMonthlyRevenueStats(selectedYear, selectedQuarter);
            });
            const defaultYear = "2025";
            const defaultQuarter = "1"; // Quý mặc định
            yearSelect.value = defaultYear;
            quarterSelect.value = defaultQuarter;
            // Gán giá trị mặc định và tải dữ liệu năm mặc định
            loadQuarterRevenueStats(defaultYear); // Tải dữ liệu năm mặc định
            loadMonthlyRevenueStats(defaultYear, defaultQuarter);
        });
    </script>

    <script>

        document.addEventListener("DOMContentLoaded", function () {

            const revenueChart = new ApexCharts(document.getElementById("service-revenue-chart"), {
                chart: {
                    type: "bar", // hoặc "line" nếu cần
                    height: 350,
                    style: {color: "green"}
                },
                series: [],
                xaxis: {
                    categories: []
                },
                yaxis: {
                    title: {
                        text: "Revenue (VNĐ)"
                    }
                },
                title: {
                    text: "Service Revenue Stats",
                    align: "center",
                    style: {fontSize: "12px"}
                },

                plotOptions: {
                    bar: {
                        horizontal: true, // Chuyển cột thành ngang
                        barHeight: "60%" // Độ cao của thanh
                    }
                }

            });
            revenueChart.render();
            // Function fetch dữ liệu từ servlet và cập nhật biểu đồ
            const yearSelect = document.getElementById("year-select2");
            const monthSelect = document.getElementById("month-select");
            yearSelect.addEventListener("change", fetchAndRenderData);
            monthSelect.addEventListener("change", fetchAndRenderData);
            if (!yearSelect || !monthSelect) {
                console.error("Không tìm thấy phần tử select!");
                return;
            }
            const defaultYear = "2025";
            yearSelect.value = defaultYear;
            yearSelect.addEventListener("change", function () {
                console.log("Year changed to:", yearSelect.value);
                fetchAndRenderData();
            });

            monthSelect.addEventListener("change", function () {
                console.log("Month changed to:", monthSelect.value);
                fetchAndRenderData();
            });

            fetchAndRenderData(); // Load mặc định

            function fetchAndRenderData() {
                const year = yearSelect.value || ""; // Nếu null, sử dụng chuỗi rỗng
                const month = monthSelect.value || ""; // Nếu null, sử dụng chuỗi rỗng

                // Log kiểm tra các giá trị vừa chọn
                console.log(`Year:` + year + `,Month: ` + month);

                // Gửi yêu cầu GET đến servlet RevenueStats
                fetch(`/SWP391/admin/ServiceRevenueStats?year=` + year + `&month=` + month)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Failed to fetch data from the server.");
                            }
                            return response.json();
                        })
                        .then(data => {
                            if (data.length === 0) {
                                alert("No data found for the selected filters!");
                                revenueChart.updateSeries([]);
                                revenueChart.updateOptions({xaxis: {categories: []}});
                                return;
                            }

                            const services = data.map(item => item[0]); // Tên dịch vụ
                            const revenues = data.map(item => item[1]); // Doanh thu
                            const colors = generateColors(services.length);
                            revenueChart.updateSeries([{name: "Revenue", data: revenues}]);
                            revenueChart.updateOptions({
                                xaxis: {categories: services},
                                plotOptions: {
                                    bar: {
                                        distributed: true // Phân phối màu sắc khác nhau cho từng cột
                                    }
                                },
                                colors: colors
                            });

                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Could not fetch data from server. Check console for details!");
                        });
            }

            // Lắng nghe sự kiện thay đổi ở dropdown
            // Tải dữ liệu mặc định khi khởi chạy
            fetchAndRenderData();
        });

        function generateColors(count) {
            // Một danh sách sẵn các màu đẹp, phổ biến
            const predefinedColors = [
                "#B03A2E", // Dark Red
                "#239B56", // Dark Green
                "#2E86C1", // Dark Blue
                "#922B5D", // Dark Pink
                "#B7950B", // Dark Yellow
                "#5B2C6F", // Dark Purple
                "#A04000", // Dark Orange
                "#117864", // Dark Teal
                "#1F618D", // Dark Sky Blue
                "#922B21", // Dark Crimson
                "#512E5F", // Dark Violet
                "#0E6655"  // Dark Cyan
            ];


            // Lặp lại màu nếu số danh mục vượt quá số màu có sẵn
            return Array.from({length: count}, (_, i) => predefinedColors[i % predefinedColors.length]);
        }




    </script>
    <script>
        fetch('/SWP391/admin/GetCrowedTime')
                .then(response => response.json())
                .then(data => {
                    // Tạo mảng labels chứa khung giờ, và values chứa số lượng đặt lịch
                    const labels = data.map(item => item.start_time + " - " + item.end_time);
                    const values = data.map(item => item.total_appointments);

                    // Vẽ biểu đồ bằng Chart.js
                    new Chart(document.getElementById("crowed-chart"), {
                        type: "line",
                        data: {
                            labels: labels,
                            datasets: [{
                                    data: values,
                                    borderColor: "blue",
                                    backgroundColor: "rgba(0, 0, 255, 0.2)",
                                    fill: true
                                }]
                        },
                        options: {
                            responsive: true,
                            scales: {
                                x: {title: {display: true, text: "Khung giờ"}},
                                y: {display: false} // Ẩn hoàn toàn cột y
                            }
                        }
                    });
                })
                .catch(error => console.error("Lỗi khi lấy dữ liệu:", error));
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const customers = [];
            const totalSpending = [];

        <% if (topCustomers != null) { %>
        <% for (UserProfile customer : topCustomers) { %>
            customers.push("<%= customer.getFullname() %>");
            totalSpending.push(<%= customer.getCheckout().getTotalBill() %>);
        <% } %>
        <% } %>

            const spendingChart = new ApexCharts(document.getElementById("top-spending-customers-chart"), {
                chart: {
                    type: "bar",
                    height: 350
                },
                series: [{name: "Spending", data: totalSpending}],
                xaxis: {
                    categories: customers
                },
                yaxis: {
                    title: {
                        text: "Total Spending (VNĐ)"
                    }
                },
                title: {
                    text: "Top 10 Customers by Spending",
                    align: "center",
                    style: {fontSize: "12px"}
                },
                plotOptions: {
                    bar: {
                        horizontal: true,
                        barHeight: "60%"
                    }
                },
                colors: generateColors(customers.length)
            });

            spendingChart.render();
        });

        function generateColors(count) {
            const colors = ["#B03A2E", "#239B56", "#2E86C1", "#922B5D", "#B7950B", "#5B2C6F", "#A04000", "#117864", "#1F618D", "#922B21"];
            return Array.from({length: count}, (_, i) => colors[i % colors.length]);
        }
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const ageGroups = [];
            const appointmentCounts = [];

        <% if (ageStats != null) { %>
        <% for (AgeGroupStats age : ageStats) { %>
            ageGroups.push("<%= age.getAgeGroup() %>");
            appointmentCounts.push(<%= age.getTotalAppointments() %>);
        <% } %>
        <% } %>

            const ageChart = new ApexCharts(document.getElementById("appointments-age-group-chart"), {
                chart: {
                    type: "bar",
                    height: 350
                },
                series: [{name: "Appointments", data: appointmentCounts}],
                xaxis: {
                    categories: ageGroups
                },
                yaxis: {
                    title: {
                        text: "Total Appointments"
                    }
                },
                title: {
                    text: "Appointments by Age Group",
                    align: "center",
                    style: {fontSize: "12px"}
                },
                plotOptions: {
                    bar: {
                        horizontal: true,
                        barHeight: "60%"
                    }
                },
                colors: generateColors(ageGroups.length)
            });

            ageChart.render();
        });

        function generateColors(count) {
            const colors = ["#E74C3C", "#3498DB", "#2ECC71", "#9B59B6", "#F1C40F", "#E67E22", "#1ABC9C"];
            return Array.from({length: count}, (_, i) => colors[i % colors.length]);
        }
    </script>
    <jsp:include page="Common/Message.jsp"/> 
    <jsp:include page="Common/Js.jsp"/>
</body>
</html>
