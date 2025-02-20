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
    
    
    public List<Customers> getAllCustomers(){
        List<Customers> list = new ArrayList<>();
        
        String sql = "select a.account_id,c.full_name,c.gender,a.username,c.image_profile_user from Customers c \n "
                + "join Accounts a on c.account_id = a.account_id";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()){
                list.add(new Customers(rs.getInt("account_id"), rs.getString("full_name"), rs.getString("gender")
                        , rs.getString("username"), rs.getString("image_profile_user")));
            }
            
        } catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    
    public Customers getCustomerByName(String full_name){
        String sql = "SELECT * FROM dbo.Customers c WHERE c.full_name = ?";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, full_name);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()){
                Customers c = new Customers(rs.getInt("account_id"), rs.getString("full_name")
                        , rs.getString("gender"),rs.getString("username"),rs.getString("image_profile_user"));
                return c;
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
