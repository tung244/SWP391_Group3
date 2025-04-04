package controller.homepage;

import bo.EncryptPassword;
import bo.GetFormatDate;
import bo.SendMail;
import dal.AccountDAO;
import dal.TokenDAO;
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
import java.util.UUID;
import model.Account;
import model.Rank;
import model.Role;
import model.UserProfile;

@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

    AccountDAO accountdao = new AccountDAO();
    UserProfileDAO udao = new UserProfileDAO();
    GetFormatDate getdate = new GetFormatDate();
    TokenDAO t = new TokenDAO();
    
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
        request.getRequestDispatcher("homepage/register.jsp").forward(request, response);
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

        if (action.equals("checkEmail")) {
            String email = request.getParameter("email").trim();
            String status = "oke";
            if (accountdao.checkTonTai(email, "email") || email.isEmpty()) {
                status = "exist";
            }
            respsone = "{\"status\":\"" + status + "\"}";
        }
        if (action.equals("checkPhone")) {
            String phone_number = request.getParameter("phone_number").trim();
            String status = "oke";
            if (accountdao.checkTonTai(phone_number, "phone_number") || phone_number.isEmpty()) {
                status = "exist";
            }
            respsone = "{\"status\":\"" + status + "\"}";
        }

        response.getWriter().write(respsone);

        if (action.equals("register")) {
            String username = request.getParameter("register-username");
            String password = EncryptPassword.hashPassword(request.getParameter("register-password"));
            String repeatPassword = request.getParameter("repeat-password");
            String fullname = request.getParameter("register-name");
            String register_phone = request.getParameter("register-phone");
            String gender = request.getParameter("customGender");
            String email = request.getParameter("register-email");
            Rank r = new Rank(1, "");
            Account a = new Account(username, password, email, register_phone, getdate.getFormString(), new Role(5, ""));
            UserProfile u = new UserProfile(a, fullname, "", "", gender,r, "logo1");
            String ms = "";
            String error = "";
            HttpSession session = request.getSession();
            try {
                if (!udao.addAccount(u)) {
                    error = "Đăng kí thất bại! Vui lòng thử lại";
                    session.setAttribute("error", error);
                    response.sendRedirect("trangchu");
                } else {
                    ms = "Đăng kí thành công !!";
                    String token = generateToken(accountdao.getAccountID(username));
                    t.saveTokenVerify(token, GetFormatDate.getFormString(), accountdao.getAccountID(username));
                    sendMail(email, token, "Xác minh tài khoản", fullname);
                    
                    session.setAttribute("ms", ms);
                    Thread.sleep(3000);
                    response.sendRedirect("verify_account");
                }
  

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }

    private static void sendMail(String email, String linkToken, String tieude, String name) {
        Thread emailThread = new Thread(() -> {  // thread gửi mail khác luồng
            try {
                System.out.println("đến 3");
                SendMail.guiMailXacMinh(email, linkToken, tieude, name);

            } catch (Exception e) {
                e.printStackTrace();  // Log lỗi nếu có
            }
        });
        emailThread.start();
    }

    private static String generateToken(int account_id) {
        return account_id + "x" +UUID.randomUUID().toString().replace("-", "");
    }
    public static void main(String[] args) {
        System.out.println(generateToken(45));
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
