/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class OTP_Services {
    private int otp_id, account_id;
    private String otp,created_otp_time,otp_expiry_date;

    public OTP_Services(int otp_id, int account_id, String otp, String created_otp_time, String otp_expiry_date) {
        this.otp_id = otp_id;
        this.account_id = account_id;
        this.otp = otp;
        this.created_otp_time = created_otp_time;
        this.otp_expiry_date = otp_expiry_date;
    }

    public OTP_Services(int account_id, String otp, String created_otp_time, String otp_expiry_date) {
        this.account_id = account_id;
        this.otp = otp;
        this.created_otp_time = created_otp_time;
        this.otp_expiry_date = otp_expiry_date;
    }

    public int getOtp_id() {
        return otp_id;
    }

    public void setOtp_id(int otp_id) {
        this.otp_id = otp_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public String getCreated_otp_time() {
        return created_otp_time;
    }

    public void setCreated_otp_time(String created_otp_time) {
        this.created_otp_time = created_otp_time;
    }

    public String getOtp_expiry_date() {
        return otp_expiry_date;
    }

    public void setOtp_expiry_date(String otp_expiry_date) {
        this.otp_expiry_date = otp_expiry_date;
    }
    
}
