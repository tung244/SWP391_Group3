<%-- 
    Document   : UpdateStaff
    Created on : Feb 6, 2025, 7:59:19 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update Staff</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .form-container {
                max-width: 800px;
                margin: 2rem auto;
                padding: 2rem;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
            .form-label {
                font-weight: 600;
                color: #2c3e50;
            }
            .form-control:read-only {
                background-color: #f8f9fa;
            }
            .btn-update {
                padding: 0.5rem 2rem;
                font-weight: 500;
            }
            .page-title {
                color: #2c3e50;
                margin-bottom: 1.5rem;
                text-align: center;
            }
            .alert {
                margin-bottom: 1rem;
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="container">
            <div class="form-container">
                <h2 class="page-title">Update Staff Details</h2>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>

                <form action="UpdateStaff" method="post">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Account Id</label>
                                <input type="text" class="form-control" name="account_id" value="${staff.account.account_id}" readonly/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">FullName</label>
                                <input type="text" class="form-control" name="admin_fullname" value="${staff.admin_fullname}" required/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" name="admin_address" value="${staff.admin_address}" required/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">DOB</label>
                                <input type="date" class="form-control" name="admin_dob" value="${staff.admin_dob}" required/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Gender</label>
                                <select class="form-control" name="admin_gender" required>
                                    <option value="" disabled ${staff.admin_gender == null ? "selected" : ""}>Select Gender</option>
                                    <option value="Male" ${"Male".equals(staff.admin_gender) ? "selected" : ""}>Male</option>
                                    <option value="Female" ${"Female".equals(staff.admin_gender) ? "selected" : ""}>Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Role</label>
                                <input type="text" class="form-control" name="role_name" value="${staff.account.role.role_name}" required/>
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary btn-update">Update Staff</button>
                        <a href="ListStaff" class="btn btn-secondary ms-2">Cancel</a>
                    </div>
                </form>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
