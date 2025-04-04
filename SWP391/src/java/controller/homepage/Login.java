/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import bo.EncryptPassword;
import dal.AccountDAO;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.UserProfile;

/**
 *
 * @author APC
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
    AccountDAO dao = new AccountDAO();
    UserProfileDAO udao = new UserProfileDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("homepage/login.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        password = EncryptPassword.hashPassword(password);
        String checkSave = request.getParameter("saveUser");
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            session.setAttribute("error", "Username or Password cannot be blank");
            response.sendRedirect("login");
        } else {
            if (dao.CheckLogin(username, password)) {
                UserProfile user = udao.GetAccount(username);
                if (user == null) {
                    request.setAttribute("error", "Error loading user");

                }
                if ("save".equals(checkSave)) {
                    Cookie userCookie = new Cookie("username", username);
                    Cookie passCookie = new Cookie("password", password);
                    userCookie.setMaxAge(60 * 60 * 24 * 30);
                    passCookie.setMaxAge(60 * 60 * 24 * 30);
                    response.addCookie(userCookie);
                    response.addCookie(passCookie);
                    session.setAttribute("user", user);
                    session.setAttribute("username", username);
                    session.setAttribute("account_id", user.getAccount().getAccount_id());
                    session.setAttribute("password", password);
                    session.setAttribute("ms", "Login Successfully!");
                    response.sendRedirect("trangchu");
                } else {

//                    session.setAttribute("account_id", user.account.account_id);
                    session.setAttribute("account_id", user.getAccount().getAccount_id());
                    session.setAttribute("user", user);
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("ms", "Login Successfully!");
                    response.sendRedirect("trangchu");
                }
            } else {
                session.setAttribute("error", "Username or password is not correct");
                response.sendRedirect("login");
            }
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
