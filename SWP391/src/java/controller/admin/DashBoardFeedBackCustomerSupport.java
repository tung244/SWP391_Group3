/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.FeedbackDAO;
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
import model.FeedbackService;

/**
 *
 * @author -ASUS-
 */
@WebServlet(name = "DashBoardFeedBackCustomerSupport", urlPatterns = {"/admin/dashboardcustomersupport"})
public class DashBoardFeedBackCustomerSupport extends HttpServlet {

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
            out.println("<title>Servlet DashBoardFeedBackCustomerSupport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashBoardFeedBackCustomerSupport at " + request.getContextPath() + "</h1>");
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
        FeedbackDAO dao = new FeedbackDAO();
        List<FeedbackService> listFWP = dao.getCustomerSupportFeedbackWithPercentage();
        List<FeedbackService> listF = dao.getFeedbackServiceCustomerSupport();
        List<String> listName = dao.getCustomerSupportNames();
        request.getParameter("");
        int page, numperpage = 6;
        int size = listF.size();
        int num = (size%6==0?(size/6):((size/6)+1));
        String xpage = request.getParameter("page");
        if(xpage==null){
            page = 1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage, size);
        List<FeedbackService> listFS = dao.getFeedbackServiceByPage((ArrayList<FeedbackService>) listF, start, end);
        request.setAttribute("listFWP", listFWP);
        request.setAttribute("listName", listName);
        request.setAttribute("page", page);
        request.setAttribute("numpage", num);
        request.setAttribute("listF", listFS);
        request.getRequestDispatcher("dashboardcustomersupport.jsp").forward(request, response);

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
        String text = request.getParameter("feedback");
        String rating_Raw = request.getParameter("rating");
        int rating = Integer.parseInt(rating_Raw);
        String appointment_id_Raw = request.getParameter("appointment_id");
        int appointment_id = Integer.parseInt(appointment_id_Raw);
        FeedbackDAO dao = new FeedbackDAO();
        boolean checkAdd = dao.addFeedback(appointment_id, text, rating);
        if (checkAdd == false) {
            session.setAttribute("error", "Chưa thể thêm feedback");
            request.getRequestDispatcher("homepage/detailtransaction.jsp").forward(request, response);
            return;
        }
        String staffName = request.getParameter("staffName");
        String year = request.getParameter("year");
        
        request.getRequestDispatcher("dashboardcustomersupport.jsp").forward(request, response);

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
