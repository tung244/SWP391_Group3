/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


package controller.admin.doctor;

import dal.CertificateDAO;
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
import model.Certificate;

import model.Degree;
import model.Doctors;
import model.Specialization;



@WebServlet(name="ListDoctorDetail", urlPatterns={"/admin/listDoctorDetail"})
public class ListDoctorDetail extends HttpServlet {

   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
           
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String doctor_id = request.getParameter("doctor_id");
        DoctorsDAO dao = new DoctorsDAO();
        Doctors doctordetail = dao.getDoctorsById(doctor_id);
        System.out.println(doctor_id);
        SpecializationDAO spdao = new SpecializationDAO();
        List<Specialization> listSpecializationByDocId = spdao.getSpecializationByDoctorId(doctor_id);
        
        DegreeDAO dedao = new DegreeDAO();
        List<Degree> listDegree = dedao.getDegreeByDoctorId(doctor_id);
        CertificateDAO cerdao = new CertificateDAO();
        List<Certificate> listCer = cerdao.getCertificateByDoctorId(doctor_id);
      
        String related_specid = spdao.getSpecializationIdByDoctorId(doctor_id);

        
        
        
        request.setAttribute("listDegree", listDegree);
        request.setAttribute("listSpecById", listSpecializationByDocId);
        request.setAttribute("listCer", listCer);
        request.setAttribute("d", doctordetail);
        request.getRequestDispatcher("DoctorDetail.jsp").forward(request, response);

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
