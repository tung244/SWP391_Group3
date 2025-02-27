/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.email;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import bo.SendMail;

@WebServlet(name = "SendMailAuto", urlPatterns = {"/admin/sendMailAuto"})
public class SendMailAuto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendMailAuto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMailAuto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("EmailAutomatic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name_company = request.getParameter("name-company");
        String group_patient = request.getParameter("group-patient");
        String subject_mail = request.getParameter("subject-mail");
        String content_mail = request.getParameter("content-mail");
        String[] group_email = group_patient.split("\\r?\\n");  // cắt chuỗi 

        List<String> email = new ArrayList<>();  // lưu lại list

        for (String string : group_email) {
            email.add(string);
        }
        sendMail(email, subject_mail, content_mail);
        String ms = "Gửi thành công vui lòng chờ cho mail được gửi!";
        request.getSession().setAttribute("ms", ms);
        response.sendRedirect("show_email");
    }
    private void sendMail(List<String> email, String subject, String noidung){
        Thread emailThread = new Thread(() -> {  // thread gửi mail khác luồng
            try {
                System.out.println("Bắt đầu gửi");
                if(SendMail.guiEmailTuDong(email, noidung, subject)){
                       
                }
            } catch (Exception e) {
                e.printStackTrace();  // Log lỗi nếu có
            }
        });
        emailThread.start();
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
