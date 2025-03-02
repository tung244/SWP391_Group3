/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.DegreeDAO;
import dal.DoctorsDAO;
import dal.SpecializationDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Degree;

import model.Doctors;
import model.Specialization;

/**
 *
 * @author -ASUS-
 */
@WebServlet(name = "Doctor", urlPatterns = {"/admin/DoctorList"})
public class ListDoctor extends HttpServlet {

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
        // Lấy các tham số lọc
        String specializationId = request.getParameter("sid");
        String degreeId = request.getParameter("deid");
        String searchName = request.getParameter("searchName");
        String sortBy = request.getParameter("sortBy");
        String option = request.getParameter("option");

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

        // lấy chuyên khoa vs bằng cấp
        SpecializationDAO spdao = new SpecializationDAO();
        List<Specialization> listSpecialization = spdao.getAllSpecialization();
        DegreeDAO dedao = new DegreeDAO();
        List<Degree> listDegree = dedao.getAllDegree();

        DoctorsDAO dao = new DoctorsDAO();
        List<Doctors> listD;

        if (specializationId != null || degreeId != null || searchName != null || sortBy != null) {
            listD = dao.getDoctorsByFilter(specializationId, degreeId, searchName, sortBy, option);
        } else {
            listD = dao.getDoctorsDash();
        }
        

        // Tính toán tổng số trang
        int totalDoctors = listD.size();
        int totalPages = (int) Math.ceil((double) totalDoctors / pageSize);
        int offset = (page - 1) * pageSize;
        int end = Math.min(offset + pageSize, totalDoctors);
        listD = listD.subList(offset, end);

        // Chuyển đổi danh sách bác sĩ thành JSON
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.add("doctors", gson.toJsonTree(listD));
        jsonResponse.addProperty("currentPage", page);
        jsonResponse.addProperty("totalPages", totalPages);

        request.setAttribute("listDegree", listDegree);
        request.setAttribute("listSpecialization", listSpecialization);
        request.setAttribute("listDoctor", listD);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);

        request.getRequestDispatcher("ListDoctor.jsp").forward(request, response);


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

        String doctor_id = request.getParameter("doctor_id");
        String status = request.getParameter("status");
        DoctorsDAO dao = new DoctorsDAO();
        boolean success = dao.updateStatus(doctor_id, status);
        if (success) {
            request.getSession().setAttribute("success", "Update status doctor successfully!");
            response.sendRedirect("DoctorList");
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
