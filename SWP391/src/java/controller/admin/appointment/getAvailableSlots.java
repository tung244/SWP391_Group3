/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.appointment;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dal.AppointmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalTime;
import java.util.Collections;
import java.util.List;
import model.Slots;
import org.json.JSONObject;

/**
 *
 * @author DELL
 */
@WebServlet(name = "getAvailableSlots", urlPatterns = {"/admin/getAvailableSlots"})
public class getAvailableSlots extends HttpServlet {

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
            out.println("<title>Servlet getAvailableSlots</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getAvailableSlots at " + request.getContextPath() + "</h1>");
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
        String doctorId = request.getParameter("doctorId");
        String serviceTypeId = request.getParameter("serviceTypeId");
        String date = request.getParameter("date");

        List<Slots> availableSlots = dao.getAvailableSlot(date, doctorId, serviceTypeId);
        Gson gson = new Gson();

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(availableSlots));
        out.flush();
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Tạo đối tượng JSON để phản hồi
        JSONObject jsonResponse = new JSONObject();

        try {
            // Lấy dữ liệu từ query string
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));
            int slotId = Integer.parseInt(request.getParameter("slotId"));

            // Tạo một đối tượng để xử lý cập nhật
            AppointmentDAO appointmentDAO = new AppointmentDAO();
            boolean isUpdated = appointmentDAO.confirmAppointment(appointmentId, doctorId, slotId, "Scheduled");
            // Tạo phản hồi
            jsonResponse.put("success", isUpdated);
            jsonResponse.put("message", isUpdated ? "Cập nhật thành công!" : "Cập nhật thất bại.");

        } catch (NumberFormatException e) {
            // Xử lý khi không thể chuyển đổi tham số
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Tham số không hợp lệ.");
        } catch (Exception e) {
            // Xử lý lỗi bất kỳ
            e.printStackTrace(); // In ra log nếu cần
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Có lỗi xảy ra, vui lòng thử lại.");
        }

        // Gửi phản hồi về client
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
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
