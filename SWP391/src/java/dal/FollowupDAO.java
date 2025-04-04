/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;

/**
 *
 * @author -ASUS-
 */
public class FollowupDAO extends DBContext{
    public boolean addFollowUp(String followUpDate, String followUpDescription, String patientName, String phone, String email) {
        String sql = "INSERT INTO Follow_Up (next_follow_up_date, follow_up_description, PatientName, phone, email) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, followUpDate);
            st.setString(2, followUpDescription);
            st.setString(3, patientName);
            st.setString(4, phone);
            st.setString(5, email);

            int rowsInserted = st.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
//    public String[] loadToken(int followUpId) {
//        String query = "SELECT followup_id, token FROM FollowUps WHERE followup_id = ?";
//        try (connection conn = DBContext.getConnection;
//             PreparedStatement ps = conn.prepareStatement(query)) {
//
//            ps.setInt(1, followUpId);
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                return new String[]{String.valueOf(rs.getInt("followup_id")), rs.getString("token")};
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
}
