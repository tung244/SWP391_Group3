
package dal;

import model.UserProfile;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
