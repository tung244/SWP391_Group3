/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.email;

import consts.Gmails;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name="LoginShowEmail", urlPatterns={"/admin/login_show_email"})
public class LoginShowEmail extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String authUrl = "https://accounts.google.com/o/oauth2/auth?"
                + "client_id=" + Gmails.CLIENT_ID
                + "&redirect_uri=" + Gmails.REDIRECT_URI
                + "&response_type=code"
                + "&scope=https://www.googleapis.com/auth/gmail.send "
                + "https://www.googleapis.com/auth/gmail.compose "
                + "https://www.googleapis.com/auth/gmail.modify"
                + "&access_type=offline"
                + "&prompt=consent";


        response.sendRedirect(authUrl);
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
