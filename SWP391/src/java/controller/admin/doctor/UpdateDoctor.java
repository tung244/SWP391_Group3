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
@WebServlet(name = "UpdateDoctor", urlPatterns = {"/admin/updateDoctor"})
public class UpdateDoctor extends HttpServlet {

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
            out.println("<title>Servlet UpdateDoctor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDoctor at " + request.getContextPath() + "</h1>");
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
        DoctorsDAO dao = new DoctorsDAO();
        // Get doctor data by id
        String did = request.getParameter("doctorId");
        Doctors doctor = dao.getDoctorsById(did);

        // Get all degrees and doctor's degrees
        DegreeDAO de = new DegreeDAO();
        List<Degree> listDegree = de.getAllDegree();
        List<Degree> listDoctorDegree = de.getDegreeByDoctorId(did);

        // Get all specializations
        SpecializationDAO spdao = new SpecializationDAO();
        List<Specialization> listSpe = spdao.getAllSpecialization();

        // Get all certificates and doctor's certificates
        CertificateDAO cdao = new CertificateDAO();
        List<Certificate> listCer = cdao.getAllCertificate();
        List<Certificate> listDoctorCertificate = cdao.getCertificateByDoctorId(did);

        request.setAttribute("doctor", doctor);
        request.setAttribute("listDegree", listDegree);
        request.setAttribute("listSpe", listSpe);
        request.setAttribute("listCer", listCer);
        request.setAttribute("listDoctorDegree", listDoctorDegree);
        request.setAttribute("listDoctorCertificate", listDoctorCertificate);
        request.getRequestDispatcher("UpdateDoctor.jsp").forward(request, response);

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
        // Get data from Update form
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        String doctorName = request.getParameter("doctorName");
        int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
        String profileImage = request.getParameter("profileImage");
        double rating = Double.parseDouble(request.getParameter("rating"));
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String doctor_status = request.getParameter("doctor_status");
        int specializationId = Integer.parseInt(request.getParameter("specializationId"));
        String[] certificateIds = request.getParameterValues("certificateIds");
        String[] degreeIds = request.getParameterValues("degreeIds");

        // Create doctor object and set properties
        Doctors doctor = new Doctors();
        doctor.setDoctor_id(doctorId);
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

        // Update records
        DoctorsDAO doctorDao = new DoctorsDAO();
        DegreeDAO degreeDao = new DegreeDAO();
        CertificateDAO certificateDao = new CertificateDAO();

        boolean isDoctorUpdated = doctorDao.updateDoctor(doctor);

        // Update degrees
        List<Integer> degreeIdList = new ArrayList<>();
        if (degreeIds != null) {
            for (String degreeId : degreeIds) {
                degreeIdList.add(Integer.parseInt(degreeId));
            }
        }
        boolean isDegreeUpdated = degreeDao.updateDoctorDegrees(doctorId, degreeIdList);

        // Update certificates
        List<Integer> certificateIdList = new ArrayList<>();
        if (certificateIds != null) {
            for (String certificateId : certificateIds) {
                certificateIdList.add(Integer.parseInt(certificateId));
            }
        }
        boolean isCertificateUpdated = certificateDao.updateDoctorCertificates(doctorId, certificateIdList);

        if (isDoctorUpdated && isDegreeUpdated && isCertificateUpdated) {
            response.sendRedirect("DoctorList");
        } else {
            request.setAttribute("errorr", "Failed to update doctor information.");
            request.getRequestDispatcher("UpdateDoctor.jsp").forward(request, response);
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
