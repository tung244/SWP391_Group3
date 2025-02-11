/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class ImagesService {
    private Services service;
    private String image_main;
    private String image_before;
    private String image_after;

    public ImagesService() {
    }

    public ImagesService(Services service, String image_main, String image_before, String image_after) {
        this.service = service;
        this.image_main = image_main;
        this.image_before = image_before;
        this.image_after = image_after;
    }

    public Services getService() {
        return service;
    }

    public void setService(Services service) {
        this.service = service;
    }

    public String getImage_main() {
        return image_main;
    }

    public void setImage_main(String image_main) {
        this.image_main = image_main;
    }

    public String getImage_before() {
        return image_before;
    }

    public void setImage_before(String image_before) {
        this.image_before = image_before;
    }

    public String getImage_after() {
        return image_after;
    }

    public void setImage_after(String image_after) {
        this.image_after = image_after;
    }

    @Override
    public String toString() {
        return "ImagesService{" + "service=" + service + ", image_main=" + image_main + ", image_before=" + image_before + ", image_after=" + image_after + '}';
    }
    
    
}
