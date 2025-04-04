/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.checking;

import dal.Certificate_DoctorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Certificate;
import model.Certificate_Doctor;

/**
 *
 * @author PC
 */
@WebServlet(name="checkingCertificateDoctor", urlPatterns={"/admin/checkingCertificateDoctor"})
public class checkingCertificateDoctor extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet checkingCertificateDoctor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkingCertificateDoctor at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Certificate_DoctorDAO cer_docdao  = new Certificate_DoctorDAO();
        // Lấy thông tin phân trang
        int page = 1;
        int pageSize = 5;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }
        String pageSizeParam = request.getParameter("pageSize");
        if (pageSizeParam != null && !pageSizeParam.isEmpty()) {
            pageSize = Integer.parseInt(pageSizeParam);
        }
        List<Certificate_Doctor> listCerDoc = cer_docdao.getCerDocAddToCheck() ;
        // Tính toán tổng số trang
        int totalCer = listCerDoc.size();
        int totalPages = (int) Math.ceil((double) totalCer / pageSize);
        int offset = (page - 1) * pageSize;
        int end = Math.min(offset + pageSize, totalCer);
        listCerDoc = listCerDoc.subList(offset, end);

        // Get pagination parameters for history list
        int historyPage = 1;
        int historyPageSize = 5;
        String historyPageParam = request.getParameter("historyPage");
        if (historyPageParam != null && !historyPageParam.isEmpty()) {
            historyPage = Integer.parseInt(historyPageParam);
        }
        String historyPageSizeParam = request.getParameter("historyPageSize");
        if (historyPageSizeParam != null && !historyPageSizeParam.isEmpty()) {
            historyPageSize = Integer.parseInt(historyPageSizeParam);
        }

        // Process history list with pagination
        List<Certificate_Doctor> historyCerDoc = cer_docdao.getDoctorCertificateHistory();
        int totalHistory = historyCerDoc.size();
        int totalHistoryPages = (int) Math.ceil((double) totalHistory / historyPageSize);
        int historyOffset = (historyPage - 1) * historyPageSize;
        int historyEnd = Math.min(historyOffset + historyPageSize, totalHistory);
        historyCerDoc = historyCerDoc.subList(historyOffset, historyEnd);
       

        request.setAttribute("listCerDoc", listCerDoc);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);

        request.setAttribute("historyCerDoc", historyCerDoc);
        request.setAttribute("currentHistoryPage", historyPage);
        request.setAttribute("totalHistoryPages", totalHistoryPages);
        request.setAttribute("historyPageSize", historyPageSize);
        request.getRequestDispatcher("CheckingCertificateDoctor.jsp").forward(request, response);
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String doctor_id = request.getParameter("doctor_id");
        String certificate_id = request.getParameter("certificate_id");
        String status = request.getParameter("status").trim();
        Certificate_DoctorDAO cedocdao = new Certificate_DoctorDAO();
        if (status.equals("Accept")) {
            boolean success = cedocdao.updateStatus(doctor_id, certificate_id, status);
            if (success) {
                request.getSession().setAttribute("success", "The new certificate has been accepted!");
                response.sendRedirect("checkingCertificateDoctor");
            }
        } else if (status.equals("Reject")) {
            boolean success = cedocdao.deleteCertificate(doctor_id, certificate_id);
            if (success) {
                request.getSession().setAttribute("success", "The new certificate has been rejected!");
                response.sendRedirect("checkingCertificateDoctor");
            }
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
