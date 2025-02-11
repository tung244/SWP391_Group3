/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import java.io.IOException;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.json.JSONObject;

public class SendSMS {

    public static boolean guiSMS(String otp, String phone) throws IOException {
        OkHttpClient client = new OkHttpClient().newBuilder().build();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("ApiKey", "9CEACFF036A16A863E417F32239D58");
        jsonObject.put("Content", otp+" la ma xac minh dang ky Baotrixemay cua ban");
        jsonObject.put("Phone",phone);
        jsonObject.put("SecretKey", "C93FBDAD470640514931DF273D462B");
        jsonObject.put("Brandname", "Baotrixemay");
        jsonObject.put("SmsType", "2");
        jsonObject.put("IsUnicode", 1);
        jsonObject.put("Sandbox", 0);
        jsonObject.put("campaignid", "Chiến dịch 05/02/2025");
        jsonObject.put("RequestId", "");
        jsonObject.put("CallbackUrl", "");
        jsonObject.put("SendDate", "");

        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, jsonObject.toString());

        Request request = new Request.Builder()
                .url("https://rest.esms.vn/MainService.svc/json/SendMultipleMessage_V4_post_json/")
                .method("POST", body)
                .addHeader("Content-Type", "application/json")
                .build();

        Response response = client.newCall(request).execute();

        if (!response.isSuccessful()) {
            return false;
        }

        
        String jsonResponse = response.body().string();
        JSONObject responseJson = new JSONObject(jsonResponse);

        
        int codeResult = responseJson.getInt("CodeResult");
        System.out.println(otp);
        return codeResult == 100; 

    }

    public static void main(String[] args) throws IOException {
        System.out.println(guiSMS("128745","0357159967"));
    }
}
