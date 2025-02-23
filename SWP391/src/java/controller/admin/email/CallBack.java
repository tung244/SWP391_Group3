/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.email;

import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpContent;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.UrlEncodedContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.gson.Gson;
import consts.Gmails;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;


@WebServlet(name="CallBack", urlPatterns={"/admin/callback"})
public class CallBack extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CallBack</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CallBack at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null) {
            response.getWriter().println("Authorization failed.");
            return;
        }

        HttpRequestFactory requestFactory = new NetHttpTransport().createRequestFactory();
        GenericUrl url = new GenericUrl(Gmails.TOKEN_URL);
        HttpContent content = new UrlEncodedContent(Map.of(
                "code", code,
                "client_id", Gmails.CLIENT_ID,
                "client_secret", Gmails.CLIENT_SECRET,
                "redirect_uri",Gmails. REDIRECT_URI,
                "grant_type", "authorization_code"
        ));

        HttpRequest tokenRequest = requestFactory.buildPostRequest(url, content);
        HttpResponse tokenResponse = tokenRequest.execute();
        String jsonResponse = tokenResponse.parseAsString();
        Gson gson = new Gson();
        Map<?, ?> jsonMap = gson.fromJson(jsonResponse, Map.class);

        String accessToken = (String) jsonMap.get("access_token");

        // Lưu Access Token vào session
        request.getSession().setAttribute("accessToken", accessToken);

        response.sendRedirect("show_email"); // Chuyển đến trang hiển thị email
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
