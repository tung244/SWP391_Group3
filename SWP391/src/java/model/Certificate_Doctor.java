/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/*
 */
public class Certificate_Doctor {

    private int certificate_id;
    private int doctor_id;
    private String date_certificate;
    private String date_change;
    private String status;
    private String issued_by;
    private String certificate_image;
    private Certificate certificate;
    private Doctors doctor;

    public Certificate_Doctor() {
    }

    public Certificate_Doctor(int certificate_id, int doctor_id, String date_certificate, String date_change, String status, String issued_by, String certificate_image, Certificate certificate, Doctors doctor) {
        this.certificate_id = certificate_id;
        this.doctor_id = doctor_id;
        this.date_certificate = date_certificate;
        this.date_change = date_change;
        this.status = status;
        this.issued_by = issued_by;
        this.certificate_image = certificate_image;
        this.certificate = certificate;
        this.doctor = doctor;
    }

    
    public Certificate_Doctor(int certificate_id, int doctor_id, String date_certificate, String date_change, String status, String issued_by, String certificate_image) {
        this.certificate_id = certificate_id;
        this.doctor_id = doctor_id;
        this.date_certificate = date_certificate;
        this.date_change = date_change;
        this.status = status;
        this.issued_by = issued_by;
        this.certificate_image = certificate_image;
    }

    

    public Certificate_Doctor(int certificate_id, int doctor_id, String date_certificate, String issued_by, String certificate_image) {
        this.certificate_id = certificate_id;
        this.doctor_id = doctor_id;
        this.date_certificate = date_certificate;
        this.issued_by = issued_by;
        this.certificate_image = certificate_image;
    }

    public Certificate getCertificate() {
        return certificate;
    }

    public void setCertificate(Certificate certificate) {
        this.certificate = certificate;
    }

    public Doctors getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctors doctor) {
        this.doctor = doctor;
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

    
    public String getCertificate_image() {
        return certificate_image;
    }

    public void setCertificate_image(String certificate_image) {
        this.certificate_image = certificate_image;
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
        return "Certificate_Doctor{" + "certificate_id=" + certificate_id + ", doctor_id=" + doctor_id + ", date_certificate=" + date_certificate + ", date_change=" + date_change + ", status=" + status + ", issued_by=" + issued_by + ", certificate_image=" + certificate_image + ", certificate=" + certificate + ", doctor=" + doctor + '}';
    }

   
}
