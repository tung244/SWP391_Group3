/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class Specialization {

    private int specialization_id;
    private String specialization_name;
    private String specialization_status;

    public Specialization() {
    }

    public Specialization(int specialization_id) {
        this.specialization_id = specialization_id;
    }

    public Specialization(int specialization_id, String specialization_name) {
        this.specialization_id = specialization_id;
        this.specialization_name = specialization_name;
    }

    
    public Specialization(int specialization_id, String specialization_name, String specialization_status) {
        this.specialization_id = specialization_id;
        this.specialization_name = specialization_name;
        this.specialization_status = specialization_status;
    }

    public int getSpecialization_id() {
        return specialization_id;
    }

    public void setSpecialization_id(int specialization_id) {
        this.specialization_id = specialization_id;
    }

    public String getSpecialization_name() {
        return specialization_name;
    }

    public void setSpecialization_name(String specialization_name) {
        this.specialization_name = specialization_name;
    }

    public String getSpecialization_status() {
        return specialization_status;
    }

    public void setSpecialization_status(String specialization_status) {
        this.specialization_status = specialization_status;
    }

    @Override
    public String toString() {
        return "Specialization{" + "specialization_id=" + specialization_id + ", specialization_name=" + specialization_name + ", specialization_status=" + specialization_status + '}';
    }
    
    
}
