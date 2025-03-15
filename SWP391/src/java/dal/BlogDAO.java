/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Banner;
import model.Blog;

public class BlogDAO extends DBContext {

    public boolean createBlog(Blog blog) {
        String sql = "INSERT INTO dbo.Blog\n"
                + "( blog_content, author_id, created_date_blog,title_meta,title_image_blog, status_blog)\n"
                + "VALUES\n"
                + "( ?, ?, ?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, blog.getBlog_content());
            st.setInt(2, blog.getAuthor_id());
            st.setString(3, blog.getCreated_date_blog());
            st.setString(4, blog.getTitle_meta());
            st.setString(5, blog.getTitle_image_blog());
            st.setString(6, blog.getStatus_blog());
            int affect_row = st.executeUpdate();
            if (affect_row == 1) {
                return true;
            }

        } catch (Exception e) {
        }

        return false;
    }

    public int loadSizeBlog(String author_id, String status_blog) {
        String sql = "Select count(*) from Blog where author_id = ? and status_blog = ?";
        int size = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, author_id);
            st.setString(2, status_blog);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                size = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return size;
    }

    public int calculateTotalBlog(String[] s) {
        int result = 0;
        for (String string : s) {
            System.out.println(string);
        }
        String sql = "Select count(*)\n"
                + "FROM Blog b JOIN dbo.Staff s ON b.author_id = s.account_id where 1=1\n";
        if (s[0] != null && !s[0].equals("All") && !s[0].isEmpty()) {
            sql += "and b.status_blog = ?\n";
        }
        if (s[1] != null && !s[1].isEmpty()) {
            sql += "and b.title_meta like ?\n";
        }
 
        if (s[3] != null && !s[3].isEmpty()) {
            sql += "and b.created_date_blog >= ?\n";
        }
        if (s[4] != null && !s[4].isEmpty()) {
            sql += "and b.created_date_blog<= ?\n";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int param = 1;
            if (s[0] != null && !s[0].equals("All") && !s[0].isEmpty()) {
                st.setString(param, s[0]);
                param++;
            }
            if (s[1] != null && !s[1].isEmpty()) {
                st.setString(param, "%" + s[1] + "%");
                param++;
            }

            if (s[3] != null && !s[3].isEmpty()) {
                st.setString(param, s[3]);
                param++;
            }
            if (s[4] != null && !s[4].isEmpty()) {
                st.setString(param, s[4]);
                param++;
            }
            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                result = rs.getInt(1);

            }

        } catch (Exception e) {
        }

        return result;
    }

    public boolean deleteBlog(String blog_id) {
        String sql = "Delete from Blog where blog_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, blog_id);
            int row = st.executeUpdate();
            if (row > 0) {
                return true;
            }

        } catch (Exception e) {
        }
        return false;
    }

    public List<Blog> filterBlog(String[] s) {

        List<Blog> list = new ArrayList<>();
        int batch = 2;
        int limit = 0;
        try {
            if (s[2] != null && !s[2].isEmpty()) {
                int page = Integer.parseInt(s[2]);
                limit = (page - 1) * batch;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        String sql = "Select b.blog_id,b.blog_content,b.author_id,b.created_date_blog,\n"
                + "b.title_meta,b.title_image_blog,b.status_blog,s.admin_fullname\n"
                + "FROM Blog b JOIN dbo.Staff s ON b.author_id = s.account_id where 1=1\n";
        if (s[0] != null && !s[0].equals("All") && !s[0].isEmpty()) {
            sql += "and b.status_blog = ?\n";
        }
        if (s[1] != null && !s[1].isEmpty()) {
            sql += "and b.title_meta like ?\n";
        }
        
        if (s[3] != null && !s[3].isEmpty()) {
            sql += "and b.created_date_blog >= ?\n";
        }
        if (s[4] != null && !s[4].isEmpty()) {
            sql += "and b.created_date_blog<= ?\n";
        }
        if (s[2] != null && !s[2].isEmpty()) {
            sql += "ORDER BY b.blog_id asc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY\n";
        }
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int param = 1;
            if (s[0] != null && !s[0].equals("All") && !s[0].isEmpty()) {
                st.setString(param, s[0]);
                param++;
            }
            if (s[1] != null && !s[1].isEmpty()) {
                st.setString(param, "%" + s[1] + "%");
                param++;
            }
            
            if (s[3] != null && !s[3].isEmpty()) {
                st.setString(param, s[3]);
                param++;
            }
            if (s[4] != null && !s[4].isEmpty()) {
                st.setString(param, s[4]);
                param++;
            }
            if (s[2] != null && !s[2].isEmpty()) {
                st.setInt(param, limit);
                param++;
                st.setInt(param, batch);
                param++;
            }
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String tieude = rs.getString(5);
                if (tieude != null) {
                    if (tieude.length() >= 30) {
                        tieude = tieude.substring(0, 30) + "...";
                    }
                }
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        tieude,
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
                list.add(b);
            }

        } catch (Exception e) {
        }

        return list;
    }

    public List<Blog> loadBlogWithID(String author_id) {
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

    public boolean saveDraftBlog(Blog b) {
        String sql = "INSERT INTO dbo.Blog "
                + "(blog_content, author_id, created_date_blog, title_meta, title_image_blog, status_blog) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {  // Auto-close PreparedStatement
            st.setString(1, b.getBlog_content());
            st.setInt(2, b.getAuthor_id());
            st.setString(3, b.getCreated_date_blog());
            st.setString(4, b.getTitle_meta());
            st.setString(5, b.getTitle_image_blog());
            st.setString(6, b.getStatus_blog());

            int row = st.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console
        }
        return false;
    }

    public Blog loadBlog(int blog_id) {
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
                        rs.getString(4),rs.getString(5),rs.getString(6));
            }

        } catch (Exception e) {
        }
        return b;
    }

    

}
