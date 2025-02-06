/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import bo.getFormatDate;
import bo.randomSixNumber;
import bo.sendMail;
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
        randomSixNumber s = new randomSixNumber();
        HttpSession session = request.getSession();
        String otp = s.generateRandomSixDigits();
        UserProfile u = (UserProfile) session.getAttribute("user");

        String method = request.getParameter("verificationMethod");
        String[] userInfo = udao.loadBasicInfoUser((String) session.getAttribute("username_forgot"));
        OTP_Services otp_old = otpdao.getOTPNewest((String) session.getAttribute("username_forgot")); //lấy otp gần nhất
        String ms = "";

        while (otp_old.getOtp().equals(otp)) {  //so sánh otp
            otp = s.generateRandomSixDigits();
        }
        try {
            int account_id = Integer.parseInt(userInfo[2]);
            OTP_Services otpservices = new OTP_Services(account_id,
                    otp,
                    getFormatDate.getFormString(),
                    getFormatDate.plusFiveMinutes(getFormatDate.getFormString()));
            otpdao.saveOTP(otpservices);
            if (method.equals("email")) {
                final String email = userInfo[1];
                final String otpcode = otp;
                ms = "Please wait some second for the email otp!";

                Thread emailThread = new Thread(() -> {  // thread gửi mail khác luồng
                    try {
                        sendMail.guiMail(email, otpcode, "Bạn");

                    } catch (Exception e) {
                        e.printStackTrace();  // Log lỗi nếu có
                    }
                });
                emailThread.start();
            }
            if (method.equals("phone")) {

            }

        } catch (Exception e) {
        }
        response.sendRedirect("otp_checking");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
