/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ContentStories;
import model.Machine;


public class ContentStoriesDAO extends DBContext{
     public List<ContentStories> getAllContentStories() {
        String sql = "SELECT TOP 5 \n" +
"    fd.feedback_text, fd.feedback_rating, ac.full_name, ac.image_profile_user, fd.feedback_date\n" +
"FROM dbo.Feedback_Doctor fd \n" +
"JOIN dbo.Appointment a ON a.appointment_id = fd.appointment_id\n" +
"JOIN dbo.Customers ac ON ac.account_id = a.patient_id\n" +
"WHERE fd.feedback_rating = 5\n" +
"UNION ALL\n" +
"SELECT TOP 5 \n" +
"    fs.feedback_text, fs.feedback_rating, ac.full_name, ac.image_profile_user, fs.feedback_date\n" +
"FROM dbo.Feedback_Service fs \n" +
"JOIN dbo.Appointment a ON a.appointment_id = fs.appointment_id\n" +
"JOIN dbo.Customers ac ON ac.account_id = a.patient_id\n" +
"WHERE fs.feedback_rating = 5\n" +
"ORDER BY fd.feedback_date DESC";
        List<ContentStories> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ContentStories e = new ContentStories(rs.getString(3),
                        rs.getString(1),
                        rs.getString(4));
                list.add(e);
            }

        } catch (Exception e) {
        }
        return list;

    }
     
     public static void main(String[] args) {
        ContentStoriesDAO d = new ContentStoriesDAO();
         for (ContentStories con : d.getAllContentStories()) {
             System.out.println(con.toString());
         }
    }
}
