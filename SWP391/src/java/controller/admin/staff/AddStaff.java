/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import bo.EncryptPassword;
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
       request.getRequestDispatcher("AddStaff.jsp").forward(request, response);

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
        AccountDAO ACDao = new AccountDAO();
        String username = request.getParameter("username");
        if (ACDao.checkTonTaiUser(username)) {
            request.getSession().setAttribute("error", "Tên đăng nhập đã tồn tại.");
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
        if (ACDao.checkTonTai(phone, "phone_number")) {
            request.getSession().setAttribute("error", "Số điện thoại đã tồn tại.");
            request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
            return;
        }
        String email = request.getParameter("email");
        if (ACDao.checkTonTai(email, "email")) {
            request.getSession().setAttribute("error", "Email đã tồn tại.");
            request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
            return;
        }
        if (staff_fullname.isEmpty() || !staff_fullname.matches("\\p{L}+[\\s\\p{L}]*")) {
            request.getSession().setAttribute("error", "Họ và tên không hợp lệ! Vui lòng nhập tên hợp lệ (chỉ chứa chữ và khoảng trắng).");
            request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
            return;
        }

        if (!phone.matches("\\d{10,11}")) {
            request.getSession().setAttribute("error", "Số điện thoại không hợp lệ! Vui lòng nhập số có 10-11 chữ số.");
            request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
            return;
        }
        if (!email.matches("^[\\w._%+-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            request.getSession().setAttribute("error", "Email không hợp lệ! Vui lòng nhập đúng định dạng (ví dụ: example@gmail.com).");
            request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
            return;
        }

        if (staff_address.isEmpty() || !staff_address.matches("^[\\p{L}\\p{N}\\s.,\\/-]+$")) {
            request.getSession().setAttribute("error", "Địa chỉ không hợp lệ! Vui lòng nhập địa chỉ hợp lệ (chỉ chứa chữ, số, khoảng trắng và các ký tự .,\\/-).");
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
            account.setPassword(EncryptPassword.hashPassword(password));
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
            if (test == false) {
                response.sendRedirect("login");
            }
            response.sendRedirect("ListStaff");

        } catch (Exception e) {
            e.printStackTrace();
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
