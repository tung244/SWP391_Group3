

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý quyền nâng cao</title>
        <jsp:include page="Common/Css.jsp"/>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f5f5f5;
            }

            .container {
                max-width: 1400px;
                margin: 0 auto;
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            h1 {
                color: #333;
                text-align: center;
            }

            .role-select {
                margin-bottom: 20px;
                padding: 10px;
                font-size: 16px;
                width: 200px;
            }

            .accordion {
                margin-top: 20px;
            }

            .accordion-item {
                border-bottom: 1px solid #ddd;
            }

            .accordion-header {
                background-color: #f8f8f8;
                padding: 15px;
                cursor: pointer;
                font-weight: bold;
            }

            .accordion-header:hover {
                background-color: #e8e8e8;
            }

            .accordion-content {
                padding: 15px;
                display: none;
                background-color: #fff;
            }

            .permission-group {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 10px;
            }

            .save-btn {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 20px;
            }

            .save-btn:hover {
                background-color: #45a049;
            }
        </style>

    </head>
    <body>

        <jsp:include page="Common/Navbar.jsp"/>
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="container">
                        <h1>Quản lý quyền theo vai trò</h1>
                        <form method="get" action="role_management">
                            <select name="role_id" class="role-select" id="roleSelect">
                                <c:forEach var="role" items="${role}">
                                    <option value="${role.role_id}">${role.role_name}</option>
                                </c:forEach>
                            </select>
                            <button style="margin: 0px 0px 5px 10px" type="submit" class="btn btn-primary px-5">Lọc</button>
                        </form>    
                        <div class="accordion" id="permissionsAccordion">
                            <c:forEach var="map" items="${module}">
                                <input type="hidden" id="role_id" value="${roleId}"/>
                                <div class="accordion-item">
                                    <div class="accordion-header" onclick="toggleAccordion(this)">${map.key.module_name}</div>
                                    <div class="accordion-content">
                                        <div class="permission-group">
                                            <c:forEach var="item" items="${map.value}">
                                                <label><input 
                                                        <c:if test="${item.isUsed eq true}">checked</c:if> 
                                                            type="checkbox"
                                                            name="permission"
                                                            onchange="updatePermission(this, ${item.permission_id})"
                                                        value="${item.permission_id}"
                                                        > ${item.permission_name}
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Common/Message.jsp"/>
        <jsp:include page="Common/Js.jsp"/>

        <script>


            // Toggle accordion
            function toggleAccordion(header) {
                const content = header.nextElementSibling;
                content.style.display = content.style.display === 'block' ? 'none' : 'block';
            }

            function updatePermission(checkbox, permissionId) {
                const isChecked = checkbox.checked;
                const roleId = document.getElementById("role_id").value;
                

                $.ajax({
                    url: 'role_management', 
                    type: 'POST',
                    data: {
                        roleId: roleId,
                        permissionId: permissionId,
                        isChecked: isChecked
                    },
                    success: function (response) {
                        console.log('Permission updated successfully:', response);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error updating permission:', error);
                        // Có thể rollback trạng thái checkbox nếu cần
                        checkbox.checked = !isChecked;
                    }
                });
            }


        </script>
    </body>
</html>
