/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Account;
import model.Certificate;
import model.Certificate_Doctor;
import model.Degree;
import model.Degree_Doctor;
import model.Doctors;
import model.Role;
import model.Specialization;

public class DoctorsDAO extends DBContext {

    //List doctor in dashboard
    public List<Doctors> getDoctorsDash() {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Doctors] d\n"
                + "LEFT JOIN dbo.Specialization sp  ON sp.specialization_id = d.specialization_id\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctors doctor = new Doctors();
                doctor.setDoctor_id(rs.getInt("doctor_id"));
                doctor.setDoctor_name(rs.getString("doctor_name"));
                doctor.setExperience_years(rs.getInt("experience_years"));
                doctor.setProfile_image(rs.getString("profile_image"));
                doctor.setRating(rs.getDouble("rating"));
                doctor.setGender(rs.getString("gender"));
                doctor.setDob(rs.getString("dob"));
                doctor.setAddress(rs.getString("address"));
                doctor.setDoctor_status(rs.getString("doctor_status"));

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                list.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // List all doctor
    public List<Doctors> getAllDoctors() {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT  * FROM [dbo].[Doctors] d\n"
                + "LEFT JOIN dbo.Specialization sp  ON sp.specialization_id = d.specialization_id\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctors doctor = new Doctors();
                doctor.setDoctor_id(rs.getInt("doctor_id"));
                doctor.setDoctor_name(rs.getString("doctor_name"));
                doctor.setExperience_years(rs.getInt("experience_years"));
                doctor.setProfile_image(rs.getString("profile_image"));
                doctor.setRating(rs.getDouble("rating"));
                doctor.setGender(rs.getString("gender"));
                doctor.setDob(rs.getString("dob"));
                doctor.setAddress(rs.getString("address"));
                doctor.setDoctor_status(rs.getString("doctor_status"));

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                list.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //Get active doctors
    public List<Doctors> getActiveDoctors() {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Doctors] d "
                + "LEFT JOIN dbo.Specialization sp ON sp.specialization_id = d.specialization_id "
                + "WHERE d.doctor_status = 'Active'";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctors doctor = new Doctors();
                doctor.setDoctor_id(rs.getInt("doctor_id"));
                doctor.setDoctor_name(rs.getString("doctor_name"));
                doctor.setExperience_years(rs.getInt("experience_years"));
                doctor.setProfile_image(rs.getString("profile_image"));
                doctor.setRating(rs.getDouble("rating"));
                doctor.setGender(rs.getString("gender"));
                doctor.setDob(rs.getString("dob"));
                doctor.setAddress(rs.getString("address"));
                doctor.setDoctor_status(rs.getString("doctor_status"));

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                list.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
//Get Doctor by id chuyen khoa

    public List<Doctors> getDoctorsBySpecializationId(String sid) {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Doctors] d\n"
                + "LEFT JOIN dbo.Specialization sp  ON sp.specialization_id = d.specialization_id\n"
                + "WHERE d.doctor_status = 'Active'"
                + "AND sp.specialization_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctors doctor = new Doctors();
                doctor.setDoctor_id(rs.getInt("doctor_id"));
                doctor.setDoctor_name(rs.getString("doctor_name"));
                doctor.setExperience_years(rs.getInt("experience_years"));
                doctor.setProfile_image(rs.getString("profile_image"));
                doctor.setRating(rs.getDouble("rating"));
                doctor.setGender(rs.getString("gender"));
                doctor.setDob(rs.getString("dob"));
                doctor.setAddress(rs.getString("address"));
                doctor.setDoctor_status(rs.getString("doctor_status"));

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                list.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
//Get Doctor by id

    public Doctors getDoctorsById(String did) {
        String sql = "SELECT * FROM [dbo].[Doctors] d\n"
                + "LEFT JOIN dbo.Specialization sp  ON sp.specialization_id = d.specialization_id\n"
                + "WHERE d.doctor_id =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctors doctor = new Doctors();
                doctor.setDoctor_id(rs.getInt("doctor_id"));
                doctor.setDoctor_name(rs.getString("doctor_name"));
                doctor.setExperience_years(rs.getInt("experience_years"));
                doctor.setProfile_image(rs.getString("profile_image"));
                doctor.setRating(rs.getDouble("rating"));
                doctor.setGender(rs.getString("gender"));
                doctor.setDob(rs.getString("dob"));
                doctor.setAddress(rs.getString("address"));
                doctor.setDoctor_status(rs.getString("doctor_status"));

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                return doctor;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Doctors> getDoctorsByFilter(String specializationId, String degreeId, String searchName, String sortBy, String option) {
        List<Doctors> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT DISTINCT d.*, sp.* "
                + "FROM dbo.Doctors d "
                + "LEFT JOIN dbo.Specialization sp ON sp.specialization_id = d.specialization_id "
                + "LEFT JOIN dbo.Degree_Doctor dd ON dd.doctor_id = d.doctor_id "
                + "LEFT JOIN dbo.Degree de ON de.degree_id = dd.degree_id "
                + "WHERE 1=1 ");

        List<String> param = new ArrayList<>();
        // Chuẩn hóa searchName để loại bỏ dấu cách thừa
        if (searchName != null && !searchName.trim().isEmpty()) {
            searchName = searchName.trim().replaceAll("\\s+", " "); // Loại bỏ khoảng trắng dư thừa
        }

        if (specializationId != null && !specializationId.isEmpty()) {
            sql.append("AND d.specialization_id = ? ");
            param.add(specializationId);
        }
        if (degreeId != null && !degreeId.isEmpty()) {
            sql.append("AND dd.degree_id = ? ");
            param.add(degreeId);
        }
        if (searchName != null && !searchName.isEmpty()) {
            sql.append("AND REPLACE(d.doctor_name, ' ', '') LIKE REPLACE(?, ' ', '') ");
            param.add("%" + searchName.replace(" ", "") + "%");
        }
        if (sortBy != null && !sortBy.isEmpty()) {
            switch (sortBy) {
                case "sortByName":
                    sql.append("ORDER BY d.doctor_name");
                    break;
                case "sortByExperience":
                    sql.append("ORDER BY d.experience_years");
                    break;
                case "sortByRating":
                    sql.append("ORDER BY d.rating");
                    break;
            }
            if (option != null && !option.isEmpty()) {
                sql.append(option.equals("asc") ? " ASC " : " DESC ");
            }

        }

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            for (int i = 0; i < param.size(); i++) {
                st.setString(i + 1, param.get(i));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctors doctor = new Doctors();
                doctor.setDoctor_id(rs.getInt("doctor_id"));
                doctor.setDoctor_name(rs.getString("doctor_name"));
                doctor.setExperience_years(rs.getInt("experience_years"));
                doctor.setProfile_image(rs.getString("profile_image"));
                doctor.setRating(rs.getDouble("rating"));
                doctor.setGender(rs.getString("gender"));
                doctor.setDob(rs.getString("dob"));
                doctor.setAddress(rs.getString("address"));
                doctor.setDoctor_status(rs.getString("doctor_status"));

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                list.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean updateDoctor(Doctors doctor) {
        String sql = "UPDATE doctors SET doctor_name = ?, experience_years = ?, specialization_id = ?, gender = ?, dob = ?, address = ?, profile_image = ? WHERE doctor_id = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, doctor.getDoctor_name());
            ps.setInt(2, doctor.getExperience_years());
            ps.setInt(3, doctor.getSpecialization().getSpecialization_id());
            ps.setString(4, doctor.getGender());
            ps.setString(5, doctor.getDob());
            ps.setString(6, doctor.getAddress());
            ps.setString(7, doctor.getProfile_image());
            ps.setInt(8, doctor.getDoctor_id());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addDoctor(Doctors doctor) {
        String accountSql = "INSERT INTO Accounts(username, password, email, phone_number, created_date, role_id, first_confirm) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String getAccountIdSql = "SELECT account_id FROM Accounts WHERE username = ?";
        String doctorSql = "INSERT INTO Doctors(doctor_name, experience_years, profile_image, gender, dob, address, doctor_status, specialization_id, account_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Thêm tài khoản vào bảng Accounts
            try (PreparedStatement stmt = connection.prepareStatement(accountSql)) {
                stmt.setString(1, doctor.getAcc().getUsername());
                stmt.setString(2, doctor.getAcc().getPassword());
                stmt.setString(3, doctor.getAcc().getEmail());
                stmt.setString(4, doctor.getAcc().getPhonenumber());
                stmt.setString(5, doctor.getAcc().getCreated_date());
                stmt.setInt(6, doctor.getAcc().getRole().getRole_id());
                stmt.setString(7, doctor.getAcc().getFirst_confirm());
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted == 0) {
                    connection.rollback();
                    return false;
                }
            }

            // Lấy account_id vừa tạo bằng cách truy vấn theo username
            int accountId = -1;
            try (PreparedStatement stmt = connection.prepareStatement(getAccountIdSql)) {
                stmt.setString(1, doctor.getAcc().getUsername());
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        accountId = rs.getInt("account_id");
                    } else {
                        connection.rollback();
                        return false;
                    }
                }
            }

            // Thêm thông tin bác sĩ vào bảng Doctors
            try (PreparedStatement stmt = connection.prepareStatement(doctorSql)) {
                stmt.setString(1, doctor.getDoctor_name());
                stmt.setInt(2, doctor.getExperience_years());
                stmt.setString(3, doctor.getProfile_image());
                stmt.setString(4, doctor.getGender());
                stmt.setString(5, doctor.getDob());
                stmt.setString(6, doctor.getAddress());
                stmt.setString(7, doctor.getDoctor_status());
                stmt.setInt(8, doctor.getSpecialization().getSpecialization_id());
                stmt.setInt(9, accountId);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted == 0) {
                    connection.rollback();
                    return false;
                }
            }

            connection.commit(); // Xác nhận transaction
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback(); // Nếu có lỗi, hoàn tác transaction
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true); // Khôi phục chế độ tự động commit
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public boolean updateStatus(String doctor_id, String status) {
        String sql = "UPDATE dbo.Doctors SET doctor_status = ? WHERE doctor_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, status);
            st.setString(2, doctor_id);

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean getFirstConfirm(String email) {
        String sql = "SELECT first_confirm FROM dbo.Accounts WHERE email = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String firstConfirm = rs.getString(1);
                return "true".equalsIgnoreCase(firstConfirm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Doctors getDoctorsByAccId(int accid) {
        String sql = " SELECT * FROM dbo.Doctors d \n"
                + " JOIN dbo.Specialization sp ON sp.specialization_id = d.specialization_id\n"
                + " WHERE d.account_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctors doctor = new Doctors();
                doctor.setDoctor_id(rs.getInt("doctor_id"));
                doctor.setDoctor_name(rs.getString("doctor_name"));
                doctor.setExperience_years(rs.getInt("experience_years"));
                doctor.setProfile_image(rs.getString("profile_image"));
                doctor.setRating(rs.getDouble("rating"));
                doctor.setGender(rs.getString("gender"));
                doctor.setDob(rs.getString("dob"));
                doctor.setAddress(rs.getString("address"));
                doctor.setDoctor_status(rs.getString("doctor_status"));

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                return doctor;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public String getDoctorIdByAccId(int accId) {
        String sql = " SELECT doctor_id FROM dbo.Doctors WHERE account_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getDoctorAccIdByDoctorId(String did) {
        String sql = " SELECT  account_id  FROM dbo.Doctors WHERE doctor_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, did);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Object[]> getDoctorStats(String startDate, String endDate) {
        List<Object[]> statsList = new ArrayList<>();
        String sql = "SELECT \n"
                + "    d.doctor_id,\n"
                + "    d.doctor_name,\n"
                + "    COUNT(a.appointment_id) AS total_appointments,\n"
                + "    SUM(CASE WHEN a.appointment_status = 'Completed' THEN 1 ELSE 0 END) AS successful_appointments,\n"
                + "    COUNT(CASE WHEN a.appointment_status = 'Completed' THEN 1 END) * 100.0 / NULLIF(COUNT(a.appointment_id), 0) AS success_rate,\n"
                + "    COUNT(CASE WHEN a.appointment_status = 'Canceled' THEN 1 END) * 100.0 / NULLIF(COUNT(a.appointment_id), 0) AS cancel_rate,\n"
                + "    ROUND(AVG(CASE WHEN fd.feedback_rating IS NOT NULL THEN fd.feedback_rating END), 2) AS average_rating,\n"
                + "    COALESCE(SUM(sd.cost), 0) AS total_revenue \n"
                + "FROM Doctors d\n"
                + "LEFT JOIN Appointment a ON d.doctor_id = a.doctor_id\n"
                + "LEFT JOIN Feedback_Doctor fd ON a.appointment_id = fd.appointment_id\n"
                + "LEFT JOIN Services_Detail sd ON a.service_detail_id = sd.service_detail_id\n"
                + "WHERE a.appointment_date BETWEEN ? AND ? "
                + "GROUP BY d.doctor_id, d.doctor_name\n"
                + "ORDER BY total_revenue DESC;";

        try {
           PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                statsList.add(new Object[]{
                    rs.getString("doctor_name"),
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

    public List<Doctors> getSameSpecializationDoctors(int id) {
        String query = "SELECT DISTINCT d.*,sp.specialization_name \n"
                + "FROM Doctors d\n"
                + "LEFT JOIN Specialization sp ON d.specialization_id = sp.specialization_id\n"
                + "LEFT JOIN [Services] s ON s.specialization_id = sp.specialization_id\n"
                + "WHERE d.specialization_id = ?";
        List<Doctors> list = new ArrayList<>();
        try {
           PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
             ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int specialization_id = rs.getInt("specialization_id");
                String spe_name = rs.getString("specialization_name");
                Specialization specialization = new Specialization(specialization_id, spe_name);
                list.add(new Doctors(rs.getInt("doctor_id"), rs.getString("doctor_name"), rs.getInt("experience_years"),
                        rs.getString("profile_image"), rs.getDouble("rating"), rs.getString("gender"), rs.getString("dob"), rs.getString("address"), specialization, null));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DoctorsDAO dao = new DoctorsDAO();
        List<Doctors> l = dao.getDoctorsDash();
        for (Doctors doctors : l) {
            System.out.println(doctors);
        }
//        System.out.println(dao.getDoctorIdByAccId(2));

//        List<Doctors> li = dao.getDoctorsByFilter("1", "", "", "", "asc");
//        for (Doctors doctors : li) {
//            System.out.println(doctors);
//        }
//    
//        Account account = new Account();
//        account.setUsername("doctor6");
//        account.setEmail("doctor6@example.com");
//        account.setCreated_date("2025-02-24");
//        account.setPassword("doctorpass6");
//        account.setPhonenumber("1000000019");
//        account.setFirst_confirm("true");
//        Role role = new Role();
//        role.setRole_id(3);
//        account.setRole(role);
//        Doctors doc = new Doctors();
//        doc.setDoctor_name("j");
//        doc.setExperience_years(10);
//        doc.setProfile_image("profile.jpg");
//        doc.setGender("Male");
//        doc.setDob("1985-01-01");
//        doc.setAddress("123 Street");
//        doc.setDoctor_status("Active");
//        Specialization specialization = new Specialization();
//        specialization.setSpecialization_id(1);
//        doc.setSpecialization(specialization);
//        doc.setAcc(account);
//
//        boolean flag = dao.addDoctor(doc);
//        if (flag) {
//            System.out.println("Doctor added successfully!");
//        } else {
//            System.out.println("Failed to add the doctor.");
//        }
//        
//        Doctors doc = new Doctors();
//        doc.setDoctor_name("Lee Min Hoo");
//        doc.setExperience_years(10);
//        doc.setProfile_image("profile.jpg");
//        
//        doc.setGender("Male");
//        doc.setDob("1985-01-01");
//        doc.setAddress("123 Street");
//       
//        Specialization specialization = new Specialization();
//        specialization.setSpecialization_id(1);
//        doc.setSpecialization(specialization);
//        doc.setDoctor_id(1);
//        
//        boolean flag = dao.updateDoctor(doc);
//        if(flag){
//            System.out.println("ok");
//        }
//        List<Doctors> l = dao.getAllDoctors();
//        for (Doctors doctors : l) {
//            System.out.println(doctors);
//        }
//    List<Doctors> list = dao.getActiveDoctors();
//    for (Doctors doctors : list
//
//    
//        ) {
//                    System.out.println(doctors);
//    }
//
//                List<Doctors> l = dao.getDoctorsBySpecializationId("1");
//                for (Doctors doctors : l) {
//                    System.out.println(doctors);
//                }        
//                Doctors d = dao.getDoctorsById("1");
//                System.out.println(d);
        //        for (Doctors doctors : list) {
        //            System.out.println(doctors);
        //
        //        }
    }

}
