package controller.admin.email;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import bo.SendMail;

@WebServlet(name = "SendMailAuto", urlPatterns = {"/admin/sendMailAuto"})
@MultipartConfig
public class SendMailAuto extends HttpServlet {

    private static final long MAX_ATTACHMENT_SIZE = 25 * 1024 * 1024; // 25MB

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("EmailAutomatic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name_company = request.getParameter("name-company");
        String group_patient = request.getParameter("group-patient");
        String subject_mail = request.getParameter("subject-mail");
        String content_mail = request.getParameter("content-mail");
        String ms = "" ; String error= "";
        // Tách danh sách email
        String[] group_email = group_patient.split("\\r?\\n");
        List<String> email = new ArrayList<>();
        for (String string : group_email) {
            if (!string.trim().isEmpty()) {
                email.add(string.trim());
            }
        }

        // Thư mục tạm
        String uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "email_attachments" + File.separator;
        System.out.println("UploadDir" +uploadDir);
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        
        List<File> savedFiles = new ArrayList<>();
        for (Part part : request.getParts()) {
            if ("attachment".equals(part.getName()) && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString().toLowerCase();

                if (part.getSize() > MAX_ATTACHMENT_SIZE) {
                    error = "File " + fileName + " size is greater than 25MB!";
                    request.getSession().setAttribute("error", error);
                    response.sendRedirect("email_statistics");
                    return;
                }

                File savedFile = new File(uploadDir + fileName);
                try (InputStream fileContent = part.getInputStream()) {
                    Files.copy(fileContent, savedFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
                savedFiles.add(savedFile);
            }
        }

        // Gửi email trong thread
        sendMail(email, subject_mail, content_mail, savedFiles);

        ms = "Create Campain Successfully!";
        request.getSession().setAttribute("ms", ms);
        response.sendRedirect("dashboard");
    }

    private void sendMail(List<String> email, String subject, String noidung, List<File> savedFiles) {
        Thread emailThread = new Thread(() -> {
            try {
                System.out.println("Bắt đầu gửi");
                if (SendMail.guiEmailTuDong(email, noidung, subject, savedFiles)) {
                    System.out.println("Gửi email thành công!");
                } else {
                    System.err.println("Gửi email thất bại!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Xóa file tạm
                for (File file : savedFiles) {
                    try {
                        Files.deleteIfExists(file.toPath());
                    } catch (IOException e) {
                        System.err.println("Không thể xóa file tạm: " + file.getAbsolutePath());
                        e.printStackTrace();
                    }
                }
            }
        });
        emailThread.start();
    }

    @Override
    public String getServletInfo() {
        return "Servlet gửi email tự động";
    }
}