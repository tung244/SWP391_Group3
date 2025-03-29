/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**

 * @author PC
 */
public class Feedback_Doctor {

    private int feedback_id;
    private int appointment_id;
    private String feedback_text;
    private String feedback_date;
    private int feedback_rating;
    private String response_text;
    private String response_date;
    private int staff_id;

    public Feedback_Doctor() {
    }

    public Feedback_Doctor(int feedback_id, int appointment_id, String feedback_text, String feedback_date, int feedback_rating, String response_text, String response_date, int staff_id) {
        this.feedback_id = feedback_id;
        this.appointment_id = appointment_id;
        this.feedback_text = feedback_text;
        this.feedback_date = feedback_date;
        this.feedback_rating = feedback_rating;
        this.response_text = response_text;
        this.response_date = response_date;
        this.staff_id = staff_id;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public String getFeedback_text() {
        return feedback_text;
    }

    public void setFeedback_text(String feedback_text) {
        this.feedback_text = feedback_text;
    }

    public String getFeedback_date() {
        return feedback_date;
    }

    public void setFeedback_date(String feedback_date) {
        this.feedback_date = feedback_date;
    }

    public int getFeedback_rating() {
        return feedback_rating;
    }

    public void setFeedback_rating(int feedback_rating) {
        this.feedback_rating = feedback_rating;
    }

    public String getResponse_text() {
        return response_text;
    }

    public void setResponse_text(String response_text) {
        this.response_text = response_text;
    }

    public String getResponse_date() {
        return response_date;
    }

    public void setResponse_date(String response_date) {
        this.response_date = response_date;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    @Override
    public String toString() {
        return "Feedback_Doctor{" + "feedback_id=" + feedback_id + ", appointment_id=" + appointment_id + ", feedback_text=" + feedback_text + ", feedback_date=" + feedback_date + ", feedback_rating=" + feedback_rating + ", response_text=" + response_text + ", response_date=" + response_date + ", staff_id=" + staff_id + '}';
    }
    
    
}
