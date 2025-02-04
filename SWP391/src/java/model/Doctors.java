/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Doctors {
    private int doctor_id;
    private String doctor_name;
    private int experience_years;
    private String profile_image;
    private double rating;
    private String gender;
    private String dob;
    private String address;
 
    public Doctors() {
    }

    public Doctors(int doctor_id, String doctor_name, int experience_years, String profile_image, double rating, String gender, String dob, String address) {
        this.doctor_id = doctor_id;
        this.doctor_name = doctor_name;
        this.experience_years = experience_years;
        this.profile_image = profile_image;
        this.rating = rating;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public int getExperience_years() {
        return experience_years;
    }

    public void setExperience_years(int experience_years) {
        this.experience_years = experience_years;
    }

    public String getProfile_image() {
        return profile_image;
    }

    public void setProfile_image(String profile_image) {
        this.profile_image = profile_image;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Doctors{" + "doctor_id=" + doctor_id + ", doctor_name=" + doctor_name + ", experience_years=" + experience_years + ", profile_image=" + profile_image + ", rating=" + rating + ", gender=" + gender + ", dob=" + dob + ", address=" + address + '}';
    }
    
    
    
    
   
    
}
