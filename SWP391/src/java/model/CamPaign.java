/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.File;
import java.util.List;

/**
 *
 * @author fptshop
 */
public class CamPaign {
    private int campaign_id;
    private String name_company;
    private String group_patient;
    private String subject_mail;
    private String content_mail;
    private int total_emails;
    private int sent_emails;
    private String created_at;
    private String status;

    public CamPaign(int campaign_id, String name_company, String group_patient, String subject_mail, String content_mail, int total_emails, int sent_emails, String created_at, String status) {
        this.campaign_id = campaign_id;
        this.name_company = name_company;
        this.group_patient = group_patient;
        this.subject_mail = subject_mail;
        this.content_mail = content_mail;
        this.total_emails = total_emails;
        this.sent_emails = sent_emails;
        this.created_at = created_at;
        this.status = status;
    }

    public CamPaign(String name_company, String group_patient, String subject_mail, String content_mail, int total_emails, int sent_emails, String created_at, String status) {
        this.name_company = name_company;
        this.group_patient = group_patient;
        this.subject_mail = subject_mail;
        this.content_mail = content_mail;
        this.total_emails = total_emails;
        this.sent_emails = sent_emails;
        this.created_at = created_at;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    public CamPaign(int campaign_id, String name_company, String group_patient, String subject_mail, String content_mail, int total_emails, int sent_emails, String created_at) {
        this.campaign_id = campaign_id;
        this.name_company = name_company;
        this.group_patient = group_patient;
        this.subject_mail = subject_mail;
        this.content_mail = content_mail;
        this.total_emails = total_emails;
        this.sent_emails = sent_emails;
        this.created_at = created_at;
    }

    public CamPaign(String name_company, String group_patient, String subject_mail, String content_mail, int total_emails, int sent_emails, String created_at) {
        this.name_company = name_company;
        this.group_patient = group_patient;
        this.subject_mail = subject_mail;
        this.content_mail = content_mail;
        this.total_emails = total_emails;
        this.sent_emails = sent_emails;
        this.created_at = created_at;
    }

    public int getCampaign_id() {
        return campaign_id;
    }

    public void setCampaign_id(int campaign_id) {
        this.campaign_id = campaign_id;
    }

    public String getName_company() {
        return name_company;
    }

    public void setName_company(String name_company) {
        this.name_company = name_company;
    }

    public String getGroup_patient() {
        return group_patient;
    }

    public void setGroup_patient(String group_patient) {
        this.group_patient = group_patient;
    }

    public String getSubject_mail() {
        return subject_mail;
    }

    public void setSubject_mail(String subject_mail) {
        this.subject_mail = subject_mail;
    }

    public String getContent_mail() {
        return content_mail;
    }

    public void setContent_mail(String content_mail) {
        this.content_mail = content_mail;
    }

    public int getTotal_emails() {
        return total_emails;
    }

    public void setTotal_emails(int total_emails) {
        this.total_emails = total_emails;
    }

    public int getSent_emails() {
        return sent_emails;
    }

    public void setSent_emails(int sent_emails) {
        this.sent_emails = sent_emails;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
    

    

    public void incrementSentEmails() {
        this.sent_emails++;
    }

}
