/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Degree;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Degree_Doctor;

/**
 *
 * @author PC
 */
public class DegreeDAO extends DBContext {

    public List<Degree> getAllDegree() {
        List<Degree> list = new ArrayList<>();
        String sql = " SELECT * FROM Degree";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Degree de = new Degree();
                de.setDegree_id(rs.getInt("degree_id"));
                de.setDegree_name(rs.getString("degree_name"));
                list.add(de);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public List<Degree> getDegreeByDoctorId(String did) {
        List<Degree> list = new ArrayList<>();
        String sql = " SELECT * FROM Degree de \n"
                + " JOIN [dbo].[Degree_Doctor] dd ON de.degree_id = dd.degree_id\n"
                + " JOIN dbo.Doctors d ON d.doctor_id = dd.doctor_id\n"
                + " WHERE d.doctor_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Degree de = new Degree();
                de.setDegree_id(rs.getInt("degree_id"));
                de.setDegree_name(rs.getString("degree_name"));
                list.add(de);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public boolean updateDoctorDegrees(int doctorId, List<Integer> degreeIds) {
        String deleteSql = "DELETE FROM Degree_Doctor WHERE doctor_id = ?";
        String insertSql = "INSERT INTO Degree_Doctor (doctor_id, degree_id) VALUES (?, ?)";
        try (PreparedStatement deleteStmt = connection.prepareStatement(deleteSql); PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {

            // Delete existing degrees
            deleteStmt.setInt(1, doctorId);
            deleteStmt.executeUpdate();

            // Insert new degrees
            for (int degreeId : degreeIds) {
                insertStmt.setInt(1, doctorId);
                insertStmt.setInt(2, degreeId);
                insertStmt.addBatch();
            }
            int[] rowsInserted = insertStmt.executeBatch();
            return rowsInserted.length == degreeIds.size();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        DegreeDAO dao = new DegreeDAO();
//        List<Degree> l = dao.getAllDegree();
//        for (Degree degree : l) {
//            System.out.println(degree);
//        }
//
//        Degree_Doctor dd = new Degree_Doctor();
//        dd.setDegree_id(2);
//        dd.setDoctor_id(1);

        List<Degree> list = dao.getDegreeByDoctorId("1");
        for (Degree degree : list) {
            System.out.println(degree);
        }
    }
}
