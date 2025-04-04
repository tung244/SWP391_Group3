/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.blog;

import bo.GetFormatDate;
import bo.ImageServices;
import bo.blog.CutJavaScriptBlog;
import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Path;
import model.Blog;

@MultipartConfig
@WebServlet(name = "Update_Blog", urlPatterns = {"/admin/update_blog"})
public class Update_Blog extends HttpServlet {

    BlogDAO blog = new BlogDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Update_Blog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Update_Blog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String blog_id = request.getParameter("blog_id");
        System.out.println(blog_id);

        try {
            int blogId = Integer.parseInt(blog_id);
            Blog b = blog.loadBlog(blogId);
            String content = CutJavaScriptBlog.cutJavaScript(b.getBlog_content());
            b.setBlog_content(content);
            System.out.println(b.getBlog_content());
            request.setAttribute("blog", b);

        } catch (Exception e) {
        }

        request.getRequestDispatcher("Update_Blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String blog_id = request.getParameter("blog_id");
        Part path = request.getPart("thumbnail_image");
        String postContent = request.getParameter("postContent");
        String tieudeMeta = request.getParameter("title_meta");
        String linkOldThumb = request.getParameter("thumb_old");
        String ms = "";
        String error = "";
        try {
            int blogId = Integer.parseInt(blog_id);
            if (path != null && path.getSize() > 0) {
                String pathHost = getServletContext().getRealPath("");
                String finalPath = pathHost.replace("build\\", "");
                String linkFile = ImageServices.uploadImageThumbBlog(path, finalPath);
                Blog b = new Blog(blogId,
                        postContent,
                        10,
                        GetFormatDate.getFormString(),
                        tieudeMeta,
                        linkFile,
                        "Public");
                if (blog.updateBlog(b)) {
                    ms = "Update thành công !!";
                } else {
                    error = "Update không thành công !!";
                }
            }
            if (linkOldThumb != null && !linkOldThumb.isEmpty()) {
                System.out.println("Không sửa ảnh, xài link cũ");
                Blog b = new Blog(blogId,
                        postContent,
                        10,
                        GetFormatDate.getFormString(),
                        tieudeMeta,
                        linkOldThumb,
                        "Public");
                if (blog.updateBlog(b)) {
                    ms = "Update thành công !!";
                } else {
                    error = "Update không thành công !!";
                }
            } else {
                error = "Thiếu ảnh tiêu đề cho bài viết";
                
            }

        } catch (Exception e) {
        }
        request.getSession().setAttribute("ms", ms);
        request.getSession().setAttribute("error", error);
        response.sendRedirect("blog_dashboard");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
