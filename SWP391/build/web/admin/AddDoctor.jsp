<%-- 
    Document   : AddDoctor
    Created on : Feb 11, 2025, 5:10:41 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Doctor</title>
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

        form {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        .form-group {
            margin-bottom: 15px;
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

        .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            margin-right: 15px;
            margin-bottom: 10px;
        }

        .checkbox-item input {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <form action="AddDoctor" method="POST">
        <h1>Add Doctor</h1>
        <div class="form-group">
            <label for="doctorName">Doctor Name:</label>
            <input type="text" id="doctorName" name="doctorName" required>
        </div>
        <div class="form-group">
            <label for="experienceYears">Experience Years:</label>
            <input type="number" id="experienceYears" name="experienceYears" required>
        </div>
        <div class="form-group">
            <label for="profileImage">Profile Image URL:</label>
            <input type="text" id="profileImage" name="profileImage">
        </div>
        <div class="form-group">
            <label for="rating">Rating:</label>
            <input type="number" id="rating" name="rating" step="0.1" required>
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="status">Status:</label>
            <select name="status" class="form-select" aria-label="Default select example">
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>
            </select>               
        </div>
        <div class="form-group">
            <label for="specializationId">Specialization:</label>
            <select name="specializationId" class="form-select" aria-label="Default select example">  
                <c:forEach items="${listSpe}" var="lsp">
                    <option value="${lsp.specialization_id}">${lsp.specialization_name}</option>
                </c:forEach>
            </select>
        </div>
<!--        <div class="form-group">
            <label for="certificateId">Certificate:</label>
            <div class="checkbox-group">
                <c:forEach items="${listCer}" var="cer">
                    <div class="checkbox-item">
                        <input type="checkbox" id="certificateId${cer.certificate_id}" name="certificateIds" value="${cer.certificate_id}">
                        <label for="certificateId${cer.certificate_id}">${cer.certificate_name}</label>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="form-group">
            <label for="degreeId">Degree:</label>
            <div class="checkbox-group">
                <c:forEach items="${listDegree}" var="de">
                    <div class="checkbox-item">
                        <input type="checkbox" id="degreeId${de.degree_id}" name="degreeIds" value="${de.degree_id}">
                        <label for="degreeId${de.degree_id}">${de.degree_name}</label>
                    </div>
                </c:forEach>
            </div>
        </div>-->
        <button type="submit">Add Doctor</button>
    </form>
</body>
</html>