<%-- 
    Document   : index
    Created on : Feb 10, 2025, 11:43:24 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>
        <title>Doctor Statistics</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
        <style>
            .page-content {
                background-color: #ffffff;
                padding: 20px;      
                margin: 0 auto;
            }

            .filter-buttons {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-bottom: 20px;
            }

            #chartContainer {
                width: 100%;
                background-color: #ffffff;
                max-width: 500px;
                margin: 20px auto;
                margin-bottom: 20px; /* Adds space between the chart and summary */
            }

            /* Flexbox layout for Doctor Summary */
            .summary {
                display: flex;
                justify-content: space-around; /* Evenly space out items */
                margin-top: 20px; /* Adds space above summary */
                padding: 20px;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif; /* Apply font */
                font-size: 16px;
                color: #333;
            }

            .summary div {
                text-align: center;
                flex: 1;
                padding: 10px;
                font-weight: 600;
                border-left: 2px solid #f0f0f0;
            }

            .summary div:first-child {
                border-left: none; /* Remove the left border from the first item */
            }

            .summary .total-appointments {
                color: #4CAF50; /* Green color for total appointments */
            }

            .summary .total-earnings {
                color: #FF9800; /* Orange color for total earnings */
            }

            .summary .completed-appointments {
                color: #3B983B; /* Green for completed appointments */
            }

            .summary h3 {
                font-size: 18px;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .summary p {
                font-size: 16px;
                margin: 5px 0;
            }

            .summary .total-earnings p,
            .summary .total-appointments p,
            .summary .completed-appointments p {
                font-size: 18px;
                font-weight: 700;
            }

        </style>
    </head>
    <body>
        <!-- wrapper -->
        <jsp:include page="Common/Navbar.jsp"/>
        <!--end header-->
        <!--page-wrapper-->
        <div class="page-wrapper">
            <div class="page-content-wrapper">
                <div class="page-content" style="display: flex ; justify-content: space-evenly" >
                    <div>
                        <!-- Rating Table with Star Style -->
                        <h2 style="text-align:center;">Doctor Rating Statistics</h2>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>Stars</th>
                                    <th>Count</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="entry" items="${ratingStatistics}">
                                    <tr>
                                        <td>${entry.key} Star</td>
                                        <td>
                                            <!-- Display stars based on the rating -->
                                            <c:forEach begin="1" end="${entry.key}" var="star">
                                                <i class="fa fa-star" style="color: orange;"></i>
                                            </c:forEach>
                                            <c:forEach begin="${entry.key+1}" end="5" var="star">
                                                <i class="fa fa-star" style="color: lightgray;"></i>
                                            </c:forEach>
                                        </td>
                                        <td>${entry.value}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <h2 style="text-align:center;">Appointments By Status</h2>
                        <div class="filter-buttons">
                            <a href="statisticDoctor?period=today" 
                               class="btn ${currentPeriod == 'today' ? 'btn-primary' : 'btn-outline-primary'}">Today</a>
                            <a href="statisticDoctor?period=week" 
                               class="btn ${currentPeriod == 'week' ? 'btn-primary' : 'btn-outline-primary'}">This Week</a>
                            <a href="statisticDoctor?period=month" 
                               class="btn ${currentPeriod == 'month' ? 'btn-primary' : 'btn-outline-primary'}">This Month</a>
                            <a href="statisticDoctor?period=3months" 
                               class="btn ${currentPeriod == '3months' ? 'btn-primary' : 'btn-outline-primary'}">3 Months</a>
                            <a href="statisticDoctor?period=year" 
                               class="btn ${currentPeriod == 'year' ? 'btn-primary' : 'btn-outline-primary'}">This Year</a>
                        </div>

                        <!-- Display Summary Statistics -->
                        <div class="summary">
                            <div class="total-appointments">
                                <h3>Total Appointments</h3>
                                <p>${doctorSummary.totalAppointments}</p>
                            </div>
                            <div class="total-earnings">
                                <h3>Total Earnings</h3>
                                <p id="totalEarnings">$${doctorSummary.totalEarnings}</p>
                            </div>
                            <div class="completed-appointments">
                                <h3>Completed Appointments</h3>
                                <p>${doctorSummary.completedAppointments}</p>
                            </div>
                        </div>

                        <div id="chartContainer">
                            <canvas id="appointmentChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--end page-content-wrapper-->
</div>

<!--footer -->
<div class="footer">
    <p class="mb-0">Eyecare @2025 | Developed By : <a href="https://themeforest.net/user/codervent" target="_blank">EyeCare</a>
    </p>
</div>
<!-- end footer -->
</div>
<!-- end wrapper -->
<!-- JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function () {

        // Giả sử tổng thu nhập được lấy từ backend
        const totalEarnings = ${doctorSummary.totalEarnings};

        // Định dạng tổng thu nhập sang tiền tệ USD
        const formattedEarnings = new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: 'USD',
        }).format(totalEarnings);

        // Gán giá trị đã định dạng vào phần tử HTML
        document.getElementById('totalEarnings').innerHTML = formattedEarnings;



        const labels = [<c:forEach var="entry" items="${statistics}" varStatus="loop">
        '${entry.key}'${!loop.last ? ',' : ''}
    </c:forEach>
        ];

        const values = [<c:forEach var="entry" items="${statistics}" varStatus="loop">
        ${entry.value}${!loop.last ? ',' : ''}
    </c:forEach>
        ];

        const total = values.reduce((a, b) => a + b, 0);

        const percentages = values.map(value => ((value / total) * 100).toFixed(1));

        const ctx = document.getElementById('appointmentChart').getContext('2d');
        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                        data: values,
                        backgroundColor: [
                            '#FF2525', // Color for Cancel
                            '#3B983B'   // Color for Completed
                        ],
                        borderColor: [
                            '#FF2525', // Border color for Cancel
                            '#3B983B'   // Border color for Completed
                        ],
                        borderWidth: 1
                    }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Appointment Status for ${currentPeriod}'
                    },
                    legend: {
                        position: 'bottom'
                    },
                    datalabels: {
                        color: '#fff',
                        font: {
                            size: 25,
                            weight: 'bold',
                            family: 'Arial, sans-serif'
                        },
                        formatter: function (value, context) {
                            return percentages[context.dataIndex] + '%';
                        }
                    }
                }
            },
            plugins: [ChartDataLabels]
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>


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
<script src="assets/js/index.js"></script>
<!-- App JS -->
<script src="assets/js/app.js"></script>

</body>
</html>
