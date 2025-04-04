/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import bo.GetFormatDate;
import bo.ImageServices;
import dal.Certificate_DoctorDAO;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Certificate;
import model.Certificate_Doctor;

/**
 *
 * @author PC
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
@WebServlet(name = "CertificateDetail", urlPatterns = {"/admin/certificateDetail"})
public class CertificateDetail extends HttpServlet {
    
      GetFormatDate getdate = new GetFormatDate();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CertificateDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CertificateDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DoctorsDAO dao = new DoctorsDAO();
        Certificate_DoctorDAO cd = new Certificate_DoctorDAO();
        String did = request.getParameter("did");
        String accId = dao.getDoctorAccIdByDoctorId(did);
        List<Certificate_Doctor> listCer = cd.getCertificateDoctorId(did);
        if (listCer.size() == 0) {
            request.getSession().setAttribute("errorr", "List Certificate is empty. Please update certificate before view detail certificate!");
            response.sendRedirect("doctorProfile?accId=" + accId);
        } else {
            System.out.println(listCer.get(0).getCertificate().getCertificate_name());
            request.setAttribute("listCer", listCer);
            request.setAttribute("accId", accId);
            request.getRequestDispatcher("CertificateDetail.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String certificateId = request.getParameter("certificateId");
        String doctorId = request.getParameter("doctorId");
        String issuedBy = request.getParameter("issuedBy");
        String certificatePhoto = request.getParameter("certificatePhoto");
        String dateCertificate = request.getParameter("dateCertificate");
        String version = request.getParameter("version");

        // Xử lý upload ảnh
        Part part = request.getPart("updateCertificateImage");
        String pathHost = getServletContext().getRealPath("");
        String finalPath = pathHost.replace("build\\", "");
        String linkFile =  "";
        if(part != null && part.getSize() > 0){
             linkFile = ImageServices.uploadImage(part, finalPath);
        }
        

        // ✅ Chỉ log ra console, không trả về response
        System.out.println("Uploaded file path: " + linkFile);

        // Tạo đối tượng degree doctor mới để update
        Certificate_Doctor cerdoc = new Certificate_Doctor();
        cerdoc.setCertificate_id(Integer.parseInt(certificateId));
        cerdoc.setDoctor_id(Integer.parseInt(doctorId));
        cerdoc.setDate_change(getdate.getFormString());
        cerdoc.setDate_certificate(convertToYYYYMMDD(dateCertificate));
        cerdoc.setIssued_by(issuedBy);
        cerdoc.setStatus("InProgress");
        cerdoc.setVersion(Integer.parseInt(version));
        if(linkFile != null && !linkFile.isEmpty()){
            cerdoc.setCertificate_image(linkFile);
        }else{
            cerdoc.setCertificate_image(certificatePhoto);
        }
        
        Certificate_DoctorDAO cerdocdao = new Certificate_DoctorDAO();
        boolean success = cerdocdao.updateCertificateDoctorWithHistory(cerdoc);
        
       
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
    
   
     
     public static String convertToYYYYMMDD(String inputDate) {
    try {
        // Assuming input date is in a format like dd/mm/yyyy or mm/dd/yyyy
        SimpleDateFormat inputFormat;
        // Detect input format (you may need to adjust based on your actual format)
        if (inputDate.matches("\\d{2}/\\d{2}/\\d{4}")) {
            inputFormat = new SimpleDateFormat("dd/MM/yyyy");
        } else {
            inputFormat = new SimpleDateFormat("MM/dd/yyyy");
        }
        
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date date = inputFormat.parse(inputDate);
        return outputFormat.format(date);
    } catch (ParseException e) {
        e.printStackTrace();
        return inputDate; // Return original if parsing fails
    }
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
