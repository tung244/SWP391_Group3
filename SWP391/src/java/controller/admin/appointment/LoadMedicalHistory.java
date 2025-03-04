/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.appointment;

import dal.AppointmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalHistory;

/**
 *
 * @author DELL
 */
@WebServlet(name="LoadMedicalHistory", urlPatterns={"/LoadMedicalHistory"})
public class LoadMedicalHistory extends HttpServlet {
   
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
            out.println("<title>Servlet LoadMedicalHistory</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadMedicalHistory at " + request.getContextPath () + "</h1>");
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
        String aid = request.getParameter("aId");
        AppointmentDAO dao = new AppointmentDAO();
        MedicalHistory history = dao.getMedicalHistoryByAId(aid);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Tạo HTML cho bảng chi tiết
        out.println("<div class='container-fluid'>");
        out.println("<table class='table'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>Diagnosis</th>");
        out.println("<th>Symptoms</th>");
        out.println("<th>Treatment</th>");
        out.println("<th>Prescription</th>");
        out.println("<th>Vision_left</th>");
        out.println("<th>Vision_right</th>");
        out.println("<th>Addition_test</th>");
        out.println("<th>Note</th>");
        out.println("<th>Created_at</th>");
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        out.println("<tr>");
        out.println("<td>" + history.getDiagnosis()+ "</td>");
        out.println("<td>" + history.getSymptoms()+ "</td>");
        out.println("<td>" + history.getTreatment()+ "</td>");
        out.println("<td>" + history.getPrescription()+ "</td>");
        out.println("<td>" + history.getVisionLeft()+ "</td>");
        out.println("<td>" + history.getVisionRight()+ "</td>");
        out.println("<td>" + history.getAdditionalTests()+ "</td>");
        out.println("<td>" + history.getNote()+ "</td>");
        out.println("<td>" + history.getCreatedAt()+ "</td>");
        out.println("<td>");
        out.println("</td>");
        out.println("</tr>");
        out.println("</tbody>");
        out.println("</table>");
        out.println("</div>");
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
