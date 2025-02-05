/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Machine {
    private int machine_id;
    private String machine_name, machine_description, machine_img;

    public Machine(int machine_id, String machine_name, String machine_description, String machine_img) {
        this.machine_id = machine_id;
        this.machine_name = machine_name;
        this.machine_description = machine_description;
        this.machine_img = machine_img;
    }

    public int getMachine_id() {
        return machine_id;
    }

    public void setMachine_id(int machine_id) {
        this.machine_id = machine_id;
    }

    public String getMachine_name() {
        return machine_name;
    }

    public void setMachine_name(String machine_name) {
        this.machine_name = machine_name;
    }

    public String getMachine_description() {
        return machine_description;
    }

    public void setMachine_description(String machine_description) {
        this.machine_description = machine_description;
    }

    public String getMachine_img() {
        return machine_img;
    }

    public void setMachine_img(String machine_img) {
        this.machine_img = machine_img;
    }
    
}
