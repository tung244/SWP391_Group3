/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @autho

 */
public class Degree_Doctor {
    private int doctor_id;
    private int degree_id;
    private Degree degree;
    

    public Degree_Doctor() {
    }

    public Degree_Doctor(int doctor_id, int degree_id, Degree degree) {
        this.doctor_id = doctor_id;
        this.degree_id = degree_id;
        this.degree = degree;
    }

    public Degree getDegree() {
        return degree;
    }

    public void setDegree(Degree degree) {
        this.degree = degree;
    }

   
    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public int getDegree_id() {
        return degree_id;
    }

    public void setDegree_id(int degree_id) {
        this.degree_id = degree_id;
    }

    @Override
    public String toString() {
        return "Degree_Doctor{" + "doctor_id=" + doctor_id + ", degree_id=" + degree_id + '}';
    }
    
    
}
