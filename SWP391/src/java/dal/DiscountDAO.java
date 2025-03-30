/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import kotlin.collections.ArrayDeque;
import model.Discount;
import model.DiscountDetail;
import model.Rank;

/**
 *
 * @author APC
 */
public class DiscountDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<DiscountDetail> getDiscountsByDateAndRank(Date selectedDate, int rankId) {
        List<DiscountDetail> discounts = new ArrayList<>();
        String sql = "SELECT d.discountId, d.discountName, d.startDate, d.endDate, d.[status], dd.rankId, dd.[percent], dd.discountDetailId "
                + "FROM Discount d "
                + "JOIN DiscountDetail dd ON d.discountId = dd.discountId "
                + "WHERE dd.rankId = ? "
                + "AND (? BETWEEN d.startDate AND d.endDate OR d.startDate IS NULL)";

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, rankId);
            ps.setDate(2, selectedDate);
            rs = ps.executeQuery();

            while (rs.next()) {
                Discount discount = new Discount();
                discount.setDiscountId(rs.getInt("discountId"));
                discount.setDiscountName(rs.getString("discountName"));
                discount.setStartDate(rs.getDate("startDate"));
                discount.setEndDate(rs.getDate("endDate"));
                discount.setStatus(rs.getBoolean("status"));
                Rank rank = new Rank();
                rank.setRankId(rs.getInt("rankId"));
                int percent = rs.getInt("percent");
                int discountDetailId = rs.getInt("discountDetailId");
                DiscountDetail dt = new DiscountDetail(discountDetailId, discount, percent, rank);
                discounts.add(dt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discounts;
    }

    public DiscountDetail getDiscountDetailById(int id) {
        String sql = "select * from Discount d join DiscountDetail dd \n"
                + "on d.discountId = dd.discountId\n"
                + "join CustomerRank r on r.rankId = dd.rankId\n"
                + "where dd.discountDetailId = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Discount discount = new Discount();
                discount.setDiscountId(rs.getInt("discountId"));
                discount.setDiscountName(rs.getString("discountName"));
                discount.setStartDate(rs.getDate("startDate"));
                discount.setEndDate(rs.getDate("endDate"));
                discount.setStatus(rs.getBoolean("status"));
                Rank rank = new Rank();
                rank.setRankId(rs.getInt("rankId"));
                rank.setRankName(rs.getString("rankName"));
                int percent = rs.getInt("percent");
                int discountDetailId = rs.getInt("discountDetailId");
                DiscountDetail dt = new DiscountDetail(discountDetailId, discount, percent, rank);
                return dt;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<DiscountDetail> getListDiscountDetailById(int id) {
        List<DiscountDetail> list = new ArrayList<>();
        String sql = "select * from Discount d join DiscountDetail dd \n"
                + "on d.discountId = dd.discountId\n"
                + "join CustomerRank r on r.rankId = dd.rankId\n"
                + "where d.discountId = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                Discount discount = new Discount();
                discount.setDiscountId(rs.getInt("discountId"));
                discount.setDiscountName(rs.getString("discountName"));
                discount.setStartDate(rs.getDate("startDate"));
                discount.setEndDate(rs.getDate("endDate"));
                discount.setStatus(rs.getBoolean("status"));
                Rank rank = new Rank();
                rank.setRankId(rs.getInt("rankId"));
                rank.setRankName(rs.getString("rankName"));
                int percent = rs.getInt("percent");
                int discountDetailId = rs.getInt("discountDetailId");
                DiscountDetail dt = new DiscountDetail(discountDetailId, discount, percent, rank);
                list.add(dt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Discount> getOnlyDiscountList() {
        String sql = "select * from Discount";
        List<Discount> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Discount discount = new Discount();
                discount.setDiscountId(rs.getInt("discountId"));
                discount.setDiscountName(rs.getString("discountName"));
                discount.setStartDate(rs.getDate("startDate"));
                discount.setEndDate(rs.getDate("endDate"));
                discount.setStatus(rs.getBoolean("status"));
                list.add(discount);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Discount getDiscountById(int id) {
        String sql = "select * from Discount where discountId = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Discount discount = new Discount();
                discount.setDiscountId(rs.getInt("discountId"));
                discount.setDiscountName(rs.getString("discountName"));
                discount.setStartDate(rs.getDate("startDate"));
                discount.setEndDate(rs.getDate("endDate"));
                discount.setStatus(rs.getBoolean("status"));
                return discount;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateDiscount(Discount discount) {
        String sql = "UPDATE Discount SET discountName = ?, startDate = ?, endDate = ?, status = ? WHERE discountId = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, discount.getDiscountName());
            ps.setDate(2, (Date) discount.getStartDate());
            ps.setDate(3, (Date)discount.getEndDate());
            ps.setBoolean(4, discount.isStatus());
            ps.setInt(5, discount.getDiscountId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateDiscountDetail(int discountId, int rankId, int percent) {
    String sql = "UPDATE DiscountDetail SET [percent] = ? WHERE discountId = ? AND rankId = ?";
    try {
        ps = connection.prepareStatement(sql);
        ps.setInt(1, percent);
        ps.setInt(2, discountId);
        ps.setInt(3, rankId);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
    }
    
    public void addDiscount(Discount discount) {
        String sql = "INSERT INTO Discount (discountName, startDate, endDate, status) VALUES (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, discount.getDiscountName());
            ps.setDate(2, (Date) discount.getStartDate());
            ps.setDate(3, (Date) discount.getEndDate());
            ps.setBoolean(4, discount.isStatus());
            ps.executeUpdate();

            // Lấy ID tự sinh sau khi INSERT
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                discount.setDiscountId(rs.getInt(1)); // Cập nhật ID cho đối tượng Discount
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Discount getNewDiscount() {
        String sql = "Select top 1 * from Discount order by discountId desc";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Discount discount = new Discount();
                discount.setDiscountId(rs.getInt("discountId"));
                discount.setDiscountName(rs.getString("discountName"));
                discount.setStartDate(rs.getDate("startDate"));
                discount.setEndDate(rs.getDate("endDate"));
                discount.setStatus(rs.getBoolean("status"));
                return discount;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addDiscountDetail(int discountId, int rankId, int percent) {
        String sql = "INSERT INTO DiscountDetail (discountId, rankId, [percent]) VALUES (?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, discountId);
            ps.setInt(2, rankId);
            ps.setInt(3, percent);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        DiscountDAO dao = new DiscountDAO();
//        Date selectedDate = Date.valueOf("2025-03-08");
//        for (DiscountDetail arg : dao.getListDiscountDetailById(4)) {
//            System.out.println(arg);
//        }
//        List<Discount> list = dao.getOnlyDiscountList();
//        for (Discount discount : list) {
//            System.out.println(discount);
//        }
        System.out.println(dao.getDiscountById(2));
    }
}
