/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class ServiceTypes {
    private int service_type_id;
    private String service_type_name;
    private String duration_service;

    public ServiceTypes() {
    }

    public ServiceTypes(int service_type_id) {
        this.service_type_id = service_type_id;
    }
    
    
    public ServiceTypes(int service_type_id, String service_type_name, String duration_service) {
        this.service_type_id = service_type_id;
        this.service_type_name = service_type_name;
        this.duration_service = duration_service;
    }

    public ServiceTypes(String service_type_name, String duration_service) {
        this.service_type_name = service_type_name;
        this.duration_service = duration_service;
    }
    
    
    
    public int getService_type_id() {
        return service_type_id;
    }

    public void setService_type_id(int service_type_id) {
        this.service_type_id = service_type_id;
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

    

    @Override
    public String toString() {
        return "ServiceTypes{" + "serviceType_id=" + service_type_id + ", serviceType_name=" + service_type_name + ", duration=" + duration_service + '}';
    }
      
}
