<%-- 
    Document   : UpdateService.jsp
    Created on : Feb 5, 2025, 3:50:22 PM
    Author     : DELL
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
                                    <form action="UpdateService" method="post">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Service Detail ID</label>
                                                    <input type="text" class="form-control" name="service_detail_id" value="${s.service_detail_id}" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Service Name</label>
                                                    <input type="text" class="form-control" name="service_name" value="${s.services.service_name}" required/>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Service Description</label>
                                                    <textarea class="form-control" name="service_description" rows="3" required>${s.services.service_description}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Service Introduce</label>
                                                    <textarea class="form-control" name="service_introduce" rows="3" required>${s.services.service_introduce}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Service Benefit</label>
                                                    <textarea class="form-control" name="service_benefit" rows="3" required>${s.services.service_benefit}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Service Type</label>
                                                    <input type="text" class="form-control" name="service_type_name" value="${s.serviceType.service_type_name}" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Cost</label>
                                                    <div class="input-group">
                                                        <span class="input-group-text">$</span>
                                                        <input type="number" step="0.01" class="form-control" name="cost" value="${s.cost}" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Specialization</label>
                                                    <select class="form-select" name="specialization_name" required>
                                                        <option value="">-Choose Specialization-</option>
                                                        <c:forEach var="specialization" items="${list}">
                                                            <option value="${specialization.specialization_name}" 
                                                                    <c:if test="${specialization.specialization_name == s.services.specialization.specialization_name}">selected</c:if>>
                                                                ${specialization.specialization_name}
                                                            </option> 
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Service Status</label>
                                                    <select class="form-select" name="service_status" required>
                                                        <option value="Active" ${s.services.service_status == 'Active' ? 'selected' : ''}>Active</option>
                                                        <option value="Inactive" ${s.services.service_status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-update">Update Service</button>
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
