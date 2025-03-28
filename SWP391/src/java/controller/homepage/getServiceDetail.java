/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import dal.ServiceDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ServiceDetail;

/**
 *
 * @author APC
 */
@WebServlet(name = "getServiceDetail", urlPatterns = {"/getServiceDetail"})
public class getServiceDetail extends HttpServlet {

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
            out.println("<title>Servlet getServiceDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getServiceDetail at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));

        ServiceDao dao = new ServiceDao();
        ServiceDetail serviceDetail = dao.getServiceDetailByServiceAndType(serviceId, serviceTypeId);

        PrintWriter out = response.getWriter();
        if (serviceDetail != null) {
            String json = "{"
                    + "\"serviceDetailId\": " + serviceDetail.getService_detail_id() + ","
                    + "\"cost\": " + serviceDetail.getCost()
                    + "}";
            out.print(json);
        } else {
            out.print("{}"); // Trả về object rỗng nếu không tìm thấy
        }
        out.flush();
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
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        ServiceDao dao = new ServiceDao();
        ServiceDetail serviceDetail = dao.getServiceDetailByServiceAndType(serviceId, serviceTypeId);

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
