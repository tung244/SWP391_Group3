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

/**
 *
 * @author PC
 */
public class DoctorsDAO extends DBContext {

    public List<Doctors> getAllDoctors() {
        List<Doctors> list = new ArrayList<>();
        String sql = "SELECT doctor_id, doctor_name, experience_years, profile_image, "
                  + "rating, gender, dob, address FROM Doctors";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Doctors(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (Exception e) {
            System.out.println("Error retrieving doctors: " + e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        DoctorsDAO dao = new DoctorsDAO();
        List<Doctors> list = dao.getAllDoctors();
        for (Doctors doctors : list) {
            System.out.println(doctors);
        }
    }

}
