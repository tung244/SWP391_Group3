
package dal;

import model.UserProfile;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Role;

public class UserProfileDAO extends DBContext{
    public boolean addAccount(UserProfile p) {
        String sqlAccount = "insert into Account( username, password,email,phone_number,created_date,role_id)\n" +
                            "values(?,?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Account WHERE username = ?";
        String sqlUserProfile = "insert into UserProfile(account_id,full_name,gender,image_profile_user)\n" +
                            "values(?,?,?,?)";
        try {

            connection.setAutoCommit(false);

            PreparedStatement stAccount = connection.prepareStatement(sqlAccount);
            stAccount.setString(1, p.getAccount().getUsername());
            stAccount.setString(2, p.getAccount().getPassword());
            stAccount.setString(3, p.getAccount().getEmail());
            stAccount.setString(4, p.getAccount().getPhonenumber());
            stAccount.setString(5, p.getAccount().getCreated_date());
            stAccount.setInt(6, p.getAccount().getRole().getRole_id());

            int affectedRows = stAccount.executeUpdate();

            if (affectedRows == 0) {
                System.out.println("Không thể thêm tài khoản, không có hàng nào bị ảnh hưởng.");
            }

            PreparedStatement stGetId = connection.prepareStatement(sqlGetAccountId);
            stGetId.setString(1, p.getAccount().getUsername());
            ResultSet rs = stGetId.executeQuery();

            if (rs.next()) {
                int accountId = rs.getInt("account_id");

                PreparedStatement stUserProfile = connection.prepareStatement(sqlUserProfile);
                stUserProfile.setInt(1, accountId); 
                stUserProfile.setString(2, p.fullname);
                stUserProfile.setString(3, p.getGender());
                stUserProfile.setString(4, p.getImage_profile_user());

                stUserProfile.executeUpdate();

 

                connection.commit();
                return true;
            }

        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true); // Bật lại chế độ AutoCommit
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }
    public UserProfile GetAccount(String username) {
        String sql = "select *\n"
                + "from Account a join \n"
                + "UserProfile u on a.account_id = u.account_id "
                + "join Role r on r.role_id = a.role_id where a.username= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = new Role(rs.getInt("role_id"),
                        rs.getString("role_name"));
                Account ac = new Account(rs.getInt("account_id"),
                        rs.getString("username"),
                        "", rs.getString("email"),
                        rs.getString("phone_number"), rs.getString("created_date"), r);
                UserProfile u = new UserProfile(ac, rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("dob"),
                        rs.getString("gender"),
                        rs.getString("image_profile_user"));
                return u;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String[] loadPhoneAndEmailUser(String username){
        String [] info = new String[2];
        String sql = "Select phone_number,email from Account where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                info[0] = rs.getString("phone_number");
                info[1] = rs.getString("email");
                

            }
            return info;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        UserProfileDAO u = new UserProfileDAO();
        String[] hehe = u.loadPhoneAndEmailUser("swp391");
        System.out.println(hehe[0]+","+ hehe[1]);
    }
}
