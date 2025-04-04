/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import model.Account;
import dal.DoctorsDAO;
import dal.StatisticDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 *
 * @author PC
 */
@WebServlet(name = "StatisticDoctor", urlPatterns = {"/admin/statisticDoctor"})
public class StatisticDoctor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StatisticDAO dao = new StatisticDAO();
        Account a = (Account) request.getSession().getAttribute("account");

        if (a == null) {
            response.sendRedirect("loginAdmin");
            return;
        }

        DoctorsDAO ddao = new DoctorsDAO();
        String did = ddao.getDoctorIdByAccId(a.getAccount_id());

        // Get period parameter, default to "year" if not specified
        String period = request.getParameter("period");
        if (period == null || period.isEmpty()) {
            period = "year";
        }
        Map<String, Object> doctorSummary = dao.getDoctorSummary(did, period);
        Map<String, Integer> statistics = dao.getAppointmentStatistics(did, period);
        Map<Integer, Integer> ratingStatistics = dao.getDoctorRatingStatistics(did);

        request.setAttribute("statistics", statistics);
        request.setAttribute("doctorSummary", doctorSummary);
        request.setAttribute("ratingStatistics", ratingStatistics);
        request.setAttribute("currentPeriod", period); // To mark active button
        request.getRequestDispatcher("StatisticDoctor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
