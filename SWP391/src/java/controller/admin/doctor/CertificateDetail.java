/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import dal.Certificate_DoctorDAO;
import dal.DoctorsDAO;
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
@WebServlet(name = "CertificateDetail", urlPatterns = {"/admin/certificateDetail"})
public class CertificateDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CertificateDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CertificateDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DoctorsDAO dao = new DoctorsDAO();
        Certificate_DoctorDAO cd = new Certificate_DoctorDAO();
        String did = request.getParameter("did");
        String accId = dao.getDoctorAccIdByDoctorId(did);
        List<Certificate_Doctor> listCer = cd.getCertificateDoctorId(did);
        if (listCer.size() == 0) {
            request.getSession().setAttribute("error", "List Certificate is empty. Please update certificate before view detail certificate!");
            response.sendRedirect("doctorProfile?accId=" + accId);
        } else {
            System.out.println(listCer.get(0).getCertificate().getCertificate_name());
            request.setAttribute("listCer", listCer);
            request.setAttribute("accId", accId);
            request.getRequestDispatcher("CertificateDetail.jsp").forward(request, response);
        }

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
