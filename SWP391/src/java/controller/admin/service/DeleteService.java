package controller.admin.service;

import dal.ServiceDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteService", urlPatterns = {"/admin/deleteService"})
public class DeleteService extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy ID dịch vụ cần xóa từ tham số yêu cầu
            int serviceDetailId = Integer.parseInt(request.getParameter("id"));
            
            // Xóa dịch vụ bằng DAO
            ServiceDao serviceDao = new ServiceDao();
            boolean isDeleted = serviceDao.deleteService(serviceDetailId);

            // Thiết lập thông báo và chuyển hướng
            String message;
            if (isDeleted) {
                message = "<div class='alert alert-success' style='font-size: 18px;'>"
                        + "<i class='fas fa-check-circle' style='color: #28a745; margin-right: 10px;'></i>"
                        + "Xóa dịch vụ thành công!"
                        + "</div>";
            } else {
                message = "<div class='alert alert-danger' style='font-size: 18px;'>"
                        + "<i class='fas fa-exclamation-circle' style='color: #dc3545; margin-right: 10px;'></i>"
                        + "Không thể xóa dịch vụ. Vui lòng thử lại!"
                        + "</div>";
            }
            request.getSession().setAttribute("message", message);
            response.sendRedirect(request.getContextPath() + "/admin/ServiceList");
        } catch (Exception e) {
            e.printStackTrace();
            String errorMessage = "<div class='alert alert-danger' style='font-size: 18px;'>"
                    + "<i class='fas fa-exclamation-triangle' style='color: #dc3545; margin-right: 10px;'></i>"
                    + "Đã xảy ra lỗi: " + e.getMessage()
                    + "</div>";
            request.getSession().setAttribute("message", errorMessage);
            response.sendRedirect(request.getContextPath() + "/admin/ServiceList");
        }
    }
}
