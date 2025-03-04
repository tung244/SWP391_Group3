/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.certificate;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.CertificateDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Certificate;

/**
 *
 * @author PC
 */
@WebServlet(name = "ListCertificate", urlPatterns = {"/admin/listCertificate"})
public class ListCertificate extends HttpServlet {

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
            out.println("<title>Servlet ListCertificate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListCertificate at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CertificateDAO cerdao = new CertificateDAO();
        List<Certificate> listCer;
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
            listCer = cerdao.getDegreeByFilter(searchName, option);
        } else {
            listCer = cerdao.getAllCertificate();
        }

        // Tính toán tổng số trang
        int totalDegree = listCer.size();
        int totalPages = (int) Math.ceil((double) totalDegree / pageSize);
        int offset = (page - 1) * pageSize;
        int end = Math.min(offset + pageSize, totalDegree);
        listCer = listCer.subList(offset, end);

        // Chuyển đổi danh sách bác sĩ thành JSON
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.add("certificates", gson.toJsonTree(listCer));
        jsonResponse.addProperty("currentPage", page);
        jsonResponse.addProperty("totalPages", totalPages);

        request.setAttribute("listCer", listCer);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.getRequestDispatcher("ListCertificate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CertificateDAO cerdao = new CertificateDAO();
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "loadCerDetails":
                    String id = request.getParameter("id");
                    if (id != null) {

                        Certificate cer = cerdao.getCertificateById(Integer.parseInt(id));

                        response.setContentType("text/html;charset=UTF-8");
                        PrintWriter out = response.getWriter();

                        if (cer != null) {
                            out.println("<p><strong>Certificate ID:</strong> " + cer.getCertificate_id() + "</p>");
                            out.println("<p><strong>Certificate Name:</strong> " + cer.getCertificate_name() + "</p>");
                        } else {
                            out.println("<p style='color: red'>No data found</p>");
                        }
                    }
                    break;

                case "addCertificate":
                    String certificateName = request.getParameter("certificateName");
                    if (certificateName != null && !certificateName.trim().isEmpty()) {
                        if (cerdao.getCertificateByName(certificateName) == false) {
                            cerdao.addCertificate(certificateName);
                            response.getWriter().write("Success");
                        } else {
                            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                            response.getWriter().write("Certificate name has been existed!");
                        }

                    } else {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("Invalid Data");
                    }
                    break;

                case "updateCertificate":
                    String cerIdStr = request.getParameter("cerId");
                    String updatecerName = request.getParameter("cerName");
                    System.out.println(cerIdStr);
                    if (cerIdStr != null && updatecerName != null && !updatecerName.trim().isEmpty()) {
                        try {
                            int cerId = Integer.parseInt(cerIdStr);
                            cerdao.updateCer(cerId, updatecerName);
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
