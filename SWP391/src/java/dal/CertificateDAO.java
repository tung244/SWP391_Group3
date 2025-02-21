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
        String sql = "SELECT c.certificate_id, c.certificate_name "
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
    
    public static void main(String[] args) {
        CertificateDAO dao = new CertificateDAO();
        List<Certificate> l = dao.getCertificateByDoctorId("1");
        for (Certificate certificate : l) {
            System.out.println(certificate);
        }

    }
}
