/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import dal.DoctorsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Doctors;

/**
 *
 * @author PC
 */
@WebServlet(name = "DoctorProfile", urlPatterns = {"/admin/doctorProfile"})
public class DoctorProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DoctorProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoctorProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int accId = Integer.parseInt(request.getParameter("accId"));
        DoctorsDAO dao = new DoctorsDAO();
        Doctors doctor = new Doctors();
        doctor = dao.getDoctorsByAccId(accId);
        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher("doctorProfile?accId=" +accId).forward(request, response);
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
