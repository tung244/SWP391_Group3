/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.email;

import bo.RefreshTokenGG;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpHeaders;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.gson.Gson;
import consts.Gmails;
import consts.Mail;
import dal.CamPaignDAO;
import dal.TokenDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import model.CamPaign;
import model.GmailFetcher;
@WebServlet(name="ThongkeEmail", urlPatterns={"/admin/email_statistics"})
public class ThongkeEmail extends HttpServlet {
   
    TokenDAO token = new TokenDAO();
    CamPaignDAO cdao = new CamPaignDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ThongkeEmail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ThongkeEmail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
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
        GmailFetcher gmail = new GmailFetcher(accessToken);
        gmail.fetchAllPages("Yêu cầu hỗ trợ", null, 0,"from"); // Thống kê các yêu cầu hỗ trợ
        int totalSupport = gmail.getTotal();
        
        gmail.fetchAllPages("Notify EyeCare Appointment", null, 0,"to");
        int totalAppointment = gmail.getTotal();
        
        gmail.fetchAllPages("Xác minh tài khoản",null, 0, "to");
        int totalVerify = gmail.getTotal();
        
        gmail.fetchAllPages("Yêu cầu xác thực", null, 0, "to");
        int toalOTP = gmail.getTotal();
        int sumVierify = toalOTP +totalVerify;
        
        gmail.fetchAllPages("", null, 0, "to");
        int sumSend = gmail.getTotal();
        
        CamPaign c = cdao.LoadCapainNewestt();
        
        request.setAttribute("campaign", c);
        request.setAttribute("support", totalSupport);
        request.setAttribute("appointment", totalAppointment);
        request.setAttribute("verify", sumVierify);
        request.setAttribute("all", sumSend);
        
        request.getRequestDispatcher("EmailStatistics.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
