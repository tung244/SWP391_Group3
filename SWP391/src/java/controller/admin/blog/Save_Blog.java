/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.blog;

import bo.GetFormatDate;
import bo.ImageServices;
import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.nio.file.Paths;
import model.Blog;

@WebServlet(name = "Save_Blog", urlPatterns = {"/admin/save_blog"})
public class Save_Blog extends HttpServlet {

    private BlogDAO blog = new BlogDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Save_Blog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Save_Blog at " + request.getContextPath() + "</h1>");
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
        String content = request.getParameter("content");
        String tieudeMeta = (String) request.getSession().getAttribute("tieudeMeta");
        String thumb = (String) request.getSession().getAttribute("linkThumb");
        String created_date = GetFormatDate.getFormString();       

        String ms = "";
        String error = "";
        Blog b = new Blog(content, 10, created_date, tieudeMeta,thumb);
        if(blog.createBlog(b)){
            ms = "Đăng bài thành công!";
            
        }
        else{
            error = "Đăng bài thất bại !";
        }
        request.getSession().setAttribute("ms", ms);
        request.getSession().setAttribute("error", error);
        request.getSession().removeAttribute("tieudeMeta");
        request.getSession().removeAttribute("linkThumb");
        response.sendRedirect("create_blog");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
