/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AccountDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.sql.Date;
import model.Account;
import model.Role;
import model.Staffs;

/**
 *
 * @author DELL
 */
@WebServlet(name = "AddStaff", urlPatterns = {"/admin/AddStaff"})
public class AddStaff extends HttpServlet {

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
            out.println("<title>Servlet AddStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStaff at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        AccountDAO ACDao = new AccountDAO();
        String username = request.getParameter("username");
        if(ACDao.checkTonTaiUser(username)){
             request.setAttribute("error", "Tên đăng nhập đã tồn tại.");
             request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
             return;
        }
        String password = request.getParameter("password");
        String staff_fullname = request.getParameter("staff_fullname");
        String staff_address = request.getParameter("staff_address");
        Date staffDob = Date.valueOf(request.getParameter("staff_dob"));
        String staff_gender = request.getParameter("staff_gender");
        String role_name = request.getParameter("role_name");
        String phone = request.getParameter("phone");
        if(ACDao.checkTonTai(phone, "phone_number")){
            request.setAttribute("error", "Số điện thoại đã tồn tại.");
            request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
            return;
        }
        String email = request.getParameter("email");
        if(ACDao.checkTonTai(email, "email")){
            request.setAttribute("error", "Email đã tồn tại.");
            request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
            return;
        }
        String salaryRaw = request.getParameter("salary");

        try {
            BigDecimal salaryParse = BigDecimal.valueOf(Double.parseDouble(salaryRaw));
            Role role = new Role();
            role.setRole_name(role_name);

            Account account = new Account();
            account.setUsername(username);
            account.setPassword(password);
            account.setRole(role);
            account.setEmail(email);
            account.setPhonenumber(phone);

            Staffs staff = new Staffs();
            staff.setAccount(account);
            staff.setAdmin_fullname(staff_fullname);
            staff.setAdmin_address(staff_address);
            staff.setAdmin_dob(staffDob);
            staff.setAdmin_gender(staff_gender);
            staff.setAdmin_salary(salaryParse);
            staff.setImage_profile_admin("default.jpg"); 
            
            
            StaffDAO dao = new StaffDAO();
            boolean test = dao.addStaff(staff);
            if(test==false){
                response.sendRedirect("login");
            }
            response.sendRedirect("ListStaff");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int accountId = Integer.parseInt(request.getParameter("account_id"));
//        String adminFullName = request.getParameter("admin_fullname");
//        String adminAddress = request.getParameter("admin_address");
//        Date adminDob = Date.valueOf(request.getParameter("admin_dob"));
//        String adminGender = request.getParameter("admin_gender");
//        String roleName = request.getParameter("role_name");
//        String phone = request.getParameter("phone");
//        String email = request.getParameter("email");
//        Date createdDate = Date.valueOf(request.getParameter("created_date"));
//
//        // Cập nhật thông tin nhân viên
//        Staffs staff = new Staffs();
//        staff.setAdmin_fullname(adminFullName);
//        staff.setAdmin_address(adminAddress);
//        staff.setAdmin_dob(adminDob);
//        staff.setAdmin_gender(adminGender);
//        Account account = new Account(username, phone, email, phone, role)
//        staff.setPhone(phone);
//        staff.setEmail(email);
//        staff.setCreated_date(createdDate);
//
//        // Gọi phương thức cập nhật trong DAO
//        StaffDAO staffDAO = new StaffDAO();
//        boolean isUpdated = staffDAO.updateStaff(accountId, staff, roleName);
//
//        if (isUpdated) {
//            response.sendRedirect("ListStaff"); // Chuyển hướng đến danh sách nhân viên
//        } else {
//            request.setAttribute("errorMessage", "Update failed!");
//            request.getRequestDispatcher("updateStaff.jsp").forward(request, response);
//        }
//    }
//}
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
