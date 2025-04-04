/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage.user;

import bo.SendMail;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Appointment;
import model.UserProfile;

/**
 *
 * @author -ASUS-
 */
@WebServlet(name = "TransactionHistoryy", urlPatterns = {"/transactionhistoryy"})
public class TransactionHistoryy extends HttpServlet {

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
            out.println("<title>Servlet TransactionHistoryy</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactionHistoryy at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        UserProfileDAO dao = new UserProfileDAO();

        String username = (String) session.getAttribute("username");
        UserProfile user = dao.GetAccount(username);
        request.setAttribute("userProfile", user);
        Integer account_id = (Integer) session.getAttribute("account_id");

        if (username == null || account_id == null) {
            response.sendRedirect("login");
            return;
        }

        List<Appointment> expiredAppointments = dao.getExpiredAppointments();
        boolean check = dao.cancelExpiredAppointments();

        // Chạy gửi email trên luồng khác để không chặn request
        new Thread(() -> {
            for (Appointment appointment : expiredAppointments) {
                try {
                    String email = appointment.getUser().getAccount().getEmail();
                    String nameUser = appointment.getUser().getFullname();
                    String noidung = "Cuộc hẹn của bạn vào ngày " + appointment.getAppointment_date() + " đã bị hủy vì quá hạn.";

                    System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + email + nameUser + noidung);

                    boolean emailSent = SendMail.guiMailCancelled(email, noidung, nameUser);
                    if (emailSent) {
                        System.out.println("Email đã gửi đến: " + email);
                        session.setAttribute("ms", " Đã xóa cuộc hẹn quá hạn.");
                    } else {
                        System.out.println("Gửi email thất bại đến: " + email);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start(); // Bắt đầu luồng gửi email

        List<Appointment> listA = dao.getAppointmentByPatientID(account_id);
        int page, numperpage = 6;
        int size = listA.size();
        int num = (size % 6 == 0 ? (size / 6) : ((size / 6) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * numperpage;
        int end = Math.min(page * numperpage, size);
        List<Appointment> listAs = dao.getAppointmentByPage((ArrayList<Appointment>) listA, start, end);

        request.setAttribute("appointment", listAs);
        request.setAttribute("page", page);
        request.setAttribute("numpage", num);
        request.setAttribute("type", "history");
        request.getRequestDispatcher("/homepage/transactionhistory.jsp").forward(request, response);
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
        processRequest(request, response);
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
