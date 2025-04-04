/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage.user;

import bo.GetFormatDate;
import dal.DoctorsDAO;
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
import model.Feedback_Doctor;


@WebServlet(name="TransactionDetail", urlPatterns={"/transactiondetail"})
public class TransactionDetail extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TransactionDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactionDetail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String appointment_idStr = request.getParameter("appointment_id");
        if(appointment_idStr==null){
            response.sendRedirect("login");
            return; 
        }
        int appointment_id = Integer.parseInt(appointment_idStr);
        UserProfileDAO  dao = new UserProfileDAO();
        List<Appointment> listA = dao.getAppointmentByAppointmentId(appointment_id);
         
        DoctorsDAO ddao = new DoctorsDAO();
        Feedback_Doctor feedback = ddao.getFeedBackDoctor(appointment_idStr);
        
        request.setAttribute("feedback", feedback);
        request.setAttribute("appointment", listA);
        request.getRequestDispatcher("homepage/detailtransaction.jsp").forward(request, response);
        
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DoctorsDAO dao = new DoctorsDAO();
        String appointmentId = request.getParameter("appointment_id");
        int did = dao.getDoctorIdByAppointmentId(Integer.parseInt(appointmentId));
        
        String feedback_rating = request.getParameter("feedback_rating");
        String feedback_text = request.getParameter("feedback_text");
        String feedback_date = GetFormatDate.getFormString();

        boolean success = dao.insertDoctorFeedback(Integer.parseInt(appointmentId), feedback_text, Integer.parseInt(feedback_rating), feedback_date);
        if (success) {
            boolean ok = dao.updateDoctorRating(did);
            request.getSession().setAttribute("success", "Rating doctor successfully!");
            response.sendRedirect("transactiondetail?appointment_id=" + appointmentId);
        } else {
            request.getSession().setAttribute("success", "Rating doctor unsuccessfully!");
            response.sendRedirect("transactiondetail?appointment_id=" + appointmentId);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
