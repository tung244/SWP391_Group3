/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.checking;

import dal.Degree_DoctorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Degree_Doctor;

/**
 *
 * @author PC
 */
@WebServlet(name = "checkingDoctorDegree", urlPatterns = {"/admin/checkingDoctorDegree"})
public class checkingDoctorDegree extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Degree_DoctorDAO dedocdao = new Degree_DoctorDAO();
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
        List<Degree_Doctor> listDeDoc = dedocdao.getDeDocAddToCheck();
        // Tính toán tổng số trang
        int totalDegree = listDeDoc.size();
        int totalPages = (int) Math.ceil((double) totalDegree / pageSize);
        int offset = (page - 1) * pageSize;
        int end = Math.min(offset + pageSize, totalDegree);
        listDeDoc = listDeDoc.subList(offset, end);

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
        List<Degree_Doctor> historyDeDoc = dedocdao.getDoctorDegreeHistory();
        int totalHistory = historyDeDoc.size();
        int totalHistoryPages = (int) Math.ceil((double) totalHistory / historyPageSize);
        int historyOffset = (historyPage - 1) * historyPageSize;
        int historyEnd = Math.min(historyOffset + historyPageSize, totalHistory);
        historyDeDoc = historyDeDoc.subList(historyOffset, historyEnd);
       

        request.setAttribute("listDeDoc", listDeDoc);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);

        request.setAttribute("historyDeDoc", historyDeDoc);
        request.setAttribute("currentHistoryPage", historyPage);
        request.setAttribute("totalHistoryPages", totalHistoryPages);
        request.setAttribute("historyPageSize", historyPageSize);
        request.getRequestDispatcher("CheckingDoctorDegree.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String doctor_id = request.getParameter("doctor_id");
        String degree_id = request.getParameter("degree_id");
        String status = request.getParameter("status").trim();
        Degree_DoctorDAO dedocdao = new Degree_DoctorDAO();
        if (status.equals("Accept")) {
            boolean success = dedocdao.updateStatus(doctor_id, degree_id, status);
            if (success) {
                request.getSession().setAttribute("success", "The new degree has been accepted!");
                response.sendRedirect("checkingDoctorDegree");
            }
        } else if (status.equals("Reject")) {
            boolean success = dedocdao.deleteDegree(doctor_id, degree_id);
            if (success) {
                request.getSession().setAttribute("success", "The new degree has been rejected!");
                response.sendRedirect("checkingDoctorDegree");
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
