/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import java.util.Random;


public class randomSixNumber {
    public String[] generateRandomSixDigits() {
        Random random = new Random();
        String[] s = new String[4];
        int randomNumber = 100000 + random.nextInt(900000);
        s[0] = String.valueOf(randomNumber);
        getFormatDate getDate = new getFormatDate();
        s[1] = getDate.getFormString();
       
        return s;
    }
}
