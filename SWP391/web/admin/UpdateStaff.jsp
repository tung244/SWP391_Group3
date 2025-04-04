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
        <jsp:include page="Common/Css.jsp"/>
    </head>
    <body >
        <jsp:include page="Common/Navbar.jsp"/>
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="row">
                        <div class="col-xl-7 mx-auto">
                            <h6 class="mb-0 text-uppercase">Basic Form</h6>
                            <hr>
                            <div class="card border-top border-0 border-4 border-primary">
                                <div class="card-body p-5">
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
                                                    <select class="form-control" name="role_name" required>
                                                        <option value="Sales" ${"Sales".equals(staff.account.role.role_name) ? "selected" : ""}>Sales</option>
                                                        <option value="Customer Support" ${"Customer Support".equals(staff.account.role.role_name) ? "selected" : ""}>Customer Support</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-update">Update Staff</button>
                                            <a href="ListStaff" class="btn btn-secondary ms-2">Cancel</a>
                                        </div>
                                    </form>
                                    </body>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
        <jsp:include page="Common/Js.jsp"/>              

</html>
