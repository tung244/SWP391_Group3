/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.specialization;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.SpecializationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Specialization;

/**
 *
 * @author PC
 */
@WebServlet(name = "ListSpecialization", urlPatterns = {"/admin/listSpecialization"})
public class ListSpecialization extends HttpServlet {

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
            out.println("<title>Servlet ListSpecialization</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListSpecialization at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SpecializationDAO spdao = new SpecializationDAO();
        List<Specialization> listSpe;
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
            listSpe = spdao.getSpecializationByFilter(searchName, option);
        } else {
            listSpe = spdao.getAllSpecialization();
        }

        // Tính toán tổng số trang
        int totalSpe = listSpe.size();
        int totalPages = (int) Math.ceil((double) totalSpe / pageSize);
        int offset = (page - 1) * pageSize;
        int end = Math.min(offset + pageSize, totalSpe);
        listSpe = listSpe.subList(offset, end);

        // Chuyển đổi danh sách bác sĩ thành JSON
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.add("specializations", gson.toJsonTree(listSpe));
        jsonResponse.addProperty("currentPage", page);
        jsonResponse.addProperty("totalPages", totalPages);

        request.setAttribute("listSpe", listSpe);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.getRequestDispatcher("ListSpecialization.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        SpecializationDAO spdao = new SpecializationDAO();

        switch (action) {
            case "loadSpecializationDetails":
                String specializationId = request.getParameter("specializationId");
                if (specializationId != null && !specializationId.trim().isEmpty()) {
                    Specialization spe = spdao.getSpecializationById(Integer.parseInt(specializationId));
                    response.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = response.getWriter();

                    if (spe != null) {
                        out.println("<p><strong>Specialization ID:</strong> " + spe.getSpecialization_id() + "</p>");
                        out.println("<p><strong>Specialization Name:</strong> " + spe.getSpecialization_name() + "</p>");
                        out.println("<p><strong>Specialization Status:</strong> " + spe.getSpecialization_status() + "</p>");
                    } else {
                        out.println("<p style='color: red'>No data found</p>");
                    }
                }
                break;

            case "addSpecialization":
                String speName = request.getParameter("speName");
                String speStatus = request.getParameter("speStatus");

                SpecializationDAO speDAO = new SpecializationDAO();

                if (speName != null && !speName.trim().isEmpty()) {
                    if (!speDAO.getSpecializationByName(speName)) {
                        speDAO.addSpecialization(speName, speStatus);
                        response.getWriter().write("Success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("Specialization name already exists");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().write("Invalid Data");
                }
                break;

            case "updateSpecialization":
                String specializationIdStr = request.getParameter("specializationId");
                String updatedSpecializationName = request.getParameter("specializationName");
                String updatedSpecializationStatus = request.getParameter("specializationStatus");

                if (specializationIdStr != null && updatedSpecializationName != null && updatedSpecializationStatus != null
                        && !updatedSpecializationName.trim().isEmpty()) {
                    try {
                        int specializationIdd = Integer.parseInt(specializationIdStr);
                        SpecializationDAO specializationDAO = new SpecializationDAO();

                        // Kiểm tra nếu specialization tồn tại
                        if (specializationDAO.getSpecializationById(specializationIdd) != null) {
                            specializationDAO.updateSpecialization(specializationIdd, updatedSpecializationName, updatedSpecializationStatus);
                            response.getWriter().write("Success");
                        } else {
                            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                            response.getWriter().write("Specialization not found");
                        }
                    } catch (NumberFormatException e) {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("Invalid Specialization ID");
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



@Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
