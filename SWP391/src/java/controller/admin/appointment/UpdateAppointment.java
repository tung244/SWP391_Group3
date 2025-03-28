/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.appointment;

import bo.SendMail;
import bo.SendSMS;
import com.google.gson.Gson;
import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import dal.AppointmentDAO;
import dal.DoctorsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Appointments;
import model.Doctors;
import org.json.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "UpdateAppointment", urlPatterns = {"/admin/UpdateAppointment"})
public class UpdateAppointment extends HttpServlet {

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
            out.println("<title>Servlet UpdateAppointment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAppointment at " + request.getContextPath() + "</h1>");
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
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        // Tạo đối tượng JSON để phản hồi
//        JSONObject jsonResponse = new JSONObject();
//
//        try {
//            // Lấy dữ liệu từ query string
//            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
//            int doctorId = Integer.parseInt(request.getParameter("doctorId"));
//            int slotId = Integer.parseInt(request.getParameter("slotId"));
//
//            // Tạo một đối tượng để xử lý cập nhật
//            AppointmentDAO appointmentDAO = new AppointmentDAO();
//            boolean isUpdated = appointmentDAO.confirmAppointment(appointmentId, doctorId, slotId);
//
//            // Tạo phản hồi
//            jsonResponse.put("success", isUpdated);
//            jsonResponse.put("message", isUpdated ? "Cập nhật thành công!" : "Cập nhật thất bại.");
//
//        } catch (NumberFormatException e) {
//            // Xử lý khi không thể chuyển đổi tham số
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            jsonResponse.put("success", false);
//            jsonResponse.put("message", "Tham số không hợp lệ.");
//        } catch (Exception e) {
//            // Xử lý lỗi bất kỳ
//            e.printStackTrace(); // In ra log nếu cần
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            jsonResponse.put("success", false);
//            jsonResponse.put("message", "Có lỗi xảy ra, vui lòng thử lại.");
//        }
//
//        // Gửi phản hồi về client
//        PrintWriter out = response.getWriter();
//        out.print(jsonResponse.toString());
//        out.flush();
        String id = request.getParameter("id");
        AppointmentDAO dao = new AppointmentDAO();
        DoctorsDAO dao1 = new DoctorsDAO();
        List<Appointments> list = dao.getAppointment(id);
        List<Doctors> list2 = dao1.getAllDoctors();
        Appointments appointment = new Appointments();
        for (Appointments appointments : list) {
            appointment = appointments;
        }
        request.setAttribute("listD", list2);
        request.setAttribute("appointment", appointment);
        request.getRequestDispatcher("/admin/UpdateAppointment.jsp").forward(request, response);
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
//        response.setContentType("application/json");
//        AppointmentDAO dao = new AppointmentDAO();
//        String id_raw = request.getParameter("id");
//        String doctor_id_raw = request.getParameter("doctor_select");
//        String slot_id_raw = request.getParameter("slot");
//        String status = request.getParameter("status");
//        System.out.println("Received in doPost - AppointmentId: " + id_raw);
//        System.out.println("Received in doPost - DoctorId: " + doctor_id_raw);
//        System.out.println("Received in doPost - SlotId: " + slot_id_raw);
//        if (status == null || status.isEmpty()) {
//            status = "Scheduled";
//        }
//        int doctor_id = 0;
//        int slot_id = 0;
//        int id = 0;
//        String mess = "";
//        String mail = "";
//        boolean check = false;
//        try {
//            if (doctor_id_raw != null && !doctor_id_raw.isEmpty()) {
//                doctor_id = Integer.parseInt(doctor_id_raw);
//            }
//            if (slot_id_raw != null && !slot_id_raw.isEmpty()) {
//                slot_id = Integer.parseInt(slot_id_raw);
//            }
//            if (id_raw != null && !id_raw.isEmpty()) {
//                id = Integer.parseInt(id_raw);
//            }
//
//            check = dao.confirmAppointment(id, doctor_id, slot_id, status);
//            mess = check ? "Update Completed" : "Update Failed";
//            Appointments appointment = new Appointments();
//            List<Appointments> list = dao.getAppointment(id_raw);
//            for (Appointments appointments : list) {
//                appointment = appointments;
//            }
////            if (status.equals("Scheduled")) {
//////                boolean sendEmail = SendMail.MailConfirmAppointment(appointment);
//////                mail = sendEmail ? "Send Email Completed" : "Send Email Fail";
////            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            mess = "An error occurred: " + e.getMessage(); // Cung cấp thông tin lỗi
//            check = false;
//        }
//        Map<String, Object> responseMap = new HashMap<>();
//        responseMap.put("success", check);
//        responseMap.put("message", mess);
//        responseMap.put("mail", mail);
//
//        String jsonResponse = new Gson().toJson(responseMap);
//        response.getWriter().write(jsonResponse);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

// Khởi tạo DAO
        AppointmentDAO dao = new AppointmentDAO();
        JSONObject jsonResponse = new JSONObject();

        try {
            // Lấy tham số từ request
            String id_raw = request.getParameter("id");
            String doctor_id_raw = request.getParameter("doctor_select");
            String slot_id_raw = request.getParameter("slot");
            String status = request.getParameter("status");

            // Kiểm tra null
            if (id_raw == null || doctor_id_raw == null || slot_id_raw == null) {
                throw new IllegalArgumentException("Thiếu tham số đầu vào.");
            }

            int appointmentId = Integer.parseInt(id_raw);
            int doctorId = Integer.parseInt(doctor_id_raw);
            int slotId = Integer.parseInt(slot_id_raw);

            // Nếu status null, đặt mặc định là "Scheduled"
            if (status == null || status.isEmpty()) {
                status = "Scheduled";
            }

            // Debug log
            System.out.println("Appointment ID: " + appointmentId);
            System.out.println("Doctor ID: " + doctorId);
            System.out.println("Slot ID: " + slotId);
            System.out.println("Status: " + status);

            // Gọi DAO để cập nhật dữ liệu
            boolean isUpdated = dao.confirmAppointment(appointmentId, doctorId, slotId, status);
            String mess = isUpdated ? "Update Completed" : "Update Failed";
            Appointments appointment = new Appointments();
            List<Appointments> list = dao.getAppointment(id_raw);
            for (Appointments appointments : list) {
                appointment = appointments;
            }
            if (status.equals("Scheduled")) {
                sendMail(appointment);
                Thread.sleep(3000);
            }
            // Tạo phản hồi JSON
            jsonResponse.put("success", isUpdated);
            jsonResponse.put("message", isUpdated ? "Cập nhật thành công!" : "Cập nhật thất bại.");

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Tham số không hợp lệ.");
        } catch (IllegalArgumentException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.put("success", false);
            jsonResponse.put("message", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Lỗi xử lý request: " + e.getMessage());
        }

// Gửi phản hồi về client
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }

    private static void sendMail(Appointments a) {
        Thread emailThread = new Thread(() -> {  // thread gửi mail khác luồng
            try {
                System.out.println("đến 3");
                SendMail.MailConfirmAppointment(a);

            } catch (Exception e) {
                e.printStackTrace();  // Log lỗi nếu có
            }
        });
        emailThread.start();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
