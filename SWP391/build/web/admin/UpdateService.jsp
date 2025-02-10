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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update Service</title>
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
                <h2 class="page-title">Update Service Details</h2>
                
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>
                
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
        
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
