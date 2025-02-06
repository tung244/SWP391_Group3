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
import model.Specialization;

/**
 *
 * @author PC
 */
@WebServlet(name="UpdateDoctor", urlPatterns={"/updateDoctor"})
public class UpdateDoctor extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateDoctor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDoctor at " + request.getContextPath () + "</h1>");
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
        DoctorsDAO dao = new DoctorsDAO();
        
        String did = request.getParameter("doctor_id");
        Doctors doctor = dao.getDoctorsById(did);
        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher("homepage/updateform.jsp").forward(request, response);
       
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
    // Lấy dữ liệu từ form
    int doctorId = Integer.parseInt(request.getParameter("doctorId"));
    String doctorName = request.getParameter("doctorName");
    int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
    String profileImage = request.getParameter("profileImage");
    double rating = Double.parseDouble(request.getParameter("rating"));
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    int specializationId = Integer.parseInt(request.getParameter("specializationId"));

    // Tạo đối tượng Doctors
    Doctors doctor = new Doctors();
    doctor.setDoctor_id(doctorId);
    doctor.setDoctor_name(doctorName);
    doctor.setExperience_years(experienceYears);
    doctor.setProfile_image(profileImage);
    doctor.setRating(rating);
    doctor.setGender(gender);
    doctor.setDob(dob);
    doctor.setAddress(address);

    // Tạo đối tượng Specialization
    Specialization specialization = new Specialization();
    specialization.setSpecialization_id(specializationId);
    doctor.setSpecialization(specialization);

    // Gọi DAO để cập nhật thông tin bác sĩ
    DoctorsDAO dao = new DoctorsDAO();
    boolean isUpdated = dao.updateDoctor(doctor);

    // Chuyển hướng hoặc hiển thị thông báo
    if (isUpdated) {
        response.sendRedirect("doctordash"); // Chuyển hướng đến trang danh sách bác sĩ
    } else {
        request.setAttribute("error", "Failed to update doctor.");
        request.getRequestDispatcher("homepage/updateform.jsp").forward(request, response);
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
