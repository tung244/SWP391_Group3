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
@WebServlet(name = "FilterControll", urlPatterns = {"/filter"})
public class FilterControll extends HttpServlet {

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
        //Get param to filter
        String specializationId = request.getParameter("sid");
        String degreeId = request.getParameter("deid");
        String searchName = request.getParameter("searchName");
        //Get param to sort
        String sortByName = request.getParameter("sortByName");
        String sortByExperience = request.getParameter("sortByExperience");
        String sortByRating = request.getParameter("sortByRating");
        //Get all chuyen khoa     
        SpecializationDAO spdao = new SpecializationDAO();
        List<Specialization> listSpecialization = spdao.getAllSpecialization();
        //Get all bang cap
        DegreeDAO dedao = new DegreeDAO();
        List<Degree> listDegree = dedao.getAllDegree();
        //List doctor after filter
        DoctorsDAO dao = new DoctorsDAO();
        
        List<Doctors> listD;
        if ((specializationId == null || specializationId.isEmpty()) && 
            (degreeId == null || degreeId.isEmpty()) && 
            (searchName == null || searchName.trim().isEmpty())) {
            
            listD = dao.getActiveDoctors();
        } else {
            
            listD = dao.getDoctorsByFilter(specializationId, degreeId, searchName);
        }
        if(sortByName != null){
            dao.sortByName(listD, sortByName);
        }
        if(sortByExperience != null){
            dao.sortByExperience(listD, sortByExperience);
        }
        if(sortByRating != null){
            dao.sortByRating(listD, sortByRating);
        }
        
        request.setAttribute("listDegree", listDegree);
        request.setAttribute("listSpecialization", listSpecialization);
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
