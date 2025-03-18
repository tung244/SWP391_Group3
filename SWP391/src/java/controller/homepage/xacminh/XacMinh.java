/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.xacminh;

import bo.GetFormatDate;
import dal.AccountDAO;
import dal.TokenDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "XacMinh", urlPatterns = {"/xacminh"})
public class XacMinh extends HttpServlet {

    TokenDAO tdao = new TokenDAO();
    AccountDAO adao = new AccountDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet XacMinh</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XacMinh at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String[] raw = token.split("x", 2);
        
        String ms = "";
        String error = "";
        try {
            int account_id = Integer.parseInt(raw[0]);
            String[] tokendb = tdao.loadToken(account_id);
            if(tokendb ==null){
                error = "Đường dẫn bị sai, Vui lòng thử lại !";
                request.getSession().setAttribute("error", error);
                response.sendRedirect("trangchu");
            }
            if (token.equals(tokendb[1])&& raw[0].equals(tokendb[2])) {
                ms = "Xác minh thành công!";
                adao.updateStatusUser(account_id);
                request.getSession().setAttribute("ms", ms);
                response.sendRedirect("login");
            } else {
                error = "Xác minh thất bại! Vui lòng thử lại";
                request.getSession().setAttribute("error", error);
                response.sendRedirect("trangchu");
            }
        } catch (Exception e) {
        }

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
