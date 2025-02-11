/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.time.LocalTime;

/**
 *
 * @author DELL
 */
public class Slots {
    private int slot_id;
    private LocalTime start_time;
    private LocalTime end_time;
    ServiceTypes serviceType;

    public Slots() {
    }

    public Slots(int slot_id) {
        this.slot_id = slot_id;
    }
    
    public Slots(int slot_id, LocalTime start_time, LocalTime end_time, ServiceTypes serviceType) {
        this.slot_id = slot_id;
        this.start_time = start_time;
        this.end_time = end_time;
        this.serviceType = serviceType;
    }
    
    public int getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }

    public LocalTime getStart_time() {
        return start_time;
    }

    public void setStart_time(LocalTime start_time) {
        this.start_time = start_time;
    }

    public LocalTime getEnd_time() {
        return end_time;
    }

    public void setEnd_time(LocalTime end_time) {
        this.end_time = end_time;
    }

    public ServiceTypes getServiceType() {
        return serviceType;
    }

    public void setServiceType(ServiceTypes serviceType) {
        this.serviceType = serviceType;
    }

    @Override
    public String toString() {
        return "Slots{" + "slot_id=" + slot_id + ", start_time=" + start_time + ", end_time=" + end_time + ", serviceType=" + serviceType + '}';
    }
    
    
}
