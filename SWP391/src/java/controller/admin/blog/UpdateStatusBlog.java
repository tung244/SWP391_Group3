/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.blog;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateStatusBlog", urlPatterns = {"/admin/update_status_blog"})
public class UpdateStatusBlog extends HttpServlet {

    private BlogDAO blogdao = new BlogDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String respsone = "";
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String blog = request.getParameter("blog").trim();
        String status = "notOke";
        
        
        if (blogdao.updateStatusBlog(blog)) {
            status = "oke";
        }
        
        respsone = "{\"status\":\"" + status + "\"}";
        response.getWriter().write(respsone);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
