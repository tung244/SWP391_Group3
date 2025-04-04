<%-- 
    Document   : UpdateDiscount
    Created on : Mar 26, 2025, 1:39:27 AM
    Author     : APC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Common/Css.jsp"/>
    </head>
    <body>
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
                                    <form action="UpdateDiscount" method="post">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Discount Detail ID</label>
                                                    <input type="text" class="form-control" name="discountId" value="${discount.discountId}" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Discount Name</label>
                                                    <input type="text" class="form-control" name="discountName" value="${discount.discountName}" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Start Date</label>
                                                    <input type="date" class="form-control" name="startDate" value="${discount.startDate}" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">End Date</label>
                                                    <input type="date" class="form-control" name="endDate" value="${discount.endDate}" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Đồng (%)</label>
                                                    <input type="number" class="form-control" name="rank1" value="${list[0].percent}" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Bạc (%)</label>
                                                    <input type="number" class="form-control" name="rank2" value="${list[1].percent}" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Vàng (%)</label>
                                                    <input type="number" class="form-control" name="rank3" value="${list[2].percent}" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Bạch Kim (%)</label>
                                                    <input type="number" class="form-control" name="rank4" value="${list[3].percent}" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Kim Cương (%)</label>
                                                    <input type="number" class="form-control" name="rank5" value="${list[4].percent}" required/>
                                                </div>
                                            </div>
<!--                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Status</label>
                                                    <input type="text" class="form-control" name="status" value="${discount.status}" required/>
                                                </div>
                                            </div> -->
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Status</label>
                                                    <select class="form-select" name="status" required>
                                                        <option value="true" ${discount.status ? 'selected' : ''}>Active</option>
                                                        <option value="false" ${!discount.status ? 'selected' : ''}>Inactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-update">Update Discount</button>
                                            <a href="ServiceList" class="btn btn-secondary ms-2">Cancel</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>

        <jsp:include page="Common/Js.jsp"/>
    </body>
</html>
