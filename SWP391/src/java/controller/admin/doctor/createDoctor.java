/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import bo.SendMail;
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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.util.List;
import model.Doctors;
import model.Specialization;
import java.time.format.DateTimeFormatter;
import org.json.JSONObject;

/**
 *
 * @author PC
 */
@WebServlet(name = "createDoctor", urlPatterns = {"/admin/createDoctor"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)

public class createDoctor extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SpecializationDAO specializationDao = new SpecializationDAO();
        List<Specialization> listSpe = specializationDao.getAllSpecialization();

        request.setAttribute("listSpe", listSpe);
        request.getRequestDispatcher("createDoctor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Handle AJAX validation requests
        String action = request.getParameter("action");
        if (action != null && !action.equals("createDoctor")) {
            handleAjaxValidation(request, response, action);
            return;
        }
        try {
            // Lấy dữ liệu từ form
            String doctorName = request.getParameter("doctorName");
            int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String status = "Active";         
            int specializationId = Integer.parseInt(request.getParameter("specializationId"));
 
            // Xử lý upload file ảnh
            Part part = request.getPart("profileImage");
            String pathHost = getServletContext().getRealPath("");
            String finalPath = pathHost.replace("build\\", "");
            String linkFile = uploadImage(part, finalPath);
            response.getWriter().print(linkFile);
           
            // Tạo đối tượng chuyên khoa
            Specialization specialization = new Specialization();
            specialization.setSpecialization_id(specializationId);

            // Tạo đối tượng Doctor            
            Doctors doctor = (Doctors) request.getSession().getAttribute("doctor"); 
            doctor.setDoctor_name(doctorName);
            doctor.setExperience_years(experienceYears);
            doctor.setProfile_image(linkFile); 
            doctor.setGender(gender);
            doctor.setDob(dob);
            doctor.setAddress(address);
            doctor.setDoctor_status(status);
            
            doctor.setSpecialization(specialization);
           
            // Thêm bác sĩ vào DB
            DoctorsDAO doctorDao = new DoctorsDAO();
            boolean isSuccess = doctorDao.addDoctor(doctor);
            System.out.println(isSuccess);
            if (isSuccess) {
//                SendMail.sendMailDoctor(doctor.getAcc().email, request.getSession().getAttribute("pass").toString(), doctorName);
                HttpSession session = request.getSession();
                session.setAttribute("progress", 100);      
                response.sendRedirect("DoctorList");
            } else {
                request.setAttribute("error", "Failed to create doctor. Please try again.");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input data: " + e.getMessage());
            doGet(request, response);
        }

    }

    private void handleAjaxValidation(HttpServletRequest request, HttpServletResponse response, String action)
            throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        try {
            switch (action) {
                case "checkDoctorName":
                    String doctorName = request.getParameter("doctor_name");
                    if (doctorName == null || doctorName.trim().isEmpty()) {
                        jsonResponse.put("status", "empty");
                    } else {
                        jsonResponse.put("status", "valid");
                    }
                    break;

                case "checkExperienceYears":
                    String expYearsStr = request.getParameter("experienceYears");
                    if (expYearsStr == null || expYearsStr.trim().isEmpty()) {
                        jsonResponse.put("status", "empty");
                    } else {
                        try {
                            int expYears = Integer.parseInt(expYearsStr);
                            if (expYears <= 0) {
                                jsonResponse.put("status", "invalid");
                            } else {
                                jsonResponse.put("status", "valid");
                            }
                        } catch (NumberFormatException e) {
                            jsonResponse.put("status", "invalid");
                        }
                    }
                    break;

                case "checkProfileImage":
                    String profileImage = request.getParameter("profileImage");
                    if (profileImage == null || profileImage.trim().isEmpty()) {
                        jsonResponse.put("status", "empty");
                    } else {
                        jsonResponse.put("status", "valid");
                    }
                    break;

                case "checkDOB":
                    String dob = request.getParameter("dob");
                    if (dob == null || dob.trim().isEmpty()) {
                        jsonResponse.put("status", "empty");
                    } else {
                        jsonResponse.put("status", "valid");
                    }
                    break;

                case "checkAddress":
                    String address = request.getParameter("address");
                    if (address == null || address.trim().isEmpty()) {
                        jsonResponse.put("status", "empty");
                    } else {
                        jsonResponse.put("status", "valid");
                    }
                    break;

                default:
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Unknown action");
            }
        } catch (Exception e) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", e.getMessage());
        }

        out.print(jsonResponse.toString());
        out.flush();
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
