/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dal.AppointmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.List;

/**
 *
 * @author DELL
 */
@WebServlet(name = "RevenueStat", urlPatterns = {"/admin/RevenueStat"})
public class RevenueStat extends HttpServlet {

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
            out.println("<title>Servlet RevenueStats</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RevenueStats at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json;charset=UTF-8");
        AppointmentDAO dao = new AppointmentDAO();
        String type = request.getParameter("type"); // Loại yêu cầu: 'quarterly' hoặc 'monthly'
        String yearParam = request.getParameter("year"); // Năm (bắt buộc)

        // Kiểm tra và xử lý tham số 'year'
        int year = 2025; // Đặt mặc định nếu không có tham số 'year'
        if (yearParam != null && !yearParam.trim().isEmpty()) {
            try {
                year = Integer.parseInt(yearParam.trim());
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid year parameter: " + yearParam);
            }
        }

        DecimalFormat df = new DecimalFormat("#.##"); // Định dạng để loại E (2 chữ số thập phân)
        JsonArray jsonArray = new JsonArray(); // JSON trả về

        if (type != null && type.equals("quarterly")) {
            // Lấy doanh thu theo quý (truyền tham số năm)
            List<Object[]> quarterlyRevenues = dao.getQuarterlyRevenue(year);

            for (Object[] record : quarterlyRevenues) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("quarter", (int) record[0]); // Quý
                jsonObject.addProperty("revenue", df.format((double) record[1])); // Doanh thu có định dạng
                jsonArray.add(jsonObject);
            }

        } else if (type != null && type.equals("monthly")) {
            // Lấy doanh thu theo tháng trong quý (yêu cầu thêm tham số quý)
            String quarterParam = request.getParameter("quarter"); // Quý (bắt buộc)

            // Kiểm tra và xử lý tham số 'quarter'
            int quarter = 1; // Đặt mặc định nếu không truyền 'quarter'
            if (quarterParam != null && !quarterParam.trim().isEmpty()) {
                try {
                    quarter = Integer.parseInt(quarterParam.trim());
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("Invalid quarter parameter: " + quarterParam);
                }
            }

            List<Object[]> monthlyRevenues = dao.getMonthlyRevenue(year, quarter);

            for (Object[] record : monthlyRevenues) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("month", (int) record[0]); // Tháng
                jsonObject.addProperty("revenue", df.format((double) record[1])); // Doanh thu có định dạng
                jsonArray.add(jsonObject);
            }
        }

        try (PrintWriter out = response.getWriter()) {
            out.print(jsonArray.toString()); // Trả về JSON cho client qua API
            out.flush();
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
