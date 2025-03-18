/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import consts.ConfigWeb;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class ImageServices {

   
    
    public static String uploadImage(Part part, String finalPath) throws ServletException {
//  Thêm đoạn dưới đây vào servlet

//      Part part = request.getPart("img");  // img là tên thẻ upload bên jsp
//         String pathHost = getServletContext().getRealPath("");
//
//        String finalPath = pathHost.replace("build\\", ""); 
        String uploadPath = finalPath + "images";

        // Tạo thư mục "uploads" nếu chưa tồn tại
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String linkFile = "";

        String fileName = part.getSubmittedFileName();

        // Kiểm tra nếu file có tên hợp lệ
        if (fileName != null && !fileName.isEmpty()) {
            File filePath = new File(uploadPath + File.separator + fileName);
            try {
                Files.copy(part.getInputStream(), filePath.toPath(), StandardCopyOption.REPLACE_EXISTING);
                linkFile = "./images" + "/" + fileName;
            } catch (IOException e) {
                throw new ServletException("File upload failed: " + e.getMessage());
            }
        }
        return linkFile;
    }

    public static String uploadImageBlog(Part part, String finalPath) throws ServletException {
//  Thêm đoạn dưới đây vào servlet

//      Part part = request.getPart("img");  // img là tên thẻ upload bên jsp
//         String pathHost = getServletContext().getRealPath("");
//
//        String finalPath = pathHost.replace("build\\", ""); 
        String uploadPath = finalPath + "images";
        System.out.println(uploadPath);

        // Tạo thư mục "uploads" nếu chưa tồn tại
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String linkFile = "";

        String fileName = part.getSubmittedFileName();

        // Kiểm tra nếu file có tên hợp lệ
        if (fileName != null && !fileName.isEmpty()) {
            File filePath = new File(uploadPath + File.separator + fileName);
            try {
                Files.copy(part.getInputStream(), filePath.toPath(), StandardCopyOption.REPLACE_EXISTING);
                linkFile = ConfigWeb.URL_IMAGE_IMAGE + "/" + fileName;
                
            } catch (IOException e) {
                throw new ServletException("File upload failed: " + e.getMessage());
            }
        }
        return linkFile;
    }

    public static String uploadImageThumbBlog(Part part, String finalPath) throws ServletException {
//  Thêm đoạn dưới đây vào servlet

//      Part part = request.getPart("img");  // img là tên thẻ upload bên jsp
//         String pathHost = getServletContext().getRealPath("");
//
//        String finalPath = pathHost.replace("build\\", ""); 
        String uploadPath = finalPath +  "thumb";
        System.out.println(uploadPath);

        // Tạo thư mục "uploads" nếu chưa tồn tại
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String linkFile = "";

        String fileName = part.getSubmittedFileName();

        // Kiểm tra nếu file có tên hợp lệ
        if (fileName != null && !fileName.isEmpty()) {
            File filePath = new File(uploadPath + File.separator + fileName);
            try {
                Files.copy(part.getInputStream(), filePath.toPath(), StandardCopyOption.REPLACE_EXISTING);
                linkFile = ConfigWeb.URL_IMAGE_THUMB + "/" + fileName;
            } catch (IOException e) {
                throw new ServletException("File upload failed: " + e.getMessage());
            }
        }
        return linkFile;
    }
    public static String getLinkFolderPublic(String linkFileTemp){
        
        return Paths.get("public" + linkFileTemp.split("public")[1]).toString();
        
    }
    
    
    
    
    
    
}
