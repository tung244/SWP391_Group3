/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author APC
 */
public class AdminDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getCountCustomer() {
        String query = "select Count(*) from Customers";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt(1);
                return count;
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public int getCountCustomerSupport() {
        String query = "select Count(*) from Accounts a\n"
                + "join Role r on a.role_id = r.role_id\n"
                + "where r.role_id = 4";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt(1);
                return count;
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public int getCountSale() {
        String query = "select Count(*) from Accounts a\n"
                + "join Role r on a.role_id = r.role_id\n"
                + "where r.role_id = 2";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt(1);
                return count;
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public List<Object[]> getCrowedTime() {
        List<Object[]> timeRecord = new ArrayList<>();
        String query = "SELECT \n"
                + "    s.start_time, \n"
                + "    s.end_time, \n"
                + "    COUNT(a.appointment_id) AS total_appointments\n"
                + "FROM Slots s\n"
                + "LEFT JOIN Appointment a ON s.slot_id = a.slot_id AND a.appointment_status = 'Completed'\n"
                + "GROUP BY s.start_time, s.end_time\n"
                + "ORDER BY s.start_time;";

        try {
            ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Object[] record = new Object[3];
                record[0] = rs.getString("start_time"); 
                record[1] = rs.getString("end_time"); 
                record[2] = rs.getInt("total_appointments");
                timeRecord.add(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return timeRecord;
    }

}
