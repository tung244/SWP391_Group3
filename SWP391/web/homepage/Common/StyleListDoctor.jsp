<%-- 
    Document   : StyleListDoctor
    Created on : Feb 10, 2025, 1:44:19 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .search-filter-box {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 20px;
                background: #f8f9fa;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            }

            .search-filter-box .form-control {
                flex: 1;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                height: 40px; /* Adjust height as needed */

            }

            .search-filter-box .btn-search {
                background-color: #28a745; /* Match sort button color */
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
                height: 40px; /* Match form control height */
                line-height: 1.5; /* Vertically center text */
            }

            .search-filter-box .btn-search:hover {
                background-color: #218838;
            }

            .sort-container {
                display: flex;
                justify-content: space-around; /* Distribute space evenly */
                align-items: center;  /* Vertically center items */
                margin-bottom: 20px;
            }

            .sort-box {
                display: flex;
                align-items: center;
                gap: 30px; /* Spacing between label, select, and button */
                margin-top: 40px;


            }

            .sort-box label {
                margin-bottom: 0; /* Remove default margin from label */
            }

            .sort-box select, .btn-sort { /* Style both select and button together */
                height: 40px; /* Consistent height */
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                width: 150px;
            }

            .btn-sort {
                background-color: #28a745;
                color: white;
                border: none;
                cursor: pointer;
                transition: 0.3s;
                margin-left: 20px;
            }

            .btn-sort:hover {
                background-color: #218838;
            }
            .service-sidebar .single-sidebar {
                margin-bottom: 10px;
                background: #f7f7f7;
                border-radius: 5px;
                overflow: hidden;
            }

            .service-sidebar .sidebar-link {
                display: flex;
                align-items: center;
                padding: 20px;
                background: #218838;
                color: #fff;
                text-decoration: none;
                transition: all 0.3s ease;
            }

            .service-sidebar .sidebar-link:hover {
                background: #218838;
            }

            .service-sidebar .icon-holder {
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 15px;
            }

            .service-sidebar .text-holder {
                flex-grow: 1;
            }

            .service-sidebar .text-holder h3 {
                margin: 5px;
                font-size: 18px;
                font-weight: 600;
                color: #ffd700;
            }

            .service-sidebar .text-holder h4 {
                margin: 15px 0 0;
                font-size: 16px;
                color: #fff;
            }

            .service-sidebar .arrow {
                width: 24px;
                height: 24px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            /* Specific styles for each section */
            .find-doctor .icon-holder i {
                font-size: 24px;
            }

            .special-offer .icon-holder i {
                font-size: 24px;
            }

            .contact-info .icon-holder i {
                font-size: 24px;
            }
            .row {
                display: flex;
                flex-wrap: wrap;
            }

            

            .single-team-member {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                height: 100%;
            }

            .text-holder {
                flex-grow: 1;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
                gap: 8px;
            }

            .pagination a {
                text-decoration: none;
                color: #333;
                background-color: #f1f1f1;
                padding: 8px 12px;
                border-radius: 5px;
                border: 1px solid #ccc;
                transition: all 0.3s ease;
            }

            .pagination a:hover {
                background-color: #218838;
                color: white;
                border-color: #218838;
            }

            .pagination a.active {
                background-color: #218838;
                color: white;
                font-weight: bold;
                border: 1px solid #218838;
                pointer-events: none;
            }





        </style> 
    </head>

</html>