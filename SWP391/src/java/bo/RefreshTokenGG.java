/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpContent;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.HttpResponseException;
import com.google.api.client.http.UrlEncodedContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.gson.Gson;
import consts.Gmails;
import java.io.IOException;
import java.util.Map;

public class RefreshTokenGG {

    public static String refreshAccessToken(String refreshToken) throws IOException {
        try {
            HttpRequestFactory requestFactory = new NetHttpTransport().createRequestFactory();
            GenericUrl url = new GenericUrl(Gmails.TOKEN_URL);

            HttpContent content = new UrlEncodedContent(Map.of(
                    "client_id", Gmails.CLIENT_ID,
                    "client_secret", Gmails.CLIENT_SECRET,
                    "refresh_token", refreshToken,
                    "grant_type", "refresh_token"
            ));

            HttpRequest refreshRequest = requestFactory.buildPostRequest(url, content);
            HttpResponse refreshResponse = refreshRequest.execute();
            String jsonResponse = refreshResponse.parseAsString();

            Gson gson = new Gson();
            Map<?, ?> jsonMap = gson.fromJson(jsonResponse, Map.class);

            return (String) jsonMap.get("access_token"); // trả access_token mới
        } catch (HttpResponseException e) {
            if (e.getStatusCode() == 400 || e.getStatusCode() == 401) {
                // refresh_token hết hạn
                return null;
            }
            throw e;
        }
    }

}
