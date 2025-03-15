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
    private int percent;
    private Rank rank;
    private Date endDate;
    private boolean status;

    public Discount() {
    }

    public Discount(int discountId, int percent) {
        this.discountId = discountId;
        this.percent = percent;
    }
    
    public Discount(int discountId, int percent, Rank rank) {
        this.discountId = discountId;
        this.percent = percent;
        this.rank = rank;
    }
    
    
    
    
    public Discount(int discountId, String discountName, int percent, Rank rank, Date endDate, boolean status) {
        this.discountId = discountId;
        this.discountName = discountName;
        this.percent = percent;
        this.rank = rank;
        this.endDate = endDate;
        this.status = status;
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

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public Rank getRank() {
        return rank;
    }

    public void setRank(Rank rank) {
        this.rank = rank;
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
        return "Discount{" + "discountId=" + discountId + ", discountName=" + discountName + ", percent=" + percent + ", rank=" + rank + ", endDate=" + endDate + ", status=" + status + '}';
    }
    
    
}
