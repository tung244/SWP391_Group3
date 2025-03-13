/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.blog;

import bo.GetFormatDate;
import consts.ConfigWeb;
import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.Normalizer;
import model.Blog;
import org.json.JSONObject;

@WebServlet(name = "Save_Draft", urlPatterns = {"/admin/save_draft"})
public class Save_Draft extends HttpServlet {

    private BlogDAO bdao = new BlogDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Save_Draft</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Save_Draft at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("method");
        String account_id = (String) request.getSession().getAttribute("account_id");
        String content = request.getParameter("content_draft");
        String tieude = request.getParameter("tieude_draft");

        String ms = "";
        String error = "";
        System.out.println(content);
        System.out.println(tieude);
        if ("step1".equals(method)) {
            Blog b = new Blog(content, 10,
                    GetFormatDate.getFormString(),
                    tieude,
                    "",
                    ConfigWeb.STATUS_DRAFT_BLOG);
            if (bdao.saveDraftBlog(b)) {
                ms = "Lưu bản nháp thành công !!";
                request.getSession().setAttribute("ms", ms);
                response.sendRedirect("blog_dashboard");
            }
            else{
                
                error = "Lưu bản nháp không thành công !!";
                request.getSession().setAttribute("error", error);
                response.sendRedirect("blog_dashboard");
            }
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
