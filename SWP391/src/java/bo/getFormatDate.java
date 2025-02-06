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
import java.util.Date;
import model.OTP_Services;

public class getFormatDate {
    public static String getFormString(){
        Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        String formattedDate = formatter.format(currentDate);
        return formattedDate;
    }
    
    public static String plusFiveMinutes(String dateNow){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        LocalDateTime formatDate = LocalDateTime.parse(dateNow,formatter);
        LocalDateTime newDate = formatDate.plusMinutes(5);
        return newDate.format(formatter).toString();
    }
    
    public static boolean checkFiveMinute(String expertDate){
        String dateNow = getFormString();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        LocalDateTime datenow = LocalDateTime.parse(dateNow, formatter);
        LocalDateTime expertdate = LocalDateTime.parse(expertDate,formatter);
        return Duration.between(datenow, expertdate).abs().toMinutes() > 0;
    }
    public static void main(String[] args) {
        getFormatDate format = new getFormatDate();
        OTPServicesDAO otp_dao = new OTPServicesDAO();
        OTP_Services otp = otp_dao.getOTPNewest("guest1");
        System.out.println(checkFiveMinute(otp.getOtp_expiry_date()));
    }
}
