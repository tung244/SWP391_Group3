/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import dal.AccountDAO;
import dal.CertificateDAO;
import dal.DegreeDAO;
import dal.Degree_DoctorDAO;
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
import model.Account;
import model.Certificate;
import model.Degree;
import model.Degree_Doctor;
import model.Doctors;
import model.Specialization;

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
        DoctorsDAO dao = new DoctorsDAO();

        Account a = (Account) request.getSession().getAttribute("account");
        if (a.getRole().getRole_id() == 3) {
            int accId = a.getAccount_id();
            String doctorId = dao.getDoctorIdByAccId(accId);

            Doctors doctor = dao.getDoctorsByAccId(accId);
            SpecializationDAO spdao = new SpecializationDAO();
            List<Specialization> listSpecializationByDocId = spdao.getSpecializationByDoctorId(doctorId);

            DegreeDAO dedao = new DegreeDAO();
            List<Degree> listDegree = dedao.getDegreeByDoctorId(doctorId);
            CertificateDAO cerdao = new CertificateDAO();
            List<Certificate> listCer = cerdao.getCertificateByDoctorId(doctorId);
            int countReviewers = dao.countRatedPatientsByDoctorId(doctorId);
            
            request.setAttribute("countReviewers", countReviewers);
            request.setAttribute("listDegree", listDegree);
            request.setAttribute("listSpecById", listSpecializationByDocId);
            request.setAttribute("listCer", listCer);
            request.setAttribute("doctor", doctor);
        }
        request.getRequestDispatcher("DoctorProfile.jsp").forward(request, response);
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
