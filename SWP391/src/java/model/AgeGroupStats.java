/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author -ASUS-
 */
public class AgeGroupStats {

    private String ageGroup;
    private int totalAppointments;

    public AgeGroupStats() {
    }

    public AgeGroupStats(String ageGroup, int totalAppointments) {
        this.ageGroup = ageGroup;
        this.totalAppointments = totalAppointments;
    }

    public String getAgeGroup() {
        return ageGroup;
    }

    public void setAgeGroup(String ageGroup) {
        this.ageGroup = ageGroup;
    }

    public int getTotalAppointments() {
        return totalAppointments;
    }

    public void setTotalAppointments(int totalAppointments) {
        this.totalAppointments = totalAppointments;
    }

    @Override
    public String toString() {
        return "AgeGroupStats{" + "ageGroup=" + ageGroup + ", totalAppointments=" + totalAppointments + '}';
    }

   
    
    
}
