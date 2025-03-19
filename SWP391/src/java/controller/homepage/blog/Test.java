/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.homepage.blog;

import java.util.Scanner;

/**
 *
 * @author fptshop
 */
public class Test {


  public static String CodelandUsernameValidation(String str) {
    // code goes here  
    boolean isTrue = true;
    String result = "";
    int count = 0;
    if(str.length()<4 || str.length() >25){
      isTrue = false;
      
    }
    else{
        char[] s = str.toCharArray();
        
        for(int i = 0; i<s.length; i++){
          if(!Character.isLetter(s[0])){
            isTrue = false;
            
          }
          if(Character.isLetter(s[i])){
            count ++;
          }
          if(Character.isDigit(s[i])){
            count ++;
          }
          if(s[i] == '_'){
            count ++;
          }
        
        }
      }
    if(count < 3 || isTrue == false){
      result = "false";
    }
    else{
      result = "true";
    }
    return result;
  }

  public static void main (String[] args) {  
    

    // keep this function call here     
    Scanner s = new Scanner(System.in);
    System.out.print(CodelandUsernameValidation(s.nextLine())); 
  }

}

