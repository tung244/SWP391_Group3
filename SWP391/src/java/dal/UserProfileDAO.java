package dal;

import bo.getFormatDate;
import model.UserProfile;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.GoogleAccount;
import model.Role;

public class UserProfileDAO extends DBContext {

    public boolean addAccount(UserProfile p) {
<<<<<<< Updated upstream
        String sqlAccount = "insert into Accounts( username, password,email,phone_number,created_date,role_id)\n" +
                            "values(?,?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Accounts WHERE username = ?";
        String sqlUserProfile = "insert into Customers(account_id,full_name,gender,image_profile_user)\n" +
                            "values(?,?,?,?)";
=======
        String sqlAccount = "insert into Account( username, password,email,phone_number,created_date,role_id)\n"
                + "values(?,?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Account WHERE username = ?";
        String sqlUserProfile = "insert into UserProfile(account_id,full_name,gender,image_profile_user)\n"
                + "values(?,?,?,?)";
>>>>>>> Stashed changes
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
                + "from Accounts a join \n"
                + "Customers u on a.account_id = u.account_id "
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
<<<<<<< Updated upstream
    
    public String[] loadBasicInfoUser(String username){
        String [] info = new String[3];
        String sql = "Select phone_number,email,account_id from Accounts where username = ?";
=======

    public String[] loadBasicInfoUser(String username) {
        String[] info = new String[3];
        String sql = "Select phone_number,email,account_id from Account where username = ?";
>>>>>>> Stashed changes
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                info[0] = rs.getString("phone_number");
                info[1] = rs.getString("email");
                info[2] = String.valueOf(rs.getInt("account_id"));

            }
            return info;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
<<<<<<< Updated upstream
    public boolean addAccountGG(GoogleAccount gg) {
        String sqlAccount = "insert into Accounts(username,email,created_date,role_id, google_id)\n" +
                            "values(?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Accounts WHERE username = ?";
        String sqlUserProfile = "insert into Customers(account_id,full_name,gender,image_profile_user)\n" +
                            "values(?,?,?,?)";
        try {

            connection.setAutoCommit(false);

            PreparedStatement stAccount = connection.prepareStatement(sqlAccount);
            stAccount.setString(1, gg.getEmail());
            
            stAccount.setString(2, gg.getEmail());

            stAccount.setString(3, getFormatDate.getFormString());
            stAccount.setInt(4, 4);
            stAccount.setString(5 ,gg.getId());


=======

    public boolean isertAccountGoogle(GoogleAccount gg) {
        String sqlAccount = "INSERT INTO dbo.Accounts\n"
                + "(username,password,email,phone_number,created_date,role_id,google_id,facebook_id)\n"
                + "VALUES\n" +
        "(?,?,?,?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Account WHERE username = ?";
        String sqlUserProfile = "insert into UserProfile(account_id,full_name,gender,image_profile_user)\n"
                + "values(?,?,?,?)";
        try {

            connection.setAutoCommit(false);
            
            PreparedStatement stAccount = connection.prepareStatement(sqlAccount);
            stAccount.setString(1, gg.getEmail());
            stAccount.setString(2, "");
            stAccount.setString(3, gg.getEmail());
            stAccount.setString(4, "");
            stAccount.setString(5, getFormatDate.getFormString());
            stAccount.setInt(6, 4);
            stAccount.setString(7, gg.getId());
>>>>>>> Stashed changes
            int affectedRows = stAccount.executeUpdate();

            if (affectedRows == 0) {
                System.out.println("Không thể thêm tài khoản, không có hàng nào bị ảnh hưởng.");
            }

            PreparedStatement stGetId = connection.prepareStatement(sqlGetAccountId);
<<<<<<< Updated upstream
            stGetId.setString(1, gg.getEmail());
=======
            stGetId.setString(1,gg.getEmail());
>>>>>>> Stashed changes
            ResultSet rs = stGetId.executeQuery();

            if (rs.next()) {
                int accountId = rs.getInt("account_id");

                PreparedStatement stUserProfile = connection.prepareStatement(sqlUserProfile);
<<<<<<< Updated upstream
                stUserProfile.setInt(1, accountId); 
                stUserProfile.setString(2, gg.getName());

=======
                stUserProfile.setInt(1, accountId);
                stUserProfile.setString(2, gg.getName());
                stUserProfile.setString(3, "");
>>>>>>> Stashed changes
                stUserProfile.setString(4, gg.getPicture());

                stUserProfile.executeUpdate();

<<<<<<< Updated upstream
 

=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
    
=======

>>>>>>> Stashed changes
}
