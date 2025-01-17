/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage;

import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="Verification_Method", urlPatterns={"/verification_method"})
public class Verification_Method extends HttpServlet {
    
    UserProfileDAO udao = new UserProfileDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Verification_Method</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Verification_Method at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username  = (String) session.getAttribute("username_forgot");
        
        String[] infoUser = udao.loadPhoneAndEmailUser(username);
        infoUser[1]  = infoUser[1].substring(0, 5)+"**********"+ infoUser[1].substring(infoUser[1].length()-9,infoUser[1].length());
        infoUser[0] = infoUser[0].substring(0, 3)+"**********"+infoUser[0].substring(infoUser[0].length()-2,infoUser[0].length());
        request.setAttribute("infoUser", infoUser);
        request.getRequestDispatcher("homepage/verification_method.jsp").forward(request, response);
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
