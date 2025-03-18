/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Permission {
    private int permission_id;
    private String permission_name;
    private String permission_path;
    private Module module;

    public Permission(int permission_id, String permission_name, String permission_path, Module module) {
        this.permission_id = permission_id;
        this.permission_name = permission_name;
        this.permission_path = permission_path;
        this.module = module;
    }

    public Permission(int permission_id, String permission_name, String permission_path) {
        this.permission_id = permission_id;
        this.permission_name = permission_name;
        this.permission_path = permission_path;
    }

    public int getPermission_id() {
        return permission_id;
    }

    public void setPermission_id(int permission_id) {
        this.permission_id = permission_id;
    }

    public String getPermission_name() {
        return permission_name;
    }

    public void setPermission_name(String permission_name) {
        this.permission_name = permission_name;
    }

    public String getPermission_path() {
        return permission_path;
    }

    public void setPermission_path(String permission_path) {
        this.permission_path = permission_path;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }
    
}
