package controller.homepage;

import bo.getToken;
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
import model.Account;
import model.UserProfile;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    AccountDAO dao = new AccountDAO();
    UserProfileDAO  udao = new UserProfileDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("homepage/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            session.setAttribute("error", "Username or Password cannot be blank");
            response.sendRedirect("login");
        } else {
            if (dao.CheckLogin(username, password)) {
                UserProfile user = udao.GetAccount(username);

                if (user == null) {
                    request.setAttribute("error", "Error loading user");

                } else {
                    
                    session.setAttribute("account_id", user.account.account_id);
                    session.setAttribute("user", user);
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("ms", "Login Successfully!");
                    response.sendRedirect("trangchu");
                }
                
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
