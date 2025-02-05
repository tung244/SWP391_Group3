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
}
