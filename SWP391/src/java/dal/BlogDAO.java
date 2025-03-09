/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Banner;
import model.Blog;

public class BlogDAO extends DBContext {

    public boolean createBlog(Blog blog) {
        String sql = "INSERT INTO dbo.Blog\n"
                + "( blog_content, author_id, created_date_blog,title_meta,title_image_blog)\n"
                + "VALUES\n"
                + "( ?, ?, ?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, blog.getBlog_content());
            st.setInt(2, blog.getAuthor_id());
            st.setString(3, blog.getCreated_date_blog());
            st.setString(4, blog.getTitle_meta());
            st.setString(5, blog.getTitle_image_blog());
            int affect_row = st.executeUpdate();
            if(affect_row == 1){
                return true;
            }

        } catch (Exception e) {
        }
        
        
        return false;
    }
    
    public int loadSizeBlog(String author_id){
        String sql= "Select count(*) from Blog where author_id = ?";
        int size = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, author_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                size = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return size;
    }
    
    public List<Blog> loadBlogWithID(String author_id){
        List<Blog> list = new ArrayList<>();
        String sql = "Select * from Blog where author_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, author_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Blog loadBlog(int blog_id){
        String sql = "Select * from Blog where blog_id = ?";
        Blog b = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blog_id);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {                
                b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4));
            }

        } catch (Exception e) {
        }
        return b;
    }
    
   
    
}
