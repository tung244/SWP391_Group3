/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.homepage.blog;

import java.io.File;


public class ThongKePhanCung {
    public static void main(String[] args) {
        // Đường dẫn đến thư mục dự án
        String projectFolderPath = "F:\\FPT\\SWP391\\SWP391_Group3\\SWP391"; 
        String imagesFolderPath = projectFolderPath + "\\web"+ "\\images"; 

        // Tính dung lượng thư mục
        long projectSize = getFolderSize(new File(projectFolderPath));
        long imagesSize = getFolderSize(new File(imagesFolderPath));

        // Hiển thị kết quả
        System.out.println("Tổng dung lượng dự án: " + formatSize(projectSize));
        System.out.println("Dung lượng thư mục ảnh: " + formatSize(imagesSize));
    }

    // Hàm tính dung lượng của thư mục
    public static long getFolderSize(File folder) {
        if (!folder.exists()) return 0;
        long length = 0;
        File[] files = folder.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    length += file.length();
                } else {
                    length += getFolderSize(file); // Đệ quy nếu là thư mục con
                }
            }
        }
        return length;
    }

    // Hàm định dạng dung lượng (Byte -> KB, MB, GB)
    public static String formatSize(long size) {
        String[] units = {"B", "KB", "MB", "GB", "TB"};
        int unitIndex = 0;
        double sizeInUnits = size;
        while (sizeInUnits > 1024 && unitIndex < units.length - 1) {
            sizeInUnits /= 1024;
            unitIndex++;
        }
        return String.format("%.2f %s", sizeInUnits, units[unitIndex]);
    }
}
