package bo;

import com.google.api.client.http.*;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.http.HttpHeaders;
import com.google.api.client.http.json.JsonHttpContent;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.Base64;
import consts.Gmails;
import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;



public class SendMailAPI {
    public static boolean sendEmail(String accessToken, String to, String subject, String bodyText) {
        try {
            // Khởi tạo email với MIME
            Properties props = new Properties();
            Session session = Session.getDefaultInstance(props, null);
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress("me")); 
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B")); 


            MimeBodyPart bodyPart = new MimeBodyPart();
            bodyPart.setContent(bodyText, "text/html; charset=UTF-8"); 

            MimeMultipart multipart = new MimeMultipart();
            multipart.addBodyPart(bodyPart);
            message.setContent(multipart);

            // Mã hóa email thành Base64
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            message.writeTo(buffer);
            byte[] bytes = buffer.toByteArray();
            String encodedEmail = Base64.encodeBase64URLSafeString(bytes);

            // Tạo request gửi đến Gmail API
            HttpRequestFactory requestFactory = new NetHttpTransport().createRequestFactory();
            GenericUrl url = new GenericUrl(Gmails.GMAIL_SEND_URL);

            HttpContent content = new JsonHttpContent(new JacksonFactory(), Map.of("raw", encodedEmail));
            HttpRequest request = requestFactory.buildPostRequest(url, content)
                    .setHeaders(new HttpHeaders().setAuthorization("Bearer " + accessToken));

            HttpResponse response = request.execute();


            return response.getStatusCode() == 200;
        } catch (MessagingException | IOException e) {
            System.out.println("Lỗi khi gửi email: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
