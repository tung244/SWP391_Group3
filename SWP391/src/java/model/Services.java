/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Services {
    private int service_id;
    private String service_name;
    private String service_description;
    private String service_introduce;
    private String service_benefit;
    private String service_status;
    private Specialization specialization;

    public Services() {
    }
    
    public Services(int service_id, String service_name, String service_description,String service_status, Specialization specialization) {
        this.service_id = service_id;
        this.service_name = service_name;
        this.service_description = service_description;
        this.service_status = service_status;
        this.specialization = specialization;
    }

    public Services(int service_id, String service_name) {
        this.service_id = service_id;
        this.service_name = service_name;
    }

    public Services(String service_name) {
        this.service_name = service_name;
    }
    
    
    
    public Services(String service_name, String service_description) {
        this.service_name = service_name;
        this.service_description = service_description;
    }
    
    
    
    public Services(int service_id, String service_name, String service_description) {
        this.service_id = service_id;
        this.service_name = service_name;
        this.service_description = service_description;
    }
    
    public Services(int service_id, String service_name, String service_description, String service_introduce, String service_benefit, String service_status, Specialization specialization) {
        this.service_id = service_id;
        this.service_name = service_name;
        this.service_description = service_description;
        this.service_introduce = service_introduce;
        this.service_benefit = service_benefit;
        this.service_status = service_status;
        this.specialization = specialization;
    }

    public String getService_introduce() {
        return service_introduce;
    }

    public void setService_introduce(String service_introduce) {
        this.service_introduce = service_introduce;
    }

    public String getService_benefit() {
        return service_benefit;
    }

    public void setService_benefit(String service_benefit) {
        this.service_benefit = service_benefit;
    }
    
    

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
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

    public Specialization getSpecialization() {
        return specialization;
    }

    public void setSpecialization(Specialization specialization) {
        this.specialization = specialization;
    }

    public String getService_status() {
        return service_status;
    }

    public void setService_status(String service_status) {
        this.service_status = service_status;
    }

    @Override
    public String toString() {
        return "Services{" + "service_id=" + service_id + ", service_name=" + service_name + ", service_description=" + service_description + ", service_introduce=" + service_introduce + ", service_benefit=" + service_benefit + ", service_status=" + service_status + ", specialization=" + specialization + '}';
    }
    
}
