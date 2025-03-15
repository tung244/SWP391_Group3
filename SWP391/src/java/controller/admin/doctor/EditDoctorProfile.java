/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import static controller.admin.doctor.CreateDoctor.uploadImage;
import dal.CertificateDAO;
import dal.DegreeDAO;
import dal.DoctorsDAO;
import dal.SpecializationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import model.Certificate;
import model.Degree;
import model.Doctors;
import model.Specialization;

/**
 *
 * @author PC
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
@WebServlet(name = "EditDoctorProfile", urlPatterns = {"/admin/editDoctorProfile"})
public class EditDoctorProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditDoctorProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditDoctorProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DoctorsDAO dao = new DoctorsDAO();
        String did = request.getParameter("did");
        String accId = dao.getDoctorAccIdByDoctorId(did);
        Doctors doctor = dao.getDoctorsById(did);

        // Get all specializations
        SpecializationDAO spdao = new SpecializationDAO();
        List<Specialization> listSpe = spdao.getAllSpecialization();

        request.setAttribute("listSpe", listSpe);
        request.setAttribute("accId", accId);
        request.setAttribute("doctor", doctor);
        request.setAttribute("did", did);
        request.getRequestDispatcher("EditDoctorProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DoctorsDAO dao = new DoctorsDAO();
        // Lấy dữ liệu từ form
        String did = request.getParameter("doctorId");
        String accId = dao.getDoctorAccIdByDoctorId(did);

        int doctorId = Integer.parseInt(did);
        String doctorName = request.getParameter("doctorName");
        int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
        int specializationId = Integer.parseInt(request.getParameter("specializationId"));
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String imageProfile = request.getParameter("imageProfile");

        // Xử lý upload ảnh
        Part part = request.getPart("profileImage");
        String pathHost = getServletContext().getRealPath("");
        String finalPath = pathHost.replace("build\\", "");
        String linkFile = uploadImage(part, finalPath);
        response.getWriter().print(linkFile);
        // Tạo đối tượng bác sĩ để cập nhật
        Doctors doctor = new Doctors();
        doctor.setDoctor_id(doctorId);
        doctor.setDoctor_name(doctorName);
        doctor.setExperience_years(experienceYears);
        // Set related specialization object
        Specialization specialization = new Specialization();
        specialization.setSpecialization_id(specializationId);
        doctor.setSpecialization(specialization);

        doctor.setGender(gender);
        doctor.setDob(dob);
        doctor.setAddress(address);
        if (linkFile != null && !linkFile.isEmpty()) {
            doctor.setProfile_image(linkFile);
        } else {
            doctor.setProfile_image(imageProfile);
        }

        System.out.println("Doctor Name: " + doctor.getDoctor_name());
        System.out.println("Experience Years: " + doctor.getExperience_years());
        System.out.println("Specialization ID: " + doctor.getSpecialization().getSpecialization_id());
        System.out.println("Gender: " + doctor.getGender());
        System.out.println("DOB: " + doctor.getDob());
        System.out.println("Address: " + doctor.getAddress());
        System.out.println("Profile Image: " + doctor.getProfile_image());
        System.out.println("Doctor ID: " + doctor.getDoctor_id());

        // Gọi DAO để cập nhật
        boolean updated = dao.updateDoctor(doctor);

        if (updated) {
            request.getSession().setAttribute("success", "Edit doctor profile successfully!");
            response.sendRedirect("doctorProfile?accId=" + accId);          
        } else {
            request.setAttribute("error", "Update failed. Please try again.");
            request.getRequestDispatcher("editDoctorProfile?did=" + did).forward(request, response);
        }
    }

    public static String uploadImage(Part part, String finalPath) throws ServletException {
        String uploadPath = finalPath + "images";
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String linkFile = "";

        String fileName = part.getSubmittedFileName();

        if (fileName != null && !fileName.isEmpty()) {
            File filePath = new File(uploadPath + File.separator + fileName);
            try {
                Files.copy(part.getInputStream(), filePath.toPath(), StandardCopyOption.REPLACE_EXISTING);
                linkFile = "./images/" + fileName;
            } catch (IOException e) {
                throw new ServletException("File upload failed: " + e.getMessage());
            }
        }
        return linkFile;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
