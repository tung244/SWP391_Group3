/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import bo.GetFormatDate;
import static controller.admin.doctor.CreateDoctor.uploadImage;
import dal.Degree_DoctorDAO;
import dal.DoctorsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import model.Degree_Doctor;

/**
 *
 * @author PC
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
@WebServlet(name = "DegreeDetail", urlPatterns = {"/admin/degreeDetail"})
public class DegreeDetail extends HttpServlet {

    GetFormatDate getdate = new GetFormatDate();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Degree_DoctorDAO dedocdao = new Degree_DoctorDAO();
        DoctorsDAO dao = new DoctorsDAO();
        String doctorId = request.getParameter("did");
        String accId = dao.getDoctorAccIdByDoctorId(doctorId);
        List< Degree_Doctor> listDeDoc = dedocdao.getDegreeDoctorById(doctorId);
        for (Degree_Doctor degree_Doctor : listDeDoc) {
            System.out.println(degree_Doctor.getVersion());
        }
        if (listDeDoc.size() == 0) {
            request.getSession().setAttribute("errorr", "List Degree is empty. Please update degree before view detail degree!");
            response.sendRedirect("doctorProfile?accId=" + accId);
        } else {
            request.setAttribute("listDeDoc", listDeDoc);
            request.setAttribute("accId", accId);
            request.getRequestDispatcher("DegreeDetail.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String degreeId = request.getParameter("degreeId");
        String doctorId = request.getParameter("doctorId");
        String issuedBy = request.getParameter("issuedBy");
        String degreeImage = request.getParameter("degreeImage");
        String dateDegree = request.getParameter("dateDegree");
        String version = request.getParameter("version");

        // Xử lý upload ảnh
        Part part = request.getPart("updateDegreeImage");
        String linkFile = "";
        if (part != null && part.getSize() > 0) {  // Kiểm tra null và file có dữ liệu
            String pathHost = getServletContext().getRealPath("");
            String finalPath = pathHost.replace("build\\", "");
            linkFile = uploadImage(part, finalPath);
        } else {
            System.out.println("❌ Không có file được tải lên.");
        }

       

        // Tạo đối tượng degree doctor mới để update
        Degree_Doctor newdedoc = new Degree_Doctor();
        newdedoc.setDegree_id(Integer.parseInt(degreeId));
        newdedoc.setDoctor_id(Integer.parseInt(doctorId));
        newdedoc.setDate_change(getdate.getFormString());
        newdedoc.setDate_degree(dateDegree);
        newdedoc.setIssued_by(issuedBy);
        newdedoc.setStatus("InProgress");
        newdedoc.setVersion(Integer.parseInt(version) + 1);

        if (linkFile != null && !linkFile.isEmpty()) {
            newdedoc.setDegree_image(linkFile);
        } else {
            newdedoc.setDegree_image(degreeImage);
        }

        System.out.println(newdedoc);

        // Cập nhật vào DB
        Degree_DoctorDAO dedocdao = new Degree_DoctorDAO();
        boolean success = dedocdao.updateDegreeDoctorWithHistory(newdedoc);

        // Trả về JSON hợp lệ
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        if (success) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false, \"error\": \"Lỗi khi cập nhật!\"}");
        }
        out.flush();
    }

    public static String uploadImage(Part part, String finalPath) throws ServletException {
        String uploadPath = finalPath + "images";
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String linkFile = "";

        String fileName = part.getSubmittedFileName();

        if (fileName != null && !fileName.isEmpty()) {
            File filePath = new File(uploadPath + File.separator + fileName);
            try {
                Files.copy(part.getInputStream(), filePath.toPath(), StandardCopyOption.REPLACE_EXISTING);
                linkFile = "./images/" + fileName;
            } catch (IOException e) {
                throw new ServletException("File upload failed: " + e.getMessage());
            }
        }
        return linkFile;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
