package controller.homepage.blog;
import dal.BlogDAO;
import org.apache.commons.text.similarity.CosineSimilarity;
import java.util.*;
import java.util.stream.Collectors;
import model.Blog;

public class TFIDFRecommender {
    // Hàm đề xuất bài viết
    public static List<String> recommend(String currentTitle, List<String> allTitleList) {
        // Chuyển tiêu đề hiện tại thành tập hợp các từ
        Set<String> currentWords = new HashSet<>(Arrays.asList(currentTitle.toLowerCase().split("\\s+")));

        Map<String, Integer> scores = new HashMap<>();
        for (String title : allTitleList) {
            if (!title.equals(currentTitle)) { // Bỏ qua chính tiêu đề hiện tại
                // Chuyển tiêu đề khác thành tập hợp các từ
                Set<String> otherWords = new HashSet<>(Arrays.asList(title.toLowerCase().split("\\s+")));
                
                // Tính số từ chung
                int commonWords = 0;
                for (String word : currentWords) {
                    if (otherWords.contains(word)) {
                        commonWords++;
                    }
                }
                scores.put(title, commonWords);
            }
        }


        // Sắp xếp theo số từ chung (giảm dần) và lấy top 5
        return scores.entrySet().stream()
                .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
                .limit(5)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }

    
    public static void main(String[] args) {
        // Danh sách các tiêu đề bài viết
        
//        BlogDAO bdao = new BlogDAO();
//        List<String> allTitles = bdao.loadAllTitle();
//
//        // Tiêu đề hiện tại
//        String currentTitle = "Phòng chống bệnh đau mắt đỏ trong trường học: Cách xử trí";
//
//        TFIDFRecommender recommender = new TFIDFRecommender();
//        List<String> recommendations = recommender.recommend(currentTitle, allTitles);
//
//        // In kết quả
//        System.out.println("Tiêu đề hiện tại: " + currentTitle);
//        System.out.println("Các bài viết được đề xuất:");
//        for (String title : recommendations) {
//            System.out.println("- " + title);
//        }
    }
}