/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import com.google.gson.Gson;
import dal.DiscountDAO;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.DiscountDetail;
import model.UserProfile;

/**
 *
 * @author APC
 */
@WebServlet(name = "GetDiscountsByDate", urlPatterns = {"/GetDiscountsByDate"})
public class GetDiscountsByDate extends HttpServlet {

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
            out.println("<title>Servlet GetDiscountsByDate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetDiscountsByDate at " + request.getContextPath() + "</h1>");
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
        DiscountDAO dao = new DiscountDAO();
        // 🔹 Lấy rankId từ session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        UserProfileDAO dao1 = new UserProfileDAO();
        UserProfile user = dao1.GetAccount(username);
        String dateParam = request.getParameter("date");
        if (dateParam == null || dateParam.isEmpty()) {
            response.getWriter().write("[]"); // Trả về danh sách rỗng nếu không có ngày
            return;
        }
        try {
            Date selectedDate = Date.valueOf(dateParam); // Chuyển từ String -> Date
//            int rankId = user.getRank().getRankId();
            int rankId = user.getRank().getRankId();

            // 🔹 Gọi DAO để lấy danh sách giảm giá
            List<DiscountDetail> discounts = dao.getDiscountsByDateAndRank(selectedDate, rankId);
            
            // Chuyển danh sách thành JSON
            Gson gson = new Gson();
            String json = gson.toJson(discounts);
            response.getWriter().write(json);
        } catch (Exception e) {
            response.getWriter().write("[]"); // Trả về rỗng nếu lỗi
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
