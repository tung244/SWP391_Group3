/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**

 */
public class Schedules {
    private int doctor_id;
    private String  schedule_status;
    private Slots slot ;

    public Schedules() {
    }

    public Schedules(int doctor_id, String schedule_status, Slots slot) {
        this.doctor_id = doctor_id;
        this.schedule_status = schedule_status;
        this.slot = slot;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getSchedule_status() {
        return schedule_status;
    }

    public void setSchedule_status(String schedule_status) {
        this.schedule_status = schedule_status;
    }

    public Slots getSlot() {
        return slot;
    }

    public void setSlot(Slots slot) {
        this.slot = slot;
    }

    @Override
    public String toString() {
        return "Schedules{" + "doctor_id=" + doctor_id + ", schedule_status=" + schedule_status + ", slot=" + slot + '}';
    }
    
    
}
