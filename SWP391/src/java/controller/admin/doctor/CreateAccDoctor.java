/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import bo.GetFormatDate;
import dal.DoctorsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Role;

/**
 *
 * @author PC
 */
@WebServlet(name = "CreateAccDoctor", urlPatterns = {"/admin/createAccount"})
public class CreateAccDoctor extends HttpServlet {
    GetFormatDate getdate = new GetFormatDate();
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
            out.println("<title>Servlet CreateAccDoctor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateAccDoctor at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("createAccDoctor.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String pass_repeat = request.getParameter("pass_repeat");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Kiểm tra mật khẩu có khớp không
        if (!pass.trim().equals(pass_repeat.trim())) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("createAccDoctor.jsp").forward(request, response);
            return;
        }

        // Tạo tài khoản mới
        Account newAccount = new Account();
        newAccount.setUsername(username);
        newAccount.setPassword(pass);
        newAccount.setEmail(email);
        newAccount.setPhonenumber(phone);
        newAccount.setCreated_date(getdate.getFormString());
        newAccount.setRole(new Role(3, "")); 

        // Gọi DAO để thêm tài khoản
        DoctorsDAO accountDAO = new DoctorsDAO();
        boolean success = accountDAO.createAccDoctor(newAccount);

        if (success) {
            // Chuyển hướng sang bước 2 (tạo bác sĩ)
            HttpSession session = request.getSession();
            session.setAttribute("accountId", newAccount.getAccount_id());
            session.setAttribute("progress", 25);
            response.sendRedirect("createDoctor.jsp");
        } else {
            request.setAttribute("error", "Failed to create account!");
            request.getRequestDispatcher("createAccount.jsp").forward(request, response);
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
