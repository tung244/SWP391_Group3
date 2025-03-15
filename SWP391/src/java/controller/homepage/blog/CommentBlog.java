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
import model.Comment;

@WebServlet(name = "CommentBlog", urlPatterns = {"/comment"})
public class CommentBlog extends HttpServlet {

    private CommentDAO cdao = new CommentDAO();

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
//        String method = request.getParameter("method");
//        String ms = "";
//        String error = "";
//        if (method.equals("basicComment")) {
//            String comment = request.getParameter("comment");
//            String blog_id = request.getParameter("blogid");
//            String author_id = request.getParameter("author_id");
//
//            if (author_id == null || author_id.isEmpty()
//                    || blog_id == null || blog_id.isEmpty()
//                    || comment == null || comment.isEmpty()) {
//                error = "Lỗi! Vui lòng thử lại";
//                return;
//            }
//            try {
//                int blogID = Integer.parseInt(blog_id);
//                int authorID = Integer.parseInt(author_id);
//                Comment cmt = new Comment(blogID, authorID, 0,
//                         comment);
//                if (cdao.createCommentBasic(cmt)) {
//                    ms = "Bình luận thành công!!";
//                } else {
//                    error = "Lỗi! Không thể bình luận!";
//                }
//            } catch (Exception e) {
//            }
//            request.getSession().setAttribute("ms", ms);
//            request.getSession().setAttribute("error", error);
//            response.sendRedirect("blog?blog=" + blog_id);
//
//        }
        
//        if(method.equals("childComment")){
//            String comment = request.getParameter("comment");
//            String blog_id = request.getParameter("blogid");
//            String author_id = request.getParameter("author_id");
//            if (author_id == null || author_id.isEmpty()
//                    || blog_id == null || blog_id.isEmpty()
//                    || comment == null || comment.isEmpty()) {
//                error = "Lỗi! Vui lòng thử lại";
//                return;
//            }
//            try {
//                int blogID = Integer.parseInt(blog_id);
//                int authorID = Integer.parseInt(author_id);
//                Comment cmt = new Comment(blogID, authorID, 0,
//                         comment);
//                if (cdao.createCommentBasic(cmt)) {
//                    ms = "Bình luận thành công!!";
//                } else {
//                    error = "Lỗi! Không thể bình luận!";
//                }
//            } catch (Exception e) {
//            }
//            request.getSession().setAttribute("ms", ms);
//            request.getSession().setAttribute("error", error);
//            response.sendRedirect("blog?blog=" + blog_id);
//        }

    }

    private String[] getInfoBasic(HttpServletRequest request) {

        String content = request.getParameter("comment");
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
