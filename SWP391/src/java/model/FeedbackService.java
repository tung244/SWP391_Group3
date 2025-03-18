/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author -ASUS-
 */
public class FeedbackService {
    public String status;
    public int rating;
    public int feedback_id;
    public double average_rating;
    public Date feedback_date;
    public Appointment appointment;
    public int appointment_id;
    public int staff_id;
    public int total_feedback ;
    public int totalStars ;
    public String full_name;
    public int month;
 
     
    public FeedbackService() {
    }

    public FeedbackService(double average_rating, int month) {
        this.average_rating = average_rating;
        this.month = month;
    }

   

    

    public FeedbackService(String status, int rating, int feedback_id, Date feedback_date, Appointment appointment, String full_name) {
        this.status = status;
        this.rating = rating;
        this.feedback_id = feedback_id;
        this.feedback_date = feedback_date;
        this.appointment = appointment;
        this.full_name = full_name;
    }

    public FeedbackService(double average_rating, Appointment appointment, int staff_id, int total_feedback, int totalStars) {
        this.average_rating = average_rating;
        this.appointment = appointment;
        this.staff_id = staff_id;
        this.total_feedback = total_feedback;
        this.totalStars = totalStars;
    }

    

    

    public FeedbackService(String status, int rating, Date feedback_date, Appointment appointment, int appointment_id) {
        this.status = status;
        this.rating = rating;
        this.feedback_date = feedback_date;
        this.appointment = appointment;
        this.appointment_id = appointment_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getTotalReviews() {
        return total_feedback;
    }

    public void setTotalReviews(int totalReviews) {
        this.total_feedback = totalReviews;
    }

    public int getTotalStars() {
        return totalStars;
    }

    public void setTotalStars(int totalStars) {
        this.totalStars = totalStars;
    }

    public double getAverage_rating() {
        return average_rating;
    }

    public void setAverage_rating(double average_rating) {
        this.average_rating = average_rating;
    }

    public int getTotal_feedback() {
        return total_feedback;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public String getFull_name() {
        return full_name;
    }

<<<<<<< HEAD
=======
    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

>>>>>>> test
    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public void setTotal_feedback(int total_feedback) {
        this.total_feedback = total_feedback;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getFeedback_date() {
        return feedback_date;
    }

    public void setFeedback_date(Date feedback_date) {
        this.feedback_date = feedback_date;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public int getAppointment_id() {
        return appointment_id;
    }

    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }
<<<<<<< HEAD

=======
    
>>>>>>> test
    @Override
    public String toString() {
        return "FeedbackService{" + "status=" + status + ", rating=" + rating + ", feedback_id=" + feedback_id + ", average_rating=" + average_rating + ", feedback_date=" + feedback_date + ", appointment=" + appointment + ", appointment_id=" + appointment_id + ", staff_id=" + staff_id + ", total_feedback=" + total_feedback + ", totalStars=" + totalStars + ", full_name=" + full_name + '}';
    }

    

    
}
