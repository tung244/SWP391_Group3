/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Appointments;
import model.Doctors;
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
        String sql = "SELECT * FROM dbo.Appointment a "
                + "JOIN dbo.Services_Detail s ON s.service_detail_id = a.service_detail_id "
                + "JOIN dbo.Services se ON se.service_id = s.service_id "
                + "JOIN dbo.Services_Type st ON st.service_type_id = s.service_type_id "
                + "LEFT JOIN dbo.Doctors d ON a.doctor_id = d.doctor_id "
                + "LEFT JOIN dbo.Slots sl ON a.slot_id = sl.slot_id "
                + "JOIN Customers c ON c.account_id = a.patient_id WHERE 1=1";

        if (id != null && !id.isEmpty()) {
            sql += " AND a.appointment_id = ?";
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

                // Handle patient details
                int account_id = rs.getInt("patient_id");
                Account account = new Account(account_id);
                String fullname = rs.getString("full_name");
                UserProfile user = new UserProfile(account, fullname);

                // Create appointment object
                Appointments appointment = new Appointments(appointment_id, appointment_date, appointment_status, doctor, slot, service_detail, user);
                list.add(appointment);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Appointments> getFilterAppointment(String service_Id, String doctor_Id, String date, String status) {
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
        String query = "INSERT INTO Appointment (appointment_date, appointment_status, service_detail_id, patient_id) VALUES (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setDate(1, appointment.getAppointment_date());
            ps.setString(2, appointment.getAppointment_status());
            ps.setInt(3, appointment.getService_detail().getService_detail_id());
            ps.setInt(4, appointment.getUser().getAccount().getAccount_id());
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
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

    public static void main(String[] args) {
        AppointmentDAO dao = new AppointmentDAO();
        List<Appointments> list = dao.getAppointment(null);
        for (Appointments slots : list) {
            System.out.println(slots);
        }
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
