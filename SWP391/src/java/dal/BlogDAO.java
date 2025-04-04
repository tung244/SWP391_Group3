/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import bo.GetFormatDate;
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
            System.out.println(sql);
            int affect_row = st.executeUpdate();
            if (affect_row == 1) {
                return true;
            }

        } catch (Exception e) {
        }

        return false;
    }

    public List<String> loadAllTitle() {
        String sql = "SELECT  title_meta FROM dbo.Blog";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> loadBlogFromTitle(List<String> title) {
        String sql = "SELECT blog_id, title_meta, title_image_blog FROM dbo.Blog where title_meta = ?";
        List<Blog> list = new ArrayList<>();
        for (String string : title) {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, string);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    list.add(new Blog(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3)));
                }
            } catch (Exception e) {
            }
        }

        return list;
    }

    public List<Blog> loadAllBlog(String page) {
        String sql = "SELECT blog_id, title_meta, title_image_blog "
                + "FROM dbo.Blog "
                + "ORDER BY blog_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Blog> list = new ArrayList<>();
        int pageNum = Integer.parseInt(page);
        int offset = (pageNum - 1) * 5;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, 5); // Số blog mỗi trang
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), // blog_id
                        rs.getString(2), // title_meta
                        rs.getString(3))); // title_image_blog
            }
        } catch (Exception e) {
            e.printStackTrace(); // Nên xử lý lỗi tốt hơn trong thực tế
        }

        return list;
    }

    // Hàm đếm tổng số blog
    public int getTotalBlogCount() {
        String sql = "SELECT COUNT(*) FROM dbo.Blog";
        int total = 0;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }

    public int plus1View(int blog_id) {
        String sql = "UPDATE dbo.Blog\n"
                + "    SET blog_view = blog_view + 1\n"
                + "    OUTPUT INSERTED.blog_view AS UpdatedViewCount\n"
                + "    WHERE blog_id = ?";
        int result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blog_id);
            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return result;
    }

    public String loadStatusBlog(String blog_id) {
        String sql = "Select status_blog from Blog where blog_id = ?";
        String result = "";
        try {
            int blogid = Integer.parseInt(blog_id);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = rs.getString(1);
            }
        } catch (Exception e) {

        }
        return result;
    }

    public boolean updateStatusBlog(String blog_id) {
        String sql = "UPDATE dbo.Blog\n"
                + "SET \n"
                + "    status_blog = ?\n"
                + "WHERE blog_id = ?; ";
        String currentStatus = loadStatusBlog(blog_id);
        String status = "";
        if (currentStatus.equals("Public")) {
            status = "Draft";
        }
        if (currentStatus.equals("Draft")) {
            status = "Public";
        }
        try {
            int blogId = Integer.parseInt(blog_id);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, blogId);
            int row = st.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean updateBlog(Blog b) {
        String sql = "UPDATE dbo.Blog\n"
                + "SET \n"
                + "    blog_content = ?,\n"
                + "    author_id = ?,\n"
                + "    created_date_blog = ?,\n"
                + "    title_meta = ?,\n"
                + "    title_image_blog = ?,\n"
                + "    status_blog = ?\n"
                + "WHERE blog_id = ?; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBlog_content());
            st.setInt(2, b.getAuthor_id());
            st.setString(3, b.getCreated_date_blog());
            st.setString(4, b.getTitle_meta());
            st.setString(5, b.getTitle_image_blog());
            st.setString(6, b.getStatus_blog());
            st.setInt(7, b.getBlog_id());
            int row = st.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public int loadSizeBlog(int author_id, String status_blog) {
        String sql;
        int size = 0;

        try {
            if (author_id == 0) {
                // Nếu author_id là null, chỉ lọc theo status_blog
                sql = "SELECT COUNT(*) FROM Blog WHERE status_blog = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, status_blog);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {  
                    size = rs.getInt(1);
                }
            } else {
                
                sql = "SELECT COUNT(*) FROM Blog WHERE author_id = ? AND status_blog = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, author_id);
                st.setString(2, status_blog);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    size = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Nên xử lý lỗi tốt hơn trong thực tế
        }

        return size;
    }
    
    public int loadViewBlog(int author_id) {
        String sql;
        int size = 0;

        try {
            if (author_id == 0) {
                // Nếu author_id là null, chỉ lọc theo status_blog
                sql = "SELECT COUNT(blog_view) FROM dbo.Blog";
                PreparedStatement st = connection.prepareStatement(sql);
                
                ResultSet rs = st.executeQuery();
                if (rs.next()) {  
                    size = rs.getInt(1);
                }
            } else {
                
                sql = "SELECT COUNT(blog_view) FROM dbo.Blog WHERE author_id = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, author_id);
                
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    size = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Nên xử lý lỗi tốt hơn trong thực tế
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

    public List<Blog> filterBlog(String[] s, int author_id) {

        List<Blog> list = new ArrayList<>();
        int batch = 10;
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
                + "b.title_meta,b.title_image_blog,b.status_blog,s.admin_fullname,b.blog_view\n"
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
        if(author_id !=0){
            sql+= "and b.author_id = ?";
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
            if (author_id !=0) {
                st.setInt(param, author_id);
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
                        rs.getString(8),
                        rs.getInt(9));
                list.add(b);
            }

        } catch (Exception e) {
        }

        return list;
    }

    public int loadBlogView() {
        String sql = "SELECT COUNT(blog_view) FROM dbo.Blog";
        int result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                result = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return result;
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
                        rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7));
            }

        } catch (Exception e) {
        }
        return b;
    }

}
