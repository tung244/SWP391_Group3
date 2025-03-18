/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import bo.EncryptPassword;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Account;
import model.GoogleAccount;
import model.Role;
import model.UserProfile;

import model.GoogleAccount;
import model.Modules;
import model.Permission;

public class AccountDAO extends DBContext {

    public boolean updateStatusUser(int account) {
        String sql = "UPDATE dbo.Accounts SET status_account = 'active' WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account);
            int row = st.executeUpdate();
            if (row == 1) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

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
            if (method.equals("email")) {
                sql += "where email = ?";
            }
            if (method.equals("phone_number")) {
                sql += "where phone_number = ?";
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

    public boolean isValidGoogleLogin(GoogleAccount gg) {
        String sql = "select count(*) from Accounts where email = ? and google_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, gg.getEmail());
            st.setString(2, gg.getId());

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int arrow = rs.getInt(1);
                    if (arrow > 0) {
                        return true;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean changePass(String newpass, int accId) {
        String sql = "UPDATE dbo.Accounts SET password = ? WHERE account_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newpass);
            st.setInt(2, accId);

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getAccountIdByEmail(String email) {
        String sql = "Select account_id from Accounts where email =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean changeFirstConfirm(String confirm, int accId) {
        String sql = "UPDATE dbo.Accounts SET first_confirm = ? WHERE account_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, confirm);
            st.setInt(2, accId);

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean LoginByEmail(String email, String password) {
        String sql = "Select * from Accounts where email =? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int row = rs.getInt(1);
                if (row > 0) {
                    return true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return false;
    }

    public Account getAccountAdmin(String email) {
        String sql = "SELECT * FROM dbo.Accounts a JOIN dbo.Role r ON r.role_id = a.role_id WHERE a.email = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Role r = new Role(rs.getInt("role_id"), rs.getString("role_name"));
                    return new Account(
                            rs.getInt("account_id"),
                            "",
                            "",
                            rs.getString("email"),
                            rs.getString("phone_number"),
                            rs.getString("created_date"),
                            "",
                            r
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean hasPermission(int role_id, String request) {
        String sql = "SELECT COUNT(*) FROM dbo.Permission p JOIN dbo.Permission_Role pr ON pr.permission_id = p.permission_id\n"
                + "JOIN dbo.Role r ON r.role_id = pr.role_id\n"
                + "JOIN dbo.Modules m ON m.module_id = p.module_id\n"
                + "WHERE r.role_id = ? AND p.permission_path = ?\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role_id);
            st.setString(2, request);
            System.out.println(sql);
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

    public List<Modules> getModule(int role_id) {
        List<Modules> list = new ArrayList<>();
        String sql = "SELECT m.module_id, m.module_name, m.module_img, COUNT(p.permission_id) AS Number_Permission\n"
                + "FROM dbo.Permission p JOIN dbo.Permission_Role pr ON pr.permission_id = p.permission_id\n"
                + "JOIN dbo.Role r ON r.role_id = pr.role_id\n"
                + "JOIN dbo.Modules m ON m.module_id = p.module_id\n"
                + "WHERE r.role_id = ?\n"
                + "GROUP BY m.module_id, m.module_name, m.module_img";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Modules m = new Modules(rs.getInt("module_id"),
                        rs.getString("module_name"),
                        rs.getString("module_img"));
                list.add(m);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Map<Modules, List<Permission>> loadMenu(int role_id) {
        List<Modules> list = getModule(role_id);
        Map<Modules, List<Permission>> map = new HashMap<>();
        String sql = "SELECT * FROM dbo.Permission p JOIN dbo.Permission_Role pr ON pr.permission_id = p.permission_id\n"
                + "JOIN dbo.Modules m ON m.module_id = p.module_id\n"
                + "JOIN dbo.Role r ON r.role_id = pr.role_id\n"
                + "WHERE m.module_id = ? AND pr.role_id = ?";
        for (Modules modules : list) {
            List<Permission> per = new ArrayList<>();
            
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, modules.getModule_id());
                st.setInt(2, role_id);
                System.out.println(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {                    
                    Permission p = new Permission(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3));
                    per.add(p);
                }
            } catch (Exception e) {
            }
            map.put(modules, per);
            
        }
        return map;
    }
    
    public static void main(String[] args) {
        AccountDAO adao = new AccountDAO();
        Map<Modules, List<Permission>> map = adao.loadMenu(2);
        for (Map.Entry<Modules, List<Permission>> entry : map.entrySet()) {
            Modules key = entry.getKey();
            List<Permission> val = entry.getValue();
            System.out.println(key.getModule_name());
            for (Permission per : val) {
                System.out.println(per.getPermission_name());
            }
        }
    }

    public boolean checkExistPhone(String phonenum) {
        String sql = "select * from Accounts where phone_number = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phonenum);
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

    public int getRoleID(String email) {
        String sql = "Select role_id from Accounts where email =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
