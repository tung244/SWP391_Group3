/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Slots {
    private int slot_id;
    private String slot_begin;
    private String slot_end;

     public Slots() {
    }
    
    public Slots(int slot_id, String slot_begin, String slot_end) {
        this.slot_id = slot_id;
        this.slot_begin = slot_begin;
        this.slot_end = slot_end;
    }

    public int getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }

    public String getSlot_begin() {
        return slot_begin;
    }

    public void setSlot_begin(String slot_begin) {
        this.slot_begin = slot_begin;
    }

    public String getSlot_end() {
        return slot_end;
    }

    public void setSlot_end(String slot_end) {
        this.slot_end = slot_end;
    }

    @Override
    public String toString() {
        return "Slots{" + "slot_id=" + slot_id + ", slot_begin=" + slot_begin + ", slot_end=" + slot_end + '}';
    }

   
    
}
