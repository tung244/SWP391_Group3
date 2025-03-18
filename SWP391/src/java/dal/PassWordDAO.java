/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 *
 * @author PC
 */
public class PassWordDAO {
     public String randomPassword() {
        String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCase = "abcdefghijklmnopqrstuvwxyz";
        String digits = "0123456789";
        String specialChars = "!@#$%^&*()-_+=<>?/{}[]";

        String allChars = upperCase + lowerCase + digits + specialChars;
        SecureRandom random = new SecureRandom();

        StringBuilder password = new StringBuilder();

        // Đảm bảo có ít nhất một ký tự viết hoa và một ký tự đặc biệt
        password.append(upperCase.charAt(random.nextInt(upperCase.length())));
        password.append(specialChars.charAt(random.nextInt(specialChars.length())));

        // Điền các ký tự còn lại (tổng cộng 8 ký tự)
        for (int i = 2; i < 8; i++) {
            password.append(allChars.charAt(random.nextInt(allChars.length())));
        }

        return password.toString();
    }
    
     public String hashPasswordMD5(String password) {
        try {
            // Tạo instance của MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            
            // Chuyển đổi mật khẩu thành mảng byte và băm nó
            byte[] hashedBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));

            // Chuyển đổi mảng byte thành chuỗi hex (định dạng 32 ký tự)
            BigInteger number = new BigInteger(1, hashedBytes);
            String hashedPassword = number.toString(16);

            // Đảm bảo độ dài của chuỗi băm là 32 ký tự (bổ sung số 0 ở đầu nếu thiếu)
            while (hashedPassword.length() < 32) {
                hashedPassword = "0" + hashedPassword;
            }

            return hashedPassword;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
     
      public static void main(String[] args) {
         PassWordDAO dao = new PassWordDAO();
//         System.out.println(dao.hashPasswordMD5(dao.randomPassword()));
    }
}
