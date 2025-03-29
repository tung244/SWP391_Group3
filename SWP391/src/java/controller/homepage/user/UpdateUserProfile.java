/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.user;

import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author -ASUS-
 */
public class UpdateUserProfile extends HttpServlet {

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
            out.println("<title>Servlet UpdateUserProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUserProfile at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String fullname = request.getParameter("fullname").trim();
        String email = request.getParameter("email").trim();
        String phonenumber = request.getParameter("phonenumber").trim();
        String address = request.getParameter("address").trim();
        String gender = request.getParameter("gender").trim();
        String dob = request.getParameter("dob").trim();
        int account_id = (int) session.getAttribute("account_id");
        
        UserProfileDAO dao = new UserProfileDAO();
        if (dao.CheckEmail(email, account_id)) {
            session.setAttribute("error", "Email đã tồn tại.");
            response.sendRedirect("userprofile");
            return;
        }

        if (dao.CheckPhoneNumber(phonenumber, account_id)) {
            session.setAttribute("error", "Số điện thoại đã tồn tại.");
            response.sendRedirect("userprofile");
            return;
        }
        if (fullname.isEmpty() || !fullname.matches("\\p{L}+[\\s\\p{L}]*")) {
            session.setAttribute("error", "Họ và tên không hợp lệ! Vui lòng nhập tên hợp lệ (chỉ chứa chữ và khoảng trắng).");
            response.sendRedirect("userprofile");
            return;
        }

        if (!phonenumber.matches("\\d{10,11}")) {
            session.setAttribute("error", "Số điện thoại không hợp lệ! Vui lòng nhập số có 10-11 chữ số.");
            response.sendRedirect("userprofile");
            return;
        }
        if (!email.matches("^[\\w._%+-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            session.setAttribute("error", "Email không hợp lệ! Vui lòng nhập đúng định dạng (ví dụ: example@gmail.com).");
            response.sendRedirect("userprofile");
            return;
        }

        if (address.isEmpty() || !address.matches("^[\\p{L}\\p{N}\\s.,\\/-]+$")) {
            session.setAttribute("error", "Địa chỉ không hợp lệ! Vui lòng nhập địa chỉ hợp lệ (chỉ chứa chữ, số, khoảng trắng và các ký tự .,\\/-).");
            response.sendRedirect("userprofile");
            return;
        }

        dao.updateUserProfile(fullname, email, phonenumber, address, dob, gender, account_id);
        response.sendRedirect("userprofile");
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
