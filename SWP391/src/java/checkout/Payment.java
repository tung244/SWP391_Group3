/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package checkout;

import bo.SendMail;
import dal.AppointmentDAO;
import dal.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Appointments;
import model.Checkout;
import model.Rank;
import model.UserProfile;
import org.json.JSONObject;

@WebServlet(name = "Payment", urlPatterns = {"/payment"})
public class Payment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Payment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Payment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String amount = request.getParameter("cost");
        HttpSession session = request.getSession();
        System.out.println(amount);
        System.out.println(id);
        session.setAttribute("amount", amount);
        session.setAttribute("aid", id);
        request.getRequestDispatcher("/homepage/Payment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AppointmentDAO dao = new AppointmentDAO();
        UserProfileDAO userDao = new UserProfileDAO();

        // Đọc request body JSON
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestData = sb.toString();
        System.out.println("Request Data: " + requestData);

        try {
            JSONObject json = new JSONObject(requestData);
            double amount = json.optDouble("transferAmount", 0);
            String description = json.optString("description", "");
            String code = json.optString("id", "");
            System.out.println("Parsed Amount: " + amount);
            System.out.println("Parsed Description: " + description);

            // Lấy ID trực tiếp từ description thay vì phụ thuộc session
            String transactionId = "";
            if (description.contains("eyecare")) {
                transactionId = description.substring(description.indexOf("eyecare") + 7).split(" ")[0];
            }

            // Kiểm tra giao dịch
            if (amount > 0 && !transactionId.isEmpty()) {
                List<Appointments> appointments = dao.getAppointment(transactionId);
                if (appointments.isEmpty()) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().write("{\"error\": \"Không tìm thấy lịch hẹn\"}");
                    return;
                }
                Appointments a = appointments.get(appointments.size() - 1);
                boolean check = dao.confirmPaymentAppointment(Integer.parseInt(transactionId), "Payed");
                if (check) {
                    try {
                        double totalBill = a.getActualCost();
                        Checkout Checkout = new Checkout(Integer.parseInt(transactionId), "Bill Payment", "Completed", totalBill, code);
                        boolean isInsert = dao.insertCheckout(Checkout);
                        if (isInsert) {
                            boolean isSendMail = SendMail.MailConfirmPaymentAppointment(a);
                            if (isSendMail) {
                                response.setStatus(HttpServletResponse.SC_OK);
                                response.getWriter().write("{\"success\": true}");
                            } else {
                                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                                response.getWriter().write("{\"error\": \"Lỗi gửi mail\"}");
                            }
                        } else {
                            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                            response.getWriter().write("{\"error\": \"Lỗi Tạo Checkout\"}");
                        }
                    } catch (UnsupportedEncodingException ex) {
                        Logger.getLogger(AppointmentDAO.class.getName()).log(Level.SEVERE, null, ex);
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().write("{\"error\": \"Lỗi gửi mail\"}");
                    }
                    List<Rank> ranks = userDao.getAllRank();
                    double totalSpending = userDao.getAmountSpendingByCusId(Integer.parseInt(transactionId));
                    int rank = 0;
                    for (Rank rank1 : ranks) {
                        if (totalSpending >= rank1.getMinAmount()) {
                            rank = rank1.getRankId();
                        }
                    }
                    boolean updateRank = userDao.updateRank(rank, Integer.parseInt(transactionId));
                    response.sendRedirect("PaymentSuccess");
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().write("{\"error\": \"Lỗi Thanh Toán\"}");
                }

            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\": \"Thông tin thanh toán không hợp lệ\"}");
            }

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid JSON format\"}");
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
