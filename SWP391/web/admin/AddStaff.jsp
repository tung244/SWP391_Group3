<%-- 
    Document   : AddStaff
    Created on : Feb 6, 2025, 8:51:09 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="Common/Css.jsp"/>
        <title>Update Staff</title>
        <!-- Bootstrap CSS -->
       
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
        
        
        <jsp:include page="Common/Navbar.jsp"/>
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
        <div class="container">
            <div class="form-container">
                <h2 class="page-title">Add Staff</h2>


                <c:if test="${error != null}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>  
                </c:if>

                <form action="AddStaff" method="post">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Username</label>
                                <input type="text" class="form-control" name="username" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="text" class="form-control" name="password" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control" name="staff_fullname" required/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" name="staff_address"  required/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">DOB</label>
                                <input type="date" class="form-control" name="staff_dob"  required/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Gender</label>
                                <select class="form-control" name="staff_gender" required>
                                    <option value="" disabled ${staff.admin_gender == null ? "selected" : ""}>Select Gender</option>
                                    <option value="Male" ${"Male".equals(staff.admin_gender) ? "selected" : ""}>Male</option>
                                    <option value="Female" ${"Female".equals(staff.admin_gender) ? "selected" : ""}>Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Role</label>
                                <select class="form-control" name="role_name" required>
                                    <option value="Sales" ${"Sales".equals(staff.account.role.role_name) ? "selected" : ""}>Sales</option>
                                    <option value="Customer Support" ${"Customer Support".equals(staff.account.role.role_name) ? "selected" : ""}>Customer Support</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Phone</label>
                                <input type="tel" class="form-control" name="phone"  required/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" required/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Salary</label>
                                <input type="text" class="form-control" name="salary" required/>
                            </div>
                        </div>

                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary btn-update">Add Staff</button>
                        <a href="ListStaff" class="btn btn-secondary ms-2">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
</div></div></div>
        <!-- Bootstrap JS -->
        
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>
        
    </body>
    
</html>
