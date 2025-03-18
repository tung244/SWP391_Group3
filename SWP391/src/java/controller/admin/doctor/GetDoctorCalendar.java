/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.doctor;

import dal.AppointmentDAO;
import dal.DoctorsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Appointments;
import model.Doctors;

/**
 *
 * @author DELL
 */
@WebServlet(name="GetDoctorCalendar", urlPatterns={"/admin/GetDoctorCalendar"})
public class GetDoctorCalendar extends HttpServlet {
   
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
            out.println("<title>Servlet GetDoctorCalendar</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetDoctorCalendar at " + request.getContextPath () + "</h1>");
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
        AppointmentDAO dao = new AppointmentDAO();
        DoctorsDAO dao1 = new DoctorsDAO();
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        String doctor_id = request.getParameter("doctor_id");
        String date = request.getParameter("date");
        List<Appointments> list = new ArrayList<>();
        if(date==null || date.isEmpty()){
            list = dao.getFilterAppointment(null, doctor_id, formattedDate, null, null);
        }else{
            list = dao.getFilterAppointment(null, doctor_id, date, null, null);
        }
        Doctors doctor = dao1.getDoctorsById(doctor_id);
        request.setAttribute("listA", list);
        request.setAttribute("doctor", doctor);
        request.setAttribute("date", formattedDate);
        request.getRequestDispatcher("DoctorCalendar.jsp").forward(request, response);
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
        AppointmentDAO dao = new AppointmentDAO();
        DoctorsDAO dao1 = new DoctorsDAO();
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String doctor_id = request.getParameter("doctor_id");
        Doctors doctor = dao1.getDoctorsById(doctor_id);
// Xóa khoảng trắng ở đầu và cuối, và giảm bớt khoảng trắng bên trong
        name = name.trim().replaceAll("\\s+", "");

// Kết hợp các từ lại với nhau
        String[] words = name.split(" ");
        if (words.length > 1) {
            StringBuilder combinedName = new StringBuilder();
            for (String word : words) {
                combinedName.append(word).append(" ");
            }
            name = combinedName.toString().trim(); // Loại bỏ khoảng trắng cuối cùng
        }

        // Gọi phương thức để lấy danh sách cuộc hẹn
        List<Appointments> list = dao.getFilterAppointment(null, doctor_id, date, null, name);
        request.setAttribute("listA", list);
        request.setAttribute("date", date);
        request.setAttribute("name", name);
        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher("DoctorCalendar.jsp").forward(request, response);
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
