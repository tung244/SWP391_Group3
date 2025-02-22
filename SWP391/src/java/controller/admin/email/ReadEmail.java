/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.email;

import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpHeaders;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpResponse;
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
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import model.Gmail;

@WebServlet(name = "ReadEmail", urlPatterns = {"/admin/read_email"})
public class ReadEmail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReadEmail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReadEmail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_email = request.getParameter("id");
        String accessToken = (String) request.getSession().getAttribute("accessToken");

        if (accessToken == null) {
            response.sendRedirect("login_show_email");
            return;
        }

        HttpRequestFactory requestFactory = new NetHttpTransport().createRequestFactory();

        Gson gson = new Gson();

        // Lấy thông tin chi tiết của từng email
        String emailDetailsUrl = Gmails.GMAIL_API_URL + "/" + id_email;  // gán từng id 1 

        HttpRequest emailDetailRequest = requestFactory.buildGetRequest(new GenericUrl(emailDetailsUrl))
                .setHeaders(new HttpHeaders().setAuthorization("Bearer " + accessToken));
        HttpResponse emailDetailResponse = emailDetailRequest.execute();
        String emailDetailJson = emailDetailResponse.parseAsString();

        // Chuyển JSON thành Map để lấy tiêu đề và nội dung
        Map<?, ?> emailDetailMap = gson.fromJson(emailDetailJson, Map.class);
        List<Map<String, String>> headers = (List<Map<String, String>>) ((Map<?, ?>) emailDetailMap.get("payload")).get("headers");

        String subject = "No Subject";
        String receivedDate = "Unknown date";
        for (Map<String, String> header : headers) {
            if ("Subject".equals(header.get("name"))) {
                subject = header.get("value");

            } else if ("Date".equals(header.get("name"))) {
                receivedDate = header.get("value").replaceAll(" \\+\\d{4}.*", "");
            }

        }
        Map<?, ?> body = (Map<?, ?>) ((Map<?, ?>) emailDetailMap.get("payload")).get("body");
        String content = "No Content";

        if (body != null && body.get("data") != null) {
            try {
                byte[] decodedBytes = Base64.getUrlDecoder().decode((String) body.get("data"));
                content = new String(decodedBytes, StandardCharsets.UTF_8);
            } catch (IllegalArgumentException e) {
                content = "Error decoding content: " + e.getMessage();
            }
        }

        Gmail g = new Gmail(id_email, subject, receivedDate,content);

        request.setAttribute("gmail", g);
        request.getRequestDispatcher("EmailRead.jsp").forward(request, response);
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
