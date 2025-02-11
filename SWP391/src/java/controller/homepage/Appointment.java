/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import dal.AppointmentDAO;
import dal.DoctorsDAO;
import dal.ServiceDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.sql.Date;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Account;
import model.Appointments;
import model.Doctors;
import model.ServiceDetail;
import model.Slots;
import model.UserProfile;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Appointment", urlPatterns = {"/appointment"})
public class Appointment extends HttpServlet {

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
            out.println("<title>Servlet Appointment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Appointment at " + request.getContextPath() + "</h1>");
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
        ServiceDao dao = new ServiceDao();
        DoctorsDAO dao1 = new DoctorsDAO();
        AppointmentDAO dao2 = new AppointmentDAO();
        ServiceDetail s = null;
        String id_raw = request.getParameter("id");
        String type_raw = request.getParameter("type");
        List<Doctors> listD = dao1.getAllDoctors();
        List<Slots> slots = null;
        try {
            int id = Integer.parseInt(id_raw);
            int type = Integer.parseInt(type_raw);
            slots = dao2.getSlotByServiceType(type);
            s = dao.getServiceDetailById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("s", s);
        request.setAttribute("listD", listD);
        request.setAttribute("slots", slots);
//            request.setAttribute("listST", list1);
        request.getRequestDispatcher("/homepage/Appointment.jsp").forward(request, response);
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
        AppointmentDAO dao = new AppointmentDAO();
        String date = request.getParameter("date");
        String user_raw = request.getParameter("patient");
        String slot_raw = request.getParameter("slot");
        String doctor_raw = request.getParameter("doctor");
        String service_detail_raw = request.getParameter("service");
        Date appointment_date = null;

        // Sử dụng DateTimeFormatter để định dạng ngày
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        if (date != null && !date.isEmpty()) {
            LocalDate localDate = LocalDate.parse(date, formatter); // Chuyển đổi sang LocalDate
            appointment_date = Date.valueOf(localDate); // Chuyển đổi LocalDate sang java.sql.Date
        }
        try {
            int user_id = Integer.parseInt(user_raw);
            int slot_id = Integer.parseInt(slot_raw);
            int doctor_id = Integer.parseInt(doctor_raw);
            int service_detail_id = Integer.parseInt(service_detail_raw);
            Account account = new Account(user_id);
            UserProfile user = new UserProfile(account);
            Slots slot = new Slots(slot_id);
            Doctors doctor = new Doctors(doctor_id);
            ServiceDetail service_detail = new ServiceDetail(service_detail_id);
            Appointments appointment = new Appointments(appointment_date, "Scheduled", doctor, slot, service_detail, user);
            boolean correct = dao.addAppointment(appointment);
            if (correct) {
                request.setAttribute("mess", "Completed");
                request.getRequestDispatcher("/homepage/Test.jsp").forward(request, response);
            } else {
                request.setAttribute("mess", "Error");
                request.getRequestDispatcher("/homepage/Test.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mess", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/homepage/Test.jsp").forward(request, response);
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
