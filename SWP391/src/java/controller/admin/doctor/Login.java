/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import dal.AccountDAO;
import jakarta.mail.Transport;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
@WebServlet(name = "Login", urlPatterns = {"/admin/login"})
public class Login extends HttpServlet {

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

        if (action.equals("login")) {
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            boolean success = accdao.LoginByEmail(email, pass);
            if (success) {
               int role_id = accdao.getRoleID(email);
               if(role_id == 3){
                    response.sendRedirect("doctorProfile");
               }
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
