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
                java.sql.Time sqlstart_time = rs.getTime("start_time");
                java.sql.Time sqlend_time = rs.getTime("end_time");
                int service_type_id = rs.getInt("service_type_id");

                LocalTime start_time = sqlstart_time.toLocalTime();
                LocalTime end_time = sqlend_time.toLocalTime();

                ServiceTypes serviceType = new ServiceTypes(service_type_id);
                Slots slot = new Slots(slot_id, start_time, end_time, serviceType);
                list.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addAppointment(Appointments appointment) {
        String query = "INSERT INTO Appointment (appointment_date, appointment_status, doctor_id, slot_id, service_detail_id, patient_id) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setDate(1, appointment.getAppointment_date());
            ps.setString(2, appointment.getAppointment_status());
//            Doctors doctor = new Doctors(appointment.getDoctor().getDoctor_id());
//            Slots slot = new Slots(appointment.getSlot().getSlot_id());
//            ServiceDetail service_detail = new ServiceDetail(appointment.getService_detail().getService_detail_id());
//            Account account = new Account(appointment.getUser().getAccount().getAccount_id());
//            UserProfile user = new UserProfile(account);
            ps.setInt(3, appointment.getDoctor().getDoctor_id());
            ps.setInt(4, appointment.getSlot().getSlot_id());
            ps.setInt(5, appointment.getService_detail().getService_detail_id());
            ps.setInt(6, appointment.getUser().getAccount().getAccount_id());
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        AppointmentDAO dao = new AppointmentDAO();
//        List<Slots> list = dao.getSlotByServiceType(2);
//        for (Slots slots : list) {
//            System.out.println(slots);
//        }
        String date = "03/27/2025";
        Date appointment_date = null;

        // Sử dụng DateTimeFormatter để định dạng ngày
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

        if (date != null && !date.isEmpty()) {
            LocalDate localDate = LocalDate.parse(date, formatter); // Chuyển đổi sang LocalDate
            appointment_date = Date.valueOf(localDate); // Chuyển đổi LocalDate sang java.sql.Date
        }

        Account account = new Account(7);
        UserProfile user = new UserProfile(account);
        Slots slot = new Slots(1);
        Doctors doctor = new Doctors(1);
        ServiceDetail service_detail = new ServiceDetail(1);
        Appointments appointment = new Appointments(appointment_date, "Scheduled", doctor, slot, service_detail, user);
        boolean correct = dao.addAppointment(appointment);
        System.out.println(correct);
    }
}
