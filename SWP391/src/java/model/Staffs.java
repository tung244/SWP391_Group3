/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
/**
 *
 * @author DELL
 */
public class Staffs {
    private Account account;
    private String admin_fullname;
    private String admin_address;
    private Date admin_dob;
    private String admin_gender;
    private String image_profile_admin;
    private Timestamp  admin_hired_date;
    private BigDecimal  admin_salary;

    public Staffs() {
    }

    public Staffs(String admin_fullname) {
        this.admin_fullname = admin_fullname;
    }

<<<<<<< HEAD
    

    
=======
>>>>>>> test
    public Staffs(Account account, String admin_fullname, String admin_address, Date admin_dob, String admin_gender, String image_profile_admin, Timestamp admin_hired_date, BigDecimal admin_salary) {
        this.account = account;
        this.admin_fullname = admin_fullname;
        this.admin_address = admin_address;
        this.admin_dob = admin_dob;
        this.admin_gender = admin_gender;
        this.image_profile_admin = image_profile_admin;
        this.admin_hired_date = admin_hired_date;
        this.admin_salary = admin_salary;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getAdmin_fullname() {
        return admin_fullname;
    }

    public void setAdmin_fullname(String admin_fullname) {
        this.admin_fullname = admin_fullname;
    }

    public String getAdmin_address() {
        return admin_address;
    }

    public void setAdmin_address(String admin_address) {
        this.admin_address = admin_address;
    }

    public Date getAdmin_dob() {
        return admin_dob;
    }

    public void setAdmin_dob(Date admin_dob) {
        this.admin_dob = admin_dob;
    }

    public String getAdmin_gender() {
        return admin_gender;
    }

    public void setAdmin_gender(String admin_gender) {
        this.admin_gender = admin_gender;
    }

    public String getImage_profile_admin() {
        return image_profile_admin;
    }

    public void setImage_profile_admin(String image_profile_admin) {
        this.image_profile_admin = image_profile_admin;
    }

    public Timestamp getAdmin_hired_date() {
        return admin_hired_date;
    }

    public void setAdmin_hired_date(Timestamp admin_hired_date) {
        this.admin_hired_date = admin_hired_date;
    }

    public BigDecimal getAdmin_salary() {
        return admin_salary;
    }

    public void setAdmin_salary(BigDecimal admin_salary) {
        this.admin_salary = admin_salary;
    }

    @Override
    public String toString() {
        return "Staffs{" + "account=" + account + ", admin_fullname=" + admin_fullname + ", admin_address=" + admin_address + ", admin_dob=" + admin_dob + ", admin_gender=" + admin_gender + ", image_profile_admin=" + image_profile_admin + ", admin_hired_date=" + admin_hired_date + ", admin_salary=" + admin_salary + '}';
    }
    
    
}
