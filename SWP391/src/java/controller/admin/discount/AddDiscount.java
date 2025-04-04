/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.discount;

import dal.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Discount;

/**
 *
 * @author fptshop
 */
@WebServlet(name="AddDiscount", urlPatterns={"/admin/AddDiscount"})
public class AddDiscount extends HttpServlet {
   
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
            out.println("<title>Servlet AddDiscount</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDiscount at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("/admin/AddDiscount.jsp").forward(request, response);
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
        DiscountDAO dao = new DiscountDAO();
        try {
            // 1️⃣ Lấy thông tin từ request
            String discountName = request.getParameter("discountName");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            // 2️⃣ Chuyển đổi ngày từ String sang Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(request.getParameter("startDate"));
            Date endDate = sdf.parse(request.getParameter("endDate"));

            // 3️⃣ Lấy giá trị phần trăm giảm giá cho từng hạng
            int rank1 = Integer.parseInt(request.getParameter("rank1"));
            int rank2 = Integer.parseInt(request.getParameter("rank2"));
            int rank3 = Integer.parseInt(request.getParameter("rank3"));
            int rank4 = Integer.parseInt(request.getParameter("rank4"));
            int rank5 = Integer.parseInt(request.getParameter("rank5"));
            // 4️⃣ Tạo đối tượng Discount
            Discount discount = new Discount(discountName, new java.sql.Date(startDate.getTime()), new java.sql.Date(endDate.getTime()), status);
            dao.addDiscount(discount);
            Discount discount1 = dao.getNewDiscount();
            // 5️⃣ Thêm DiscountDetail
            dao.addDiscountDetail(discount1.getDiscountId(), 1, rank1); // Đồng
            dao.addDiscountDetail(discount1.getDiscountId(), 2, rank2); // Bạc
            dao.addDiscountDetail(discount1.getDiscountId(), 3, rank3); // Vàng
            dao.addDiscountDetail(discount1.getDiscountId(), 4, rank4); // Bạch Kim
            dao.addDiscountDetail(discount1.getDiscountId(), 5, rank5); // Kim Cương

            response.sendRedirect("DiscountList");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra! " + e.getMessage());
            request.getRequestDispatcher("addDiscount.jsp").forward(request, response);
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
