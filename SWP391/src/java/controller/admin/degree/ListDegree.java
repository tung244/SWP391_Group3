/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.degree;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.DegreeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Degree;

/**
 *
 * @author PC
 */
@WebServlet(name = "ListDegree", urlPatterns = {"/admin/listDegree"})
public class ListDegree extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListDegree</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListDegree at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DegreeDAO de = new DegreeDAO();
        List<Degree> listDegree;
        // get parameter
        String searchName = request.getParameter("searchName");
        String option = request.getParameter("option");

        // Lấy thông tin phân trang
        int page = 1;
        int pageSize = 5;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }
        String pageSizeParam = request.getParameter("pageSize");
        if (pageSizeParam != null && !pageSizeParam.isEmpty()) {
            pageSize = Integer.parseInt(pageSizeParam);
        }

        if (searchName != null || option != null) {
            listDegree = de.getDegreeByFilter(searchName, option);
        } else {
            listDegree = de.getAllDegree();
        }

        // Tính toán tổng số trang
        int totalDegree = listDegree.size();
        int totalPages = (int) Math.ceil((double) totalDegree / pageSize);
        int offset = (page - 1) * pageSize;
        int end = Math.min(offset + pageSize, totalDegree);
        listDegree = listDegree.subList(offset, end);

        // Chuyển đổi danh sách bác sĩ thành JSON
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.add("degrees", gson.toJsonTree(listDegree));
        jsonResponse.addProperty("currentPage", page);
        jsonResponse.addProperty("totalPages", totalPages);

        request.setAttribute("listDegree", listDegree);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.getRequestDispatcher("ListDegree.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "loadDegreeDetails":
                    String id = request.getParameter("id");
                    if (id != null) {
                        DegreeDAO dedao = new DegreeDAO();
                        Degree de = dedao.getDegreeById(Integer.parseInt(id));

                        response.setContentType("text/html;charset=UTF-8");
                        PrintWriter out = response.getWriter();

                        if (de != null) {
                            out.println("<p><strong> Degree ID:</strong> " + de.getDegree_id() + "</p>");
                            out.println("<p><strong>Degree Name:</strong> " + de.getDegree_name() + "</p>");
                        } else {
                            out.println("<p style='color: red'>No data found</p>");
                        }
                    }
                    break;

                case "addDegree":
                    String degreeName = request.getParameter("degreeName");
                    if (degreeName != null && !degreeName.trim().isEmpty()) {
                        DegreeDAO degreeDAO = new DegreeDAO();
                        degreeDAO.addDegree(degreeName);
                        response.getWriter().write("Success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("Invalid Data");
                    }
                    break;

                case "updateDegree":
                    String degreeIdStr = request.getParameter("degreeId");
                    String updatedDegreeName = request.getParameter("degreeName");

                    if (degreeIdStr != null && updatedDegreeName != null && !updatedDegreeName.trim().isEmpty()) {
                        try {
                            int degreeId = Integer.parseInt(degreeIdStr);
                            DegreeDAO degreeDAO = new DegreeDAO();
                            degreeDAO.updateDegree(degreeId, updatedDegreeName);
                            response.getWriter().write("Success");
                        } catch (NumberFormatException e) {
                            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                            response.getWriter().write("Invalid Degree ID");
                        }
                    } else {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("Invalid Data");
                    }
                    break;

                default:
                    throw new AssertionError();
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
