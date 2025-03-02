/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import bo.GetFormatDate;
import dal.AccountDAO;
import dal.DoctorsDAO;
import dal.PassWordDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Doctors;
import model.Role;

/**
 *
 * @author PC
 */
@WebServlet(name = "CreateAccDoctor", urlPatterns = {"/admin/createAccount"})
public class CreateAccDoctor extends HttpServlet {

    GetFormatDate getdate = new GetFormatDate();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet CreateAccDoctor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateAccDoctor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("createAccDoctor.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO accdao = new AccountDAO();
        PassWordDAO passdao = new PassWordDAO();
        String action = request.getParameter("action");
        String respsonse = "";
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        if(action.equals("checkUserName")){
            String username = request.getParameter("user_name").trim();
            String status = "valid";
            if(accdao.checkTonTaiUser(username)){
                status = "exist";
            }else if(username.isEmpty()){
                status = "empty";
            } 
            
            respsonse = "{\"status\":\"" + status + "\"}";
        }
        
        if(action.equals("checkPhone")){
            String phone = request.getParameter("phone").trim();
            String status = "valid";
            if(accdao.checkExistPhone(phone)){
                status = "exist";
            }else if(phone.isEmpty()){
                status = "empty";
            }
            
            respsonse = "{\"status\":\"" + status + "\"}";
        }
        
        if(action.equals("checkEmail")){
            String email = request.getParameter("email").trim();
            String status = "valid";
            if(accdao.CheckExistEmail(email)){
                status = "exist";
            }else if(email.isEmpty()){
                status = "empty";
            }
            
            respsonse = "{\"status\":\"" + status + "\"}";
        }
        
        response.getWriter().write(respsonse);
        
        if(action.equals("register")){
            String username = request.getParameter("username");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String pass = passdao.randomPassword();
            String passEncrypt = passdao.hashPasswordMD5(pass);
            Account acc = new Account();
            acc.setUsername(username);
            acc.setPhonenumber(phone);
            acc.setEmail(email);
            acc.setPassword(passEncrypt);
            acc.setCreated_date(getdate.getFormString());
            acc.setRole(new Role(3,""));
            
            Doctors doc = new Doctors();
            doc.setAcc(acc);
            request.getSession().setAttribute("pass", pass);
            request.getSession().setAttribute("doctor", doc);
            request.getSession().setAttribute("progress", 35);
            response.sendRedirect("createDoctor");
        }
                
//     

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
