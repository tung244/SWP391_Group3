/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Blog;
import model.Comment;

/**
 *
 * @author fptshop
 */
public class CommentDAO extends DBContext {

    public boolean createCommentBasic(Comment c) {
        String sql = "INSERT INTO dbo.CommentBlog\n"
                + "( commnent, author_id, tuongtac, blog_id)\n"
                + "VALUES\n"
                + "( ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getComment());
            st.setInt(2, c.getAuthor_id());
            st.setInt(3, c.getTuongtac());
            st.setInt(4, c.getBlog_id());
            int affect_row = st.executeUpdate();
            if (affect_row == 1) {
                return true;
            }

        } catch (Exception e) {
        }

        return false;
    }
    
    
    
   public Map<Comment, List<Comment>> loadCommentBlog(int blog_id) {
    String sql = "SELECT * FROM dbo.CommentBlog WHERE blog_id = ?";
    Map<Comment, List<Comment>> map = new HashMap<>();
    List<Comment> allComments = new ArrayList<>();

    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, blog_id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            int commentBlogId = rs.getInt("comment_blog_id");
            String content = rs.getString("comment");
            int authorId = rs.getInt("author_id");
            int tuongtac = rs.getInt("tuongtac");
            int parentIdFromDb = rs.getInt("parent_comment_id");
            int parentCommentId = rs.wasNull() ? -1 : parentIdFromDb; // Gán -1 thay vì null
            int blogId = rs.getInt("blog_id");

            Comment comment = new Comment(commentBlogId, blogId, authorId, tuongtac, parentCommentId, content);
            allComments.add(comment);
        }

        Map<Integer, Comment> commentById = new HashMap<>();
        for (Comment comment : allComments) {
            commentById.put(comment.getComment_blog_id(), comment);

            // Kiểm tra bình luận gốc với -1 thay vì null
            if (comment.getParent_comment_id() == -1) {
                map.put(comment, new ArrayList<>());
            }
        }

        for (Comment comment : allComments) {
            if (comment.getParent_comment_id() != -1) { // Kiểm tra khác -1 thay vì != null
                Comment parentComment = commentById.get(comment.getParent_comment_id());
                if (parentComment != null && map.containsKey(parentComment)) {
                    map.get(parentComment).add(comment);
                }
            }
        }

    } catch (SQLException e) {
        e.printStackTrace(); 
    }

    return map;
}
   
    public static void main(String[] args){
        CommentDAO cdao = new CommentDAO();
        
        Map<Comment,List<Comment>> result = cdao.loadCommentBlog(6);
        for (Map.Entry<Comment, List<Comment>> entry : result.entrySet()) {
            Object key = entry.getKey();
            Object val = entry.getValue();
            System.out.println(key);
            System.out.println(val);
        }
    }
    
   
}
