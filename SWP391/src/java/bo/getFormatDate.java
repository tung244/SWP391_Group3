/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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
    public static void main(String[] args) {
        getFormatDate format = new getFormatDate();
        System.out.println(format.getFormString());
        System.out.println(format.plusFiveMinutes(format.getFormString()));
    }
}
