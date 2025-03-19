/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.blog;

import bo.blog.CutJavaScriptBlog;
import dal.BlogDAO;
import dal.CommentDAO;
import dal.StaffDAO;
import model.Blog;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Comment;

@WebServlet(name = "Blog", urlPatterns = {"/blog"})
public class BlogPage extends HttpServlet {

    private BlogDAO bdao = new BlogDAO();
    private StaffDAO sdao = new StaffDAO();
    private CommentDAO cdao = new CommentDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String blog_id = request.getParameter("blog");
        try {
            int blogId = Integer.parseInt(blog_id);
            
            Blog blog = bdao.loadBlog(blogId);
            blog.setBlog_content(CutJavaScriptBlog.cutJavaScript(blog.getBlog_content()));

            String[] authorInfo = sdao.loadStaffBlog(blog.getAuthor_id());

            String str = "hehe";
            
            char[] s = str.toCharArray();
            for (int i = 0; i < s.length; i++) {
                
            }
            
            
            System.out.println(bdao.plus1View(blogId));
            
            Map<Comment, List<Comment>> comment = cdao.loadCommentBlog(blogId);

            request.setAttribute("comment", comment);
            request.setAttribute("author", authorInfo);
            request.setAttribute("blog", blog);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("homepage/BlogSingle.jsp").forward(request, response);
    }
    
    private void plus1View(int blogId){
        Thread plus1View = new Thread(() -> {  
            try {
                System.out.println("đến 3");
                bdao.plus1View(blogId);

            } catch (Exception e) {
                e.printStackTrace();  
            }
        });
        plus1View.start();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
