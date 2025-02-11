/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class ServiceDetail {
    private int service_detail_id;
    Services services;
    ServiceTypes serviceType;
    private double cost;

    public ServiceDetail() {
    }

    public ServiceDetail(int service_detail_id, Services services, ServiceTypes serviceType, double cost) {
        this.service_detail_id = service_detail_id;
        this.services = services;
        this.serviceType = serviceType;
        this.cost = cost;
    }

    public int getService_detail_id() {
        return service_detail_id;
    }

    public void setService_detail_id(int service_detail_id) {
        this.service_detail_id = service_detail_id;
    }
    
    public Services getServices() {
        return services;
    }

    public void setServices(Services services) {
        this.services = services;
    }

    public ServiceTypes getServiceType() {
        return serviceType;
    }

    public void setServiceType(ServiceTypes serviceType) {
        this.serviceType = serviceType;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "ServiceDetail{" + "serviceDetail_id=" + service_detail_id + ", services=" + services + ", serviceType=" + serviceType + ", cost=" + cost + '}';
    }
    
    
}
