/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import com.twilio.Twilio;
import com.twilio.converter.Promoter;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import java.io.IOException;

import java.net.URI;
import java.math.BigDecimal;

public class SMS {
    // Find your Account Sid and Token at twilio.com/console

    public static final String ACCOUNT_SID = "ACb8e8bcca17da8d8839c2ad8bf050203a";
    public static final String AUTH_TOKEN = "2d1dc44d5a4f1bc200e05e96489a371d";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                new com.twilio.type.PhoneNumber("+15076280442"),
                new com.twilio.type.PhoneNumber("+447479455407"),
                "Hello Lương")
                        .create();

        System.out.println(message.getSid());
    }
   
}
