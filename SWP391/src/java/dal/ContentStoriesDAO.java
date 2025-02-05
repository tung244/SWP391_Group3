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
        String sql = "SELECT *\n" +
"FROM dbo.Content_Stories";
        List<ContentStories> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ContentStories e = new ContentStories(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3));
                list.add(e);
            }

        } catch (Exception e) {
        }
        return list;

    }
     
     public static void main(String[] args) {
        ContentStoriesDAO d = new ContentStoriesDAO();
         for (ContentStories con : d.getAllContentStories()) {
             System.out.println(con.getPatient_name());
         }
    }
}
