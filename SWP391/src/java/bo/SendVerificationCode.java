/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;


import com.twilio.Twilio;
import com.twilio.rest.verify.v2.service.Verification;

public class SendVerificationCode {

    // Thông tin tài khoản Twilio của bạn
    public static final String ACCOUNT_SID = "ACb8e8bcca17da8d8839c2ad8bf050203a";
    public static final String AUTH_TOKEN = "2d1dc44d5a4f1bc200e05e96489a371d";

    // Twilio Verify Service SID của bạn
    public static final String SERVICE_SID = "VA578731ecdba42c2c230710720b44973a";

    public static void main(String[] args) {
        // Khởi tạo Twilio SDK với Account SID và Auth Token
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Số điện thoại cần xác minh, sử dụng mã quốc gia +84 và không có số 0 ở đầu
        String phoneNumber = "+84936971273"; // Ví dụ: số điện thoại Việt Nam

        // Gửi mã xác minh qua SMS
        Verification verification = Verification.creator(SERVICE_SID, phoneNumber, "sms").create();

        // In ra số điện thoại nhận mã và trạng thái xác minh
        System.out.println("Verification sent to phone number: " + verification.getTo());
    }
}

