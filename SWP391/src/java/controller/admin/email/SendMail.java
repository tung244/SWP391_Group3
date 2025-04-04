/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.email;

import bo.RefreshTokenGG;
import bo.SendMailAPI;
import com.google.gson.Gson;
import dal.TokenDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import model.Gmail;

@WebServlet(name = "SendMail", urlPatterns = {"/admin/sendmail"})
public class SendMail extends HttpServlet {

    TokenDAO token = new TokenDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ms = "", error = "";
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        
        PrintWriter out = response.getWriter();
        out.println(to);
        out.println(subject);
        out.println(content);
//        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//         request.setCharacterEncoding("UTF-8");
        String accessToken = (String) request.getSession().getAttribute("accessToken");
        String refreshToken = (String) request.getSession().getAttribute("refreshToken");

        // Nếu accessToken hết hạn, lấy thử refresh token
        if (accessToken == null) {
            if (refreshToken == null) {
                // Nếu refreshToken trong session null, lấy từ DB ra 
                refreshToken = token.loadNewestToken();
            }

            if (refreshToken != null) {
                accessToken = RefreshTokenGG.refreshAccessToken(refreshToken);
                if (accessToken != null) {
                    request.getSession().setAttribute("accessToken", accessToken);
                    request.getSession().setAttribute("refreshToken", refreshToken);
                } else {
                    // Nếu refreshToken trong db cũng hết hạn rồi thì chuyển cho login oauth lại
                    response.sendRedirect("callback");
                    return;
                }
            } else {
                // Nếu không có refreshToken nào, cho nó login lại
                response.sendRedirect("login_show_email");
                return;
            }
        }

        String ms = "", error = "";
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        
        PrintWriter out = response.getWriter();
        out.println(to);
        out.println(subject);
        out.println(content);
        
 
        if(SendMailAPI.sendEmail(accessToken, to, subject, content)){
            ms = "Gửi email thành công !";
        }
        else{
            error = "Gửi thất bại!";
        }
        request.getSession().setAttribute("ms", ms);
        request.getSession().setAttribute("error", error);
        response.sendRedirect("show_email");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
