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
        String verificationCode = request.getParameter("verificationCode");
        HttpSession session = request.getSession();
        OTP_Services otp = otpdao.getOTPNewest((String) session.getAttribute("username_forgot"));
        
        String ms = "";
        String error = "";

        if (otp != null && verificationCode != null) {
            if (GetFormatDate.checkFiveMinute(otp.getOtp_expiry_date())) {
                if (otp.getOtp().equals(verificationCode)) {
                    ms = "OTP chính xác";
                    session.setAttribute("ms", ms);
                    response.sendRedirect("create_new_password");
                    return; 
                } else {
                    error = "OTP không chính xác, vui lòng thử lại!";
                }
            } else {
                error = "OTP đã hết hạn, vui lòng lấy mã mới!";
            }
        } else {
            error = "Lỗi hệ thống, vui lòng thử lại!";
        }

        session.setAttribute("error", error);
        response.sendRedirect("otp_checking");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
