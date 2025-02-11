/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import bo.GetFormatDate;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.OTP_Services;

public class OTPServicesDAO extends DBContext {

    public OTP_Services getOTPNewest(String username) {
        String sql = "SELECT TOP 1 *\n"
                + "FROM dbo.Accounts a JOIN dbo.OTP_Services os ON os.account_id = a.account_id\n"
                + "WHERE a.username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OTP_Services otp = new OTP_Services(rs.getInt("account_id"),
                        rs.getString("otp"),
                        rs.getString("created_otp_time"),
                        rs.getString("otp_expiry_date"));
                return otp;
            }

        } catch (Exception e) {
        }
        return null;
    }
    

    public boolean saveOTP(OTP_Services otp_services) {
        String sql = "Insert into OTP_Services(account_id,otp,created_otp_time,otp_expiry_date)"
                + "Values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, otp_services.getAccount_id());
            st.setString(2, otp_services.getOtp());
            st.setString(3, otp_services.getCreated_otp_time());
            st.setString(4, otp_services.getOtp_expiry_date());
            int row = st.executeUpdate();
            if (row > 0) {
                return true;
            }

        } catch (Exception e) {
        }
        return false;
    }

    public static void main(String[] args) {
        OTPServicesDAO otp_dao = new OTPServicesDAO();
        OTP_Services otp = otp_dao.getOTPNewest("guest1");
        System.out.println(otp.getOtp_expiry_date());
    }
}
