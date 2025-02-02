/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage;

import bo.getToken;
import dal.AccountDAO;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.GoogleAccount;


@WebServlet(name="LoginGoogle", urlPatterns={"/login_google"})
public class LoginGoogle extends HttpServlet {
    AccountDAO dao = new AccountDAO();
    UserProfileDAO udao = new UserProfileDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String code = request.getParameter("code");
            String accessToken = getToken.getToken(code);
            GoogleAccount gg = getToken.getUserInfo(accessToken);
            String ms,error = "";
            
            if(!dao.CheckExistGGAccount(gg)){
                if(udao.addAccountGG(gg)){
                    ms = "Đăng kí thành công !!!";
                }
                else{
                    error = "Đăng kí thất bại !!";
                }
            }
            else{
                error= "Tài khoản google này đã được đăng kí trước đây ! Vui lòng thử lại với tài khoản khác!";
            }
            response.sendRedirect("trangchu");
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
        processRequest(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
