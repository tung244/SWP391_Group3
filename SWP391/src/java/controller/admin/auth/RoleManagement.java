/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.auth;

import dal.AccountDAO;
import dal.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Modules;
import model.Permission;
import model.Role;


@WebServlet(name="RoleManagement", urlPatterns={"/admin/role_management"})
public class RoleManagement extends HttpServlet {
    RoleDAO rdao = new RoleDAO();
    AccountDAO adao = new AccountDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RoleManagement</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoleManagement at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String roleId = request.getParameter("role_id");
        Account a = (Account) request.getSession().getAttribute("account");
        
        
        List<Role> r = rdao.getAllRole();
        
        if (a.getRole().role_id == 1) {
            List<Role> role = rdao.getAllRole();
            request.setAttribute("role", role);
            if(roleId == null){
                roleId = "1";
            }
            try {
                int roleid = Integer.parseInt(roleId);
                Map<Modules,List<Permission>> map = adao.loadMCustomRole(roleid);
                request.setAttribute("roleId", roleId);
                request.setAttribute("module", map);
            } catch (Exception e) {
            }
            
        }
        request.setAttribute("role", r);
        request.getRequestDispatcher("RoleManagement.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        int permissionId = Integer.parseInt(request.getParameter("permissionId"));
        boolean isChecked = Boolean.parseBoolean(request.getParameter("isChecked"));

        try {
            if (isChecked) {
                adao.addPermissionToRole(roleId, permissionId);
            } else {
                adao.removePermissionFromRole(roleId, permissionId);
            }
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Permission updated successfully");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error updating permission");
            e.printStackTrace();
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
