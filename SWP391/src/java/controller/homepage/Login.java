package controller.homepage;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    AccountDAO dao = new AccountDAO();

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
   
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            session.setAttribute("error", "Username or Password cannot be blank");
            response.sendRedirect("login");
        } else {
            if (dao.CheckLogin(username, password)) {
                Account ac = dao.GetAccount(username);

                if (ac == null) {
                    request.setAttribute("error", "Error loading user");

                } else {
                    session.setAttribute("account", ac);
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
