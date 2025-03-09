/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.blog;

import bo.GetFormatDate;
import consts.ConfigWeb;
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
import org.json.JSONObject;

@WebServlet(name = "Save_Draft", urlPatterns = {"/admin/save_draft"})
public class Save_Draft extends HttpServlet {

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
        String ms = ""; String error = "";
        if ("step1".equals(method)) {  
            String[] s = new String[5];
            s[0] = request.getParameter("tieude_draft");
            s[1] = request.getParameter("content_draft");
            s[2] = "";
            s[3] = GetFormatDate.getFormString();
            s[4] = "10";  // sau thay thanh account_id
            createJsonDraftBlog(s,"10");
            ms = "Lưu bản nháp thành công !!";
            response.sendRedirect("blog_dashboard");
        }
        
    }
    
    private void createJsonDraftBlog(String[] blogDraft, String account_id){
        JSONObject obj = new JSONObject();
        String file = normalizeString(blogDraft[0]);
        Path path = Paths.get(ConfigWeb.FOLDER_TEMP_BLOG + File.separator+ account_id+"_" +file+ normalizeString(GetFormatDate.getFormString())+".json");
        obj.put("title", blogDraft[0]);
        obj.put("content", blogDraft[1]);
        obj.put("image_blog", blogDraft[2]);
        obj.put("created_date_blog", blogDraft[3]);
        obj.put("author_id", blogDraft[4]);
        try {
            // Ghi JSON vào file (file tự động tạo nếu chưa có)
            Files.write(path, obj.toString(4).getBytes(StandardCharsets.UTF_8));
            System.out.println("Dữ liệu đã ghi vào file.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    private String normalizeString(String str){
        str = str.length() >=15 ? str.substring(0, 15) : str;
        String str2 = str.replaceAll("[\\\\/:*?\"<>|]", "");
        String normalize = Normalizer.normalize(str2, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        return normalize.replace(" ", "_");
    }
   

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
