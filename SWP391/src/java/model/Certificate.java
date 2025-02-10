/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**

);


 */
public class Certificate {
    private int certificate_id;
    private String certificate_name;
    private Certificate_Doctor cer_doct;

    public Certificate() {
    }

    public Certificate(int certificate_id, String certificate_name) {
        this.certificate_id = certificate_id;
        this.certificate_name = certificate_name;
    }

    public Certificate(int certificate_id, String certificate_name, Certificate_Doctor cer_doct) {
        this.certificate_id = certificate_id;
        this.certificate_name = certificate_name;
        this.cer_doct = cer_doct;
    }

    public Certificate_Doctor getCer_doct() {
        return cer_doct;
    }

    public void setCer_doct(Certificate_Doctor cer_doct) {
        this.cer_doct = cer_doct;
    }
    

    public int getCertificate_id() {
        return certificate_id;
    }

    public void setCertificate_id(int certificate_id) {
        this.certificate_id = certificate_id;
    }

    public String getCertificate_name() {
        return certificate_name;
    }

    public void setCertificate_name(String certificate_name) {
        this.certificate_name = certificate_name;
    }

    @Override
    public String toString() {
        return "Certificate{" + "certificate_id=" + certificate_id + ", certificate_name=" + certificate_name + ", cer_doct=" + cer_doct + '}';
    }

   
    
    
    
}
