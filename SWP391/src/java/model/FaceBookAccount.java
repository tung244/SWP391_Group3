/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class FaceBookAccount {
    private String id;
    private String name;
    private String email;
    private String profile_pic;

    public FaceBookAccount(String id, String name, String email, String profile_pic) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.profile_pic = profile_pic;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    @Override
    public String toString() {
        return "FaceBookAccount{" + "id=" + id + ", name=" + name + ", email=" + email + ", profile_pic=" + profile_pic + '}';
    }

   

    
    
}
