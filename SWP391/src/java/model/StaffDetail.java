/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author -ASUS-
 */
public class StaffDetail {
    private String image_profile_admin;
    private Timestamp  admin_hired_date;
    private BigDecimal  admin_salary;

    public StaffDetail() {
    }

    public StaffDetail(String image_profile_admin, Timestamp admin_hired_date, BigDecimal admin_salary) {
        this.image_profile_admin = image_profile_admin;
        this.admin_hired_date = admin_hired_date;
        this.admin_salary = admin_salary;
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
        return "StaffDetail{" + "image_profile_admin=" + image_profile_admin + ", admin_hired_date=" + admin_hired_date + ", admin_salary=" + admin_salary + '}';
    }
    
}
