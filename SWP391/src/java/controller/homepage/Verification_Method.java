/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import bo.GetFormatDate;
import bo.RandomSixNumber;
import bo.SendMail;
import bo.SendSMS;
import dal.AccountDAO;
import dal.OTPServicesDAO;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.OTP_Services;
import model.UserProfile;

@WebServlet(name = "Verification_Method", urlPatterns = {"/verification_method"})
public class Verification_Method extends HttpServlet {

    UserProfileDAO udao = new UserProfileDAO();
    OTPServicesDAO otpdao = new OTPServicesDAO();
    RandomSixNumber s = new RandomSixNumber();
    AccountDAO a = new AccountDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Verification_Method</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Verification_Method at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username_forgot");

        String[] infoUser = udao.loadBasicInfoUser(username);
        if (infoUser != null) {
            String[] encryptUser = new String[2];
            if (infoUser[1] != null) {
                encryptUser[1] = infoUser[1].substring(0, 5) + "**********" + infoUser[1].substring(infoUser[1].length() - 9, infoUser[1].length());
            }
            if (infoUser[0] != null) {
                encryptUser[0] = infoUser[0].substring(0, 3) + "**********" + infoUser[0].substring(infoUser[0].length() - 2, infoUser[0].length());
            }
            session.setAttribute("infoUser", infoUser);
            request.setAttribute("encryptUser", encryptUser);
        }

        request.getRequestDispatcher("homepage/verification_method.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String usernameForgot = (String) session.getAttribute("username_forgot");
        int account_id = a.getAccountID(usernameForgot);
        
        if (usernameForgot == null || usernameForgot.trim().isEmpty()) {
            response.sendRedirect("forgot_password");
            return;
        }

        OTP_Services otp_old = otpdao.getOTPNewest(usernameForgot);
        String method = request.getParameter("verificationMethod");
        String ms = "";
        String error = "";

        String[] infoUser = (String[]) session.getAttribute("infoUser");

        System.out.println("Bắt đầu xử lý OTP");

        // Nếu không có OTP cũ hoặc OTP cũ đã quá 5 phút -> tạo mới và gửi
        if (otp_old == null || !GetFormatDate.checkFiveMinute(otp_old.getOtp_expiry_date())) {
            String otp_new;
            do {
                otp_new = s.generateRandomSixDigits();
            } while (otp_old != null && otp_new.equals(otp_old.getOtp())); // Đảm bảo không trùng OTP cũ
            OTP_Services otp_NEW = new OTP_Services(account_id, otp_new, GetFormatDate.getFormString(),
                    GetFormatDate.plusFiveMinutes(GetFormatDate.getFormString()));
            if (otpdao.saveOTP(otp_NEW)) {
                sendOTP(method, infoUser,otp_new);
                ms = "OTP gửi thành công! Vui lòng chờ trong giây lát.";
                session.setAttribute("ms", ms);
                response.sendRedirect("otp_checking");
                return;
            } else {
                error = "Có lỗi xảy ra khi lưu OTP.";
            }
        } else {
            error = "OTP cũ vẫn còn hiệu lực, vui lòng kiểm tra tin nhắn.";
            
        }
        session.setAttribute("error", error);
        session.setAttribute("ms", ms);
        response.sendRedirect("verification_method");
    }

    public void sendOTP(String method, String[] infoUser, String otp) {
        if (method.equals("email")) {
            Thread emailThread = new Thread(() -> {  // thread gửi mail khác luồng
                try {
                    System.out.println("đến 3");
                    SendMail.guiMail(infoUser[1], otp, "bạn");

                } catch (Exception e) {
                    e.printStackTrace();  // Log lỗi nếu có
                }
            });
            emailThread.start();
        }
        if (method.equals("phone")) {
            Thread emailThread = new Thread(() -> {  // thread gửi sms khác luồng
                try {
                    SendSMS.guiSMS(otp, infoUser[0]);

                } catch (Exception e) {
                    e.printStackTrace();  // Log lỗi nếu có
                }
            });
            emailThread.start();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
