package controller.admin.blog;

import bo.ImageServices;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.json.JSONObject;

@WebServlet("/admin/save_image")  // Đường dẫn đúng với request của bạn
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class SaveImage extends HttpServlet {

 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json"); // Đặt kiểu dữ liệu JSON
        response.setCharacterEncoding("UTF-8");

        Part part = request.getPart("upload"); // "upload" là tên input file của CKEditor
        String pathHost = getServletContext().getRealPath("").replace("build\\", "");
        System.out.println(pathHost);
        String fileUrl = ImageServices.uploadImageBlog(part, pathHost);

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("url", fileUrl);

        response.getWriter().write(jsonResponse.toString());
        System.out.println(jsonResponse.toString());
        response.getWriter().flush();
    }
}
