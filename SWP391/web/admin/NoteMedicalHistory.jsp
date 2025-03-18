<%-- 
    Document   : NoteMedicalHistory
    Created on : Feb 27, 2025, 4:04:00 AM
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
                                    <form action="NoteMedical" method="post">
                                        <div class="row g-3">
                                            <c:if test="${not empty msg}">
                                                ${msg}
                                            </c:if>
                                            <input type="hidden" name="aId" value="${aId}"/>
                                            <input type="hidden" name="docId" value="${docId}"/>
                                            <input type="hidden" name="date" value="${date}"/>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Diagnosis</label>
                                                    <input type="text" class="form-control" name="diagnosis" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Symptoms</label>
                                                    <input type="text" class="form-control" name="symptom" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Treatment</label>
                                                    <input type="text" class="form-control" name="treatment" required/>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Prescription</label>
                                                    <textarea class="form-control" name="prescription"  ></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Vision_left</label>
                                                    <input class="form-control" name="vision_left" rows="3"/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Vision_right</label>
                                                    <input type="text" class="form-control" name="vision_right" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label class="form-label">Addition_test</label>
                                                    <select class="form-select" name="addition_test">
                                                        <option value="">-- Chọn --</option>
                                                        <c:forEach var="s" items="${listS}">
                                                            <option value="${s.service_name}">${s.service_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Note</label>
                                                    <textarea class="form-control" name="note"  ></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-update">Note</button>
                                            <a href="GetDoctorCalendar?doctor_id=${docId}" class="btn btn-secondary ms-2">Cancel</a>
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
