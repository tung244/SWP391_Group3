/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.HashMap;
import java.util.Map;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author PC
 */
public class StatisticDAO extends DBContext {

    public Map<String, Integer> getAppointmentStatistics(String did, String period) {
        String sql = "SELECT appointment_status, COUNT(*) as count \n"
                + "FROM Appointment \n"
                + "WHERE doctor_id = ? AND appointment_status IN ('Completed', 'Cancel') \n";

        // Add time period condition for SQL Server
        switch (period) {
            case "today":
                sql += "AND CONVERT(date, appointment_date) = CONVERT(date, GETDATE()) ";
                break;
            case "week":
                sql += "AND DATEPART(WEEK, appointment_date) = DATEPART(WEEK, GETDATE()) "
                        + "AND DATEPART(YEAR, appointment_date) = DATEPART(YEAR, GETDATE()) ";
                break;
            case "month":
                sql += "AND DATEPART(MONTH, appointment_date) = DATEPART(MONTH, GETDATE()) "
                        + "AND DATEPART(YEAR, appointment_date) = DATEPART(YEAR, GETDATE()) ";
                break;
            case "3months":
                sql += "AND appointment_date >= DATEADD(MONTH, -3, GETDATE()) ";
                break;
            case "year":
                sql += "AND DATEPART(YEAR, appointment_date) = DATEPART(YEAR, GETDATE()) ";
                break;
        }

        sql += "GROUP BY appointment_status;";

        Map<String, Integer> statistics = new HashMap<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
            System.err.println(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String status = rs.getString("appointment_status");
                int count = rs.getInt("count");
                statistics.put(status, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return statistics;
    }

    private String getDateFilterClause(String period) {
        switch (period) {
            case "today":
                return "CAST(appointment_date AS DATE) = CAST(GETDATE() AS DATE) ";
            case "week":
                return "appointment_date >= DATEADD(week, -1, GETDATE()) ";
            case "month":
                return "appointment_date >= DATEADD(month, -1, GETDATE()) ";
            case "3months":
                return "appointment_date >= DATEADD(month, -3, GETDATE()) ";
            case "year":
            default:
                return "appointment_date >= DATEADD(year, -1, GETDATE()) ";
        }
    }

    public Map<String, Object> getDoctorSummary(String doctorId, String period) {
        Map<String, Object> summary = new HashMap<>();
        String query = "SELECT "
                + "COUNT(*) AS total_appointments, "
                + "SUM(actualCost) AS total_earnings, "
                + "SUM(CASE WHEN appointment_status = 'Completed' THEN 1 ELSE 0 END) AS completed_appointments "
                + "FROM Appointment "
                + "WHERE doctor_id = ? AND " + getDateFilterClause(period);

        try (PreparedStatement pstm = connection.prepareStatement(query)) {
            pstm.setString(1, doctorId);
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                summary.put("totalAppointments", rs.getInt("total_appointments"));
                summary.put("totalEarnings", rs.getDouble("total_earnings"));
                summary.put("completedAppointments", rs.getInt("completed_appointments"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return summary;
    }

    public Map<Integer, Integer> getDoctorRatingStatistics(String doctorId) {
        String sql = "SELECT feedback_rating, COUNT(*) AS rating_count "
                + "FROM Feedback_Doctor "
                + "JOIN Appointment ON Feedback_Doctor.appointment_id = Appointment.appointment_id "
                + "WHERE Appointment.doctor_id = ? "
                + "GROUP BY feedback_rating "
                + "ORDER BY feedback_rating DESC";  // Sắp xếp từ 5 sao đến 1 sao

        Map<Integer, Integer> ratingStatistics = new HashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, doctorId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int rating = rs.getInt("feedback_rating");
                int count = rs.getInt("rating_count");
                ratingStatistics.put(rating, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Đảm bảo trả về đủ các mức sao từ 5 đến 1, kể cả khi không có đánh giá cho mức sao nào
        for (int i = 1; i <= 5; i++) {
            ratingStatistics.putIfAbsent(i, 0);
        }

        return ratingStatistics;
    }

    public static void main(String[] args) {
        StatisticDAO dao = new StatisticDAO();
        Map<String, Integer> statistics = dao.getAppointmentStatistics("1","week");
        System.out.println(statistics);

    }

}
