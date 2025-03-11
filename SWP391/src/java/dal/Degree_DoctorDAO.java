/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Degree_Doctor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Degree;
import model.Doctors;

/**
 *
 * @author PC
 */
public class Degree_DoctorDAO extends DBContext {

    public List<Degree_Doctor> getDegreeDoctorById(String did) {
        List<Degree_Doctor> list = new ArrayList<>();
        String sql = "SELECT  dedoc.*, de.degree_name, d.doctor_name FROM dbo.Degree_Doctor dedoc \n"
                + " JOIN dbo.Degree de ON de.degree_id = dedoc.degree_id\n"
                + " JOIN dbo.Doctors d ON d.doctor_id = dedoc.doctor_id\n"
                + " WHERE dedoc.doctor_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Degree_Doctor de_doc = new Degree_Doctor();
                de_doc.setDegree_id(rs.getInt("degree_id"));
                de_doc.setDoctor_id(rs.getInt("doctor_id"));
                de_doc.setDegree_image(rs.getString("degree_image"));
                de_doc.setDate_degree(rs.getString("date_degree"));
                de_doc.setDate_change(rs.getString("date_change"));
                de_doc.setStatus(rs.getString("status"));
                de_doc.setIssued_by(rs.getString("issued_by"));

                Doctors doc = new Doctors();
                doc.setDoctor_name(rs.getString("doctor_name"));
                de_doc.setDoctor(doc);

                Degree de = new Degree();
                de.setDegree_name(rs.getString("degree_name"));
                de_doc.setDegree(de);

                list.add(de_doc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public boolean addDoctorDegree(int doctorId, int degreeId, String degreeImage, String status, String issuedBy, String dateDegree) {
        String sql = "INSERT INTO Degree_Doctor (doctor_id, degree_id, degree_image, status, issued_by, date_degree) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, doctorId);
            st.setInt(2, degreeId);
            st.setString(3, degreeImage);
            st.setString(4, status);
            st.setString(5, issuedBy);
            st.setString(6, dateDegree);
            int result = st.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            System.out.println("Error in addDoctorDegree: " + e.getMessage());
            return false;
        }
    }

    //check trùng
    public boolean checkSpecificDoctorDegree(int doctorId, int degreeId) {
        String sql = "SELECT * FROM dbo.Degree_Doctor WHERE doctor_id = ? AND degree_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, doctorId);
            st.setInt(2, degreeId);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next(); // Returns true if the specific degree already exists
            }
        } catch (Exception e) {
            System.err.println("Error while checking specific degree existence: " + e.getMessage());
        }
        return false; // Return false if there's an error or no degree found
    }

    public List<Degree_Doctor> getDeDocAddToCheck() {
        List<Degree_Doctor> list = new ArrayList<>();
        String sql = " SELECT dedoc.*, de.degree_name, d.doctor_name \n"
                + "FROM dbo.Degree_Doctor dedoc \n"
                + "JOIN dbo.Degree de ON de.degree_id = dedoc.degree_id\n"
                + "JOIN dbo.Doctors d ON d.doctor_id = dedoc.doctor_id\n"
                + "WHERE dedoc.status = 'InProgress' \n"
                + "AND dedoc.date_change IS NULL";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Degree_Doctor de_doc = new Degree_Doctor();
                de_doc.setDegree_id(rs.getInt("degree_id"));
                de_doc.setDoctor_id(rs.getInt("doctor_id"));
                de_doc.setDegree_image(rs.getString("degree_image"));
                de_doc.setDate_degree(rs.getString("date_degree"));
                de_doc.setDate_change(rs.getString("date_change"));
                de_doc.setStatus(rs.getString("status"));
                de_doc.setIssued_by(rs.getString("issued_by"));

                Doctors doc = new Doctors();
                doc.setDoctor_name(rs.getString("doctor_name"));
                de_doc.setDoctor(doc);

                Degree de = new Degree();
                de.setDegree_name(rs.getString("degree_name"));
                de_doc.setDegree(de);

                list.add(de_doc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }
    
     public boolean updateStatus(String doctor_id, String degree_id, String status) {
        String sql = "  UPDATE dbo.Degree_Doctor SET status = ? WHERE doctor_id = ? AND degree_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, status);
            st.setString(2, doctor_id);
            st.setString(3, degree_id);

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
     
      public boolean deleteDegree(String doctor_id, String degree_id) {
        String sql = " DELETE FROM dbo.Degree_Doctor WHERE doctor_id = ? AND degree_id = ? ";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            
            st.setString(1, doctor_id);
            st.setString(2, degree_id);

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
      
      public List<Degree_Doctor> getDoctorDegreeHistory() {
        List<Degree_Doctor> list = new ArrayList<>();
        String sql = " SELECT dedoc.*, de.degree_name, d.doctor_name \n"
                + "FROM dbo.Degree_Doctor dedoc \n"
                + "JOIN dbo.Degree de ON de.degree_id = dedoc.degree_id\n"
                + "JOIN dbo.Doctors d ON d.doctor_id = dedoc.doctor_id\n"
                + "WHERE dedoc.status = 'Accept' \n"
                + "AND dedoc.date_change IS NULL";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Degree_Doctor de_doc = new Degree_Doctor();
                de_doc.setDegree_id(rs.getInt("degree_id"));
                de_doc.setDoctor_id(rs.getInt("doctor_id"));
                de_doc.setDegree_image(rs.getString("degree_image"));
                de_doc.setDate_degree(rs.getString("date_degree"));
                de_doc.setDate_change(rs.getString("date_change"));
                de_doc.setStatus(rs.getString("status"));
                de_doc.setIssued_by(rs.getString("issued_by"));

                Doctors doc = new Doctors();
                doc.setDoctor_name(rs.getString("doctor_name"));
                de_doc.setDoctor(doc);

                Degree de = new Degree();
                de.setDegree_name(rs.getString("degree_name"));
                de_doc.setDegree(de);

                list.add(de_doc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public static void main(String[] args) {
        List<Degree_Doctor> list = new ArrayList<>();
        Degree_DoctorDAO dao = new Degree_DoctorDAO();

//        list = dao.getDeDocAddToCheck();
//        for (Degree_Doctor degree_Doctor : list) {
//            System.out.println(degree_Doctor);
//        }
//        System.out.println(dao.checkSpecificDoctorDegree(6, 1));
//        boolean success = dao.deleteDegree("1", "2");
//        if(success){
//            System.out.println("sucess delete");
//        }
    }
}
