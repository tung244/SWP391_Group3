/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import com.resend.*;
import com.resend.core.exception.ResendException;
import com.resend.services.emails.model.CreateEmailOptions;
import com.resend.services.emails.model.CreateEmailResponse;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Map;
import java.util.Properties;
import consts.Mail;

public class SendMail {
//     public static void SendMail(String username, String otp, String emailTo) {
//    Resend resend = new Resend("");  
//    String emailContent = "<html><body>"
//            + "<div style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>"
//            + "<div style='background-color: #fff; padding: 20px; border-radius: 10px; width: 100%; max-width: 600px; margin: 0 auto; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);'>"
//            + "<div style='text-align: center; margin-bottom: 20px;'>"
//            + "<img src='https://drive.google.com/file/d/1gA8dwrA9xB2QxGo5y3c2_kHtNlBVcZu7/view?usp=sharing' alt='Avatar' style='width: 80px; border-radius: 50%;'>"
//            + "<h2>Chào " + username + "!</h2>"
//            + "</div>"
//            + "<div style='font-size: 16px; margin-bottom: 20px;'>"
//            + "<p>Đây là mã OTP của bạn: <strong style='font-size: 20px; color: #3498db;'>" + otp + "</strong></p>"
//            + "<p>Vui lòng nhập mã này để xác nhận yêu cầu của bạn.</p>"
//            + "</div>"
//            + "</div>"
//            + "</div>"
//            + "</body></html>";
//    
//    CreateEmailOptions params = CreateEmailOptions.builder()
//            .from("Acme <smtp.resend.com>")
//            .to(emailTo)
//            .subject("Xác thực OTP")
//            .html(emailContent)
//            .build();
//
//    try {
//        CreateEmailResponse data = resend.emails().send(params);
//        System.out.println("Email đã được gửi với ID: " + data.getId());
//    } catch (ResendException e) {
//        e.printStackTrace();
//    }
//}

//    public static void main(String[] args) {
//        SendMail("Lương", "098472", "nguyenluongk2k4@gmail.com");
//    }
 

    public static void guiMail(String email, String noidung, String nameUser) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", Mail.HOST_NAME);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", Mail.TSL_PORT);

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                System.out.println("Xác minh gg thành công" + System.currentTimeMillis());
                return new PasswordAuthentication(Mail.APP_EMAIL, Mail.APP_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            System.out.println("Time:" + System.currentTimeMillis());
            message.setSubject("Xác nhận đơn hàng");
            String emailContent = "<html><head>"
                    + "<style>"
                    + "  @media only screen and (max-width: 600px) {"
                    + "    body, div {"
                    + "      width: 100% !important;"
                    + "      padding: 0 !important;"
                    + "    }"
                    + "    .email-container {"
                    + "      width: 100% !important;"
                    + "      padding: 10px !important;"
                    + "    }"
                    + "    .email-content {"
                    + "      width: 100% !important;"
                    + "      padding: 15px !important;"
                    + "      border-radius: 8px !important;"
                    + "    }"
                    + "    .email-header img {"
                    + "      width: 60px !important;"
                    + "      height: 60px !important;"
                    + "    }"
                    + "    h2 {"
                    + "      font-size: 18px !important;"
                    + "    }"
                    + "    p {"
                    + "      font-size: 14px !important;"
                    + "    }"
                    + "  }"
                    + "</style>"
                    + "</head><body>"
                    + "<div class='email-container' style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>"
                    + "<div class='email-content' style='background-color: #fff; padding: 20px; border-radius: 10px; width: 100%; max-width: 600px; margin: 0 auto; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);'>"
                    + "<div class='email-header' style='text-align: center; margin-bottom: 20px;'>"
                    + "<img src='https://media.istockphoto.com/id/1481681927/vi/vec-to/bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-con-m%E1%BA%AFt-bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-%E1%BA%A9n-bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-v%C3%B4-h%C3%ACnh-hi%E1%BB%83n-th%E1%BB%8B-look-and-vision-hide-unhide.jpg?s=612x612&w=0&k=20&c=r4NR_qn-2dfENl-MiOqPgeK7XT1XZTMR4IX8yAM87R4=' alt='Avatar' style='width: 80px; border-radius: 50%;'>"
                    + "<h2>Chào " + nameUser + "!</h2>"
                    + "</div>"
                    + "<div style='font-size: 16px; margin-bottom: 20px;'>"
                    + "<p>Đây là mã OTP của bạn: <strong style='font-size: 20px; color: #3498db;'>" + noidung + "</strong></p>"
                    + "<p>Vui lòng nhập mã này để xác nhận yêu cầu của bạn.</p>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</body></html>";

            System.out.println("Time:" + System.currentTimeMillis());
            message.setContent(emailContent, "text/html; charset=UTF-8");
            System.out.println("Time:" + System.currentTimeMillis());
            Transport.send(message);
            System.out.println("mail được gửi" + System.currentTimeMillis());
            

        } catch (MessagingException e) {
            e.printStackTrace();
        }
       
    }

    public static void guiMail2(String email, String noidung, String nameUser) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", Mail.HOST_NAME);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", Mail.TSL_PORT);

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                System.out.println("Xác minh gg thành công" + System.currentTimeMillis());
                return new PasswordAuthentication(Mail.APP_EMAIL, Mail.APP_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            System.out.println("Time:" + System.currentTimeMillis());
            message.setSubject("Xác nhận đơn hàng");
            String emailContent = "hehe"+ noidung;

            System.out.println("Time:" + System.currentTimeMillis());
            message.setContent(emailContent, "text/html; charset=UTF-8");
            System.out.println("Time:" + System.currentTimeMillis());
            Transport.send(message);
            System.out.println("mail được gửi" + System.currentTimeMillis());
            

        } catch (MessagingException e) {
            e.printStackTrace();
        }
       
    }
    public static void main(String[] args) {
        guiMail2("0936971273@mms.mobifone.net.vn", "029193", "Lương");
    }
    
}
