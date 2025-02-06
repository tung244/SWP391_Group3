
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Banner;

public class BannerDAO extends DBContext{
    public List<Banner> getAllBanner() {
        String sql = "select * from Banner";
        List<Banner> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Banner b = new Banner(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
                list.add(b);
            }
            
        } catch (Exception e) {
        }
        return list;

    }
    public static void main(String[] args) {
        BannerDAO b = new BannerDAO();
        for (Banner banner : b.getAllBanner()) {
            System.out.println(banner.getLink_banner());
        }
    }
}
