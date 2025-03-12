/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author APC
 */
public class Checkout {
    private int checkoutId;
    private int appointmentId;
    private String transactionType;
    private String transactionStatus;
    private double totalBill;
    private String checkoutCode;
    private int discount;
    private Timestamp checkoutTime;

    public Checkout() {
    }

    public Checkout(int checkoutId, int appointmentId, String transactionType, String transactionStatus, double totalBill, String checkoutCode, int discount, Timestamp checkoutTime) {
        this.checkoutId = checkoutId;
        this.appointmentId = appointmentId;
        this.transactionType = transactionType;
        this.transactionStatus = transactionStatus;
        this.totalBill = totalBill;
        this.checkoutCode = checkoutCode;
        this.discount = discount;
        this.checkoutTime = checkoutTime;
    }

    public int getCheckoutId() {
        return checkoutId;
    }

    public void setCheckoutId(int checkoutId) {
        this.checkoutId = checkoutId;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public double getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(double totalBill) {
        this.totalBill = totalBill;
    }

    public String getCheckoutCode() {
        return checkoutCode;
    }

    public void setCheckoutCode(String checkoutCode) {
        this.checkoutCode = checkoutCode;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Timestamp getCheckoutTime() {
        return checkoutTime;
    }

    public void setCheckoutTime(Timestamp checkoutTime) {
        this.checkoutTime = checkoutTime;
    }

    @Override
    public String toString() {
        return "Checkout{" + "checkoutId=" + checkoutId + ", appointmentId=" + appointmentId + ", transactionType=" + transactionType + ", transactionStatus=" + transactionStatus + ", totalBill=" + totalBill + ", checkoutCode=" + checkoutCode + ", discount=" + discount + ", checkoutTime=" + checkoutTime + '}';
    }
    
    
}
