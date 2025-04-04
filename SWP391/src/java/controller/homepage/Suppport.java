/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage;

import bo.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name="Suppport", urlPatterns={"/support"})
public class Suppport extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Suppport</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Suppport at " + request.getContextPath () + "</h1>");
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
        String supportName = request.getParameter("supportName");
        String supportContact = request.getParameter("supportContact");
        String supportMessage = request.getParameter("supportMessage");
        Thread emailThread = new Thread(() -> {  // thread gửi mail khác luồng
                try {
                    System.out.println("đến 3");
                    SendMail.guiSupport(supportContact, supportMessage, supportName);

                } catch (Exception e) {
                    e.printStackTrace();  // Log lỗi nếu có
                }
            });
            emailThread.start();
            
        String ms = "Gửi hỗ trợ thành công! Hãy chú ý email hoặc số điện thoại để chúng tôi có thể hỗ trợ bạn !";        
        HttpSession session = request.getSession();
        session.setAttribute("ms", ms);
        response.sendRedirect("trangchu");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
