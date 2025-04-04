/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.user;

import bo.EncryptPassword;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author -ASUS-
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/changeNewpassword"})
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        request.getRequestDispatcher("homepage/ChangeNewPassword.jsp").forward(request, response);

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
        String username = (String) session.getAttribute("username");
        String usernameTest = request.getParameter("usernameTest")  ;
        String password = (String) session.getAttribute("password");
        String current_password = request.getParameter("current_password").replaceAll("^\\s+", "").trim(); // Loáº¡i bá»� khoáº£ng tráº¯ng á»Ÿ Ä‘áº§u
        current_password = EncryptPassword.hashPassword(current_password);
        String newpassword = request.getParameter("newpassword").replaceAll("^\\s+", "").trim(); // Loáº¡i bá»� khoáº£ng tráº¯ng á»Ÿ Ä‘áº§u
        String newpassword2 = request.getParameter("newpassword2").replaceAll("^\\s+", "").trim(); // Loáº¡i bá»� khoáº£ng tráº¯ng á»Ÿ Ä‘áº§u
        int accountId = (int) session.getAttribute("account_id");
        UserProfileDAO udao = new UserProfileDAO();
        
        if(usernameTest.equals("") || !usernameTest.equals(username)){
            session.setAttribute("error", "Tên đăng nhập không đúng.");
            response.sendRedirect("changeNewpassword");
            return;
        }

        if (current_password.equals("") || !current_password.equals(password)) {
            session.setAttribute("error", "Mật khẩu hiện tại không đúng");
            response.sendRedirect("changeNewpassword");
            return;
        }

        if (!newpassword.equals(newpassword2)) {
            session.setAttribute("error", "Mật khẩu mới không khớp.");
            response.sendRedirect("changeNewpassword");
            return;
        }
        if (!newpassword.matches("^[A-Z][a-zA-Z0-9!@#$%^&*()_+\\-=]{7,}$") || !newpassword.matches(".*[!@#$%^&*()_+\\-=].*")) {
            session.setAttribute("error", "Mật khẩu phải có ít nhất 8 ký tự, bắt đầu bằng chữ in hoa và chứa ít nhất một ký tự đặc biệt.");
            response.sendRedirect("changeNewpassword");
            return;
        }
        newpassword = EncryptPassword.hashPassword(newpassword);
        udao.updatePassword(newpassword, accountId);
        session.setAttribute("ms", "Đổi mật khẩu thành công. Xin vui lòng đăng nhập lại");
        response.sendRedirect("login");

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