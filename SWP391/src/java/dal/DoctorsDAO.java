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
import model.Certificate;
import model.Certificate_Doctor;
import model.Degree;
import model.Degree_Doctor;
import model.Doctors;
import model.Specialization;

public class DoctorsDAO extends DBContext {

    // List all doctor
    public List<Doctors> getAllDoctors() {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Doctors] d\n"
                + "LEFT JOIN dbo.Specialization sp  ON sp.specialization_id = d.specialization_id\n"
                + "LEFT JOIN dbo.Certificate_Doctor cd ON cd.doctor_id = d.doctor_id\n"
                + "LEFT JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n";

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

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));
                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDate_certificate(rs.getString("date_certificate"));
                cer_doct.setIssued_by(rs.getString("issued_by"));
                certificate.setCer_doct(cer_doct);
                doctor.setCertificate(certificate);

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
                + "LEFT JOIN dbo.Certificate_Doctor cd ON cd.doctor_id = d.doctor_id "
                + "LEFT JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id "
                + "WHERE d.doctor_status LIKE 'Active'";

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

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));
                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDate_certificate(rs.getString("date_certificate"));
                cer_doct.setIssued_by(rs.getString("issued_by"));
                certificate.setCer_doct(cer_doct);
                doctor.setCertificate(certificate);

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
                + "LEFT JOIN dbo.Certificate_Doctor cd ON cd.doctor_id = d.doctor_id\n"
                + "LEFT JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + "WHERE sp.specialization_id = ?";

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

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));
                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDate_certificate(rs.getString("date_certificate"));
                cer_doct.setIssued_by(rs.getString("issued_by"));
                certificate.setCer_doct(cer_doct);
                doctor.setCertificate(certificate);

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
                + "LEFT JOIN dbo.Certificate_Doctor cd ON cd.doctor_id = d.doctor_id\n"
                + "LEFT JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
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

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));
                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDate_certificate(rs.getString("date_certificate"));
                cer_doct.setIssued_by(rs.getString("issued_by"));
                certificate.setCer_doct(cer_doct);
                doctor.setCertificate(certificate);

                return doctor;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
// Search doctor by name

    public List<Doctors> searchByName(String name) {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Doctors] d\n"
                + "LEFT JOIN dbo.Specialization sp  ON sp.specialization_id = d.specialization_id\n"
                + "LEFT JOIN dbo.Certificate_Doctor cd ON cd.doctor_id = d.doctor_id\n"
                + "LEFT JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + "WHERE d.doctor_name LIKE ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
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

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));
                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDate_certificate(rs.getString("date_certificate"));
                cer_doct.setIssued_by(rs.getString("issued_by"));
                certificate.setCer_doct(cer_doct);
                doctor.setCertificate(certificate);

                list.add(doctor);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Doctors> getDoctorsBySpecializationIdAndName(String specializationId, String name) {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Doctors] d\n"
                + "LEFT JOIN dbo.Specialization sp  ON sp.specialization_id = d.specialization_id\n"
                + "LEFT JOIN dbo.Certificate_Doctor cd ON cd.doctor_id = d.doctor_id\n"
                + "LEFT JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + "WHERE d.specialization_id = ? AND d.doctor_name LIKE ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, specializationId);
            st.setString(2, "%" + name + "%");
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

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));
                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDate_certificate(rs.getString("date_certificate"));
                cer_doct.setIssued_by(rs.getString("issued_by"));
                certificate.setCer_doct(cer_doct);
                doctor.setCertificate(certificate);

                list.add(doctor);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

   

    public boolean updateDoctor(Doctors doctor) {
        String sql = "UPDATE Doctors SET "
                + "doctor_name = ?, "
                + "experience_years = ?, "
                + "profile_image = ?, "
                + "rating = ?, "
                + "gender = ?, "
                + "dob = ?, "
                + "address = ?, "
                + "specialization_id = ? "
                + "WHERE doctor_id = ?";

        try (
                PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, doctor.getDoctor_name());
            st.setInt(2, doctor.getExperience_years());
            st.setString(3, doctor.getProfile_image());
            st.setDouble(4, doctor.getRating());
            st.setString(5, doctor.getGender());
            st.setString(6, doctor.getDob());
            st.setString(7, doctor.getAddress());
            st.setInt(8, doctor.getSpecialization().getSpecialization_id());
            st.setInt(9, doctor.getDoctor_id());

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Sắp xếp theo tên
    public static void sortByName(List<Doctors> doctors, String order) {
        if (order.equals("A-Z")) {
            Collections.sort(doctors, Comparator.comparing(Doctors::getDoctor_name));
        } else if (order.equals("Z-A")) {
            Collections.sort(doctors, Comparator.comparing(Doctors::getDoctor_name).reversed());
        }
    }

    // Sắp xếp theo kinh nghiệm
    public static void sortByExperience(List<Doctors> doctors, String order) {
        if (order.equals("High-low")) {
            Collections.sort(doctors, Comparator.comparingInt(Doctors::getExperience_years).reversed());
        } else if (order.equals("Low-high")) {
            Collections.sort(doctors, Comparator.comparingInt(Doctors::getExperience_years));
        }
    }

    // Sắp xếp theo đánh giá
    public static void sortByRating(List<Doctors> doctors, String order) {
        if (order.equals("High-low")) {
            Collections.sort(doctors, Comparator.comparingDouble(Doctors::getRating).reversed());
        } else if (order.equals("Low-high")) {
            Collections.sort(doctors, Comparator.comparingDouble(Doctors::getRating));
        }
    }

    public static void main(String[] args) {
        DoctorsDAO dao = new DoctorsDAO();
//        List<Doctors> l = dao.searchByName("o");
//        for (Doctors doctors : l) {
//            System.out.println(doctors);
//        }
        //        List<Doctors> list = dao.getAllDoctors();
        //        for (Doctors doctors : list) {
        //            System.out.println(doctors);
        //        }        
//                List<Doctors> list = dao.getDoctorsBySpecializationIdAndName("2", "o");
//                for (Doctors doctors : list) {
//                    System.out.println(doctors);
//                }
        //        List<Doctors> l = dao.getDoctorsBySpecializationId("3");
        //        for (Doctors doctors : l) {
        //            System.out.println(doctors.getSpecialization());
        //        }        
        //        Doctors d = dao.getDoctorsById("1");
        //        System.out.println(d);
        //        for (Doctors doctors : list) {
        //            System.out.println(doctors);
        //
        //        }
    }

}
