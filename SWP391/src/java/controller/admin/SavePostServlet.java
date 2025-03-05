/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author fptshop
 */
@WebServlet(name="SavePostServlet", urlPatterns={"/admin/SavePostServlet"})
public class SavePostServlet extends HttpServlet {
   
    
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
            out.println("<h1>Servlet SavePostServlet at " + request.getContextPath () + "</h1>");
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
        // Thiết lập encoding để hỗ trợ tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Lấy dữ liệu từ form (chỉ có nội dung)
        String postContent = request.getParameter("postContent");

        // Xử lý dữ liệu (in ra console)
        System.out.println("Nội dung: " + postContent);

        // Phản hồi
        response.getWriter().write("<h2>Bài viết đã được lưu!</h2>");
        response.getWriter().write("<div>" + postContent + "</div>");
        response.getWriter().write("<a href='" + request.getContextPath() + "/editor.jsp'>Quay lại soạn thảo</a>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
