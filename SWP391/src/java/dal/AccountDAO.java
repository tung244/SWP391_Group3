/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Account;
import model.GoogleAccount;
import model.Role;
import model.UserProfile;

import model.GoogleAccount;



public class AccountDAO extends DBContext {

    public boolean checkTonTaiUser(String username) {
        String sql = "select * from Accounts where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int row = rs.getInt(1);
                if (row > 0) {
                    return true;
                }
            }

        } catch (Exception e) {
        }
        return false;

    }
    public boolean checkTonTai(String string, String method) {
        String sql = "select * from Accounts ";
        try {
            if(method.equals("email")){
                sql+= "where email = ?";
            }
            if(method.equals("phone_number")){
                sql+="where phone_number = ?";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, string);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int row = rs.getInt(1);
                if (row > 0) {
                    return true;
                }
            }

        } catch (Exception e) {
        }
        return false;

    }
    

    public boolean CheckLogin(String username, String password) {
        String sql = "Select count(*) from Accounts where username =? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int arrow = rs.getInt(1);
                if (arrow > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
     public int getAccountID(String username) {
        String sql = "Select account_id from Accounts where username =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
                
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean CheckExistEmail(String email) {
        String sql = "Select count(*) from Accounts where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int arrow = rs.getInt(1);
                if (arrow > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean CheckExistGGAccount(GoogleAccount gg) {
        String sql = "Select count(*) from Accounts where username = ? and google_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, gg.getEmail());
            st.setString(2, gg.getId());

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int arrow = rs.getInt(1);
                if (arrow > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isValidGoogleLogin(GoogleAccount gg){
        String sql = "select count(*) from Accounts where email = ? and google_id = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, gg.getEmail());
            st.setString(2,gg.getId());
            
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                int arrow = rs.getInt(1);
                if (arrow > 0) {
                    return true;
                }
            }
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}
