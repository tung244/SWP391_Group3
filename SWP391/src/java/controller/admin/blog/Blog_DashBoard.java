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
        String type = request.getParameter("type");
        int sizeDraft = loadFileNameWithAccount_id("10").size();
        int sizePublic = blog.loadSizeBlog("10");

        
        
        request.setAttribute("sizeDraft", sizeDraft);
        request.setAttribute("sizePublic", sizePublic);
        request.setAttribute("total", sizeDraft + sizePublic);

        request.getRequestDispatcher("Blog_DashBoard.jsp").forward(request, response);
    }

    private List<String> loadFileNameWithAccount_id(String author_id) {
        File folder = new File(ConfigWeb.FOLDER_TEMP_BLOG);
        List<String> matchedFiles = new ArrayList<>();

        if (folder.exists() && folder.isDirectory()) {
            File[] files = folder.listFiles((dir, name) -> name.startsWith(author_id + "_") && name.endsWith(".json"));

            if (files != null) {
                for (File file : files) {
                    matchedFiles.add(file.getName());
                }
            }
        }
        return matchedFiles;
    }

    public List<Blog> loadData(String author_id) {
        List<String> nameFile = loadFileNameWithAccount_id(author_id);
        List<Blog> list = new ArrayList<>();
        for (String string : nameFile) {
            String path = ConfigWeb.FOLDER_TEMP_BLOG + File.separator + string;
            try {
                String contentJson = Files.readString(Paths.get(path));
                JSONObject obj = new JSONObject(contentJson);
                Blog b = new Blog(obj.getString("content"),
                        obj.getInt("author_id"),
                        obj.getString("created_date_blog"),
                        obj.getString("title"),
                        obj.getString("image_blog"));
                list.add(b);

            } catch (Exception e) {
            }
        }
        return list;
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
