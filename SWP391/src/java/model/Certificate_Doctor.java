/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**

 */
public class Certificate_Doctor {
    private int certificate_id;
    private int doctor_id;
    private String date_certificate;
    private String issued_by;

    public Certificate_Doctor() {
    }

    public Certificate_Doctor(int certificate_id, int doctor_id, String date_certificate, String issued_by) {
        this.certificate_id = certificate_id;
        this.doctor_id = doctor_id;
        this.date_certificate = date_certificate;
        this.issued_by = issued_by;
    }

    public int getCertificate_id() {
        return certificate_id;
    }

    public void setCertificate_id(int certificate_id) {
        this.certificate_id = certificate_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDate_certificate() {
        return date_certificate;
    }

    public void setDate_certificate(String date_certificate) {
        this.date_certificate = date_certificate;
    }

    public String getIssued_by() {
        return issued_by;
    }

    public void setIssued_by(String issued_by) {
        this.issued_by = issued_by;
    }

    @Override
    public String toString() {
        return "Certificate_Doctor{" + "certificate_id=" + certificate_id + ", doctor_id=" + doctor_id + ", date_certificate=" + date_certificate + ", issued_by=" + issued_by + '}';
    }
    
    
}
