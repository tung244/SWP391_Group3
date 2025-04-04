/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author DELL
 */
public class MedicalHistory {
    private Appointments appointmentId;
    private String diagnosis;
    private String symptoms;
    private String treatment;
    private String prescription;
    private double visionLeft;
    private double visionRight;
    private String additionalTests;
    private String note;
    private LocalDateTime createdAt;

    public MedicalHistory() {
    }

    public MedicalHistory(Appointments appointmentId, String diagnosis, String symptoms, String treatment, String prescription, double visionLeft, double visionRight, String additionalTests, String note, LocalDateTime createdAt) {
        this.appointmentId = appointmentId;
        this.diagnosis = diagnosis;
        this.symptoms = symptoms;
        this.treatment = treatment;
        this.prescription = prescription;
        this.visionLeft = visionLeft;
        this.visionRight = visionRight;
        this.additionalTests = additionalTests;
        this.note = note;
        this.createdAt = createdAt;
    }

    public Appointments getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(Appointments appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public double getVisionLeft() {
        return visionLeft;
    }

    public void setVisionLeft(double visionLeft) {
        this.visionLeft = visionLeft;
    }

    public double getVisionRight() {
        return visionRight;
    }

    public void setVisionRight(double visionRight) {
        this.visionRight = visionRight;
    }

    public String getAdditionalTests() {
        return additionalTests;
    }

    public void setAdditionalTests(String additionalTests) {
        this.additionalTests = additionalTests;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "MedicalHistory{" + "appointmentId=" + appointmentId + ", diagnosis=" + diagnosis + ", symptoms=" + symptoms + ", treatment=" + treatment + ", prescription=" + prescription + ", visionLeft=" + visionLeft + ", visionRight=" + visionRight + ", additionalTests=" + additionalTests + ", note=" + note + ", createdAt=" + createdAt + '}';
    }
    
    
}
