/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * 
 */
public class Degree_Doctor {

    private int doctor_id;
    private int degree_id;
    private String degree_image;
    private String date_degree;
    private String date_change;
    private String status;
    private String issued_by;
    private Doctors doctor;   
    private Degree degree;

    public Degree_Doctor() {
    }

    public Degree_Doctor(int doctor_id, int degree_id, String degree_image, String date_degree, String date_change, String status, String issued_by, Degree degree) {
        this.doctor_id = doctor_id;
        this.degree_id = degree_id;
        this.degree_image = degree_image;
        this.date_degree = date_degree;
        this.date_change = date_change;
        this.status = status;
        this.issued_by = issued_by;
        this.degree = degree;
    }

    public Degree_Doctor(int doctor_id, int degree_id, String degree_image, String date_degree, String date_change, String status, String issued_by, Doctors doctor, Degree degree) {
        this.doctor_id = doctor_id;
        this.degree_id = degree_id;
        this.degree_image = degree_image;
        this.date_degree = date_degree;
        this.date_change = date_change;
        this.status = status;
        this.issued_by = issued_by;
        this.doctor = doctor;
        this.degree = degree;
    }
    
    

    
    public Degree_Doctor(int doctor_id, int degree_id, String degree_image, Degree degree) {
        this.doctor_id = doctor_id;
        this.degree_id = degree_id;
        this.degree_image = degree_image;
        this.degree = degree;
    }

    public String getDate_degree() {
        return date_degree;
    }

    public void setDate_degree(String date_degree) {
        this.date_degree = date_degree;
    }

    public String getDate_change() {
        return date_change;
    }

    public void setDate_change(String date_change) {
        this.date_change = date_change;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIssued_by() {
        return issued_by;
    }

    public void setIssued_by(String issued_by) {
        this.issued_by = issued_by;
    }


    public String getDegree_image() {
        return degree_image;
    }

    public void setDegree_image(String degree_image) {
        this.degree_image = degree_image;
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

    public Doctors getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctors doctor) {
        this.doctor = doctor;
    }

    @Override
    public String toString() {
        return "Degree_Doctor{" + "doctor_id=" + doctor_id + ", degree_id=" + degree_id + ", degree_image=" + degree_image + ", date_degree=" + date_degree + ", date_change=" + date_change + ", status=" + status + ", issued_by=" + issued_by + ", doctor=" + doctor + ", degree=" + degree + '}';
    }

   

    

}
