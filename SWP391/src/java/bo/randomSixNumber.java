/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import java.util.Random;



public class randomSixNumber {

    Random random = new Random();

    public String generateRandomSixDigits() {
        return String.valueOf(100000 + random.nextInt(900000));

    }

    

}
