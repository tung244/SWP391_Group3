/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.auth;

import bo.EncryptPassword;
import dal.AccountDAO;
import dal.DoctorsDAO;
import dal.PassWordDAO;
import dal.StaffDAO;
import jakarta.mail.Transport;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Doctors;
import model.Staffs;

/**
 *
 * @author PC
 */
@WebServlet(name = "LoginAdmin", urlPatterns = {"/admin/loginAdmin"})
public class LoginAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("LoginAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO accdao = new AccountDAO();
        DoctorsDAO dao = new DoctorsDAO();
        StaffDAO sdao = new StaffDAO();
        String action = request.getParameter("action");
        String respsonse = "";
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (action.equals("checkEmail")) {
            String email = request.getParameter("email").trim();
            String status = "valid";

            if (email.isEmpty()) {
                status = "empty";
            } else {
                // Regular expression to validate general email format
                String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
                if (!email.matches(emailRegex)) {
                    status = "invalid_format";
                } else {
                    status = "valid";
                }
            }

            respsonse = "{\"status\":\"" + status + "\"}";
        }

        if (action.equals("checkPass")) {
            String username = request.getParameter("pass").trim();
            String status = "valid";
            if (username.isEmpty()) {
                status = "empty";
            } else {
                status = "valid";
            }

            respsonse = "{\"status\":\"" + status + "\"}";
        }

        response.getWriter().write(respsonse);
        PassWordDAO pdao = new PassWordDAO();
        
        if (action.equals("login")) {
            String email = request.getParameter("email").trim();
            String pass = request.getParameter("pass");
            String encryptPass = EncryptPassword.hashPassword(pass);
            boolean success = accdao.LoginByEmail(email, encryptPass);
            if (success) {
                int role_id = accdao.getRoleID(email);
                Staffs s = null;
                Account a = accdao.getAccountAdmin(email);
                
                request.getSession().setAttribute("account", a);
                request.getSession().setMaxInactiveInterval(3600);
                switch (role_id) {
                    case 1:
                         s = sdao.getStaffById(a.getAccount_id());
                         request.getSession().setAttribute("profile", s);
                        response.sendRedirect("dashboard");
                        break;
                    case 2:
                         s = sdao.getStaffById(a.getAccount_id());
                         request.getSession().setAttribute("profile", s);
                        response.sendRedirect("dashboard");
                        break;
                    case 3:
                        if (dao.getFirstConfirm(email)) {
                            request.getSession().setAttribute("email", email);
                            response.sendRedirect("changePass");
                        } else {
                            int accId = accdao.getAccountIdByEmail(email);
                            Doctors dos = dao.getDoctorsByAccId(a.getAccount_id());
                            request.getSession().setAttribute("profile", dos);
                            response.sendRedirect("dashboard");
                        }
                        
                        break;
                    case 4:
                        s = sdao.getStaffById(a.getAccount_id());
                        request.getSession().setAttribute("profile", s);
                        response.sendRedirect("dashboard");
                        break;
                    case 5:
                        
                        response.sendRedirect("loginAdmin");
                        break;
                    default:
                        throw new AssertionError();
                }
                
                
            } else {
                request.getSession().setAttribute("error", "Password is incorect. Please try again!");
                response.sendRedirect("loginAdmin");
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
