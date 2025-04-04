/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.user;

import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Appointment;
import model.UserProfile;

@WebServlet(name = "UserProfile", urlPatterns = {"/userprofile"})
public class UsersProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        Integer account_id = (Integer) session.getAttribute("account_id");
        if (username == null || account_id == null) {
            response.sendRedirect("login");
            return; 
        }
        UserProfileDAO dao = new UserProfileDAO();
        UserProfile user = dao.GetAccount(username);
        session.setAttribute("userProfile", user);

        List<Appointment> listA = dao.getAppointmentByPatientID(account_id);
        request.setAttribute("appointment", listA);
        request.getRequestDispatcher("homepage/userprofile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String fullname = request.getParameter("fullname").trim();
        String email = request.getParameter("email").trim();
        String phonenumber = request.getParameter("phonenumber").trim();
        String address = request.getParameter("address").trim();
        String gender = request.getParameter("gender").trim();
        String dob = request.getParameter("dob").trim();
        int account_id = (int) session.getAttribute("account_id");
        
        UserProfileDAO dao = new UserProfileDAO();
        if (dao.CheckEmail(email, account_id)) {
            session.setAttribute("error", "Email đã tồn tại.");
            response.sendRedirect("userprofile");
            return;
        }

        if (dao.CheckPhoneNumber(phonenumber, account_id)) {
            session.setAttribute("error", "Số điện thoại đã tồn tại.");
            response.sendRedirect("userprofile");
            return;
        }
        if (fullname.isEmpty() || !fullname.matches("\\p{L}+[\\s\\p{L}]*")) {
            session.setAttribute("error", "Họ và tên không hợp lệ! Vui lòng nhập tên hợp lệ (chỉ chứa chữ và khoảng trắng).");
            response.sendRedirect("userprofile");
            return;
        }

        if (!phonenumber.matches("\\d{10,11}")) {
            session.setAttribute("error", "Số điện thoại không hợp lệ! Vui lòng nhập số có 10-11 chữ số.");
            response.sendRedirect("userprofile");
            return;
        }
        if (!email.matches("^[\\w._%+-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            session.setAttribute("error", "Email không hợp lệ! Vui lòng nhập đúng định dạng (ví dụ: example@gmail.com).");
            response.sendRedirect("userprofile");
            return;
        }

        if (address.isEmpty() || !address.matches("^[\\p{L}\\p{N}\\s.,\\/-]+$")) {
            session.setAttribute("error", "Địa chỉ không hợp lệ! Vui lòng nhập địa chỉ hợp lệ (chỉ chứa chữ, số, khoảng trắng và các ký tự .,\\/-).");
            response.sendRedirect("userprofile");
            return;
        }

        dao.updateUserProfile(fullname, email, phonenumber, address, dob, gender, account_id);
        response.sendRedirect("userprofile");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
