/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author APC
 */
public class Rank {
    private int rankId;
    private String rankName;
    private double minAmount;

    public Rank() {
    }

    public Rank(int rankId, String rankName) {
        this.rankName = rankName;
        this.rankId = rankId;
    }

    public Rank(int rankId, String rankName, double minAmount) {
        this.rankId = rankId;
        this.rankName = rankName;
        this.minAmount = minAmount;
    }

    public int getRankId() {
        return rankId;
    }

    public void setRankId(int rankId) {
        this.rankId = rankId;
    }

    public String getRankName() {
        return rankName;
    }

    public void setRankName(String rankName) {
        this.rankName = rankName;
    }

    public double getMinAmount() {
        return minAmount;
    }

    public void setMinAmount(double minAmount) {
        this.minAmount = minAmount;
    }

    @Override
    public String toString() {
        return "Rank{" + "rankId=" + rankId + ", rankName=" + rankName + ", minAmount=" + minAmount + '}';
    }
    
    
}
