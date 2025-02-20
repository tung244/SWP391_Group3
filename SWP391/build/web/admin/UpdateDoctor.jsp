

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Doctor</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f0f4f0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                padding: 20px;
                color: #333;
            }

            h1 {
                color: #2e7d32;
                text-align: center;
                margin-bottom: 30px;
            }

            form {
                background-color: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 600px;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .form-group {
                width: 48%;
                margin-bottom: 15px;
            }

            .full-width {
                width: 100%;
            }

            label {
                display: block;
                margin-bottom: 5px;
                color: #2e7d32;
                font-weight: bold;
            }

            input, select {
                width: 100%;
                padding: 10px;
                border: 1px solid #4caf50;
                border-radius: 5px;
                transition: border-color 0.3s ease;
            }

            input:focus, select:focus {
                outline: none;
                border-color: #81c784;
            }

            button {
                width: 100%;
                padding: 12px;
                background-color: #4caf50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #2e7d32;
            }

            /* Checkbox Group Styling */
            .checkbox-group {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                background: #f9f9f9;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #4caf50;
                margin-bottom: 15px;
            }

            .checkbox-item {
                display: flex;
                align-items: center;
                gap: 5px;
                width: 48%;
            }

            /* Ensure Certificates are Above Degrees */
            .certificates {
                order: -1;
            }

            .degrees {
                order: 1;
            }

            /* Responsive Design */
            @media (max-width: 600px) {
                .form-group {
                    width: 100%;
                }
                .checkbox-item {
                    width: 100%;
                }
            }

            .form-buttons {
                display: flex;
                justify-content: space-between;
                gap: 20px;
                width: 100%;
            }

            .form-buttons button {
                flex: 1;
                padding: 10px 20px;
            }
        </style>
    </head>
    <body>

        <form action="updateDoctor" method="POST" id="updateDoctorForm">
            <h1>Update Doctor Information</h1>
            <div class="form-group">
                <label for="doctorId">Doctor ID:</label>
                <input value="${doctor.doctor_id}" type="number" id="doctorId" name="doctorId" readonly>
            </div>
            <div class="form-group">
                <label for="doctorName">Doctor Name:</label>
                <input value="${doctor.doctor_name}" type="text" id="doctorName" name="doctorName" required>
            </div>
            <div class="form-group">
                <label for="experienceYears">Experience Years:</label>
                <input value="${doctor.experience_years}" type="number" id="experienceYears" name="experienceYears" required>
            </div>
            <div class="form-group">
                <label for="profileImage">Profile Image URL:</label>
                <input value="${doctor.profile_image}" type="text" id="profileImage" name="profileImage">
            </div>
            <div class="form-group">
                <label for="rating">Rating:</label>
                <input value="${doctor.rating}" type="number" id="rating" name="rating" step="0.1" readonly required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="Male" ${doctor.gender == 'Male' ? 'selected' : ''}>Male</option>
                    <option value="Female" ${doctor.gender == 'Female' ? 'selected' : ''}>Female</option>
                    <option value="Other" ${doctor.gender == 'Other' ? 'selected' : ''}>Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input value="${doctor.dob}" type="date" id="dob" name="dob" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input value="${doctor.address}" type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select name="doctor_status" class="form-select" aria-label="Default select example">
                    <option value="Active" ${doctor.doctor_status == 'Active' ? 'selected' : ''}>Active</option>
                    <option value="Inactive" ${doctor.doctor_status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                </select>               
            </div>
            <div class="form-group">
                <label for="specializationId">Specialization :</label>
                <select name="specializationId" class="form-select" aria-label="Default select example">  
                    <c:forEach items="${listSpe}" var="lsp">
                        <option value="${lsp.specialization_id}" ${doctor.specialization.specialization_id == lsp.specialization_id ? 'selected' : ''}>${lsp.specialization_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="certificateId">Certificate :</label>
                <div class="checkbox-group">
                    <c:forEach items="${listCer}" var="cer">
                        <div class="checkbox-item">
                            <input type="checkbox" id="certificateId${cer.certificate_id}" name="certificateIds" value="${cer.certificate_id}" 
                                   <c:if test="${fn:contains(listDoctorCertificate, cer)}">checked</c:if>>
                            <label for="certificateId${cer.certificate_id}">${cer.certificate_name}</label>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="form-group">
                <label for="degreeId">Degree :</label>
                <div class="checkbox-group">
                    <c:forEach items="${listDegree}" var="de">
                        <div class="checkbox-item">
                            <input type="checkbox" id="degreeId${de.degree_id}" name="degreeIds" value="${de.degree_id}" 
                                   <c:if test="${fn:contains(listDoctorDegree, de)}">checked</c:if>>
                            <label for="degreeId${de.degree_id}">${de.degree_name}</label>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="form-buttons">
                <button type="submit">Update Doctor</button>
                <button type="button" onclick="window.location.href = 'DoctorList';">Cancel</button>
            </div>
        </form>


    </body>
</html>

