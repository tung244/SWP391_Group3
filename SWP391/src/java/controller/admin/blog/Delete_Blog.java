
package controller.admin.blog;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name="Delete_Blog", urlPatterns={"/admin/delete_blog"})
public class Delete_Blog extends HttpServlet {
    BlogDAO blog = new BlogDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Delete_Blog</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Delete_Blog at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String blog_id = request.getParameter("blog_id");
        System.out.println(blog_id);
        String ms = ""; String error ="";
        if(blog.deleteBlog(blog_id)){
            ms = "Xóa bài viết thành công!";
        }
        else{
            error = "Xóa bài viết không thành công !";
        }
        request.getSession().setAttribute("ms", ms);
        request.getSession().setAttribute("error", error);
        response.sendRedirect("blog_dashboard");
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
