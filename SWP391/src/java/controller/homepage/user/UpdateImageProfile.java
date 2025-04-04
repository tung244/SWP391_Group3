/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage.user;

import bo.ImageServices;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import org.json.JSONObject;

/**
 *
 * @author -ASUS-
 */

@WebServlet(name="UpdateImageProfile", urlPatterns={"/updateimageprofile"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,    // 1MB
    maxFileSize = 2 * 1024 * 1024,        // 2MB tối đa cho mỗi file
    maxRequestSize = 4 * 1024 * 1024      // tổng dung lượng request tối đa (nếu có nhiều file)
)
public class UpdateImageProfile extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateImageProfile</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateImageProfile at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json"); // Đặt kiểu dữ liệu JSON
        response.setCharacterEncoding("UTF-8");
        
        Part part = request.getPart("profileImage");  // "profileImage" là tên input file trong JSP
        String pathHost = getServletContext().getRealPath("").replace("build\\", "");
        System.out.println("File ảnh được lưu tại: " + pathHost);
        
        HttpSession session = request.getSession();
        int account_id = (int) session.getAttribute("account_id");
        
        String fileUrl = ImageServices.uploadImage(part, pathHost);
        
        UserProfileDAO dao = new UserProfileDAO();
        
        
        if (dao.UpdateImageProfile(fileUrl, account_id)) {
            session.setAttribute("ms", "Cập nhật ảnh thành công.");
            response.sendRedirect("userprofile");
        } else {
            session.setAttribute("error", "Cập nhật ảnh thất bại.");
            response.sendRedirect("userprofile");
        }

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
