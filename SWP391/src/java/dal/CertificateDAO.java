/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Certificate;
import model.Certificate_Doctor;
import model.Degree;

/**
 *
 * @author PC
 */
public class CertificateDAO extends DBContext {

    public List<Certificate> getAllCertificate() {
        List<Certificate> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Certificate";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Certificate c = new Certificate();
                c.setCertificate_id(rs.getInt("certificate_id"));
                c.setCertificate_name(rs.getString("certificate_name"));

                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public boolean updateDoctorCertificates(int doctorId, List<Integer> certificateIds) {
        String deleteSql = "DELETE FROM Certificate_Doctor WHERE doctor_id = ?";
        String insertSql = "INSERT INTO Certificate_Doctor (doctor_id, certificate_id) VALUES (?, ?)";
        try (PreparedStatement deleteStmt = connection.prepareStatement(deleteSql); PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {

            // Delete existing certificates
            deleteStmt.setInt(1, doctorId);
            deleteStmt.executeUpdate();

            // Insert new certificates
            for (int certificateId : certificateIds) {
                insertStmt.setInt(1, doctorId);
                insertStmt.setInt(2, certificateId);
                insertStmt.addBatch();
            }
            int[] rowsInserted = insertStmt.executeBatch();
            return rowsInserted.length == certificateIds.size();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Certificate> getCertificateByDoctorId(String doctorId) {
        List<Certificate> certificates = new ArrayList<>();
        String sql = "SELECT * "
                + "FROM Certificate_Doctor cd "
                + "JOIN Certificate c ON cd.certificate_id = c.certificate_id "
                + "WHERE cd.doctor_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, doctorId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Certificate certificate = new Certificate();
                    certificate.setCertificate_id(rs.getInt("certificate_id"));
                    certificate.setCertificate_name(rs.getString("certificate_name"));

                    Certificate_Doctor cer_doc = new Certificate_Doctor();
                    cer_doc.setIssued_by(rs.getString("issued_by"));
                    certificate.setCer_doct(cer_doc);

                    certificates.add(certificate);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return certificates;
    }

    public void addDoctorCertificates(int doctorId, List<Integer> certificateIds) {
        String sql = "INSERT INTO Certificate_Doctor (doctor_id, certificate_id) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            for (int certificateId : certificateIds) {
                stmt.setInt(1, doctorId);
                stmt.setInt(2, certificateId);
                stmt.addBatch();
            }
            stmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Certificate> getDegreeByFilter(String searchName, String option) {
        List<Certificate> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM dbo.Certificate");
        List<String> param = new ArrayList<>();

        // Chuẩn hóa searchName (loại bỏ khoảng trắng dư thừa)
        if (searchName != null && !searchName.trim().isEmpty()) {
            searchName = searchName.trim().replaceAll("\\s+", " ");
        }

        if (searchName != null && !searchName.isEmpty()) {
            sql.append(" WHERE REPLACE(certificate_name, ' ', '') LIKE REPLACE(?, ' ', '') ");
            param.add("%" + searchName.replace(" ", "") + "%");
        }

        if ("asc".equalsIgnoreCase(option) || "desc".equalsIgnoreCase(option)) {
            sql.append(" ORDER BY certificate_name ").append(option.equalsIgnoreCase("asc") ? "ASC" : "DESC");
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            for (int i = 0; i < param.size(); i++) {
                st.setString(i + 1, param.get(i));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Certificate cer = new Certificate();
                cer.setCertificate_id(rs.getInt("certificate_id"));
                cer.setCertificate_name(rs.getString("certificate_name"));
                list.add(cer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Certificate getCertificateById(int id) {
        Certificate cer = null;
        String sql = "SELECT * FROM dbo.Certificate WHERE certificate_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cer = new Certificate();
                cer.setCertificate_id(rs.getInt("certificate_id"));
                cer.setCertificate_name(rs.getString("certificate_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cer;
    }

    public void addCertificate(String certificateName) {
        String sql = "INSERT INTO Certificate  (certificate_name) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, certificateName);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //    check trùng
    public boolean getCertificateByName(String name) {
        String sql = "SELECT * FROM Certificate WHERE LOWER(certificate_name) = LOWER(?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);

            try (ResultSet rs = st.executeQuery()) {
                return rs.next(); 
            }
        } catch (Exception e) {
            System.err.println("Error while checking certificate existence: " + e.getMessage());
        }

        return false; 
    }
    
     public void updateCer(int cerId, String cerName) {
        String sql = "UPDATE Certificate SET certificate_name = ? WHERE certificate_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1,cerName );
            ps.setInt(2, cerId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CertificateDAO dao = new CertificateDAO();
//        List<Certificate> l = dao.getDegreeByFilter("", "desc");
//        for (Certificate certificate : l) {
//            System.out.println(certificate);
//        }
        dao.updateCer(1, "Chứng chỉ bác sĩ chuyên khoa mắt");
        System.out.println(dao.getCertificateById(1));

    }
}
