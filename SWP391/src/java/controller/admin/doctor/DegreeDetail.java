/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import dal.Degree_DoctorDAO;
import dal.DoctorsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Degree_Doctor;

/**
 *
 * @author PC
 */
@WebServlet(name = "DegreeDetail", urlPatterns = {"/admin/degreeDetail"})
public class DegreeDetail extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Degree_DoctorDAO dedocdao = new Degree_DoctorDAO();
        DoctorsDAO dao = new DoctorsDAO();
        String doctorId = request.getParameter("did");
        String accId = dao.getDoctorAccIdByDoctorId(doctorId);
        List< Degree_Doctor> listDeDoc = dedocdao.getDegreeDoctorById(doctorId);
        if (listDeDoc.size() == 0) {
            request.getSession().setAttribute("error", "List Degree is empty. Please update degree before view detail degree!");
            response.sendRedirect("doctorProfile?accId=" + accId);
        } else {
            request.setAttribute("listDeDoc", listDeDoc);
            request.setAttribute("accId", accId);
            request.getRequestDispatcher("DegreeDetail.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
