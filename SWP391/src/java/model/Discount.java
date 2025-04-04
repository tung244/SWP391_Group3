/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author APC
 */
public class Discount {
    private int discountId;
    private String discountName;
    private Date startDate;
    private Date endDate;
    private boolean status;

    public Discount(int discountId, String discountName, Date startDate, Date endDate, boolean status) {
        this.discountId = discountId;
        this.discountName = discountName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public Discount(String discountName, Date startDate, Date endDate, boolean status) {
        this.discountName = discountName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }
    
    
    
    
    public Discount() {
    }

    public Discount(String discountName) {
        this.discountName = discountName;
    }

    
    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public String getDiscountName() {
        return discountName;
    }

    public void setDiscountName(String discountName) {
        this.discountName = discountName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Discount{" + "discountId=" + discountId + ", discountName=" + discountName + ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + '}';
    }
    
    
    
}
