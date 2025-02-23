package dal;

import bo.GetFormatDate;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.UserProfile;

public class TokenDAO extends DBContext{

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
            if(row == 1){
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
    
    
    
    
}
