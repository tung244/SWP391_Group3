/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.doctor;

import static controller.admin.doctor.EditDoctorProfile.uploadImage;
import dal.DegreeDAO;
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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Collection;
import java.util.List;
import model.Degree;
import model.Degree_Doctor;

/**
 *
 * @author PC
 */
@WebServlet(name = "AddDegree", urlPatterns = {"/admin/addDegree"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddDegree extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DoctorsDAO dao = new DoctorsDAO();
        String did = request.getParameter("did");
        String accId = dao.getDoctorAccIdByDoctorId(did);

        DegreeDAO dedao = new DegreeDAO();
        List<Degree> listDe = dedao.getAllDegree();

        request.setAttribute("listDe", listDe);
        request.setAttribute("accId", accId);
        request.setAttribute("did", did);
        request.getRequestDispatcher("AddDegree.jsp").forward(request, response);
    }

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    DoctorsDAO dao = new DoctorsDAO();
    String did = request.getParameter("did");
    String accId = dao.getDoctorAccIdByDoctorId(did);
    
    HttpSession session = request.getSession();

    // Get the array of selected degree names
    String[] degreeNames = request.getParameterValues("degreeName[]");

    if (degreeNames != null && degreeNames.length > 0) {
        Degree_DoctorDAO dedocdao = new Degree_DoctorDAO();
        boolean allSuccess = true;

        // Process each degree submission
        for (int i = 0; i < degreeNames.length; i++) {
            String degreeName = degreeNames[i];
            
            // Get the corresponding image file part (fixing array naming)
            Collection<Part> parts = request.getParts();
            Part imagePart = null;
            
            // Find the correct file part by index
            int fileIndex = 0;
            for (Part part : parts) {
                if (part.getName().equals("degreeImage[]")) {
                    if (fileIndex == i) {
                        imagePart = part;
                        break;
                    }
                    fileIndex++;
                }
            }
            
            String pathHost = getServletContext().getRealPath("");
            String finalPath = pathHost.replace("build\\", "");

            String imageLink = "";

            // Upload the image if available
            if (imagePart != null && imagePart.getSize() > 0) {
                imageLink = uploadImage(imagePart, finalPath);
            }

            // Add degree-doctor relationship to database
            int degreeId = Integer.parseInt(degreeName);
            int doctorId = Integer.parseInt(did);
            String status = "InProgress"; // Fixed typo

            // Check if SPECIFIC degree already exists for this doctor
            if (dedocdao.checkSpecificDoctorDegree(doctorId, degreeId)) {
                session.setAttribute("errorMessage", "Degree " + degreeName + " has already been added for this doctor!");
                allSuccess = false;
                break;
            } else {
                boolean success = dedocdao.addDoctorDegree(doctorId, degreeId, imageLink, status);

                if (!success) {
                    // Handle insertion failure
                    session.setAttribute("errorMessage", "Failed to add one or more degrees.");
                    allSuccess = false;
                    break;
                }
            }
        }
        
        if (allSuccess) {
            // All degrees added successfully
            response.sendRedirect("doctorProfile?accId=" + accId);
        } else {
            // Some error occurred
            response.sendRedirect("addDegree?did=" + did);
        }
    } else {
        // No degrees selected, return to form with error message
        session.setAttribute("errorMessage", "No degrees selected.");
        response.sendRedirect("addDegree?did=" + did);
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
