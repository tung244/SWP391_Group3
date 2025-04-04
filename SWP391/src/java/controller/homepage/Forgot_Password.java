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

@WebServlet(name = "Forgot_Password", urlPatterns = {"/forgot_password"})
public class Forgot_Password extends HttpServlet {

    AccountDAO adao = new AccountDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Forgot_Password</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Forgot_Password at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("homepage/forgot_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username_forgot = request.getParameter("forgotPasswordUsername").trim();
        String error = "";
        HttpSession session = request.getSession();
        if (username_forgot == null) {
            error = "Please input the username!!";
            session.setAttribute("error", error);
            response.sendRedirect("forgot_password");
        }
        if (!adao.checkTonTaiUser(username_forgot)) {
            error = "Username is not existed!!";
            session.setAttribute("error", error);
            response.sendRedirect("forgot_password");
        } else {
            session.setAttribute("username_forgot", username_forgot);
            session.setAttribute("error", error);
            response.sendRedirect("verification_method");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
