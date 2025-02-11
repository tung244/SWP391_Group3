
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </head>
    <body>
    <c:if test="${not empty sessionScope.ms}">
        <script type="text/javascript">
            $(document).ready(function () {
                toastr.success("${sessionScope.ms}");
            });
        </script>
    </c:if>
    <%      
        session.removeAttribute("ms");   
    %>
    <c:if test="${not empty sessionScope.error}">
        <script type="text/javascript">
            $(document).ready(function () {
                toastr.error("${sessionScope.error}");
            });
        </script>
    </c:if>
    <%      
        session.removeAttribute("error");   
    %>
    </body>
</html>
