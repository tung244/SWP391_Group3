/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nguyen Phu Thinh
 */
public class Customers {
    public int account_id;
    public String full_name,address,dob,gender,username,password,phonenumber,email,image_profile_user;

    public Customers() {
    }

    public Customers(int account_id, String full_name, String gender, String username, String image_profile_user) {
        this.account_id = account_id;
        this.full_name = full_name;
        this.gender = gender;
        this.username = username;
        this.image_profile_user = image_profile_user;
    }
    
    

    public Customers(int account_id, String full_name, String address, String dob, String gender, String username, String password, String phonenumber, String email, String image_profile_user) {
        this.account_id = account_id;
        this.full_name = full_name;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.image_profile_user = image_profile_user;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage_profile_user() {
        return image_profile_user;
    }

    public void setImage_profile_user(String image_profile_user) {
        this.image_profile_user = image_profile_user;
    }
    
    
    
}
