/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package bo;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import okhttp3.*;
@WebServlet(name="sms", urlPatterns={"/sms"})
public class sms extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sms</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sms at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OkHttpClient client = new OkHttpClient();

        String jsonBody = "{"
                + "\"ApiKey\": \"C305BF11D39FC15EC83259AF7E8506\","
                + "\"Content\": \"Hello, this is a test message\","
                + "\"Phone\": \"0936971273\","
                + "\"SecretKey\": \"DDEF344BA4C498C1441EAC2ABCFAFF\","
                + "\"Brandname\": \"Baotrixemay\","
                + "\"SmsType\": \"2\","
                + "\"IsUnicode\": true,"
                + "\"Sandbox\": true,"
                + "\"campaignid\": \"\","
                + "\"RequestId\": \"\","
                + "\"CallbackUrl\": \"\","
                + "\"SendDate\": \"\""
                + "}";

        RequestBody body = RequestBody.create(jsonBody, MediaType.get("application/json"));

        Request req = new Request.Builder()
                .url("https://rest.esms.vn/MainService.svc/json/SendMultipleMessage_V4_post_json/")
                .post(body)
                .addHeader("Content-Type", "application/json")
                .build();

        Response res = client.newCall(req).execute();
        response.getWriter().println("Response: " + res.body().string());
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
