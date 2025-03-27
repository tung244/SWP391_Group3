/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo.file;

import jakarta.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class FileServices {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    private static final String FILE_DIR = "F:\\FPT\\SWP391\\SWP391_Group3\\SWP391\\web\\";
    
    public static List<Map<String, String>> getAllFile(String folder, HttpServletRequest request){
        String FILE_URL_PREFIX = request.getContextPath() + "/" +folder+"/"; 
        File directory = new File(FILE_DIR + folder);
        File[] files = directory.listFiles();
        List<Map<String, String>> fileList = new ArrayList<>();
        if (files != null) {
            Arrays.sort(files, (f1, f2) -> Long.compare(f2.lastModified(), f1.lastModified()));

            for (File file : files) {
                if (file.isFile() && (file.getName().toLowerCase().endsWith(".jpg") || 
                                      file.getName().toLowerCase().endsWith(".png") || 
                                      file.getName().toLowerCase().endsWith(".webp") || 
                                      file.getName().toLowerCase().endsWith(".pdf"))) {
                    Map<String, String> fileData = new HashMap<>();
                    fileData.put("name", file.getName());
                    fileData.put("lastModified", dateFormat.format(new Date(file.lastModified())));
                    fileData.put("path", FILE_URL_PREFIX + file.getName());
                    fileData.put("icon", file.getName().toLowerCase().endsWith(".pdf") ? 
                            "bxs-file-pdf text-danger" : "bxs-file text-primary");
                    fileList.add(fileData);
                }
            }
        }
        
        
        return fileList;
    }
    
    public static List<Map<String, String>> filterFile(String folder, HttpServletRequest request, String search){
        
        File directory = new File(FILE_DIR + folder);
        File[] files = directory.listFiles();
        List<Map<String, String>> fileList = new ArrayList<>();
        if (files != null) {
            for (File file : files) {
                Map<String, String> fileInfo = new HashMap<>();
                fileInfo.put("name", file.getName());
                fileInfo.put("path", file.getAbsolutePath());
                
                fileInfo.put("lastModified", dateFormat.format(new Date(file.lastModified())));
                
                String icon = "bx-file";
                if (file.getName().endsWith(".pdf")) {
                    icon = "bx-file-pdf";
                } else if (file.getName().matches(".*\\.(jpg|png|gif)")) {
                    icon = "bx-image";
                }
                fileInfo.put("icon", icon);
                fileList.add(fileInfo);
            }
        }
        
        
        return fileList;
    }
}
