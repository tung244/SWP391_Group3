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
import model.Staffs;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Role;

/**
 *
 * @author DELL
 */
@WebServlet(name = "UpdateStaff", urlPatterns = {"/admin/UpdateStaff"})
public class UpdateStaff extends HttpServlet {

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
            out.println("<title>Servlet UpdateStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStaff at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        StaffDAO dao = new StaffDAO();
        Staffs s = null;
        try {
            int id = Integer.parseInt(id_raw);
            s = dao.getStaffById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("staff", s);
        request.getRequestDispatcher("UpdateStaff.jsp").forward(request, response);
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
        try {
            int accountId = Integer.parseInt(request.getParameter("account_id"));
            String adminFullname = request.getParameter("admin_fullname");
            String adminAddress = request.getParameter("admin_address");
            Date adminDob = Date.valueOf(request.getParameter("admin_dob"));
            String adminGender = request.getParameter("admin_gender");
            String roleName = request.getParameter("role_name");
            StaffDAO dao = new StaffDAO();
            // Tạo đối tượng Role
            Role role = new Role();
            role.setRole_name(roleName);
            // Bạn có thể cần thêm logic để lấy role_id nếu cần

            // Tạo đối tượng Account
            Account account = new Account();
            account.setAccount_id(accountId);
            account.setRole(role);

            // Tạo đối tượng Staff
            Staffs staff = new Staffs();
            staff.setAccount(account);
            staff.setAdmin_fullname(adminFullname);
            staff.setAdmin_address(adminAddress);
            staff.setAdmin_dob(adminDob);
            staff.setAdmin_gender(adminGender);

            // Gọi phương thức cập nhật
            boolean isUpdated = dao.updateStaff(staff);
            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/admin/ListStaff");
            } else {
                request.setAttribute("error", "Update failed. Please try again.");
                request.getRequestDispatcher("/admin/UpdateStaff.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "An error occurred: " + ex.getMessage());
            request.getRequestDispatcher("/admin/UpdateStaff.jsp").forward(request, response);
        }

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
