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
    public Date appointment_date;
    public String appointment_status;
    public Doctors doctor;
    public Staffs staff;
    public Slots slot;
    public ServiceTypes service_type;
    public Services service;
    public ServiceDetail service_detail;
    public UserProfile user;

    public Appointment() {
    }

    public Appointment(Staffs staff) {
        this.staff = staff;
    }

    public Appointment(int appointment_id, Date appointment_date,  Services service, ServiceDetail service_detail, ServiceTypes service_type) {
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.service_type = service_type;
        this.service = service;
        this.service_detail = service_detail;
    }

    public Appointment(int appointment_id, String appointment_status, Doctors doctor, Slots slot, Services service) {
        this.appointment_id = appointment_id;
        this.appointment_status = appointment_status;
        this.doctor = doctor;
        this.slot = slot;
        this.service = service;
    }

    public Appointment(int appointment_id, Date appointment_date, String appointment_status, Doctors doctor, Slots slot, ServiceTypes service_type, Services service, ServiceDetail service_detail, UserProfile user) {
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.appointment_status = appointment_status;
        this.doctor = doctor;
        this.slot = slot;
        this.service_type = service_type;
        this.service = service;
        this.service_detail = service_detail;
        this.user = user;
    }
    
    public Appointment(int appointment_id, String appointment_status, Staffs staff, Doctors doctor, Slots slot, Services service) {
        this.appointment_id = appointment_id;
        this.appointment_status = appointment_status;
        this.staff = staff;
        this.doctor = doctor;
        this.slot = slot;
        this.service = service;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public Date getAppointment_date() {
        return appointment_date;
    }

    public void setAppointment_date(Date appointment_date) {
        this.appointment_date = appointment_date;
    }

    public String getAppointment_status() {
        return appointment_status;
    }

    public Staffs getStaff() {
        return staff;
    }

    public void setStaff(Staffs staff) {
        this.staff = staff;
    }

    public void setAppointment_status(String appointment_status) {
        this.appointment_status = appointment_status;
    }

    public Doctors getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctors doctor) {
        this.doctor = doctor;
    }

    public Slots getSlot() {
        return slot;
    }

    public void setSlot(Slots slot) {
        this.slot = slot;
    }

    public ServiceTypes getService_type() {
        return service_type;
    }

    public void setService_type(ServiceTypes service_type) {
        this.service_type = service_type;
    }

    public Services getService() {
        return service;
    }

    public void setService(Services service) {
        this.service = service;
    }

    public ServiceDetail getService_detail() {
        return service_detail;
    }

    public void setService_detail(ServiceDetail service_detail) {
        this.service_detail = service_detail;
    }

    public UserProfile getUser() {
        return user;
    }

    public void setUser(UserProfile user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Appointment{" + "appointment_id=" + appointment_id + ", appointment_date=" + appointment_date + ", appointment_status=" + appointment_status + ", doctor=" + doctor + ", slot=" + slot + ", service_type=" + service_type + ", service=" + service + ", service_detail=" + service_detail + ", user=" + user + '}';
    }

    
    
}
