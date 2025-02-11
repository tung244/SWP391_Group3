/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import bo.GetToken;
import dal.AccountDAO;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.GoogleAccount;
import model.UserProfile;


@WebServlet(name = "login_google", urlPatterns = {"/logingoogle"})
public class Google extends HttpServlet {

    AccountDAO dao = new AccountDAO();
    UserProfileDAO udao = new UserProfileDAO();

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String code = request.getParameter("code");
            String accessToken = GetToken.getToken2(code);
            GoogleAccount gg = GetToken.getUserInfo(accessToken);
            HttpSession session = request.getSession();
            UserProfile user = udao.GetAccount(gg.getEmail());
            String ms = "";
            String error = "";

            if (!dao.CheckExistGGAccount(gg)) {
                session.setAttribute("error", "Can not Login. Please register to continue.");
            }
            if (!dao.isValidGoogleLogin(gg)) {
                session.setAttribute("error", "Login fail!");
            } else {
                session.setAttribute("user", user);
                session.setAttribute("username", user.getAccount().getUsername());
                session.setAttribute("account_id",user.getAccount().getAccount_id());
                session.setAttribute("ms", "Login Successfully!");
                response.sendRedirect("trangchu");

            }
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
