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
import java.util.Map;
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

    public List<Degree> getDegreeByFilter(String searchName, String option) {
        List<Degree> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Degree");
        List<String> param = new ArrayList<>();

        // Chuẩn hóa searchName (loại bỏ khoảng trắng dư thừa)
        if (searchName != null && !searchName.trim().isEmpty()) {
            searchName = searchName.trim().replaceAll("\\s+", " ");
        }

        if (searchName != null && !searchName.isEmpty()) {
            sql.append(" WHERE REPLACE(degree_name, ' ', '') LIKE REPLACE(?, ' ', '') ");
            param.add("%" + searchName.replace(" ", "") + "%");
        }

        if ("asc".equalsIgnoreCase(option) || "desc".equalsIgnoreCase(option)) {
            sql.append(" ORDER BY degree_name ").append(option.equalsIgnoreCase("asc") ? "ASC" : "DESC");
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            for (int i = 0; i < param.size(); i++) {
                st.setString(i + 1, param.get(i));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Degree degree = new Degree();
                degree.setDegree_id(rs.getInt("degree_id"));
                degree.setDegree_name(rs.getString("degree_name"));
                list.add(degree);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Degree getDegreeById(int id) {
        Degree degree = null;
        String sql = "SELECT * FROM Degree WHERE degree_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                degree = new Degree();
                degree.setDegree_id(rs.getInt("degree_id"));
                degree.setDegree_name(rs.getString("degree_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return degree;
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

    public void addDegree(String degreeName) {
        String sql = "INSERT INTO degree (degree_name) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, degreeName);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateDegree(int degreeId, String degreeName) {
        String sql = "UPDATE degree SET degree_name = ? WHERE degree_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, degreeName);
            ps.setInt(2, degreeId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    check trùng
    public boolean getDegreeByName(String name) {
        String sql = "SELECT * FROM Degree WHERE LOWER(degree_name) = LOWER(?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);

            try (ResultSet rs = st.executeQuery()) {
                return rs.next(); 
            }
        } catch (Exception e) {
            System.err.println("Error while checking degree existence: " + e.getMessage());
        }

        return false; 
    }

//    public void addDoctorDegrees(int doctorId, List<Integer> degreeIds) {
//        String sql = "INSERT INTO Degree_Doctor (doctor_id, degree_id) VALUES (?, ?)";
//        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
//            for (int degreeId : degreeIds) {
//                stmt.setInt(1, doctorId);
//                stmt.setInt(2, degreeId);
//                stmt.addBatch();
//            }
//            stmt.executeBatch();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//    public void addDoctorDegrees(int doctorId, List<String> degreeNames, Map<String, String> degreeImages) {
//        String checkDegreeSql = "SELECT degree_id FROM Degree WHERE degree_name = ?";
//        String insertDegreeSql = "INSERT INTO Degree (degree_name) VALUES (?)";
//        String getDegreeIdByNameSql = "SELECT degree_id FROM Degree WHERE degree_name = ?";
//        String insertDoctorDegreeSql = "INSERT INTO Degree_Doctor (doctor_id, degree_id, degree_image) VALUES (?, ?, ?)";
//
//        try (PreparedStatement checkStmt = connection.prepareStatement(checkDegreeSql)
//                ; PreparedStatement insertDegreeStmt = connection.prepareStatement(insertDegreeSql); 
//                PreparedStatement getDegreeIdByNameStmt = connection.prepareStatement(getDegreeIdByNameSql)
//                        ; PreparedStatement insertDoctorDegreeStmt = connection.prepareStatement(insertDoctorDegreeSql)) {
//
//            for (String degreeName : degreeNames) {
//                int degreeId = -1;
//
//                // Kiểm tra xem degree đã tồn tại chưa
//                checkStmt.setString(1, degreeName);
//                ResultSet rs = checkStmt.executeQuery();
//                if (rs.next()) {
//                    degreeId = rs.getInt("degree_id");
//                } else {
//                    // Nếu chưa tồn tại, thêm mới vào bảng Degree
//                    insertDegreeStmt.setString(1, degreeName);
//                    insertDegreeStmt.executeUpdate();
//
//                    // Lấy ID vừa chèn vào bằng tên
//                    getDegreeIdByNameStmt.setString(1, degreeName);
//                    ResultSet generatedKeys = getDegreeIdByNameStmt.executeQuery();
//                    if (generatedKeys.next()) {
//                        degreeId = generatedKeys.getInt("degree_id");
//                    }
//                }
//
//                // Thêm vào bảng Degree_Doctor
//                if (degreeId != -1) {
//                    insertDoctorDegreeStmt.setInt(1, doctorId);
//                    insertDoctorDegreeStmt.setInt(2, degreeId);
//                    insertDoctorDegreeStmt.setString(3, degreeImages.get(degreeName)); // Lấy ảnh tương ứng từ map
//                    insertDoctorDegreeStmt.addBatch();
//                }
//            }
//            insertDoctorDegreeStmt.executeBatch();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
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

//        // Create a list of degree IDs to test
//        List<Integer> degreeIds = new ArrayList<>();
//        degreeIds.add(1);  // Add some test degree IDs
//        degreeIds.add(2);
//        degreeIds.add(3);
//
//        // Now test the method with doctor ID 6 and the list of degrees
//        dao.addDoctorDegrees(6, degreeIds);
        List<Degree> list = dao.getDegreeByFilter("b á c s       ĩ   ", "asc");
        for (Degree degree : list) {
            System.out.println(degree);
        }

        dao.updateDegree(1, "Bác sĩ nội trú");
        System.out.println(dao.getDegreeByName("BÁC sĩ nội trú"));
    }
}
