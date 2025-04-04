/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage;

import bo.EncryptPassword;
import dal.AccountDAO;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name="CreateNewPassword", urlPatterns={"/create_new_password"})
public class CreateNewPassword extends HttpServlet {
    
    UserProfileDAO udao = new UserProfileDAO();
    AccountDAO adao = new AccountDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateNewPassword</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateNewPassword at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("homepage/ChangePassword.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String password_new = request.getParameter("new_password");
        String confirm_password = request.getParameter("confirm_password");
        String ms = "";
        String error = "";
        HttpSession session = request.getSession();
        
        if(!password_new.equals(confirm_password)){
            error = "Mật khẩu và xác thực không trùng khớp!! Vui lòng thử lại!";
            session.setAttribute("error", error);
            response.sendRedirect("create_new_password");
            return;
        }
        int account_id = adao.getAccountID((String)session.getAttribute("username_forgot"));
        
        udao.updatePassword(EncryptPassword.hashPassword(password_new), account_id);
        ms = "Update mật khẩu thành công!!";
        session.setAttribute("ms", ms);
        request.getSession().removeAttribute("username_forgot");
        response.sendRedirect("trangchu");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
