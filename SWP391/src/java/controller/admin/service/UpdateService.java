/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.service;

import dal.ServiceDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ServiceDetail;
import com.google.gson.Gson;
import java.util.List;
import model.ServiceTypes;
import model.Services;
import model.Specialization;

/**
 *
 * @author DELL
 */
@WebServlet(name = "UpdateService", urlPatterns = {"/admin/UpdateService"})
public class UpdateService extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateService</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateService at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        ServiceDao dao = new ServiceDao();
        String id_raw = request.getParameter("id");
        ServiceDetail serviceDetail = null;

        try {
            // Kiểm tra ID
            if (id_raw != null) {
                int id = Integer.parseInt(id_raw);
                serviceDetail = dao.getServiceDetailById(id);
                List<Specialization> list = dao.getAllSpecialization();
                // Kiểm tra serviceDetail có null không
                if (serviceDetail != null) {
                    request.setAttribute("s", serviceDetail);
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("UpdateService.jsp").forward(request, response);
                } else {
                    out.println("Service detail not found.");
                }
            } else {
                out.println("Invalid ID provided.");
            }
        } catch (NumberFormatException e) {
            out.println("Invalid ID format.");
            e.printStackTrace();
        } catch (Exception e) {
            out.println("An error occurred while retrieving service details.");
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Nhận các tham số từ yêu cầu
            int serviceDetailId = Integer.parseInt(request.getParameter("service_detail_id"));
            String serviceName = request.getParameter("service_name");
            String serviceDescription = request.getParameter("service_description");
            String serviceIntroduce = request.getParameter("service_introduce");
            String serviceBenefit = request.getParameter("service_benefit");
            String serviceStatus = request.getParameter("service_status");
            String serviceTypeName = request.getParameter("service_type_name");
            double cost = Double.parseDouble(request.getParameter("cost"));
            String specializationName = request.getParameter("specialization_name");

            // Tạo đối tượng Services
            Services service = new Services();
            service.setService_name(serviceName);
            service.setService_description(serviceDescription);
            service.setService_introduce(serviceIntroduce);
            service.setService_benefit(serviceBenefit);
            service.setService_status(serviceStatus);

            // Tạo đối tượng Specialization
            Specialization specialization = new Specialization();
            specialization.setSpecialization_name(specializationName);
            service.setSpecialization(specialization);

            // Tạo đối tượng ServiceTypes
            ServiceTypes serviceType = new ServiceTypes();
            serviceType.setService_type_name(serviceTypeName);

            // Tạo đối tượng ServiceDetail
            ServiceDetail serviceDetail = new ServiceDetail();
            serviceDetail.setService_detail_id(serviceDetailId);
            serviceDetail.setServices(service);
            serviceDetail.setServiceType(serviceType);
            serviceDetail.setCost(cost);

            // Cập nhật dữ liệu
            ServiceDao serviceDetailDAO = new ServiceDao();
            boolean isUpdated = serviceDetailDAO.updateServiceDetail(serviceDetail);

            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/admin/ServiceList");
            } else {
                request.setAttribute("error", "Update failed. Please try again.");
                request.getRequestDispatcher("/admin/UpdateService.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/admin/UpdateService.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
