/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.ServiceDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.ServiceDetail;
import model.Specialization;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SearchService", urlPatterns = {"/admin/searchService"})
public class SearchService extends HttpServlet {
    List<ServiceDetail> list = new ArrayList<>();
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
            out.println("<title>Servlet SearchService</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchService at " + request.getContextPath() + "</h1>");
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
        String sort = request.getParameter("sort");
        ServiceDao dao = new ServiceDao();
        int id = 0;

        try {
            // Nếu có ID, lấy danh sách theo chuyên khoa
            if (id_raw != null && !id_raw.isEmpty() && !id_raw.equals("0")) {
                id = Integer.parseInt(id_raw);
                list = dao.getServiceBySpecializationId(id);
            } else {
                // Nếu không có ID, lấy toàn bộ danh sách
                list = dao.getServiceAll();
            }

            // Nếu có tham số sort, thực hiện sắp xếp
            if (sort != null && !sort.isBlank()) {
                list = dao.getSortBySpecialization(sort); // Sắp xếp danh sách có sẵn
            }

        } catch (NumberFormatException e) {
            e.printStackTrace(); // Ghi log lỗi nếu ID không hợp lệ
        }

        // Lấy danh sách chuyên khoa
        List<Specialization> list1 = dao.getAllSpecialization();

        // Đặt dữ liệu vào request
        request.setAttribute("listSP", list1);
        request.setAttribute("listS", list);
        request.setAttribute("id", id);

        // Chuyển hướng về trang JSP
        request.getRequestDispatcher("/admin/ServiceList.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        ServiceDao dao = new ServiceDao();
        list = dao.getServiceByName(name);
        List<Specialization> list1 = dao.getAllSpecialization();

        // Đặt dữ liệu vào request
        request.setAttribute("listSP", list1);
        request.setAttribute("listS", list);
        request.setAttribute("Name", name);
        request.getRequestDispatcher("/admin/ServiceList.jsp").forward(request, response);
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
