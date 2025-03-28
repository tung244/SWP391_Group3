/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.appointment;

import dal.AppointmentDAO;
import dal.ServiceDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Appointments;
import model.Services;

/**
 *
 * @author DELL
 */
@WebServlet(name = "NoteMedical", urlPatterns = {"/admin/NoteMedical"})
public class NoteMedical extends HttpServlet {

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
            out.println("<title>Servlet NoteMedical</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NoteMedical at " + request.getContextPath() + "</h1>");
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
        AppointmentDAO dao = new AppointmentDAO();
        ServiceDao dao2 = new ServiceDao();
        String id = request.getParameter("id");
        List<Services> list2 = dao2.getAllServicesOnly();
        List<Appointments> list = dao.getAppointment(id);
        Appointments appointment = null;
        for (Appointments appointments : list) {
            appointment = appointments;
        }
        String date = appointment.getAppointment_date().toString();
        int docId = appointment.getDoctor().getDoctor_id();
        request.setAttribute("aId", id);
        request.setAttribute("docId", docId);
        request.setAttribute("date", date);
        request.setAttribute("listS", list2);
        request.getRequestDispatcher("NoteMedicalHistory.jsp").forward(request, response);

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
        int appointmentId = Integer.parseInt(request.getParameter("aId"));
        String diagnosis = request.getParameter("diagnosis");
        String symptoms = request.getParameter("symptom");  // Lưu ý: form bị viết sai "symptom" -> "symmtom"
        String treatment = request.getParameter("treatment");
        String prescription = request.getParameter("prescription");

        // Xử lý giá trị của vision_left và vision_right (nếu rỗng thì gán giá trị mặc định)
        double visionLeft = 0.0;
        double visionRight = 0.0;
        try {
            if (!request.getParameter("vision_left").isEmpty()) {
                visionLeft = Double.parseDouble(request.getParameter("vision_left"));
            }
            if (!request.getParameter("vision_right").isEmpty()) {
                visionRight = Double.parseDouble(request.getParameter("vision_right"));
            }
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Xử lý lỗi khi nhập không đúng định dạng số
        }
        List<Appointments> apps = dao.getAppointment(appointmentId +"");
        Appointments app = apps.get(0);
        String additionalTests = request.getParameter("addition_test");
        String note = request.getParameter("note");
        int docId = app.getDoctor().getDoctor_id();
        boolean success = dao.insertMedicalHistory(appointmentId, diagnosis, symptoms, treatment, prescription, visionLeft, visionRight, additionalTests, note);
        if(success){
            response.sendRedirect("GetDoctorCalendar?doctor_id="+docId);
        }else{
            request.setAttribute("msg", "Update Error");
            request.getRequestDispatcher("NoteMedical?id="+appointmentId).forward(request, response);
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
