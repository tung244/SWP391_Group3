/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import dal.DoctorsDAO;
import dal.ServiceDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Doctors;
import model.ImagesService;
import model.ServiceDetail;
import model.Services;

/**
 *
 * @author DELL
 */
@WebServlet(name = "LoadServiceDetailHomepage", urlPatterns = {"/loadServiceDetailHomepage"})
public class LoadServiceDetailHomepage extends HttpServlet {

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
            out.println("<title>Servlet LoadServiceDetailHomepage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadServiceDetailHomepage at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        ServiceDao dao = new ServiceDao();
        DoctorsDAO ddao = new DoctorsDAO();
        int id = 0;
        Services service = null;
        List<ServiceDetail> list1 = null;
        List<Doctors> listDoctor = null;
        ServiceDetail service1 = null;
        ImagesService imageService = null;
        String[] introduceParts = null;
        String[] benefitParts = null;
        int spe_id = 0;
        try {
            id = Integer.parseInt(id_raw);
            service = dao.getOnlyServiceById(id);
            imageService = dao.getServiceWithImageById(id);
            String name = service.getService_name();
            list1 = dao.getServiceByName(name);
            service1 = list1.isEmpty() ? null : list1.get(0);
            String serviceIntroduce = service1.getServices().getService_introduce();
            String serviceBenefit = service1.getServices().getService_benefit();

            introduceParts = serviceIntroduce.split("\\.");
            benefitParts = serviceBenefit.split("\\.");
            spe_id = service.getSpecialization().getSpecialization_id();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        listDoctor = ddao.getSameSpecializationDoctors(spe_id);
        List<Services> list = dao.getAllServicesOnly();
        request.setAttribute("listS", list);
        request.setAttribute("listSD", list1);
        request.setAttribute("doctors", listDoctor);
        request.setAttribute("service", service);
        request.setAttribute("imageService", imageService);
        request.setAttribute("introducePart1", introduceParts[0]);
        request.setAttribute("introducePart2", introduceParts.length > 1 ? introduceParts[1] : "");
        request.setAttribute("benefitPart1", benefitParts[0]);
        request.setAttribute("benefitPart2", benefitParts.length > 1 ? benefitParts[1] : "");
        request.getRequestDispatcher("/homepage/ServiceDetail.jsp").forward(request, response);
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
        processRequest(request, response);
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
