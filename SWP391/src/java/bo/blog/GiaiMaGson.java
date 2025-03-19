/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo.blog;

import bo.GetFormatDate;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import dal.BlogDAO;
import java.io.File;
import java.util.List;
import model.Blog;
import model.BlogCrawl;

public class GiaiMaGson {
    
    public static void main(String[] args) {
        try {
            BlogDAO bdao = new BlogDAO();
            // Tạo ObjectMapper để đọc JSON
            ObjectMapper mapper = new ObjectMapper();

            // Đọc JSON vào danh sách List<MyJsonData>
            List<BlogCrawl> dataList = mapper.readValue(new File("F:\\Download\\toolCrawlNhaVua\\blog_posts.json"), new TypeReference<List<BlogCrawl>>() {
            });

            // In ra danh sách phần tử đã giải mã
            for (BlogCrawl item : dataList) {
                Blog b = new Blog(item.getContent_html(),
                        10,
                        GetFormatDate.getFormString(),
                        item.getTitle(),
                        "http://localhost:8080/SWP391/images/duy.png", "Public");
                if(bdao.createBlog(b)){
                    System.out.println(b.getTitle_meta()); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
