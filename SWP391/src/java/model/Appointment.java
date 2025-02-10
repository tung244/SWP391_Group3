/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author -ASUS-
 */
public class Appointment {

    public int appointment_id;
    public String appointment_date;
    public String appointment_status;
    public int doctor_id;
    public int service_detail_id;
    public int patient_id;
    public int service_type_id;
    public int service_id;
    public int specialization_id;
    public String time_begin;
    public String time_end;
    public String service_name;
    public String service_description;
    public String service_type_name;
    public String duration_service;
    public double cost;
    public String phonenumber_patient;

    public Appointment() {
    }

    public Appointment(int appointment_id, String appointment_date, String appointment_status, int doctor_id, int service_detail_id, int patient_id, int service_type_id, int service_id, int specialization_id, String time_begin, String time_end, String service_name, String service_description, String service_type_name, String duration_service, double cost, String phonenumber_patient) {
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.appointment_status = appointment_status;
        this.doctor_id = doctor_id;
        this.service_detail_id = service_detail_id;
        this.patient_id = patient_id;
        this.service_type_id = service_type_id;
        this.service_id = service_id;
        this.specialization_id = specialization_id;
        this.time_begin = time_begin;
        this.time_end = time_end;
        this.service_name = service_name;
        this.service_description = service_description;
        this.service_type_name = service_type_name;
        this.duration_service = duration_service;
        this.cost = cost;
        this.phonenumber_patient = phonenumber_patient;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public String getAppointment_date() {
        return appointment_date.substring(0, 10);
    }


    public void setAppointment_date(String appointment_date) {
        this.appointment_date = appointment_date;
    }

    public String getAppointment_status() {
        return appointment_status;
    }

    public void setAppointment_status(String appointment_status) {
        this.appointment_status = appointment_status;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public int getService_detail_id() {
        return service_detail_id;
    }

    public void setService_detail_id(int service_detail_id) {
        this.service_detail_id = service_detail_id;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public int getService_type_id() {
        return service_type_id;
    }

    public void setService_type_id(int service_type_id) {
        this.service_type_id = service_type_id;
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public int getSpecialization_id() {
        return specialization_id;
    }

    public void setSpecialization_id(int specialization_id) {
        this.specialization_id = specialization_id;
    }

    public String getTime_begin() {
        return time_begin;
    }

    public void setTime_begin(String time_begin) {
        this.time_begin = time_begin;
    }

    public String getTime_end() {
        return time_end;
    }

    public void setTime_end(String time_end) {
        this.time_end = time_end;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }

    public String getService_description() {
        return service_description;
    }

    public void setService_description(String service_description) {
        this.service_description = service_description;
    }

    public String getService_type_name() {
        return service_type_name;
    }

    public void setService_type_name(String service_type_name) {
        this.service_type_name = service_type_name;
    }

    public String getDuration_service() {
        return duration_service;
    }

    public void setDuration_service(String duration_service) {
        this.duration_service = duration_service;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getPhonenumber_patient() {
        return phonenumber_patient;
    }

    public void setPhonenumber_patient(String phonenumber_patient) {
        this.phonenumber_patient = phonenumber_patient;
    }

    @Override
    public String toString() {
        return "Appointment{" + "appointment_id=" + appointment_id + ", appointment_date=" + appointment_date + ", appointment_status=" + appointment_status + ", doctor_id=" + doctor_id + ", service_detail_id=" + service_detail_id + ", patient_id=" + patient_id + ", service_type_id=" + service_type_id + ", service_id=" + service_id + ", specialization_id=" + specialization_id + ", time_begin=" + time_begin + ", time_end=" + time_end + ", service_name=" + service_name + ", service_description=" + service_description + ", service_type_name=" + service_type_name + ", duration_service=" + duration_service + ", cost=" + cost + ", phonenumber_patient=" + phonenumber_patient + '}';
    }

}
