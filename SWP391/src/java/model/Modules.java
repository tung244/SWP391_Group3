/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Modules {
    private int module_id;
    private String module_name;
    private String description;
    private String module_img;

    public Modules(int module_id, String module_name, String module_img) {
        this.module_id = module_id;
        this.module_name = module_name;
        this.module_img = module_img;
    }

    public int getModule_id() {
        return module_id;
    }

    public void setModule_id(int module_id) {
        this.module_id = module_id;
    }

    public String getModule_name() {
        return module_name;
    }

    public void setModule_name(String module_name) {
        this.module_name = module_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getModule_img() {
        return module_img;
    }

    public void setModule_img(String module_img) {
        this.module_img = module_img;
    }

    @Override
    public String toString() {
        return "Modules{" + "module_id=" + module_id + ", module_name=" + module_name + ", description=" + description + ", module_img=" + module_img + '}';
    }
    
    
    
}
