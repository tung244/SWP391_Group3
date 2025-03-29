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
import dal.CamPaignDAO;
import jakarta.activation.DataHandler;
import jakarta.activation.FileDataSource;
import jakarta.mail.Authenticator;
import jakarta.mail.Multipart;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMultipart;
import jakarta.mail.internet.MimeUtility;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import model.Appointments;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import model.Gmail;

public class SendMail {

    private static final long MAX_ATTACHMENT_SIZE = 25 * 1024 * 1024;
    private CamPaignDAO cdao = new CamPaignDAO();

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

            Transport.send(message);
            System.out.println("Mail đã được gửi thành công!");

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }

    }

    public static boolean guiMailXacMinh(String email, String token, String tieude, String nameUser) throws UnsupportedEncodingException {
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

            message.setSubject(tieude);

            // Tạo link xác nhận với token
            String confirmationLink = "http://localhost:8080/SWP391/xacminh?token=" + token;
            String emailContent = "Xin chào,<br>" + nameUser + " 😉<br>"
                    + "Cảm ơn bạn đã tin tưởng Eyecare. Đây là link xác minh tài khoản của bạn.<br>"
                    + "Vui lòng nhấp vào liên kết dưới đây để xác nhận tài khoản của bạn:<br>"
                    + "<a href='" + confirmationLink + "'>Xác nhận tài khoản</a><br><br>"
                    + "Nếu bạn không yêu cầu điều này, vui lòng bỏ qua email này.";

            // Đặt tiêu đề với UTF-8
            message.setSubject(MimeUtility.encodeText(tieude, "UTF-8", "B"));

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

    public static boolean MailConfirmAppointment(Appointments appointment) throws UnsupportedEncodingException {
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
        String paymentLink = "http://localhost:9999/SWP391/payment?id=" + appointment.getAppointment_id() + "&cost=5000";
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedCost = currencyFormat.format(appointment.getActualCost());
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(appointment.getUser().getAccount().getEmail()));

            String subject = "Notify EyeCare Appointment";
            String emailContent = "<html>\n"
                    + "<head>\n"
                    + "    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>\n"
                    + "    <style>\n"
                    + "        body { font-family: Arial, sans-serif; }\n"
                    + "        .email-container { width: 100%; padding: 20px; background-color: #f4f4f4; text-align: center; }\n"
                    + "        .email-content { background-color: #fff; padding: 20px; border-radius: 10px; width: 100%; max-width: 600px; margin: 0 auto; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }\n"
                    + "        h2 { color: #333; }\n"
                    + "        .details { font-size: 18px; color: #555; }\n"
                    + "        .reminder { font-weight: bold; color: #e74c3c; }\n"
                    + "    </style>\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "    <div class='email-container'>\n"
                    + "        <div class='email-content'>\n"
                    + "            <h2>Xác Nhận Đặt Lịch Thành Công Cho" + appointment.getUser().getFullname() + "!</h2>\n"
                    + "            <p class='details'>Bạn đã đăng ký dịch vụ: <strong>[" + appointment.getService_detail().getServices().getService_name() + "]</strong></p>\n"
                    + "            <p class='details'>Ngày: <strong>[" + appointment.getAppointment_date() + "]</strong></p>\n"
                    + "            <p class='details'>Giờ: <strong>[" + appointment.getSlot().getStart_time() + " - " + appointment.getSlot().getEnd_time() + "]</strong></p>\n"
                    + "            <p class='details'>Bác sĩ: <strong>[" + appointment.getDoctor().getDoctor_name() + "]</strong></p>\n"
                    + "            <p class='details'>Giá: <strong>[" + formattedCost + "]</strong></p>\n"
                    + "            <a href='" + paymentLink + "' class='pay-button'>💳 Thanh toán tại đây</a>\n"
                    + "            <p class='reminder'>Vui lòng đến đúng lịch hẹn để được phục vụ tốt nhất!</p>\n"
                    + "        </div>\n"
                    + "    </div>\n"
                    + "</body>\n"
                    + "</html>";

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

            Transport.send(message);
            System.out.println("Mail đã được gửi thành công!");

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean MailConfirmPaymentAppointment(Appointments appointment) throws UnsupportedEncodingException {
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
        String billLink = "http://localhost:9999/SWP391/Invoice?appointment=" + appointment.getAppointment_id();
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedCost = currencyFormat.format(appointment.getActualCost());
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(appointment.getUser().getAccount().getEmail()));
            LocalDateTime now = LocalDateTime.now();
            String formattedDateTime = now.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));
            String subject = "Notify EyeCare Appointment";
            String emailContent = "<html>\n"
                    + "<head>\n"
                    + "    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>\n"
                    + "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css\">"
                    + "    <style>\n"
                    + "        body { font-family: Arial, sans-serif; }\n"
                    + "        .email-container { width: 100%; padding: 20px; background-color: #f4f4f4; text-align: center; }\n"
                    + "        .email-content { background-color: #fff; padding: 20px; border-radius: 10px; width: 100%; max-width: 600px; margin: 0 auto; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }\n"
                    + "        h2 { color: #333; }\n"
                    + "        .details { font-size: 18px; color: #555; }\n"
                    + "        .reminder { font-weight: bold; color: #e74c3c; }\n"
                    + "    </style>\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "    <div class='email-container'>\n"
                    + "        <div class='email-content'>\n"
                    + "            <h2>Xác nhận thanh toán thành công cho cuộc hẹn của " + appointment.getUser().getFullname() + "!</h2>\n"
                    + "            <p class='details'>Bạn đã thanh toán thành công cho cuộc hẹn: <strong>[" + appointment.getAppointment_id() + "]</strong></p>\n"
                    + "            <p class='details'>Ngày: <strong>[" + formattedDateTime + "]</strong></p>\n"
                    + "            <p class='details'>Giá: <strong>[" + formattedCost + "]</strong></p>\n"
                    + "            <a href='" + billLink + "' class='pay-button'><i class='fas fa-file-invoice'></i> Xem bill tại đây</a>\n"
                    + "            <p class='reminder'>Vui lòng đến đúng lịch hẹn để được phục vụ tốt nhất. Nếu hủy lịch bạn sẽ mất một số tiền đấy nhé!</p>\n"
                    + "        </div>\n"
                    + "    </div>\n"
                    + "</body>\n"
                    + "</html>";

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

            Transport.send(message);
            System.out.println("Mail đã được gửi thành công!");

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean MailNotifyPaymentAppointment(Appointments appointment) throws UnsupportedEncodingException {
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
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedCost = currencyFormat.format(appointment.getService_detail().getCost());
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(appointment.getUser().getAccount().getEmail()));
            LocalDateTime now = LocalDateTime.now();
            String formattedDateTime = now.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));
            String subject = "Nhắc nhở thanh toán cho cuộc hẹn của EyeCare";
            String emailContent = "<html>\n"
                    + "<head>\n"
                    + "    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>\n"
                    + "    <style>\n"
                    + "        body { font-family: Arial, sans-serif; }\n"
                    + "        .email-container { width: 100%; padding: 20px; background-color: #f4f4f4; text-align: center; }\n"
                    + "        .email-content { background-color: #fff; padding: 20px; border-radius: 10px; width: 100%; max-width: 600px; margin: 0 auto; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }\n"
                    + "        h2 { color: #333; }\n"
                    + "        .details { font-size: 18px; color: #555; }\n"
                    + "        .reminder { font-weight: bold; color: #e74c3c; }\n"
                    + "    </style>\n"
                    + "</head>\n"
                    + "<body>\n"
                    + "    <div class='email-container'>\n"
                    + "        <div class='email-content'>\n"
                    + "            <h2>Làm ơn hãy nhanh chóng thanh toán hóa đơn cho cuộc hẹn " + appointment.getAppointment_id() + "!</h2>\n"
                    + "            <p class='details'>Ngày: <strong>[" + formattedDateTime + "]</strong></p>\n"
                    + "            <p class='details'>Giờ: <strong>[" + appointment.getSlot().getStart_time() + " - " + appointment.getSlot().getEnd_time() + "]</strong></p>\n"
                    + "            <p class='details'>Giá: <strong>[" + formattedCost + "]</strong></p>\n"
                    + "            <p class='reminder'>Vui lòng thanh toán đúng hạn trước khi cuộc hẹn bị hủy đấy nhé!</p>\n"
                    + "        </div>\n"
                    + "    </div>\n"
                    + "</body>\n"
                    + "</html>";

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

            Transport.send(message);
            System.out.println("Mail đã được gửi thành công!");

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean guiEmailTuDong(List<String> recipients, String content, String subject, List<File> savedFiles, int campaignId) throws UnsupportedEncodingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Mail.APP_EMAIL, Mail.APP_PASSWORD);
            }
        });

        try {
            for (String to : recipients) {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(Mail.APP_EMAIL));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
                message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));

                // Nội dung email
                MimeBodyPart textPart = new MimeBodyPart();
                textPart.setContent(content, "text/html; charset=UTF-8");

                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(textPart);

                for (File savedFile : savedFiles) {
                    MimeBodyPart filePart = new MimeBodyPart();
                    filePart.setFileName(savedFile.getName());
                    filePart.setDataHandler(new DataHandler(new FileDataSource(savedFile)));
                    multipart.addBodyPart(filePart);
                }

                message.setContent(multipart);
                Transport.send(message);

                // Gửi thành công, cập nhật số lượng email đã gửi
                int result = cdao.UpdateSendEmails(campaignId); // Hàm updateEmail trả về int

                // Nếu updateEmail trả về 0, tức là đã gửi hết -> cập nhật trạng thái campaign
                if (result == 0) {
                    cdao.UpdateStatus(campaignId);
                }
            }
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean guiMailTaiKham(String email, String token, String tieude, String nameUser, String followUpDate, String description) throws UnsupportedEncodingException {
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

            message.setSubject(tieude);

            // Tạo link xác nhận chuyển đến servlet xử lý
            String confirmationLink = "http://localhost:8080/SWP391/xacminh?token=" + token
                    + "&email=" + email
                    + "&date=" + followUpDate
                    + "&desc=" + URLEncoder.encode(description, "UTF-8");

            String emailContent = "Xin chào,<br>" + nameUser + " 😉<br>"
                    + "Bạn có một lịch tái khám vào ngày: <b>" + followUpDate + "</b><br>"
                    + "Mô tả: " + description + "<br>"
                    + "Vui lòng nhấp vào liên kết dưới đây để xác nhận lịch tái khám của bạn:<br>"
                    + "<a href='" + confirmationLink + "'>Xác nhận lịch tái khám</a><br><br>"
                    + "Nếu bạn không yêu cầu điều này, vui lòng bỏ qua email này.";

            MimeMultipart multipart = new MimeMultipart();
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(emailContent, "text/html; charset=UTF-8");
            multipart.addBodyPart(messageBodyPart);
            message.setContent(multipart);
            Transport.send(message);
            System.out.println("✅ Mail lịch tái khám đã gửi đến: " + email);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean guiMailDoctor(String email, String password, String nameUser) throws UnsupportedEncodingException {
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

            String subject = "Thông tin tài khoản bác sĩ";
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
                    + "<h2>Hi " + nameUser + "!</h2>"
                    + "<p>Your account password doctor is: <span class='otp'>" + password + "</span></p>"
                    + "<a href='http://localhost:9999/SWP391/admin/login'>Click here</a>"
                    + "<p>Please use this password to login to your account!</p>"
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

    public static boolean guiMailCancelled(String email, String noidung, String nameUser) throws UnsupportedEncodingException {
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

            String subject = "Thông báo hủy !";
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
                    + "<p>Tôi đã nhận được thông báo hủy cuộc hẹn <span class='otp'>" + noidung + "</span></p>"
                    + "<p>Cảm ơn bạn đã quan tâm!!</p>"
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

            Transport.send(message);
            System.out.println("Mail đã được gửi thành công!");

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }

    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        guiSupport("nguyenluongk2k4@gmail.com", "Hehe lương", "Lương");
    }
}
