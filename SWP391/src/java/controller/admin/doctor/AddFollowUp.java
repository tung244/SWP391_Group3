/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;


import bo.SendMail;
import dal.DoctorsDAO;
import dal.FollowupDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

/**
 *
 * @author -ASUS-
 */
@WebServlet(name = "AddFollowUp", urlPatterns = {"/admin/addfollowup"})
public class AddFollowUp extends HttpServlet {

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
            out.println("<title>Servlet AddFollowUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFollowUp at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("AddFollowUp.jsp");
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
        HttpSession session = request.getSession();
        String patientName = request.getParameter("name");
        String followUpDate = request.getParameter("follow_up_date");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String description = request.getParameter("description");
        FollowupDAO dao = new FollowupDAO();
        boolean check = dao.addFollowUp(followUpDate, description, patientName, phone, email);

        if (!check) {
            session.setAttribute("error", "Add Follow Up Failed");
            response.sendRedirect("AddFollowUp.jsp");
        } else {
            session.setAttribute("ms", "Add Follow Up Successfully");

            // Gửi email xác nhận
            String subject = "Xác nhận lịch tái khám";
            String token = "someUniqueToken"; // Token có thể được tạo bằng cách mã hóa dữ liệu hoặc sinh ngẫu nhiên

            try {
                boolean mailSent = SendMail.guiMailTaiKham(email, token, subject, patientName, followUpDate, description);
                if (mailSent) {
                    System.out.println("✅ Email xác nhận đã gửi đến: " + email);
                } else {
                    System.out.println("❌ Gửi email xác nhận thất bại đến: " + email);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect("AddFollowUp.jsp");
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
