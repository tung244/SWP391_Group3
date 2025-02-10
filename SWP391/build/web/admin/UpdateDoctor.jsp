<%-- 
    Document   : UpdateDoctor
    Created on : Feb 11, 2025, 12:26:50 AM
    Author     : PC
--%>
<%-- 
    Document   : updateform
    Created on : Feb 6, 2025, 11:17:49 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Doctor</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"], input[type="number"], input[type="date"], select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }
            button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h1>Update Doctor Information</h1>
        <form action="updateDoctor" method="POST" id="updateDoctorForm">
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
                <input value="${doctor.rating}" type="number" id="rating" name="rating" step="0.1" required>
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
                <label for="specializationId">Specialization ID:</label>
                <input value="${doctor.specialization.specialization_id}" type="number" id="specializationId" name="specializationId" required>
            </div>
            <button type="submit">Update Doctor</button>
        </form>

       
    </body>
</html>

