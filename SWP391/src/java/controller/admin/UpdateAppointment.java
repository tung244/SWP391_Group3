/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

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
import java.util.List;
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
        AppointmentDAO dao = new AppointmentDAO();
        String id_raw = request.getParameter("id");
        String doctor_id_raw = request.getParameter("doctor_select");
        String slot_id_raw = request.getParameter("slot");
        String status = request.getParameter("status"); // Sửa lỗi chính tả

        int doctor_id = 0;
        int slot_id = 0;
        int id = 0;
        String mess = "";

        try {
            if (doctor_id_raw != null && !doctor_id_raw.isEmpty()) {
                doctor_id = Integer.parseInt(doctor_id_raw);
            }
            if (slot_id_raw != null && !slot_id_raw.isEmpty()) {
                slot_id = Integer.parseInt(slot_id_raw);
            }
            if (id_raw != null && !id_raw.isEmpty()) {
                id = Integer.parseInt(id_raw);
            }

            boolean check = dao.confirmAppointment(id, doctor_id, slot_id, status);
            mess = check ? "Update Completed" : "Update Failed";
        } catch (Exception e) {
            e.printStackTrace();
            mess = "An error occurred: " + e.getMessage(); // Cung cấp thông tin lỗi
        }

        request.setAttribute("mess", mess);
        request.getRequestDispatcher("/admin/AppointmentList").forward(request, response);
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
