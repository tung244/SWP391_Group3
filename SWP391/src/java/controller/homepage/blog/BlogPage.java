/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage.blog;

import dal.BlogDAO;
import dal.StaffDAO;
import model.Blog;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name="Blog", urlPatterns={"/blog"})
public class BlogPage extends HttpServlet {
    private BlogDAO bdao = new BlogDAO();
    private StaffDAO sdao = new StaffDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Blog</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Blog at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String blog_id = request.getParameter("blog");
        try {
            int blogId  = Integer.parseInt(blog_id);
            Blog blog = bdao.loadBlog(blogId);
            
            String[] authorInfo = sdao.loadStaffBlog(blog.getAuthor_id());
            
            request.setAttribute("author", authorInfo);
            request.setAttribute("blog", blog);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("homepage/DemoBlog.jsp").forward(request, response);
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
