package controller.admin;

import dal.ServiceDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.ServiceDetail;
import model.ServiceTypes;
import model.Services;
import model.Specialization;

@WebServlet(name = "AddService", urlPatterns = {"/admin/AddService"})
public class AddService extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Nhận các tham số từ yêu cầu
            String serviceName = request.getParameter("service_name");
            String serviceDescription = request.getParameter("service_description");
            String serviceIntroduce = request.getParameter("service_introduce");
            String serviceBenefit = request.getParameter("service_benefit");
            String serviceTypeName = request.getParameter("service_type_name");
            double cost = Double.parseDouble(request.getParameter("cost"));
            String specializationName = request.getParameter("specialization_name");
            String specializationStatus = request.getParameter("specialization_status");

            // Tạo đối tượng Services
            Services service = new Services();
            service.setService_name(serviceName);
            service.setService_description(serviceDescription);
            service.setService_introduce(serviceIntroduce);
            service.setService_benefit(serviceBenefit);

            // Tạo đối tượng Specialization
            Specialization specialization = new Specialization();
            specialization.setSpecialization_name(specializationName);
            specialization.setSpecialization_status(specializationStatus);
            service.setSpecialization(specialization);

            // Tạo đối tượng ServiceTypes
            ServiceTypes serviceType = new ServiceTypes();
            serviceType.setService_type_name(serviceTypeName);

            // Tạo đối tượng ServiceDetail
            ServiceDetail serviceDetail = new ServiceDetail();
            serviceDetail.setServices(service);
            serviceDetail.setServiceType(serviceType);
            serviceDetail.setCost(cost);

            // Thêm dữ liệu vào database
            ServiceDao serviceDetailDAO = new ServiceDao();
            boolean isAdded = serviceDetailDAO.addServiceDetail(serviceDetail);

            if (isAdded) {
                response.sendRedirect(request.getContextPath() + "/admin/ServiceList");
            } else {
                request.setAttribute("error", "Add failed. Please try again.");
                request.getRequestDispatcher("AddService.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("AddService.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy danh sách các specialization từ database
            ServiceDao serviceDao = new ServiceDao();
            List<Specialization> specializations = serviceDao.getAllSpecialization();
            List<ServiceTypes> serviceTypes = serviceDao.getAllServiceType();

            // Đặt danh sách vào request attribute
            request.setAttribute("list", specializations);
            request.setAttribute("serviceTypes", serviceTypes);

            // Chuyển tiếp đến trang AddService.jsp
            request.getRequestDispatcher("AddService.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("AddService.jsp").forward(request, response);
        }
    }
}
