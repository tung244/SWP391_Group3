/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.filemanager;

import bo.ImageServices;
import jakarta.servlet.RequestDispatcher;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@MultipartConfig
@WebServlet(name = "file_manager", urlPatterns = {"/admin/file_manager"})
public class FileManager extends HttpServlet {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    private static final String FILE_DIR = "F:\\FPT\\SWP391\\SWP391_Group3\\SWP391\\web\\";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        String folder = request.getParameter("folder");
        if(folder ==null || folder.isEmpty()){
            folder = "images";
        }
        List<Map<String, String>> fileList = filterFile(folder, request, search);

        long[] fileImage = calculateSize("images", request);
        long[] fileThumb = calculateSize("thumb", request);
        String sizeImage = formatFileSize(fileImage[0]);
        String sizeThumb = formatFileSize(fileThumb[0]);
        String totalImage = formatFileSize(fileImage[0] + fileThumb[0]);

        request.setAttribute("totalImage", totalImage);
        request.setAttribute("numberimg", fileImage[1]);
        request.setAttribute("sizeimg", sizeImage);
        request.setAttribute("numberthumb", fileThumb[1]);
        request.setAttribute("sizethumb", sizeThumb);
        request.setAttribute("fileList", fileList);

        request.getRequestDispatcher("FileManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String folder = request.getParameter("folder");
        Part part = request.getPart("file");
        String pathHost = getServletContext().getRealPath("");
        String ms = "";String error = "";
        String finalPath = pathHost.replace("build\\", "");
        System.out.println("Path hh" + finalPath);
        String fileName = part.getSubmittedFileName().toLowerCase();

        if (!(fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")
                || fileName.endsWith(".png") || fileName.endsWith(".webp"))) {
            error = "Định dạng file không hợp lệ! Chỉ chấp nhận .jpg, .jpeg, .png, .webp.";
            request.getSession().setAttribute("ms", ms);
            response.sendRedirect("file_manager");
            return; 
        }

        if (folder.equals("images")) {
            ImageServices.uploadImage(part, finalPath);
            ms = "Upload ảnh thành công";
        }
        if (folder.equals("thumb")) {
            ImageServices.uploadImageThumbBlog(part, finalPath);
            ms = "Upload thumbnails thành công";
        }

        request.getSession().setAttribute("ms", ms);
        response.sendRedirect("file_manager");
    }

    private static String formatFileSize(long sizeInBytes) {
        if (sizeInBytes < 1024) {
            return sizeInBytes + " B";
        }
        int exp = (int) (Math.log(sizeInBytes) / Math.log(1024));
        String[] units = {"KB", "MB", "GB", "TB"};
        return String.format("%.1f %s", sizeInBytes / Math.pow(1024, exp), units[exp - 1]);
    }

    private long[] calculateSize(String folder, HttpServletRequest request) {

        File directory = new File(FILE_DIR + folder);

        File[] files = directory.listFiles();

        long[] list = new long[2];
        if (files == null) {
            return list;
        }
        Arrays.sort(files, (f1, f2) -> Long.compare(f2.lastModified(), f1.lastModified()));

        for (File file : files) {
            if (!file.isFile()) {
                continue;
            }

            String fileNameLower = file.getName().toLowerCase();

            boolean isFile = fileNameLower.endsWith(".jpg")
                    || fileNameLower.endsWith(".png")
                    || fileNameLower.endsWith(".webp")
                    || fileNameLower.endsWith(".jpeg")
                    || fileNameLower.endsWith(".pdf");

            if (isFile) {
                list[0] += file.length();
                list[1]++;
            }
        }

        return list;
    }

    private List<Map<String, String>> filterFile(String folder, HttpServletRequest request, String search) {
        String FILE_URL_PREFIX = request.getContextPath() + "/" + folder + "/";
        File directory = new File(FILE_DIR + folder);
        File[] files = directory.listFiles();
        List<Map<String, String>> fileList = new ArrayList<>();

        if (files == null) {
            return fileList;
        }
        Arrays.sort(files, (f1, f2) -> Long.compare(f2.lastModified(), f1.lastModified()));
        String searchLower = (search != null && !search.trim().isEmpty()) ? search.trim().toLowerCase() : null;

        for (File file : files) {
            if (!file.isFile()) {
                continue;
            }

            String fileNameLower = file.getName().toLowerCase();

            boolean isFile = fileNameLower.endsWith(".jpg")
                    || fileNameLower.endsWith(".png")
                    || fileNameLower.endsWith(".webp")
                    || fileNameLower.endsWith(".pdf");

            if (isFile && (searchLower == null || fileNameLower.contains(searchLower))) {
                Map<String, String> fileData = new HashMap<>();
                fileData.put("name", file.getName());
                fileData.put("lastModified", dateFormat.format(new Date(file.lastModified())));
                fileData.put("path", FILE_URL_PREFIX + file.getName());
                fileData.put("icon", fileNameLower.endsWith(".pdf")
                        ? "bxs-file-pdf text-danger"
                        : "bxs-file text-primary");
                fileData.put("size", String.valueOf(formatFileSize(file.length())));
                fileList.add(fileData);
            }
        }

        return fileList;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
