package dal;

import bo.GetFormatDate;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.UserProfile;

public class TokenDAO extends DBContext {

    public boolean addRefreshToken(String token) {
        String sql = "INSERT INTO dbo.Token_Google\n"
                + "(token,created_date)\n"
                + "VALUES\n"
                + "(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, token);
            st.setString(2, GetFormatDate.getFormString());
            int row = st.executeUpdate();
            if (row == 1) {
                return true;
            }

        } catch (Exception e) {
        }
        return false;

    }

    public String loadNewestToken() {
        String sql = "SELECT TOP 1 token FROM Token_Google ORDER BY token_id DESC ";
        String token = "hehee";
        try {
            System.out.println("1");
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                System.out.println("2");
                token = rs.getString(1);
            }

        } catch (Exception e) {
        }
        return token;

    }

    public boolean saveTokenVerify(String token, String created, int account_id) {
        String sql = "INSERT INTO dbo.Token_User\n"
                + "(token_user,account_id,created_date_token)\n"
                + "VALUES\n"
                + "(?,?,?)";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, token);
            st.setInt(2, account_id);
            st.setString(3, created);
            ResultSet rs = st.executeQuery();
            int row = rs.getInt(1);
            if(row ==1){
                return true;
            }
            
        } catch (Exception e) {
        }
        return false;
    }
    
    public String[] loadToken(int account_id){
        String sql = "SELECT TOP 1 * FROM Token_User WHERE account_id = ? ORDER BY created_date_token DESC";
        String[] s = new String[10];
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                s[0] = rs.getString(1);
                s[1] =rs.getString(2);
                s[2] = String.valueOf(rs.getInt(3));
                s[3] = rs.getString(4);
            }
            return s;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    } 
    
    
}
