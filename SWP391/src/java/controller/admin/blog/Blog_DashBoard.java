/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.blog;

import com.google.api.client.json.Json;
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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Blog;
import org.json.JSONObject;

@WebServlet(name = "Blog_DashBoard", urlPatterns = {"/admin/blog_dashboard"})
public class Blog_DashBoard extends HttpServlet {

    private BlogDAO blog = new BlogDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Account a = (Account) request.getSession().getAttribute("account");
        int sizeDraft = 0; int sizePublic = 0; int view = 0;
        if (a.getRole().getRole_id() != 1) {
            sizeDraft = blog.loadSizeBlog(a.getAccount_id(), ConfigWeb.STATUS_DRAFT_BLOG);
            sizePublic = blog.loadSizeBlog(a.getAccount_id(), ConfigWeb.STATUS_PUBLIC_BLOG);
            view = blog.loadViewBlog(a.getAccount_id());
        }
        
        if (a.getRole().getRole_id() == 1) {
            sizeDraft = blog.loadSizeBlog(0, ConfigWeb.STATUS_DRAFT_BLOG);
            sizePublic = blog.loadSizeBlog(0, ConfigWeb.STATUS_PUBLIC_BLOG);
            view = blog.loadViewBlog(0);
        }
        
        

        String[] info = getInfo(request);

        List<Blog> list = new ArrayList<>();
        if (a.getRole().getRole_id() != 1) {
            list = blog.filterBlog(info, a.getAccount_id());
        }
        if (a.getRole().getRole_id() == 1) {
            list = blog.filterBlog(info, 0);
        }
        
        int numberPage = calculatePage(blog.calculateTotalBlog(info));
        System.out.println(blog.calculateTotalBlog(info));
        System.out.println(numberPage);
        int currentNumber = Integer.parseInt(info[2]);
        int nextNumber = currentNumber + 5;
        if (nextNumber >= numberPage) {
            nextNumber = numberPage;
        }
        request.setAttribute("totalView", view);
        request.setAttribute("nextNumber", nextNumber);
        request.setAttribute("currentPage", currentNumber);
        request.setAttribute("numberPage", numberPage);
        request.setAttribute("list", list);
        request.setAttribute("sizeDraft", sizeDraft);
        request.setAttribute("sizePublic", sizePublic);
        request.setAttribute("total", sizeDraft + sizePublic);

        request.getRequestDispatcher("Blog_DashBoard.jsp").forward(request, response);
    }

    private int calculatePage(int size) {
        int batch = 10;
        return (int) Math.ceil((double) size / batch);
    }

    private String[] getInfo(HttpServletRequest request) {

        String type = request.getParameter("type");
        String search = request.getParameter("search");
        String page = request.getParameter("page");
        String pageNew = page == null ? "1" : page;
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");
        return new String[]{type, search, pageNew, dateFrom, dateTo};
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
