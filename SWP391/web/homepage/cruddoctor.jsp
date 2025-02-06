<%-- 
    Document   : cruddoctor
    Created on : Feb 6, 2025, 7:09:38 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Product</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <style>
            body {
                background-color: #e8f5e9;
            }
            .card {
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            .card-header {
                background-color: #2e7d32;
                color: white;
                border-radius: 8px 8px 0 0;
            }
            .table th, .table td {
                vertical-align: middle;
                text-align: center;
            }
            .product-img {
                width: 60px;
                height: auto;
                border-radius: 5px;
            }
            .btn-success {
                background-color: #388e3c;
                border-color: #388e3c;
            }
            .btn-danger {
                background-color: #d32f2f;
                border-color: #d32f2f;
            }
            .btn-warning {
                background-color: #fbc02d;
                border-color: #fbc02d;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4 class="m-0">Manage <strong>Product</strong></h4>
                    <div>
                        <button style="border: 1px solid black" class="btn btn-danger"> <i class="fas fa-trash"></i> Delete</button>
                        <button style="border: 1px solid black" class="btn btn-success"> <i class="fas fa-plus"></i> Add New Product</button>
                        <button style="border: 1px solid black" class="btn btn-success"> <i class="fas fa-plus"></i><a style="color: white" href="trangchu">Home</a> </button>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-hover">
                        <thead class="table-success">
                            <tr>
                                <th><input type="checkbox"></th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Specialization</th>
                                <th>Certificate</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="doc" items="${listDoctor}">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>${doc.doctor_id}</td>
                                    <td>${doc.doctor_name}</td>
                                    <td><img src="${doc.profile_image}" alt="Doctor Image" class="product-img"></td>
                                    <td>${doc.specialization.specialization_name} </td>
                                    <td>${doc.certificate.certificate_name}</td>
                                    <td>

                                        <form action="" method="">
                                            <button class="btn btn-warning btn-sm"><i class="fas fa-edit">Update</i></button>
                                        </form>
                                        <form action="" method="">
                                            <button class="btn btn-danger btn-sm"><i class="fas fa-trash">Delete</i></button>
                                        </form>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>
</html>
