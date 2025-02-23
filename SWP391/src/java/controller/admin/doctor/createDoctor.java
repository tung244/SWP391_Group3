/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.doctor;

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
import model.Doctors;
import model.Specialization;

/**
 *
 * @author PC
 */
@WebServlet(name="createDoctor", urlPatterns={"/admin/createDoctor"})
public class createDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet createDoctor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet createDoctor at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        SpecializationDAO specializationDao = new SpecializationDAO();
        List<Specialization> listSpe = specializationDao.getAllSpecialization();
        
        request.setAttribute("listSpe", listSpe);
        request.getRequestDispatcher("createDoctor.jsp").forward(request, response);
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
        try {
            // Lấy dữ liệu từ form
            String doctorName = request.getParameter("doctorName");
            int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
            String profileImage = request.getParameter("profileImage"); // URL ảnh profile
            double rating = Double.parseDouble(request.getParameter("rating"));
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String status = request.getParameter("status");
            int specializationId = Integer.parseInt(request.getParameter("specializationId"));

            // Tạo đối tượng chuyên khoa
            Specialization specialization = new Specialization();
            specialization.setSpecialization_id(specializationId);

            // Tạo đối tượng Doctor
            Doctors doctor = new Doctors();
            doctor.setDoctor_name(doctorName);
            doctor.setExperience_years(experienceYears);
            doctor.setProfile_image(profileImage);
            doctor.setRating(rating);
            doctor.setGender(gender);
            doctor.setDob(dob);
            doctor.setAddress(address);
            doctor.setDoctor_status(status);
            doctor.setSpecialization(specialization);

            // Thêm bác sĩ vào DB
            DoctorsDAO doctorDao = new DoctorsDAO();
            boolean isSuccess = doctorDao.addDoctor(doctor);

            if (isSuccess) {
                request.getSession().setAttribute("progress", 50); // Cập nhật tiến trình
                response.sendRedirect("success.jsp"); // Chuyển đến trang thành công
            } else {
                request.setAttribute("error", "Failed to create doctor. Please try again.");
                doGet(request, response); // Quay lại trang createDoctor.jsp với lỗi
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input data.");
            doGet(request, response);
        }
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
