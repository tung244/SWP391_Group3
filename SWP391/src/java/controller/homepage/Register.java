package controller.homepage;

import bo.GetFormatDate;
import dal.AccountDAO;
import dal.UserProfileDAO;
import jakarta.mail.Session;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import model.Account;
import model.Role;
import model.UserProfile;

@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

    AccountDAO accountdao = new AccountDAO();
    UserProfileDAO udao = new UserProfileDAO();
    GetFormatDate getdate = new GetFormatDate();
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        String action = request.getParameter("action");
        String respsone = "";
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (action.equals("checkUser")) {
            String username = request.getParameter("user_name").trim();
            String status = "oke";
            if (accountdao.checkTonTaiUser(username) || username.isEmpty()) {
                status = "exist";
            }
            respsone = "{\"status\":\"" + status + "\"}";

        }
        if (action.equals("checkRepeat")) {
            String password = request.getParameter("password").trim();
            String repeat_password = request.getParameter("repeat_password").trim();
            String status = "wrong";
            if (password.equals(repeat_password)) {
                status = "oke";
            }
            respsone = "{\"status\":\"" + status + "\"}";
        }

        response.getWriter().write(respsone);

        if (action.equals("register")) {
            String username = request.getParameter("register-username");
            String password = request.getParameter("register-password");
            String repeatPassword = request.getParameter("repeat-password");
            String fullname = request.getParameter("register-name");
            String register_phone = request.getParameter("register-phone");
            String gender = request.getParameter("register-gender");
            String email = request.getParameter("register-email");
            Account a = new Account(username, password, email, register_phone,getdate.getFormString(), new Role(5, ""));
            UserProfile u = new UserProfile(a, fullname, "", "", gender, "logo1");
            String ms = "";
            String error = "";
            HttpSession session = request.getSession();
            try {
                if (!udao.addAccount(u)) {
                    error = "Đăng kí thất bại! Vui lòng thử lại";
                    
                }
                else{
                   ms = "Đăng kí thành công !!";
                    
                }
                session.setAttribute("ms", ms); 
                session.setAttribute("error", error);
                Thread.sleep(3000);
                response.sendRedirect("login");
                    
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
