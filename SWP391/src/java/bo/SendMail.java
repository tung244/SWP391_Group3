/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
import jakarta.mail.internet.MimeUtility;
import java.io.UnsupportedEncodingException;

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
    public static boolean guiMail(String email, String noidung, String nameUser) throws UnsupportedEncodingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", Mail.HOST_NAME);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", Mail.TSL_PORT);

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Mail.APP_EMAIL, Mail.APP_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

            String subject = "Yêu cầu xác thực";
            String emailContent = "<html><head>"
                    + "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
                    + "<style>"
                    + "  body { font-family: Arial, sans-serif; }"
                    + "  .email-container { width: 100%; padding: 20px; background-color: #f4f4f4; text-align: center; }"
                    + "  .email-content { background-color: #fff; padding: 20px; border-radius: 10px; width: 100%; max-width: 600px; margin: 0 auto; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }"
                    + "  h2 { color: #333; }"
                    + "  .otp { font-size: 20px; color: #3498db; font-weight: bold; }"
                    + "</style>"
                    + "</head><body>"
                    + "<div class='email-container'>"
                    + "<div class='email-content'>"
                    + "<h2>Chào " + nameUser + "!</h2>"
                    + "<p>Đây là mã OTP của bạn: <span class='otp'>" + noidung + "</span></p>"
                    + "<p>Vui lòng nhập mã này để xác nhận yêu cầu của bạn.</p>"
                    + "</div></div>"
                    + "</body></html>";

            // Đặt tiêu đề với UTF-8
            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));

            // Đặt nội dung email với UTF-8
            message.setHeader("Content-Type", "text/html; charset=UTF-8");
            message.setContent(emailContent, "text/html; charset=UTF-8");
            
            Transport.send(message);
            System.out.println("Mail đã được gửi thành công!");

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
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
            String emailContent = "hehe" + noidung;

            System.out.println("Time:" + System.currentTimeMillis());
            message.setContent(emailContent, "text/html; charset=UTF-8");
            System.out.println("Time:" + System.currentTimeMillis());
            Transport.send(message);
            System.out.println("mail được gửi" + System.currentTimeMillis());

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public static void guiSupport(String email, String noidung, String nameUser) throws UnsupportedEncodingException {
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
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("supporeyecare@gmail.com"));
            System.out.println("Time:" + System.currentTimeMillis());
            String subject = "Yêu cầu hỗ trợ từ người dùng " + nameUser + " - " + email;

            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
            message.setContent(noidung, "text/html; charset=UTF-8");

            Transport.send(message);
            System.out.println("mail được gửi" + System.currentTimeMillis());

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    

}
