/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.Certificate;
import model.Certificate_Doctor;
import model.Doctors;
import model.Specialization;

/**
 *
 * @author PC
 */
public class DoctorsDAO extends DBContext {

    public List<Doctors> getAllDoctors() {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT d.doctor_id, d.doctor_name, d.experience_years, d.profile_image, d.rating, d.gender, d.dob, d.address,"
                + "sp.specialization_id, sp.specialization_name, sp.specialization_status,"
                + " c.certificate_id, c.certificate_name, cd.date_certificate,cd.issued_by\n"
                + "FROM [dbo].[Doctors] d \n"
                + "JOIN [dbo].[Specialization] sp ON d.specialization_id = sp.specialization_id\n"
                + "JOIN [dbo].[Certificate_Doctor] cd on d.doctor_id = cd.doctor_id\n"
                + "JOIN [dbo].[Certificate] c on c.certificate_id = cd.certificate_id";

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

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));

                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDoctor_id(rs.getInt("doctor_id"));
                cer_doct.setCertificate_id(rs.getInt("certificate_id"));
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

    public List<Doctors> getDoctorsBySpecializationId(String sid) {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT d.doctor_id, d.doctor_name, d.experience_years, d.profile_image, d.rating, d.gender, d.dob, d.address, sp.specialization_id, sp.specialization_name, sp.specialization_status, c.certificate_id, c.certificate_name, cd.date_certificate,cd.issued_by\n"
                + "FROM [dbo].[Doctors] d \n"
                + "JOIN [dbo].[Specialization] sp ON d.specialization_id = sp.specialization_id\n"
                + "JOIN [dbo].[Certificate_Doctor] cd on d.doctor_id = cd.doctor_id\n"
                + "JOIN [dbo].[Certificate] c on c.certificate_id = cd.certificate_id\n"
                + "where sp.specialization_id = ?";

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

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));

                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDoctor_id(rs.getInt("doctor_id"));
                cer_doct.setCertificate_id(rs.getInt("certificate_id"));
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

    public Doctors getDoctorsById(String did) {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT d.doctor_id, d.doctor_name, d.experience_years, d.profile_image, d.rating, d.gender, d.dob, d.address, sp.specialization_id, sp.specialization_name, sp.specialization_status, c.certificate_id, c.certificate_name, cd.date_certificate,cd.issued_by\n"
                + "FROM [dbo].[Doctors] d \n"
                + "JOIN [dbo].[Specialization] sp ON d.specialization_id = sp.specialization_id\n"
                + "JOIN [dbo].[Certificate_Doctor] cd on d.doctor_id = cd.doctor_id\n"
                + "JOIN [dbo].[Certificate] c on c.certificate_id = cd.certificate_id\n"
                + "where d.doctor_id = ?";

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

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));

                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDoctor_id(rs.getInt("doctor_id"));
                cer_doct.setCertificate_id(rs.getInt("certificate_id"));
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

    public List<Doctors>  searchByName(String txt) {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT d.doctor_id, d.doctor_name, d.experience_years, d.profile_image, d.rating, d.gender, d.dob, d.address, sp.specialization_id, sp.specialization_name, sp.specialization_status, c.certificate_id, c.certificate_name, cd.date_certificate,cd.issued_by\n"
                + "FROM [dbo].[Doctors] d \n"
                + "JOIN [dbo].[Specialization] sp ON d.specialization_id = sp.specialization_id\n"
                + "JOIN [dbo].[Certificate_Doctor] cd on d.doctor_id = cd.doctor_id\n"
                + "JOIN [dbo].[Certificate] c on c.certificate_id = cd.certificate_id\n"
                + "where d.doctor_name like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,"%" + txt + "%");
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

                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));
                doctor.setSpecialization(specialization);

                Certificate certificate = new Certificate();
                certificate.setCertificate_id(rs.getInt("certificate_id"));
                certificate.setCertificate_name(rs.getString("certificate_name"));

                Certificate_Doctor cer_doct = new Certificate_Doctor();
                cer_doct.setDoctor_id(rs.getInt("doctor_id"));
                cer_doct.setCertificate_id(rs.getInt("certificate_id"));
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

    public static void main(String[] args) {
        DoctorsDAO dao = new DoctorsDAO();
//        List<Doctors> list = dao.searchByName("u");
//        for (Doctors doctors : list) {
//            System.out.println(doctors);
//        }
//        List<Doctors> list = dao.getAllDoctors();
//        List<Doctors> l = dao.getDoctorsBySpecializationId("3");
//        for (Doctors doctors : l) {
//            System.out.println(doctors.getSpecialization().getSpecialization_id());
//        }        
//        Doctors d = dao.getDoctorsById("1");
//        System.out.println(d);
//        for (Doctors doctors : list) {
//            System.out.println(doctors);
//
//        }

    }

}
