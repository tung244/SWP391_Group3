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
import model.Account;
import model.Blog;
import model.Comment;
import model.Role;

public class CommentDAO extends DBContext {

    public boolean createCommentBasic(Comment c) {
        String sql = "INSERT INTO dbo.CommentBlog\n"
                + "(comment,author_id,tuongtac,parent_comment_id,blog_id)\n"
                + "VALUES\n"
                + "(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getComment());
            st.setInt(2, c.getAuthor().getAccount_id());
            st.setInt(3, c.getTuongtac());
            st.setInt(4, c.getParent_comment_id());
            st.setInt(5, c.getBlog().getBlog_id());
            System.out.println(sql);
            int affect_row = st.executeUpdate();
            if (affect_row == 1) {
                return true;
            }

        } catch (Exception e) {
        }

        return false;
    }

    public int plus1Like(int comment_id) {
        String sql = "UPDATE dbo.CommentBlog\n"
                + "    SET tuongtac = tuongtac + 1\n"
                + "    OUTPUT INSERTED.tuongtac AS UpdatedLikeCount\n"
                + "    WHERE comment_blog_id = ?";
        int result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, comment_id);
            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return result;
    }

    public static void main(String[] args) {
        CommentDAO c = new CommentDAO();
        Map<Comment, List<Comment>> list = c.loadCommentBlog(4);
        for (Map.Entry<Comment, List<Comment>> entry : list.entrySet()) {
            Comment key = entry.getKey();
            List<Comment> value = entry.getValue();
            System.out.println("key");
            System.out.println(key.getComment_date());
            for (Comment comment : value) {
                System.out.println("value");
                System.out.println(comment.getComment_date());
            }
        }
    }

    public Map<Comment, List<Comment>> loadCommentBlog(int blog_id) {
        String sql = "SELECT * FROM dbo.CommentBlog c JOIN dbo.Accounts a ON a.account_id = c.author_id \n"
                + "JOIN dbo.Customers cu ON cu.account_id = a.account_id\n"
                + "WHERE blog_id = ?";
        Map<Comment, List<Comment>> map = new HashMap<>();
        List<Comment> allComments = new ArrayList<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, blog_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int commentBlogId = rs.getInt("comment_blog_id");
                String content = rs.getString("comment");

                int tuongtac = rs.getInt("tuongtac");
                int parentCommentId = rs.getInt("parent_comment_id");

                int blogId = rs.getInt("blog_id");
                System.out.println(sql);
                Account a = new Account(rs.getInt("author_id"),
                        "", "", "",
                        "", "", new Role(0, ""));
                Comment comment = new Comment(commentBlogId,
                        content,
                        a,
                        tuongtac,
                        parentCommentId, new Blog(blogId, "", 0, ""),
                        rs.getString("comment_date"),
                        rs.getString("full_name"));
                allComments.add(comment);
            }

            Map<Integer, Comment> commentById = new HashMap<>();
            for (Comment comment : allComments) {
                commentById.put(comment.getComment_blog_id(), comment);

                if (comment.getParent_comment_id() == 0) {
                    map.put(comment, new ArrayList<>());
                }
            }

            for (Comment comment : allComments) {
                if (comment.getParent_comment_id() != 0) {
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
}
