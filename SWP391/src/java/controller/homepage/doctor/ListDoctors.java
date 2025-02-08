/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.doctor;

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
import java.util.List;
import model.Degree;
import model.Doctors;
import model.Specialization;

/**
 *
 * @author PC
 */
@WebServlet(name = "ListDoctors", urlPatterns = {"/listDoctors"})
public class ListDoctors extends HttpServlet {

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
            out.println("<title>Servlet ListDoctors</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListDoctors at " + request.getContextPath() + "</h1>");
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

        String doctor_id = request.getParameter("doctorId");
        
        DoctorsDAO dao = new DoctorsDAO();
        List<Doctors> listDoctor = dao.getActiveDoctors();
        SpecializationDAO spdao = new SpecializationDAO();
        List<Specialization> listSpecialization = spdao.getAllSpecialization();
        DegreeDAO dedao = new DegreeDAO();
        List<Degree> listDegree = dedao.getDegreeByDoctorId(doctor_id);

        // Nhận các tham số sắp xếp từ yêu cầu
        String sortByName = request.getParameter("sortByName");
        String sortByExperience = request.getParameter("sortByExperience");
        String sortByRating = request.getParameter("sortByRating");

        // Sắp xếp danh sách bác sĩ theo các tiêu chí
        if (sortByName != null) {
            dao.sortByName(listDoctor, sortByName);
        }
        if (sortByExperience != null) {
            dao.sortByExperience(listDoctor, sortByExperience);
        }
        if (sortByRating != null) {
            dao.sortByRating(listDoctor, sortByRating);
        }

        request.setAttribute("listDegree", listDegree);
        request.setAttribute("listDoctor", listDoctor);
        request.setAttribute("listSpecialization", listSpecialization);
       
        request.getRequestDispatcher("homepage/listdoctors.jsp").forward(request, response);
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
