/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.doctor;

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
import model.Doctors;
import model.Specialization;

/**
 *
 * @author PC
 */
@WebServlet(name = "SpecializationControll", urlPatterns = {"/specialization"})
public class SpecializationControll extends HttpServlet {

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

        String specializationId = request.getParameter("sid");
        String searchName = request.getParameter("name");
        DoctorsDAO dao = new DoctorsDAO();
        SpecializationDAO spdao = new SpecializationDAO();

        List<Specialization> listSpecialization = spdao.getAllSpecialization();
        request.setAttribute("listSpecialization", listSpecialization);

        List<Doctors> listD;

       
        if (specializationId == null || specializationId.isEmpty()) {
            if (searchName == null || searchName.isEmpty()) {
                listD = dao.getAllDoctors();
            } else {
                listD = dao.searchByName(searchName); 
            }
        } else {
            if (searchName == null || searchName.isEmpty()) {
                listD = dao.getDoctorsBySpecializationId(specializationId);
            } else {
                listD = dao.getDoctorsBySpecializationIdAndName(specializationId, searchName); 
            }
        }
        request.setAttribute("txtS", searchName);
        request.setAttribute("listDoctor", listD);
        request.getRequestDispatcher("homepage/listdoctors.jsp").forward(request, response);


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
        processRequest(request, response);
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
