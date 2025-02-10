package controller.homepage;

import bo.GetToken;
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
import model.Account;
import model.UserProfile;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    AccountDAO dao = new AccountDAO();
    UserProfileDAO udao = new UserProfileDAO();

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
                    session.setAttribute("password", password);
                    session.setAttribute("ms", "Login Successfully!");
                    response.sendRedirect("trangchu");
                } else {
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
