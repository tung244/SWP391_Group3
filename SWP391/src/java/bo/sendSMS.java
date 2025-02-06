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

public class sendSMS {

    public static boolean guiSMS(String otp) throws IOException {
        OkHttpClient client = new OkHttpClient().newBuilder().build();

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("ApiKey", "C305BF11D39FC15EC83259AF7E8506");
        jsonObject.put("Content", otp+" la ma xac minh cua ban");
        jsonObject.put("Phone", "0936971273");
        jsonObject.put("SecretKey", "DDEF344BA4C498C1441EAC2ABCFAFF");
        jsonObject.put("Brandname", "Baotrixemay");
        jsonObject.put("SmsType", "2");
        jsonObject.put("IsUnicode", 1);
        jsonObject.put("Sandbox", 1);
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

        return codeResult == 100; 

    }

    public static void main(String[] args) throws IOException {
        System.out.println(guiSMS("128745"));
    }
}
