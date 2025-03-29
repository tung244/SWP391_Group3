/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import bo.SendMail;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Appointment;
import model.Appointments;
import model.Checkout;
import model.Discount;
import model.DiscountDetail;
import model.Doctors;
import model.MedicalHistory;
import model.Rank;
import model.ServiceDetail;
import model.ServiceTypes;
import model.Services;
import model.Slots;
import model.UserProfile;

/**
 *
 * @author DELL
 */
public class AppointmentDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Slots> getSlotByServiceType(int id) {
        List<Slots> list = new ArrayList<>();
        String query = "select * from Slots s join Services_Type st on s.service_type_id = st.service_type_id\n"
                + "where s.service_type_id =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int slot_id = rs.getInt("slot_id");
                String start_time = rs.getString("start_time");
                String end_time = rs.getString("end_time");
                int service_type_id = rs.getInt("service_type_id");
                ServiceTypes serviceType = new ServiceTypes(service_type_id);
                Slots slot = new Slots(slot_id, start_time, end_time, serviceType);
                list.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Appointments> getAppointment(String id) {
        List<Appointments> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM dbo.Appointment a\n"
                + "JOIN dbo.Services_Detail s ON s.service_detail_id = a.service_detail_id\n"
                + "JOIN dbo.Services se ON se.service_id = s.service_id\n"
                + "JOIN dbo.Services_Type st ON st.service_type_id = s.service_type_id\n"
                + "LEFT JOIN dbo.Doctors d ON a.doctor_id = d.doctor_id\n"
                + "LEFT JOIN dbo.Slots sl ON a.slot_id = sl.slot_id\n"
                + "JOIN dbo.Customers c ON c.account_id = a.patient_id\n"
                + "JOIN dbo.Accounts acc ON acc.account_id = c.account_id\n"
                + "left JOIN dbo.DiscountDetail dd ON a.discountDetailId = dd.discountDetailId\n"
                + "left JOIN dbo.Discount dc ON dd.discountId = dc.discountId\n"
                + "WHERE 1 = 1";

        if (id != null && !id.isEmpty()) {
            sql += " AND a.appointment_id = ? Order by a.appointment_date";
        } else {
            sql += " Order by a.appointment_date";
        }

        try {
            ps = connection.prepareStatement(sql);
            int index = 1;
            if (id != null && !id.isEmpty()) {
                ps.setString(index++, id);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                int appointment_id = rs.getInt("appointment_id");
                Date appointment_date = rs.getDate("appointment_date");
                String appointment_status = rs.getString("appointment_status");

                // Handle doctor
                Doctors doctor = null;
                int doctor_id = rs.getInt("doctor_id");
                if (!rs.wasNull()) {
                    String doctor_name = rs.getString("doctor_name");
                    doctor = new Doctors(doctor_id, doctor_name);
                }

                // Handle slot
                Slots slot = null;
                int slot_id = rs.getInt("slot_id");
                if (!rs.wasNull()) {
                    String start_time = rs.getString("start_time");
                    String end_time = rs.getString("end_time");
                    slot = new Slots(slot_id, start_time, end_time);
                }

                // Handle service details
                int service_id = rs.getInt("service_id");
                String service_name = rs.getString("service_name");
                int type_id = rs.getInt("service_type_id");
                String service_type_name = rs.getString("service_type_name");
                String duration_service = rs.getString("duration_service");
                Services service = new Services(service_id, service_name);
                ServiceTypes serviceType = new ServiceTypes(type_id, service_type_name, duration_service);
                int cost = rs.getInt("cost");
                int service_detail_id = rs.getInt("service_detail_id");
                ServiceDetail service_detail = new ServiceDetail(service_detail_id, service, serviceType, cost);
                Discount discount = new Discount(rs.getString("discountName"));
                DiscountDetail discountDetail = new DiscountDetail(rs.getInt("discountDetailId"),discount, rs.getInt("percent"));
                // Handle patient details
                int account_id = rs.getInt("patient_id");
                String email = rs.getString("email");
                String phonenumber = rs.getString("phone_number");
                Account account = new Account(account_id, email, phonenumber);
                String fullname = rs.getString("full_name");
                String address = rs.getString("address");
                UserProfile user = new UserProfile(account, fullname, address);
                double actualCost = rs.getDouble("actualCost");
                // Create appointment object
                //Appointments appointment = new Appointments(appointment_id, appointment_date, appointment_status, doctor, slot, service_detail, user, discountDetail, actualCost);
                Appointments appointment = new Appointments(appointment_id, appointment_date, appointment_status, doctor, slot, service_detail, user, discountDetail, actualCost);
                
                list.add(appointment);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Appointments> getPaginationAppointment(List<Appointments> list, int start, int end) {
        List<Appointments> list1 = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list1.add(list.get(i));
        }
        return list1;
    }

//    public Discount getDiscountByRankId(int id) {
//        String query = "select * from Discount d \n"
//                + "join CustomerRank r on d.rankId = r.rankId\n"
//                + "where r.rankId = ?";
//        List<Discount> list = new ArrayList<>();
//        try {
//            ps = connection.prepareStatement(query);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                Rank rank = new Rank(rs.getInt("rankId"), rs.getString("rankName"));
//                Discount discount = new Discount(rs.getInt("discountId"), rs.getInt("percent"), rank);
//                return discount;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }

    public List<Appointments> getFilterAppointment(String service_Id, String doctor_Id, String date, String status, String name) {
        List<Appointments> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM dbo.Appointment AS a\n"
                + "JOIN dbo.Services_Detail AS s ON s.service_detail_id = a.service_detail_id\n"
                + "JOIN dbo.Services AS se ON se.service_id = s.service_id\n"
                + "JOIN dbo.Services_Type AS st ON st.service_type_id = s.service_type_id\n"
                + "JOIN dbo.Doctors AS d ON a.doctor_id = d.doctor_id\n"
                + "JOIN dbo.Slots AS sl ON a.slot_id = sl.slot_id\n"
                + "JOIN dbo.Customers AS c ON c.account_id = a.patient_id\n"
                + "where 1=1 ";
        if (service_Id != null && !service_Id.isEmpty()) {
            query += "and s.service_id = ? ";
        }
        if (doctor_Id != null && !doctor_Id.isEmpty()) {
            query += "and d.doctor_id = ? ";
        }
        if (date != null && !date.isEmpty()) {
            query += "AND CAST(a.appointment_date AS DATE) = ? ";
        }
        if (status != null && !status.isEmpty()) {
            query += "and a.appointment_status = ?";
        }
        if (name != null && !name.isEmpty()) {
            query += "and c.full_name like ?";
        }
        try {
            ps = connection.prepareStatement(query);
            int index = 1;
            if (service_Id != null && !service_Id.isEmpty()) {
                ps.setString(index++, service_Id);
            }
            if (doctor_Id != null && !doctor_Id.isEmpty()) {
                ps.setString(index++, doctor_Id);
            }
            if (date != null && !date.isEmpty()) {
                ps.setString(index++, date);
            }
            if (status != null && !status.isEmpty()) {
                ps.setString(index++, status);
            }

            if (name != null && !name.isEmpty()) {
                ps.setString(index++, "%" + name + "%"); // Nếu bạn muốn tìm kiếm với wildcard
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                int appointment_id = rs.getInt("appointment_id");
                Date appointment_date = rs.getDate("appointment_date");
                String appointment_status = rs.getString("appointment_status");
                String doctor_name = rs.getString("doctor_name");
                int doctor_id = rs.getInt("doctor_id");
                Doctors doctor = new Doctors(doctor_id, doctor_name);
                String start_time = rs.getString("start_time");
                String end_time = rs.getString("end_time");
                int slot_id = rs.getInt("slot_id");
                Slots slot = new Slots(slot_id, start_time, end_time);
                int service_id = rs.getInt("service_id");
                String service_name = rs.getString("service_name");
                int type_id = rs.getInt("service_type_id");
                String service_type_name = rs.getString("service_type_name");
                String duration_service = rs.getString("duration_service");
                Services service = new Services(service_id, service_name);
                ServiceTypes serviceType = new ServiceTypes(type_id, service_type_name, duration_service);
                int cost = rs.getInt("cost");
                int service_detail_id = rs.getInt("service_detail_id");
                ServiceDetail service_detail = new ServiceDetail(service_detail_id, service, serviceType, cost);
                int account_id = rs.getInt("patient_id");
                Account account = new Account(account_id);
                String fullname = rs.getString("full_name");
                UserProfile user = new UserProfile(account, fullname);
                Appointments appointment = new Appointments(appointment_id, appointment_date, appointment_status, doctor, slot, service_detail, user);
                list.add(appointment);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Slots> getAvailableSlot(String date, String doctor_id, String service_type) {
        List<Slots> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    s.slot_id, \n"
                + "    s.start_time, \n"
                + "    s.end_time \n"
                + "FROM \n"
                + "    Slots s \n"
                + "	join Services_Type st on s.service_type_id =st.service_type_id\n"
                + "WHERE \n"
                + "    s.slot_id NOT IN (\n"
                + "        SELECT \n"
                + "            sch.slot_id \n"
                + "        FROM \n"
                + "            Schedules sch\n"
                + "        JOIN \n"
                + "            Slots sl ON sch.slot_id = sl.slot_id\n"
                + "        JOIN \n"
                + "            Services_Type st ON sl.service_type_id = st.service_type_id\n"
                + "        WHERE \n"
                + "            sch.doctor_id = ? \n"
                + "            AND sch.schedule_date = ?\n"
                + "    )\n"
                + "	and st.service_type_id =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, doctor_id);
            ps.setString(2, date);
            ps.setString(3, service_type);
            rs = ps.executeQuery();
            while (rs.next()) {
                int slot_id = rs.getInt("slot_id");
                String start_time = rs.getString("start_time");
                String end_time = rs.getString("end_time");
                Slots slot = new Slots(slot_id, start_time, end_time);
                list.add(slot);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean addAppointment(Appointments appointment) {
        String query = "INSERT INTO Appointment (appointment_date, appointment_status, service_detail_id, patient_id, discountDetailId,actualCost) VALUES (?, ?, ?, ?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setDate(1, appointment.getAppointment_date());
            ps.setString(2, appointment.getAppointment_status());
            ps.setInt(3, appointment.getService_detail().getService_detail_id());
            ps.setInt(4, appointment.getUser().getAccount().getAccount_id());
            ps.setInt(5, appointment.getDiscount().getDiscountDetailId());
            ps.setDouble(6, appointment.getActualCost());
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertCheckout(Checkout checkout) {
        String query = "INSERT INTO CheckOut (appointment_id,transaction_type,transaction_status,total_bill,"
                + "checkout_code)values(?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, checkout.getAppointmentId());
            ps.setString(2, checkout.getTransactionType());
            ps.setString(3, checkout.getTransactionStatus());
            ps.setDouble(4, checkout.getTotalBill());
            ps.setString(5, checkout.getCheckoutCode());
            int success = ps.executeUpdate();
            return success > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean confirmAppointment(int appointmentId, int doctorId, int slotId, String status) {
        String query = "UPDATE Appointment SET doctor_id = ?, slot_id = ?,appointment_status = ? WHERE appointment_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, doctorId);
            ps.setInt(2, slotId);
            ps.setString(3, status);
            ps.setInt(4, appointmentId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean confirmPaymentAppointment(int appointmentId, String status) {
        String query = "UPDATE Appointment SET appointment_status = ? WHERE appointment_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, appointmentId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public MedicalHistory getMedicalHistoryByAId(String aid) {
        String query = "select * from MedicalHistory where appointment_id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, aid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int appointment_id = rs.getInt("appointment_id");
                Appointments appointment = new Appointments(appointment_id);
                return new MedicalHistory(appointment, rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getString(8), rs.getString(9), rs.getTimestamp(10).toLocalDateTime());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insertMedicalHistory(int appointmentId, String diagnosis, String symptoms, String treatment,
            String prescription, double visionLeft, double visionRight,
            String additionalTests, String note) {
        String query = "INSERT INTO MedicalHistory (appointment_id, diagnosis, symptoms, treatment, "
                + "prescription, vision_left, vision_right, additional_tests, note, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE())";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, appointmentId);
            ps.setString(2, diagnosis);
            ps.setString(3, symptoms);
            ps.setString(4, treatment);
            ps.setString(5, prescription);
            ps.setDouble(6, visionLeft);
            ps.setDouble(7, visionRight);
            ps.setString(8, additionalTests);
            ps.setString(9, note);

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Object[]> getAppointmentStats(String startDate, String endDate) {
        List<Object[]> statsList = new ArrayList<>();
        String sql = "SELECT \n"
                + "        s.service_name, \n"
                + "        COUNT(a.appointment_id) AS total_appointments, \n"
                + "        SUM(sd.cost) AS total_revenue,\n"
                + "        COUNT(CASE WHEN a.appointment_status = 'Completed' THEN 1 END) * 100.0 / COUNT(a.appointment_id) AS success_rate,\n"
                + "        COUNT(CASE WHEN a.appointment_status = 'Canceled' THEN 1 END) * 100.0 / COUNT(a.appointment_id) AS cancel_rate,\n"
                + "        AVG(fs.feedback_rating) AS average_rating\n"
                + "    FROM Appointment AS a\n"
                + "    LEFT JOIN Feedback_Service AS fs ON a.appointment_id = fs.appointment_id\n"
                + "    INNER JOIN Services_Detail AS sd ON a.service_detail_id = sd.service_detail_id\n"
                + "    INNER JOIN Services AS s ON sd.service_id = s.service_id\n"
                + "    WHERE a.appointment_date BETWEEN ? AND ? \n"
                + "    GROUP BY s.service_name\n"
                + "    ORDER BY total_revenue DESC";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                statsList.add(new Object[]{
                    rs.getString("service_name"),
                    rs.getInt("total_appointments"),
                    rs.getDouble("total_revenue"),
                    rs.getDouble("success_rate"),
                    rs.getDouble("cancel_rate"),
                    rs.getDouble("average_rating")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return statsList;
    }

    public List<Object[]> getQuarterlyRevenue(int year) {
        List<Object[]> revenueList = new ArrayList<>();
        String query = "SELECT \n"
                + "    YEAR(a.appointment_date) AS year,\n"
                + "    DATEPART(QUARTER, a.appointment_date) AS quarter,\n"
                + "    SUM(sd.cost) AS revenue\n"
                + "FROM \n"
                + "    Appointment a\n"
                + "JOIN \n"
                + "    Services_Detail sd ON a.service_detail_id = sd.service_detail_id\n"
                + "WHERE \n"
                + "    a.appointment_status IN ('Completed', 'Payed') and YEAR(a.appointment_date) = ?\n"
                + "GROUP BY \n"
                + "    YEAR(a.appointment_date), DATEPART(QUARTER, a.appointment_date)\n"
                + "ORDER BY \n"
                + "    year, quarter;";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] record = new Object[2];
                record[0] = rs.getInt("quarter");     // Quý
                record[1] = rs.getDouble("revenue");  // Doanh thu
                revenueList.add(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenueList;
    }

    public List<Object[]> getMonthlyRevenue(int year, int quarter) {
        List<Object[]> revenueList = new ArrayList<>();
        String query = "SELECT MONTH(a.appointment_date) AS month, "
                + "SUM(sd.cost) AS revenue "
                + "FROM Appointment a "
                + "JOIN Services_Detail sd ON a.service_detail_id = sd.service_detail_id "
                + "WHERE a.appointment_status IN ('Completed', 'Payed') "
                + "AND YEAR(a.appointment_date) = ? "
                + "AND DATEPART(QUARTER, a.appointment_date) = ? "
                + "GROUP BY MONTH(a.appointment_date) "
                + "ORDER BY month";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, year);     // Điều kiện năm
            ps.setInt(2, quarter);  // Điều kiện quý
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Object[] record = new Object[2];
                record[0] = rs.getInt("month");       // Tháng
                record[1] = rs.getDouble("revenue"); // Doanh thu
                revenueList.add(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenueList;
    }

    public List<Object[]> getRevenueStatsGroupByService(String year, String month) {
        List<Object[]> statsList = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT ");
        sql.append("s.service_name AS service_name, ");
        sql.append("SUM(sd.cost) AS total_revenue ");
        sql.append("FROM Appointment AS a ");
        sql.append("INNER JOIN Services_Detail AS sd ON a.service_detail_id = sd.service_detail_id ");
        sql.append("INNER JOIN Services AS s ON sd.service_id = s.service_id ");
        sql.append("WHERE (a.appointment_status = 'Completed' OR a.appointment_status = 'Payed') ");

        // Điều kiện thêm theo năm, quý, tháng
        if (year != null && !year.isBlank()) {
            sql.append("AND YEAR(a.appointment_date) = ? ");
        }
        if (month != null && !month.isBlank()) {
            sql.append("AND MONTH(a.appointment_date) = ? ");
        }

        sql.append("GROUP BY s.service_name "); // Nhóm theo loại dịch vụ
        sql.append("ORDER BY total_revenue DESC"); // Sắp xếp theo doanh thu giảm dần

        try {
            ps = connection.prepareStatement(sql.toString());

            // Gán tham số cho câu SQL
            int paramIndex = 1;
            if (year != null && !year.isBlank()) {
                ps.setString(paramIndex++, year); // Tham số năm
            }
            if (month != null && !month.isBlank()) {
                ps.setInt(paramIndex++, Integer.parseInt(month)); // Tham số tháng
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                statsList.add(new Object[]{
                    rs.getString("service_name"),
                    rs.getDouble("total_revenue") // Doanh thu dịch vụ đó
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return statsList;
    }

    public Checkout getCheckoutByAppointmentId(int id) {
        String sql = "select * from CheckOut where appointment_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Checkout(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getDouble(5), rs.getString(6), rs.getInt(7), rs.getTimestamp(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        AppointmentDAO dao = new AppointmentDAO();
//        LocalDate currentDate = LocalDate.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        String formattedDate = currentDate.format(formatter);

//        List<Discount> list = dao.getDiscountByRankId(1);
//        for (Discount appointments : list) {
//            System.out.println(appointments);
//        }
//        Discount d = dao.getDiscountByRankId(1);
//        System.out.println(d);

//        String date = "03/27/2025";
//        Date appointment_date = null;
//
//        // Sử dụng DateTimeFormatter để định dạng ngày
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
//
//        if (date != null && !date.isEmpty()) {
//            LocalDate localDate = LocalDate.parse(date, formatter); // Chuyển đổi sang LocalDate
//            appointment_date = Date.valueOf(localDate); // Chuyển đổi LocalDate sang java.sql.Date
//        }
//
//        Account account = new Account(7);
//        UserProfile user = new UserProfile(account);
//        Slots slot = new Slots(1);
//        Doctors doctor = new Doctors(1);
//        ServiceDetail service_detail = new ServiceDetail(1);
//        Appointments appointment = new Appointments(appointment_date, "Scheduled", doctor, slot, service_detail, user);
//        boolean correct = dao.addAppointment(appointment);
//        System.out.println(correct);
    }
}
