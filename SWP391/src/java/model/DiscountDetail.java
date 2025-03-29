/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author APC
 */
public class DiscountDetail {
    int discountDetailId;
    Discount discount;
    int percent;
    Rank rank;

    public DiscountDetail() {
    }

    public DiscountDetail(int discountDetailId, Discount discount, int percent) {
        this.discountDetailId = discountDetailId;
        this.discount = discount;
        this.percent = percent;
    }

    public DiscountDetail(int discountDetailId, Discount discount, int percent, Rank rank) {
        this.discountDetailId = discountDetailId;
        this.discount = discount;
        this.percent = percent;
        this.rank = rank;
    }

    public int getDiscountDetailId() {
        return discountDetailId;
    }

    public void setDiscountDetailId(int discountDetailId) {
        this.discountDetailId = discountDetailId;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
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

    @Override
    public String toString() {
        return "DiscountDetail{" + "discountDetailId=" + discountDetailId + ", discount=" + discount + ", percent=" + percent + ", rank=" + rank + '}';
    }

    
    
    
}
