/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.blog;

import bo.ImageServices;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 *
 * @author fptshop
 */
@MultipartConfig
@WebServlet(name = "SavePostServlet", urlPatterns = {"/admin/demo_Post"})
public class DemoPost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SavePostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SavePostServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("DemoBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String postContent = request.getParameter("postContent");
        String tieudeMeta = request.getParameter("title_meta");
        
        
        Part thumb = request.getPart("thumbnail_image");
        String pathHost = getServletContext().getRealPath("");
        String finalPath = pathHost.replace("build\\", ""); 
        String linkFile = ImageServices.uploadImageThumbBlog(thumb, finalPath);
        
        request.getSession().setAttribute("tieudeMeta", tieudeMeta);
        request.getSession().setAttribute("linkThumb", linkFile);
        request.getSession().setAttribute("postContent", postContent);
        
        request.getRequestDispatcher("DemoBlog.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
