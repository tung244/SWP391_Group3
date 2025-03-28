/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author DELL
 */
public class Appointments {

    public int appointment_id;
    public Date appointment_date;
    public String appointment_status;
    public Doctors doctor;
    public Slots slot;
    public ServiceDetail service_detail;
    public UserProfile user;
    public DiscountDetail discount;
    public double actualCost;

    public Appointments() {
    }

    public Appointments(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public Appointments(int appointment_id, Date appointment_date, String appointment_status, Doctors doctor, Slots slot, ServiceDetail service_detail,
            UserProfile user, DiscountDetail discount, double actualCost) {
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.appointment_status = appointment_status;
        this.doctor = doctor;
        this.slot = slot;
        this.service_detail = service_detail;
        this.user = user;
        this.discount = discount;
        this.actualCost = actualCost;
    }

    public Appointments(int appointment_id, Date appointment_date, String appointment_status, Doctors doctor, Slots slot, ServiceDetail service_detail, UserProfile user) {
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.appointment_status = appointment_status;
        this.doctor = doctor;
        this.slot = slot;
        this.service_detail = service_detail;
        this.user = user;
    }

    public Appointments(Date appointment_date, String appointment_status, Doctors doctor, Slots slot, ServiceDetail service_detail, UserProfile user) {
        this.appointment_date = appointment_date;
        this.appointment_status = appointment_status;
        this.doctor = doctor;
        this.slot = slot;
        this.service_detail = service_detail;
        this.user = user;
    }

    public Appointments( Date appointment_date, String appointment_status, Doctors doctor, Slots slot, ServiceDetail service_detail,
            UserProfile user, DiscountDetail discount, double actualCost) {
        this.appointment_date = appointment_date;
        this.appointment_status = appointment_status;
        this.doctor = doctor;
        this.slot = slot;
        this.service_detail = service_detail;
        this.user = user;
        this.discount = discount;
        this.actualCost = actualCost;
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

    public DiscountDetail getDiscount() {
        return discount;
    }

    public void setDiscount(DiscountDetail discount) {
        this.discount = discount;
    }

    public double getActualCost() {
        return actualCost;
    }

    public void setActualCost(double actualCost) {
        this.actualCost = actualCost;
    }

    @Override
    public String toString() {
        return "Appointments{" + "appointment_id=" + appointment_id + ", appointment_date=" + appointment_date + ", appointment_status=" + appointment_status + ", doctor=" + doctor + ", slot=" + slot + ", service_detail=" + service_detail + ", user=" + user + ", discount=" + discount + ", actualCost=" + actualCost + '}';
    }

}
