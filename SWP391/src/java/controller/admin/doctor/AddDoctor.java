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
import java.util.ArrayList;
import java.util.List;
import model.Certificate;
import model.Degree;
import model.Doctors;
import model.Specialization;

/**
 *
 * @author PC
 */
@WebServlet(name = "AddDoctor", urlPatterns = {"/admin/AddDoctor"})
public class AddDoctor extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet AddDoctor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDoctor at " + request.getContextPath() + "</h1>");
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
        // Get all degrees and specializations for the form
        DegreeDAO degreeDao = new DegreeDAO();
        List<Degree> listDegree = degreeDao.getAllDegree();

        SpecializationDAO specializationDao = new SpecializationDAO();
        List<Specialization> listSpe = specializationDao.getAllSpecialization();

        CertificateDAO certificateDao = new CertificateDAO();
        List<Certificate> listCer = certificateDao.getAllCertificate();

        request.setAttribute("listDegree", listDegree);
        request.setAttribute("listSpe", listSpe);
        request.setAttribute("listCer", listCer);

        request.getRequestDispatcher("AddDoctor.jsp").forward(request, response);
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
        // Get data from Add form
        String doctorName = request.getParameter("doctorName");
        int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
        String profileImage = request.getParameter("profileImage");
        double rating = Double.parseDouble(request.getParameter("rating"));
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String doctor_status = request.getParameter("status");
        int specializationId = Integer.parseInt(request.getParameter("specializationId"));
        String[] certificateIds = request.getParameterValues("certificateIds");
        String[] degreeIds = request.getParameterValues("degreeIds");

        // Create doctor object and set properties
        Doctors doctor = new Doctors();
        doctor.setDoctor_name(doctorName);
        doctor.setExperience_years(experienceYears);
        doctor.setProfile_image(profileImage);
        doctor.setRating(rating);
        doctor.setGender(gender);
        doctor.setDob(dob);
        doctor.setAddress(address);
        doctor.setDoctor_status(doctor_status);

        // Set related specialization object
        Specialization specialization = new Specialization();
        specialization.setSpecialization_id(specializationId);
        doctor.setSpecialization(specialization);

        // Insert doctor and get generated doctor ID
        DoctorsDAO doctorDao = new DoctorsDAO();
        boolean doctorId = doctorDao.addDoctor(doctor);

        if (doctorId) {
//            // Insert degrees
//            DegreeDAO degreeDao = new DegreeDAO();
//            List<Integer> degreeIdList = new ArrayList<>();
//            if (degreeIds != null && degreeIds.length > 0) {
//                try {
//                    for (String degreeId : degreeIds) {
//                        if (degreeId != null && !degreeId.trim().isEmpty()) {
//                            degreeIdList.add(Integer.parseInt(degreeId.trim()));
//                        }
//                    }
//                } catch (NumberFormatException e) {
//                    e.printStackTrace();
//                    // Handle the error appropriately
//                }
//            }
//            degreeDao.addDoctorDegrees(doctorId, degreeIdList);
//
//            // Insert certificates
//            CertificateDAO certificateDao = new CertificateDAO();
//            List<Integer> certificateIdList = new ArrayList<>();
//            if (certificateIds != null && certificateIds.length > 0) {
//                try {
//                    for (String certificateId : certificateIds) {
//                        if (certificateId != null && !certificateId.trim().isEmpty()) {
//                            certificateIdList.add(Integer.parseInt(certificateId.trim()));
//                        }
//                    }
//                } catch (NumberFormatException e) {
//                    e.printStackTrace();
//                    // Handle the error appropriately
//                }
//            }
//            certificateDao.addDoctorCertificates(doctorId, certificateIdList);

            response.sendRedirect("DoctorList");
        } else {
            request.setAttribute("error", "Failed to add doctor.");
            request.getRequestDispatcher("AddDoctor.jsp").forward(request, response);
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
