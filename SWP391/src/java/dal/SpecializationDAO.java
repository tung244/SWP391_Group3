/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.Specialization;

/**
 *
 * @author PC
 */
public class SpecializationDAO extends DBContext {

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

    public List<Specialization> getSpecializationByDoctorId(String did) {
        List<Specialization> list = new ArrayList<>();
        String sql = " select sp.specialization_id,sp.specialization_name,sp.specialization_status from [dbo].[Specialization] sp join [dbo].[Doctors] d on sp.specialization_id = d.specialization_id\n"
                + " where d.doctor_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
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

    public String getSpecializationIdByDoctorId(String did) {
        String sql = " select sp.specialization_id from [dbo].[Specialization] sp join [dbo].[Doctors] d "
                + "on sp.specialization_id = d.specialization_id\n"
                + " where d.doctor_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("specialization_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        SpecializationDAO dao = new SpecializationDAO();
//        String speid = dao.getSpecializationIdByDoctorId("1");
//        System.out.println(speid);
//        List<Specialization> sp = dao.getSpecializationByDoctorId("1");
//        for (Specialization specialization : sp) {
//            System.out.println(specialization);
//            
//        }
    }
}
