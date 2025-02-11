/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import dal.OTPServicesDAO;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import model.OTP_Services;

public class GetFormatDate {

    public static String getFormString() {
        Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        String formattedDate = formatter.format(currentDate);
        return formattedDate;
    }

    public static String plusFiveMinutes(String dateNow) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        LocalDateTime formatDate = LocalDateTime.parse(dateNow, formatter);
        LocalDateTime newDate = formatDate.plusMinutes(5);
        return newDate.format(formatter).toString();
    }

    public static boolean checkFiveMinute(String expertDate) {
        if (expertDate == null || expertDate.isEmpty()) {
            return false; // Nếu expertDate null hoặc rỗng thì coi như hết hạn.
        }

        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
            LocalDateTime now = LocalDateTime.now();
            LocalDateTime expireTime = LocalDateTime.parse(expertDate, formatter);
            return now.isBefore(expireTime); 
        } catch (DateTimeParseException e) {
            return false; 
        }
    }

    public static void main(String[] args) {
        GetFormatDate format = new GetFormatDate();
        OTPServicesDAO otp_dao = new OTPServicesDAO();
        OTP_Services otp = otp_dao.getOTPNewest("guest1");
        System.out.println(checkFiveMinute(otp.getOtp_expiry_date()));
    }
}
