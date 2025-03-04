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
                                            <h2 class="mb-0 text-white">649 <i class='bx bxs-up-arrow-alt font-14 text-white'></i> </h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-cart-alt"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Item Delivered</p>
                                        </div>
                                        <div class="ms-auto font-14 text-white">+23.4%</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-primary-blue">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">114 <i class='bx bxs-down-arrow-alt font-14 text-white'></i> </h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-support"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Refund Request</p>
                                        </div>
                                        <div class="ms-auto font-14 text-white">+14.7%</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-rose">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">98 <i class='bx bxs-up-arrow-alt font-14 text-white'></i> </h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-tachometer"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">Cancelled Orders</p>
                                        </div>
                                        <div class="ms-auto font-14 text-white">-12.9%</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card radius-15 bg-sunset">
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h2 class="mb-0 text-white">208 <i class='bx bxs-up-arrow-alt font-14 text-white'></i> </h2>
                                        </div>
                                        <div class="ms-auto font-35 text-white"><i class="bx bx-user"></i>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <p class="mb-0 text-white">New Users</p>
                                        </div>
                                        <div class="ms-auto font-14 text-white">+13.6%</div>
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
                    <div class="row">
                        <div class="col-12 col-lg-8 d-flex">
                            <div class="card radius-15 w-100 overflow-hidden">
                                <div class="card-header border-bottom-0">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h5 class="mb-0">Revenue By Locations</h5>
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
                                </div>
                                <div class="card-body">
                                    <div id="location-map"></div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="text-blue-ribbon">Countries</th>
                                                <th scope="col" class="text-brink-pink">Orders</th>
                                                <th scope="col" class="text-mountain-meadow">Earnings</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="d-flex align-items-center"><i class="flag-icon flag-icon-um me-2"></i>
                                                    <div>United States</div>
                                                </td>
                                                <td>13,495</td>
                                                <td class="text-semibold">$58,430.75</td>
                                            </tr>
                                            <tr>
                                                <td class="d-flex align-items-center"><i class="flag-icon flag-icon-nl me-2"></i>
                                                    <div>Netherlands</div>
                                                </td>
                                                <td>11,495</td>
                                                <td class="text-semibold">$68,253.90</td>
                                            </tr>
                                            <tr>
                                                <td class="d-flex align-items-center"><i class="flag-icon flag-icon-us me-2"></i>
                                                    <div>United Kingdom</div>
                                                </td>
                                                <td>09,348</td>
                                                <td class="text-semibold">$87,295.70</td>
                                            </tr>
                                            <tr>
                                                <td class="d-flex align-items-center"><i class="flag-icon flag-icon-ca me-2"></i>
                                                    <div>Canada</div>
                                                </td>
                                                <td>07,845</td>
                                                <td class="text-semibold">$64,914.20</td>
                                            </tr>
                                            <tr>
                                                <td class="d-flex align-items-center"><i class="flag-icon flag-icon-au me-2"></i>
                                                    <div>Australia</div>
                                                </td>
                                                <td>05,945</td>
                                                <td class="text-semibold">$94,335.60</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4 d-flex">
                            <div class="card radius-15 w-100">
                                <div class="card-body">
                                    <div class="card radius-15 border shadow-none">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center">
                                                <h5 class="mb-0">New Users</h5>
                                                <p class="mb-0 ms-auto"><i class="bx bx-dots-horizontal-rounded float-right font-24"></i>
                                                </p>
                                            </div>
                                            <div class="d-flex align-items-center mt-3 gap-2">
                                                <img src="assets/images/avatars/avatar-1.png" width="45" height="45" class="rounded-circle" alt="">
                                                <div class="flex-grow-1">
                                                    <p class="font-weight-bold mb-0">Neil Wagner</p>
                                                    <p class="text-secondary mb-0">United Kingdom</p>
                                                </div>
                                                <a href="javascript:;" class="btn btn-sm btn-light-primary px-4 radius-10">Add</a>
                                            </div>
                                            <hr>
                                            <div class="d-flex align-items-center gap-2">
                                                <img src="assets/images/avatars/avatar-2.png" width="45" height="45" class="rounded-circle" alt="">
                                                <div class="flex-grow-1">
                                                    <p class="font-weight-bold mb-0">Sampoll Dinga</p>
                                                    <p class="text-secondary mb-0">America</p>
                                                </div> <a href="javascript:;" class="btn btn-sm btn-light-primary px-4 radius-10">Add</a>
                                            </div>
                                            <hr>
                                            <div class="d-flex align-items-center gap-2">
                                                <img src="assets/images/avatars/avatar-3.png" width="45" height="45" class="rounded-circle" alt="">
                                                <div class="flex-grow-1">
                                                    <p class="font-weight-bold mb-0">Loona Ting</p>
                                                    <p class="text-secondary mb-0">Canada</p>
                                                </div> <a href="javascript:;" class="btn btn-sm btn-light-primary px-4 radius-10">Add</a>
                                            </div>
                                            <hr>
                                            <div class="d-flex align-items-center gap-2">
                                                <img src="assets/images/avatars/avatar-4.png" width="45" height="45" class="rounded-circle" alt="">
                                                <div class="flex-grow-1">
                                                    <p class="font-weight-bold mb-0">Lee Jong</p>
                                                    <p class="text-secondary mb-0">China</p>
                                                </div> <a href="javascript:;" class="btn btn-sm btn-light-primary px-4 radius-10">Add</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card radius-15 border shadow-none mb-0">
                                        <div class="card-body">
                                            <h4 class="mb-0">87.52%</h4>
                                            <p class="mb-0">Bounce Rate</p>
                                        </div>
                                        <div id="chart8"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--end row-->
                    <div class="card radius-15 overflow-hidden">
                        <div class="card-header border-bottom-0">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h5 class="mb-0">Recent Orders</h5>
                                </div>
                                <div class="ms-auto">
                                    <button type="button" class="btn btn-white btn-sm px-4 radius-15">View More</button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th>Photo</th>
                                            <th>Product Name</th>
                                            <th>Customer</th>
                                            <th>Product id</th>
                                            <th>Price</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="product-img bg-transparent border">
                                                    <img src="assets/images/icons/smartphone.png" width="35" alt="">
                                                </div>
                                            </td>
                                            <td>Honor Mobile 7x</td>
                                            <td>Mitchell Daniel</td>
                                            <td>#835478</td>
                                            <td>$54.68</td>
                                            <td><a href="javascript:;" class="btn btn-sm btn-light-success btn-block radius-30">Delivered</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="product-img bg-transparent border">
                                                    <img src="assets/images/icons/watch.png" width="35" alt="">
                                                </div>
                                            </td>
                                            <td>Hand Watch</td>
                                            <td>Milona Burke</td>
                                            <td>#987546</td>
                                            <td>$43.78</td>
                                            <td><a href="javascript:;" class="btn btn-sm btn-light-warning btn-block radius-30">Pending</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="product-img bg-transparent border">
                                                    <img src="assets/images/icons/laptop.png" width="35" alt="">
                                                </div>
                                            </td>
                                            <td>Mini Laptop</td>
                                            <td>Craig Clayton</td>
                                            <td>#325687</td>
                                            <td>$62.21</td>
                                            <td><a href="javascript:;" class="btn btn-sm btn-light-success btn-block radius-30">Delivered</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="product-img bg-transparent border">
                                                    <img src="assets/images/icons/shirt.png" width="35" alt="">
                                                </div>
                                            </td>
                                            <td>Slim-T-Shirt</td>
                                            <td>Clark Andola</td>
                                            <td>#658972</td>
                                            <td>$75.68</td>
                                            <td><a href="javascript:;" class="btn btn-sm btn-light-danger btn-block radius-30">Cancelled</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="product-img bg-transparent border">
                                                    <img src="assets/images/icons/wine-glass.png" width="35" alt="">
                                                </div>
                                            </td>
                                            <td>Mini Laptop</td>
                                            <td>Craig Clayton</td>
                                            <td>#325687</td>
                                            <td>$62.21</td>
                                            <td><a href="javascript:;" class="btn btn-sm btn-light-success btn-block radius-30">Delivered</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="product-img bg-transparent border">
                                                    <img src="assets/images/icons/headphones.png" width="35" alt="">
                                                </div>
                                            </td>
                                            <td>Honor Mobile 7x</td>
                                            <td>Mitchell Daniel</td>
                                            <td>#835478</td>
                                            <td>$54.68</td>
                                            <td><a href="javascript:;" class="btn btn-sm btn-light-success btn-block radius-30">Delivered</a>
                                            </td>
                                        </tr>
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
                    <td>`+row.service+`</td>
                    <td>`+row.totalAppointments+`</td>
                    <td>`+row.totalRevenue.toLocaleString("vi-VN")+` đ</td>
                    <td>`+row.success_rate+`%</td>
                    <td>`+row.cancel_rate+`%</td>
                    <td>`+stars+`</td>
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
                    <td>`+row.doctor_name+`</td>
                    <td>`+row.total_appointments+`</td>
                    <td>`+row.total_revenue.toLocaleString("vi-VN")+` đ</td>
                    <td>`+row.success_rate+`%</td>
                    <td>`+row.cancel_rate+`%</td>
                    <td>`+stars+`</td>  
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
    <jsp:include page="Common/Js.jsp"/>
</body>
</html>
