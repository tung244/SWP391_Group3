/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.blog;

import dal.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Blog;
import model.Comment;
import model.UserProfile;

@WebServlet(name = "CommentBlog", urlPatterns = {"/comment"})
public class CommentBlog extends HttpServlet {

    CommentDAO cdao = new CommentDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CommentBlog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentBlog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("method");
        String ms = "";
        String error = "";
        UserProfile a = (UserProfile) request.getSession().getAttribute("user");
        if (method.equals("basicComment")) {

            String comment = request.getParameter("comment");
            String blog_id = request.getParameter("blog_id");
            System.out.println(comment);
            System.out.println(blog_id);
            try {
                int blogId = Integer.parseInt(blog_id);
                Comment c = new Comment(comment,
                        a.getAccount(),
                        0, 0,
                        new Blog(blogId, "", 0, ""));
                System.out.println("Chuẩn bị lưu");
                if (cdao.createCommentBasic(c)) {
                    ms = "Bình luận thành công!";
                } else {
                    error = "Đã có lỗi xảy ra. Vui lòng thử lại!!";
                }

            } catch (Exception e) {
            }
            request.getSession().setAttribute("ms", ms);
            request.getSession().setAttribute("error", error);
            response.sendRedirect("blog?blog=" + blog_id);

        }
        
        if(method.equals("childComment")){
            String blog_id = request.getParameter("blogid");
            String parent_comment_id = request.getParameter("parent_comment_id");
            String comment = request.getParameter("comment");
            System.out.println("hehe");
            System.out.println(blog_id);
            System.out.println(parent_comment_id);
            System.out.println(comment);
        }
        
        
        String respsone = "";
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (method.equals("likeComment")) {
            int result = 0;
            String comment_id = request.getParameter("comment_id").trim();
            String status = "notOke";
            try {
                int commentId = Integer.parseInt(comment_id);
                result = cdao.plus1Like(commentId);
                if (result > 0) {
                    status = "Oke";
                }

                respsone = "{\"status\":\"" + status + "\",\"like\":\"" + result + "\"}";
            } catch (Exception e) {
            }

        }
        response.getWriter().write(respsone);
    }

   

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
