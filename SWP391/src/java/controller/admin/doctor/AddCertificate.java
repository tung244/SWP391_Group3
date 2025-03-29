/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import bo.GetFormatDate;
import dal.CertificateDAO;
import dal.Certificate_DoctorDAO;
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
import model.Account;
import model.Certificate;
import model.Certificate_Doctor;

/**
 *
 * @author PC
 */
@WebServlet(name = "AddCertificate", urlPatterns = {"/admin/addCertificate"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddCertificate extends HttpServlet {

    GetFormatDate getdate = new GetFormatDate();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCertificate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCertificate at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String did = request.getParameter("did");
        Account a = (Account) request.getSession().getAttribute("account");
        int accId = a.getAccount_id();

        CertificateDAO cerdao = new CertificateDAO();
        List<Certificate> listCer = cerdao.getAllCertificate();

        request.setAttribute("listCer", listCer);
        request.setAttribute("accId", accId);
        request.setAttribute("did", did);
        request.getRequestDispatcher("AddCertificate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account a = (Account) request.getSession().getAttribute("account");
        String did = request.getParameter("did");
        String isNewCertificate = request.getParameter("isNewCertificate");
        String certificateId = request.getParameter("certificateName"); // cer_id
        String newCertificateName = request.getParameter("newCertificateName");
        String issuedBy = request.getParameter("issuedBy");
        String dateCertificate = request.getParameter("dateCertificate");
        String status = "InProgress";

        Part part = request.getPart("certificateImage");
        String pathHost = getServletContext().getRealPath("");
        String finalPath = pathHost.replace("build\\", "");
        String linkFile = uploadImage(part, finalPath);
        response.getWriter().print(linkFile);
        System.out.println(did);
        System.out.println(isNewCertificate);
        System.out.println(certificateId);
        System.out.println(newCertificateName);
        System.out.println(issuedBy);
        System.out.println(dateCertificate);
        System.out.println(status);
        System.out.println(linkFile);

        Certificate_DoctorDAO cer_docdao = new Certificate_DoctorDAO();

        if (cer_docdao.getCertificateByName(newCertificateName)) {
            request.getSession().setAttribute("errorMessage", "Certificate name has been existed!");
            response.sendRedirect("addCertificate?did=" + did);
            return;
        }

        if (cer_docdao.checkExistCertificate(certificateId, did, dateCertificate)) {
            request.getSession().setAttribute("errorMessage", "This certificate has been existed in your profile!");
            response.sendRedirect("addCertificate?did=" + did);
            return;
        }

        boolean success;
        if ("true".equals(isNewCertificate)) {
            success = cer_docdao.addNewCertificate(newCertificateName, did, linkFile, dateCertificate, status, issuedBy);
        } else {
            success = cer_docdao.addCertificate(certificateId, did, linkFile, dateCertificate, status, issuedBy);
        }

        if (success) {
            request.getSession().setAttribute("success", "Add certificate successfully!");
            response.sendRedirect("doctorProfile?accId=" + a.getAccount_id());
        } else {
            request.getSession().setAttribute("errorMessage", "Add certificate unsuccessfully");
            response.sendRedirect("addCertificate?did=" + did);
        }
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
