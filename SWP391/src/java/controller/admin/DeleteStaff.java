/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author -ASUS-
 */
@WebServlet(name="DeleteStaff", urlPatterns={"/deletestaff"})
public class DeleteStaff extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet DeleteStaff</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteStaff at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        try {
            
            int serviceDetailId = Integer.parseInt(request.getParameter("id"));
            
            
            StaffDAO dao = new StaffDAO();
            boolean isDeleted = dao.deleteStaff(serviceDetailId);

            
            String message;
            if (isDeleted) {
                message = "<div class='alert alert-success' style='font-size: 18px;'>"
                        + "<i class='fas fa-check-circle' style='color: #28a745; margin-right: 10px;'></i>"
                        + "Xóa thành công!"
                        + "</div>";
            } else {
                message = "<div class='alert alert-danger' style='font-size: 18px;'>"
                        + "<i class='fas fa-exclamation-circle' style='color: #dc3545; margin-right: 10px;'></i>"
                        + "Không thể xóa dịch vụ. Vui lòng thử lại!"
                        + "</div>";
            }
            request.getSession().setAttribute("message", message);
            response.sendRedirect(request.getContextPath() + "/admin/StaffList");
        } catch (Exception e) {
            e.printStackTrace();
            String errorMessage = "<div class='alert alert-danger' style='font-size: 18px;'>"
                    + "<i class='fas fa-exclamation-triangle' style='color: #dc3545; margin-right: 10px;'></i>"
                    + "Đã xảy ra lỗi: " + e.getMessage()
                    + "</div>";
            request.getSession().setAttribute("message", errorMessage);
            response.sendRedirect(request.getContextPath() + "/admin/StaffList");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
