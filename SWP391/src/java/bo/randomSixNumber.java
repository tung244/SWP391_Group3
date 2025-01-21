/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import java.util.Random;

    
public class randomSixNumber {
    getFormatDate getDate = new getFormatDate();
    Random random = new Random();
    public String[] generateRandomSixDigits(int account_id) {
        
        String[] s = new String[4];
        int randomNumber = 100000 + random.nextInt(900000);
        s[0] = String.valueOf(randomNumber); // 6 số ngẫu nhiên  
        s[1] = getDate.getFormString(); // thời gian tạo otp
        s[3] = String.valueOf(account_id); // account lay otp
        return s;
    }
}
