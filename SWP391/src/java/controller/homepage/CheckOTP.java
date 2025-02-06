/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import bo.getFormatDate;
import bo.randomSixNumber;
import bo.sendMail;
import bo.sendSMS;
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

@WebServlet(name = "CheckOTP", urlPatterns = {"/otp_checking"})
public class CheckOTP extends HttpServlet {

    OTPServicesDAO otpdao = new OTPServicesDAO();
    UserProfileDAO udao = new UserProfileDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOTP</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOTP at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("homepage/checkOTP.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        randomSixNumber s = new randomSixNumber();
        HttpSession session = request.getSession();
        String otp = s.generateRandomSixDigits();
        OTP_Services otp_old = otpdao.getOTPNewest((String) session.getAttribute("username_forgot"));
        String method = request.getParameter("verificationMethod");
        String ms = "";
        String error = "";
        String[] infoUser = (String[]) session.getAttribute("infoUser");
        
        if (otp_old != null) {
            if (getFormatDate.checkFiveMinute(otp_old.getOtp_expiry_date())) {
                String otp_new = s.generateRandomSixDigits();
                if (!otp_new.equals(otp_old.getOtp())) {

                    if (method.equals("email")) {
                        Thread emailThread = new Thread(() -> {  // thread gửi mail khác luồng
                            try {
                                sendMail.guiMail(infoUser[1], s.generateRandomSixDigits(), "bạn");

                            } catch (Exception e) {
                                e.printStackTrace();  // Log lỗi nếu có
                            }
                        });
                        emailThread.start();
                    }
                    if (method.equals("phone")) {
                        Thread emailThread = new Thread(() -> {  // thread gửi sms khác luồng
                            try {
                                sendSMS.guiSMS(s.generateRandomSixDigits(), infoUser[0]);

                            } catch (Exception e) {
                                e.printStackTrace();  // Log lỗi nếu có
                            }
                        });
                        emailThread.start();
                    }

                }
                ms = "OTP gửi thành công ! Vui Lòng chờ trong giây lát";
            } else {
                error = "Vui lòng chờ trong giây lát!";
            }

        }
        session.setAttribute("ms", ms);
        session.setAttribute("error", error);
        response.sendRedirect("trangchu");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
