/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import bo.*;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpHeaders;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.gson.Gson;
import java.io.IOException;
import java.net.URLEncoder;
import consts.Gmails;
import consts.Mail;
import java.util.List;
import java.util.Map;

public class GmailFetcher {

    private String access_token;
    private int total;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public GmailFetcher(String accesstoken) {
        this.access_token = accesstoken;
        this.total = 0;
    }

    public void fetchAllPages(String query, String pageToken, int currentTotal, String method) throws IOException {
        String emailListJson = fetchGmailData(query, pageToken,method);
        System.out.println("Response JSON: " + emailListJson); // Debug
        Gson gson = new Gson();
        Map<String, Object> emailListMap = gson.fromJson(emailListJson, Map.class);

        List<Map<String, String>> messages = (List<Map<String, String>>) emailListMap.get("messages");
        int messageCount = messages != null ? messages.size() : 0;

        String nextPageToken = (String) emailListMap.get("nextPageToken");

        if (pageToken == null) { // Lần đầu, chưa có pageToken
            if (nextPageToken != null && !nextPageToken.isEmpty()) {
                // Nếu có nextPageToken, đặt total = 100 và tiếp tục
                total = 100;
                fetchAllPages(query, nextPageToken, 100,method);

            } else {
                // Nếu không có nextPageToken, đếm số id thực tế
                total = messageCount;
                System.out.println("Total end" + total);
            }
        } else { // Các trang tiếp theo
            if (nextPageToken != null && !nextPageToken.isEmpty()) {
                // Tiếp tục với total hiện tại + 100 (giả định mỗi trang 100 email)
                int current = total + 100;
                setTotal(current);
                System.out.println("Current" + current);
                fetchAllPages(query, nextPageToken, current,method);
            } else {
                // Khi hết nextPageToken, đếm số id thực tế của trang cuối và cộng với total trước đó
                int totalnew = total + messageCount;
                setTotal(totalnew);
                System.out.println("Total New" + totalnew);
            }
        }

    }

    private String fetchGmailData(String query, String pageToken, String method) throws IOException {
        String q = "";
        
        if (method.equals("from") && query!=null) {
            q = "subject:" + query + " after:" + GetFormatDate.getFirstDateOfMonth();
        }
        if (method.equals("to")&& query!=null) {
            q = "subject:" + query + " after:" + GetFormatDate.getFirstDateOfMonth() + " -to:" + Mail.APP_EMAIL;
        }
        
        String url = Gmails.GMAIL_API_URL + "?q=" + URLEncoder.encode(q, "UTF-8") + "&maxResults=100";
        if (pageToken != null && !pageToken.isEmpty()) {
            url += "&pageToken=" + URLEncoder.encode(pageToken, "UTF-8");
        }

        HttpRequestFactory requestFactory = new NetHttpTransport().createRequestFactory();
        HttpRequest emailListRequest = requestFactory.buildGetRequest(new GenericUrl(url))
                .setHeaders(new HttpHeaders().setAuthorization("Bearer " + access_token));
        HttpResponse emailListResponse = emailListRequest.execute();
        return emailListResponse.parseAsString();
    }
}
