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
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMultipart;
import jakarta.mail.internet.MimeUtility;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SendMail {

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
            MimeMultipart multipart = new MimeMultipart();
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(emailContent, "text/html; charset=UTF-8");
            multipart.addBodyPart(messageBodyPart);
            message.setContent(multipart);
            Transport.send(message);
            System.out.println("mail được gửi" + System.currentTimeMillis());

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
            System.out.println(noidung);
            String subject = "Yêu cầu hỗ trợ từ người dùng " + nameUser + " - " + email;

            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
            // Tạo một phần MultiPart
            MimeMultipart multipart = new MimeMultipart();
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(noidung, "text/html; charset=UTF-8");
            multipart.addBodyPart(messageBodyPart);
            message.setContent(multipart);
            Transport.send(message);
            System.out.println("mail được gửi" + System.currentTimeMillis());

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public static boolean guiEmailTuDong(List<String> email, String noidung, String tieude) throws UnsupportedEncodingException, InterruptedException {
        int size = 10;
        int total = email.size();
        int emailsent = 0;

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
            for (int i = 0; i < email.size(); i += size) {

                List<String> batch = email.subList(i, Math.min(i + size, email.size())); // phòng khi số lượng list k chia hết cho 10
                MimeMessage message = new MimeMessage(session);
                String subject = tieude;
                message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
                for (String string : batch) {

                    message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(string));
                }
                // Tạo một phần MultiPart
                MimeMultipart multipart = new MimeMultipart();
                MimeBodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setContent(noidung, "text/html; charset=UTF-8");
                multipart.addBodyPart(messageBodyPart);
                message.setContent(multipart);
                Transport.send(message);

                emailsent += batch.size();
                System.out.println("Gửi xong: " + emailsent + "/" + total);
                
                Thread.sleep(3000);  // chờ 3s 
                return true;
            }
        } catch (MessagingException e) {
            e.printStackTrace();
            
        }
        System.out.println("Gửi hoàn tất!");
        return false;
    }

    public static void main(String[] args) throws UnsupportedEncodingException, InterruptedException {
        List<String> email = Arrays.asList("nguyenluongk2k4@gmail.com", "luongndhe181876@fpt.edu.vn", "kn1802204@gmail.com");
        guiEmailTuDong(email, "lương vip pro", "test mail tự động");
    }

}
