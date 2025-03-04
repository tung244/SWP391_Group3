/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.customer;

import com.google.gson.Gson;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;
import model.Customers;

/**
 *
 * @author Nguyen Phu Thinh
 */
@WebServlet(name = "CustomerDetail", urlPatterns = {"/admin/CustomerDetail"})
public class CustomerDetail extends HttpServlet {
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
            out.println("<title>Servlet CustomerDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerDetail at " + request.getContextPath () + "</h1>");
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
         int accountId = Integer.parseInt(request.getParameter("id"));
        CustomerDAO dao = new CustomerDAO();
        Customers customer = dao.GetCustomerById(accountId);
        if(customer.getDob() == null){
        customer.setDob("Chưa cập nhật");
        }
        
        if(customer.getGender() == null){
            customer.setGender("Không rõ");
        }
        
        if (customer.getAddress() == null){
            customer.setAddress("Chưa cập nhật");
        }
        
        if (customer.getPhonenumber() == null){
            customer.setPhonenumber("Đang cập nhật");
        }
        
        if ("5".equals(customer.getRole_id())){
            customer.setRole_id("Customer");
        }
        
        if (customer.getImage_profile_user() == null || customer.getImage_profile_user().endsWith(".jpg, .png")|| customer.getImage_profile_user().isEmpty()){
            customer.setImage_profile_user("https://cdn.kona-blue.com/upload/kona-blue_com/post/images/2024/09/18/457/avatar-mac-dinh-10.jpg");
        }
        if (customer != null) {
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(Map.of("success", true, "data", customer));
            response.setContentType("application/json");
            response.getWriter().write(jsonResponse);
        } else {
            response.getWriter().write("{\"success\": false}");
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
