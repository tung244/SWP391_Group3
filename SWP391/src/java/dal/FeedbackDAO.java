/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import model.Appointment;
import model.FeedbackService;
import model.Staffs;

/**
 *
 * @author -ASUS-
 */
public class FeedbackDAO extends DBContext {

    public boolean addFeedback(int appointmentId, String feedbackText, int feedbackRating) {
        String sql = "INSERT INTO Feedback_Service (appointment_id, feedback_text, feedback_date, feedback_rating) "
                + "VALUES (?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, appointmentId);
            st.setString(2, feedbackText);
            st.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis())); // Lấy thời gian thực
            st.setInt(4, feedbackRating);

            int rowsInserted = st.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List<String> list = dao.getCustomerSupportNames();
        System.out.println(list);
    }

    public List<FeedbackService> getCustomerSupportFeedbackWithPercentage() {
        List<FeedbackService> list = new ArrayList<>();
        String sql = """
                     SELECT 
                         s.admin_fullname,
                         a.staff_id,
                         COUNT(f.feedback_id) AS total_feedback,
                         SUM(f.feedback_rating) AS total_stars,
                         FORMAT(CAST(SUM(f.feedback_rating) AS FLOAT) / COUNT(f.feedback_id) * 20, '0.#')  AS average_rating                     FROM Feedback_Service f
                     JOIN Appointment a ON f.appointment_id = a.appointment_id
                     JOIN Staff s ON s.account_id = a.staff_id  
                     GROUP BY a.staff_id, s.admin_fullname  
                     ORDER BY CAST(SUM(f.feedback_rating) AS FLOAT) / COUNT(f.feedback_id) * 20 DESC; """;
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                int staff_id = rs.getInt("staff_id");
                int total_feedback = rs.getInt("total_feedback");
                int total_stars = rs.getInt("total_stars");
                double average_rating = rs.getDouble("average_rating");
                String name = rs.getString("admin_fullname");
                Staffs staff = new Staffs(name);
                Appointment appointment = new Appointment(staff);
                FeedbackService feedbackService = new FeedbackService(average_rating, appointment, staff_id, total_feedback, total_stars);
                list.add(feedbackService);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<FeedbackService> getFeedbackServiceCustomerSupport() {
        List<FeedbackService> list = new ArrayList<>();
        String sql = """
                     SELECT
                     \tf.feedback_id, 
                     \tf.feedback_text, 
                     \tf.feedback_rating, 
                     \tf.feedback_date, 
                     \tc.full_name,
                     \ts.admin_fullname
                     from Feedback_Service f
                     join Appointment a on a.appointment_id = f.appointment_id
                     join Customers c on c.account_id = a.patient_id
                     join Staff s on s.account_id = a.staff_id""";
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                int feedback_id = rs.getInt("feedback_id");
                String feedback_text = rs.getString("feedback_text");
                int feedback_rating = rs.getInt("feedback_rating");
                Date feedback_date = rs.getDate("feedback_date");
                String full_name = rs.getString("full_name");
                String admin_fullname = rs.getString("admin_fullname");
                Staffs staff = new Staffs(admin_fullname);
                Appointment appointment = new Appointment(staff);
                FeedbackService feedbackService = new FeedbackService(feedback_text, feedback_rating, feedback_id, feedback_date, appointment, full_name);
                list.add(feedbackService);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<FeedbackService> getMonthlyFeedbackByCustomerSupport(String admin_fullname, String year) {
        List<FeedbackService> list = new ArrayList<>();
        String sql = """
        SELECT 
            DATEPART(MONTH, a.appointment_date) AS month,
            FORMAT(CAST(SUM(f.feedback_rating) AS FLOAT) / COUNT(f.feedback_id) * 20, '0.#') AS average_rating_percentage
        FROM Feedback_Service f
        JOIN Appointment a ON f.appointment_id = a.appointment_id
        JOIN Staff s ON s.account_id = a.staff_id
        WHERE s.admin_fullname LIKE N'%' + ? + '%' AND YEAR(a.appointment_date) = ?
        GROUP BY DATEPART(MONTH, a.appointment_date)
        ORDER BY month;
    """;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, admin_fullname);
            st.setString(2, year); // Đặt năm vào câu truy vấn

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int month = rs.getInt("month");
                    double averageRating = rs.getDouble("average_rating_percentage");
                    list.add(new FeedbackService(averageRating, month));
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Debug lỗi nếu có
        }
        return list;
    }

    public List<FeedbackService> getFeedbackServiceByPage(ArrayList<FeedbackService> list, int start, int end) {
        ArrayList<FeedbackService> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<String> getCustomerSupportNames() {
        List<String> names = new ArrayList<>();
        String sql = "SELECT DISTINCT admin_fullname FROM Staff"; // Giả sử cột tên là admin_fullname
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                names.add(rs.getString("admin_fullname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return names;
    }

}
