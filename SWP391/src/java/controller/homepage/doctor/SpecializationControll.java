/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage.doctor;

import dal.DoctorsDAO;
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
@WebServlet(name="SpecializationControll", urlPatterns={"/specialization"})
public class SpecializationControll extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String specializationId = request.getParameter("sid");
        DoctorsDAO dao = new DoctorsDAO();
        
        List<Specialization> listSpecialization = dao.getAllSpecialization();
        
        request.setAttribute("listSpecialization", listSpecialization);
        List<Doctors> listD;
        if (specializationId == null || specializationId.isEmpty()) {
            
            listD = dao.getAllDoctors();
        } else {
            
            listD = dao.getDoctorsBySpecializationId(specializationId);
        }
         request.setAttribute("listDoctor", listD);
         request.getRequestDispatcher("homepage/listdoctors.jsp").forward(request, response);
        
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
