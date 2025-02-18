/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Gmail {
    private String id;
    private String subject;
    private String date;
    private String context;

    public Gmail(String id, String subject, String date, String context) {
        this.id = id;
        this.subject = subject;
        this.date = date;
        this.context = context;
    }

    public Gmail(String id, String subject, String date) {
        this.id = id;
        this.subject = subject;
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }
    
}
