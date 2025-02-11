/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import bo.GetFormatDate;
import bo.RandomSixNumber;
import bo.SendMail;
import bo.SendSMS;
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
        OTP_Services otp_old = otpdao.getOTPNewest((String) session.getAttribute("username_forgot"));

        String method = request.getParameter("verificationMethod");
        String ms = "";
        String error = "";
        
        String[] infoUser = (String[]) session.getAttribute("infoUser");
        System.out.println("đến1");
        
        if (otp_old != null) {
            if (GetFormatDate.checkFiveMinute(otp_old.getOtp_expiry_date())) {
                String otp_new = s.generateRandomSixDigits();
                while (otp_new.equals(otp_old.getOtp())) {
                    otp_new = s.generateRandomSixDigits();
                }
                if (!otpdao.saveOTP(new OTP_Services(0, ms, otp_new, otp_new))) {
                    System.out.println("đến 2");
                    sendOTP(method, infoUser);
                }

            }
            ms = "OTP gửi thành công ! Vui Lòng chờ trong giây lát";
        } else {
            error = "Vui lòng chờ trong giây lát!";
        }

    }

    public void sendOTP(String method, String[] infoUser) {
        if (method.equals("email")) {
            Thread emailThread = new Thread(() -> {  // thread gửi mail khác luồng
                try {
                    System.out.println("đến 3");
                    SendMail.guiMail(infoUser[1], s.generateRandomSixDigits(), "bạn");

                } catch (Exception e) {
                    e.printStackTrace();  // Log lỗi nếu có
                }
            });
            emailThread.start();
        }
        if (method.equals("phone")) {
            Thread emailThread = new Thread(() -> {  // thread gửi sms khác luồng
                try {
                    SendSMS.guiSMS(s.generateRandomSixDigits(), infoUser[0]);

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
