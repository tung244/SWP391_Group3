/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class ContentStories {
    private String patient_name,content_stories,image_patient;

    public ContentStories(String patient_name, String content_stories, String image_patient) {
        this.patient_name = patient_name;
        this.content_stories = content_stories;
        this.image_patient = image_patient;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getContent_stories() {
        return content_stories;
    }

    public void setContent_stories(String content_stories) {
        this.content_stories = content_stories;
    }

    public String getImage_patient() {
        return image_patient;
    }

    public void setImage_patient(String image_patient) {
        this.image_patient = image_patient;
    }
    
}
