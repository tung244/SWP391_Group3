/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import com.google.gson.Gson;
import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author APC
 */
@WebServlet(name = "GetCrowedTime", urlPatterns = {"/admin/GetCrowedTime"})
public class GetCrowedTime extends HttpServlet {

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
            out.println("<title>Servlet GetCrowedTime</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetCrowedTime at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        AdminDAO dao = new AdminDAO();
        List<Object[]> data = dao.getCrowedTime(); // Lấy dữ liệu từ database

        // Chuyển dữ liệu thành danh sách đối tượng JSON
        List<SlotStatistics> slotStats = new ArrayList<>();
        for (Object[] row : data) {
            slotStats.add(new SlotStatistics(
                    (String) row[0], // start_time
                    (String) row[1], // end_time
                    (int) row[2] // total_appointments
            ));
        }

        // Chuyển danh sách thành JSON và gửi về client
        String json = new Gson().toJson(slotStats);
        response.getWriter().write(json);
    }

    class SlotStatistics {

        String start_time;
        String end_time;
        int total_appointments;

        public SlotStatistics(String start_time, String end_time, int total_appointments) {
            this.start_time = start_time;
            this.end_time = end_time;
            this.total_appointments = total_appointments;
        }
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
        processRequest(request, response);
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
