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
import dal.TokenDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Gmail;

@WebServlet(name = "ShowEmail", urlPatterns = {"/admin/show_email"})
public class ShowEmail extends HttpServlet {

    TokenDAO token = new TokenDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        List<String> historyToken = (List) request.getSession().getAttribute("historyToken");
        if (historyToken == null || historyToken.isEmpty()) {
            historyToken = new ArrayList<>();
            historyToken.add("");
            request.getSession().setAttribute("historyToken", historyToken);
        }

        String currentToken = request.getParameter("next_page_token");
        if (currentToken == null) {
            currentToken = "";
        }

        String emailListJson = getAllIDEmail(accessToken, currentToken); // lấy string mà google trả

        Map<String, List<Gmail>> email = loadAllMessage(emailListJson, accessToken);  // load all tin nhắn dưới dạng tokenNextPage - List Các email chứa tiêu đề- dob

        
        String previousToken = getPreviousToken(historyToken, currentToken);  // lấy ra previousToken
        request.setAttribute("thePreviousToken", previousToken);

        String keyNextToken = email.keySet().iterator().next();

        historyToken.add(keyNextToken);

        request.setAttribute("theNextPageToken", keyNextToken);

        // Lấy thông tin chi tiết của từng email
        List<Gmail> emailDetails = email.get(keyNextToken);
        
        request.setAttribute("emailDetails", emailDetails);
        request.getSession().setAttribute("historyToken", historyToken);

        request.getRequestDispatcher("EmailBox.jsp").forward(request, response);
    }

    private String getPreviousToken(List<String> history, String currentToken) {
        if (currentToken == null || history == null || history.isEmpty()) {
            return "";
        }

        int index = history.indexOf(currentToken);
        if (index > 0) {
            return history.get(index - 1); // Lấy token trước đó
        }
        return "";
    }

    // áp từng id email 
    private Map<String, List<Gmail>> loadAllMessage(String list_id_email, String accessToken) throws IOException {
        Gson gson = new Gson();
        System.out.println(list_id_email);
        Map<?, ?> emailListMap = gson.fromJson(list_id_email, Map.class);
        List<Map<String, String>> messages = (List<Map<String, String>>) emailListMap.get("messages");
        
        List<Gmail> emailDetails = new ArrayList<>();

        if (messages != null && !messages.isEmpty()) {

            for (Map<String, String> message : messages) {
                String emailId = message.get("id");
                HttpRequestFactory requestFactory = new NetHttpTransport().createRequestFactory();

                String emailDetailsUrl = Gmails.GMAIL_API_URL + "/" + emailId;  // gán từng id 1 

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
                    if ("Subject".equals(header.get("name")) && header.get("value").contains("Yêu cầu hỗ trợ")) {
                        subject = header.get("value");
                    } else if ("Date".equals(header.get("name"))) {
                        receivedDate = header.get("value").replaceAll(" \\+\\d{4}.*", "");
                    }
                }

                Gmail g = new Gmail(emailId, subject, receivedDate);
                emailDetails.add(g);

            }
        }

        String nextPageToken = (String) emailListMap.get("nextPageToken");
        Map<String, List<Gmail>> result = new HashMap<>();
        result.put(nextPageToken, emailDetails);
        return result;
    }

    //load hết id email ra
    private String getAllIDEmail(String accessToken, String nextPageToken) throws UnsupportedEncodingException, IOException {
        HttpRequestFactory requestFactory = new NetHttpTransport().createRequestFactory();
        String query = "subject:(\"Yêu cầu hỗ trợ\") -from:" + Mail.APP_EMAIL;

        // Tạo URL cơ bản với query
        String url = Gmails.GMAIL_API_URL + "?q=" + URLEncoder.encode(query, "UTF-8") + "&maxResults=3";

        // Nếu nextPageToken không null hoặc không rỗng, thêm vào URL
        if (nextPageToken != null && !nextPageToken.isEmpty()) {
            url += "&pageToken=" + URLEncoder.encode(nextPageToken, "UTF-8");
        }

        // Tạo request với URL đã được thêm nextPageToken (nếu có)
        HttpRequest emailListRequest = requestFactory.buildGetRequest(new GenericUrl(url))
                .setHeaders(new HttpHeaders().setAuthorization("Bearer " + accessToken));

        HttpResponse emailListResponse = emailListRequest.execute();
        System.out.println("hehehe");
        return emailListResponse.parseAsString();
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
