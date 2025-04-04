/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import com.cloudinary.utils.ObjectUtils;
import static consts.CloudinaryConfig.cloudinary;
import jakarta.servlet.http.Part;
import java.io.File;  
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Map;



public class Cloudinary_Services {
    public static String[] uploadImage(Part part) throws IOException{
        String[] image = new String[2];
        File tempFile = File.createTempFile("upload-", ".jpg");  // tạo name file VD: upload-724109055963885517.jpg(na ná v)
        try (InputStream fileContent = part.getInputStream()) {
            Files.copy(fileContent, tempFile.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }
        Map uploadResult;
        try {
            uploadResult = cloudinary.uploader().upload(tempFile, ObjectUtils.asMap(
                "folder", "test"  // này là thư mục lưu ảnh, có j thì kêu t tạo rồi add tên vô
            ));
        } finally {
            tempFile.delete(); // Xóa file tạm thời nãy tạo đi
        }
        
        System.out.println(uploadResult.toString());
        // Lấy URL ảnh ra dùng cái này lưu db này
        image[1] = (String) uploadResult.get("secure_url");
        image[2] = (String) uploadResult.get("public_id");
        return image;
    }
    
    public static void deleteImage(String public_id_img){
        
        try{
            Map result = cloudinary.uploader().destroy(public_id_img, ObjectUtils.asMap());
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }
}
