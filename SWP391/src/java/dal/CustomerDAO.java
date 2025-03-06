/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Customers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Nguyen Phu Thinh
 */
public class CustomerDAO extends DBContext {

    public List<Customers> getAllCustomers() {
        List<Customers> list = new ArrayList<>();

        String sql = "select a.account_id,c.full_name,c.gender,a.username,c.image_profile_user from Customers c \n "
                + "join Accounts a on c.account_id = a.account_id";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Customers(rs.getInt(
                        "account_id"),
                        rs.getString("full_name"),
                        rs.getString("gender"),
                        rs.getString("username"),
                        rs.getString("image_profile_user")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Customers> BatchCustomers(int offset, int limit) {
        List<Customers> list = new ArrayList<>();

        String sql = "SELECT * FROM dbo.Customers\n"
                + "ORDER BY account_id\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, limit);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Customers c = new Customers(rs.getInt("account_id"),
                        rs.getString("full_name"),
                        rs.getString("gender"),
                        rs.getString("username"),
                        rs.getString("image_profile_user"));
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public Customers GetCustomerById(int account_id) {
    String sql = """
                 SELECT c.full_name, c.dob,c.gender,c.address,a.phone_number,a.email,a.created_date,a.role_id,c.image_profile_user FROM dbo.Customers c
                 JOIN dbo.Accounts a ON a.account_id = c.account_id WHERE c.account_id = ?""";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, account_id);

        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            return new Customers(rs.getString("role_id"), rs.getString("full_name"), rs.getString("address"), rs.getString("dob"),
                    rs.getString("gender"), rs.getString("phone_number"), rs.getString("email"), rs.getString("created_date"),
                    rs.getString("image_profile_user"));
        }
    } catch (SQLException e) {
        System.out.println("Database error: " + e.getMessage());
    }
    return null;
}
public List<Customers> searchCustomers(String keyword){
    List<Customers> list = new ArrayList<>();
    String sql = """
                 SELECT * FROM dbo.Customers c
                 JOIN dbo.Accounts a ON
                 a.account_id = c.account_id
                 WHERE c.full_name LIKE ? 
                 """;
    
    try{
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, "%" + keyword + "%");
        ResultSet rs = st.executeQuery();
        
        while(rs.next()){
            Customers c = new Customers(rs.getInt("account_id"),
                    rs.getString("full_name"),
                    rs.getString("gender"),
                    rs.getString("username"),
                    rs.getString("image_profile_user"));
            list.add(c);
        }
    } catch (SQLException e){
        e.printStackTrace();
    }
        return list;
}
}
