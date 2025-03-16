/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.StaffDetail;
import model.Staffs;

/**
 *
 * @author -ASUS-
 */
@WebServlet(name="LoadStaffDetail", urlPatterns={"/loadstaffdetail"})
public class LoadStaffDetail extends HttpServlet {
   
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
            out.println("<title>Servlet LoadStaffDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadStaffDetail at " + request.getContextPath () + "</h1>");
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
        //processRequest(request, response);
        String idRaw = request.getParameter("staffId");
        StaffDAO daoStaff = new StaffDAO();
        Staffs s = new Staffs();
        try {
            int id = Integer.parseInt(idRaw);
            s = daoStaff.getStaffById(id);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
         response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Tạo HTML cho bảng chi tiết
        out.println("<div class='container-fluid'>");
        out.println("<table class='table'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>Admin_hired_date</th>");
        out.println("<th>Salary</th>");
        
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        out.println("<tr>");
        out.println("<td>" + s.getAdmin_hired_date()+ "</td>");
        out.println("<td>" + s.getAdmin_salary() + "</td>");
        
        out.println("<td>");
        out.println("</td>");
        out.println("</tr>");

        out.println("</tbody>");
        out.println("</table>");
        out.println("</div>");
        
//        out.println("<div class='container-fluid'>");
//        out.println("<table class='table'>");
//        out.println("<thead>");
//        out.println("<tr><th>Ảnh</th><th>Admin_hired_date</th><th>Salary</th></tr>");
//        out.println("</thead>");
//        out.println("<tbody>");
//        out.println("<tr>");
//
//        
//        if (s.getImage_profile_admin() != null && !s.getImage_profile_admin().isEmpty()) {
//            out.println("<td><img src='" + s.getImage_profile_admin() + "' width='100'></td>");
//        } else {
//            out.println("<td>Không có ảnh</td>");
//        }
//
//        out.println("<td>" + s.getAdmin_hired_date() + "</td>");
//        out.println("<td>" + s.getAdmin_salary() + "</td>");
//        out.println("</tr>");
//        out.println("</tbody>");
//        out.println("</table>");
//        out.println("</div>");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        
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
