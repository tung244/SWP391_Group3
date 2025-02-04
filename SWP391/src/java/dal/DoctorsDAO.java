/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.Doctors;
import model.Specialization;

/**
 *
 * @author PC
 */
public class DoctorsDAO extends DBContext {

    public List<Doctors> getAllDoctors() {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT d.doctor_id, d.doctor_name, d.experience_years, d.profile_image, d.rating, d.gender, d.dob, d.address, sp.specialization_id, sp.specialization_name, sp.specialization_status "
                + "FROM [dbo].[Doctors] d "
                + "JOIN [dbo].[Specialization] sp ON d.specialization_id = sp.specialization_id";

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

                list.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Specialization> getAllSpecialization() {
        List<Specialization> list = new ArrayList<>();
        String sql = "select * from [dbo].[Specialization]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Specialization specialization = new Specialization();
                specialization.setSpecialization_id(rs.getInt("specialization_id"));
                specialization.setSpecialization_name(rs.getString("specialization_name"));
                specialization.setSpecialization_status(rs.getString("specialization_status"));

                list.add(specialization);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Doctors> getDoctorsBySpecializationId(String sid) {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT d.doctor_id, d.doctor_name, d.experience_years, d.profile_image, d.rating, d.gender, d.dob, d.address, sp.specialization_id, sp.specialization_name, sp.specialization_status \n"
                + "FROM [dbo].[Doctors] d JOIN [dbo].[Specialization] sp "
                + "ON d.specialization_id = sp.specialization_id "
                + "where d.specialization_id = ?";

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

                list.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        DoctorsDAO dao = new DoctorsDAO();
        List<Doctors> list = dao.getAllDoctors();
        List<Specialization> listsp = dao.getAllSpecialization();
//        for (Doctors doctors : list) {
//            System.out.println(doctors);
//
//        }
//        for (Specialization sp : listsp) {
//            System.out.println(sp);
//        }
//          List<Doctors> listbySid = dao.getDoctorsBySpecializationId("2");
//          System.out.println(listbySid);
    }

}
