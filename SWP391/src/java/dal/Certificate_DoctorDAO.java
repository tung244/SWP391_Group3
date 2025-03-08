/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Certificate;
import model.Certificate_Doctor;
import model.Doctors;

/**
 *
 * @author PC
 */
public class Certificate_DoctorDAO extends DBContext {

    public List<Certificate_Doctor> getCertificateDoctorId(String did) {
        List<Certificate_Doctor> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Certificate_Doctor cd JOIN dbo.Doctors d ON d.doctor_id = cd.doctor_id\n"
                + " JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + " WHERE d.doctor_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Certificate_Doctor cd = new Certificate_Doctor();
                cd.setCertificate_id(rs.getInt("certificate_id"));
                cd.setDoctor_id(rs.getInt("doctor_id"));
                cd.setCertificate_image(rs.getString("certificate_image"));
                cd.setDate_certificate(rs.getString("date_certificate"));
                cd.setDate_change(rs.getString("date_change"));
                cd.setIssued_by(rs.getString("issued_by"));
                cd.setStatus(rs.getString("status"));
                
                Doctors doc = new Doctors();
                doc.setDoctor_name(rs.getString("doctor_name"));
                cd.setDoctor(doc);
                
                Certificate cer = new Certificate();
                cer.setCertificate_name(rs.getString("certificate_name"));
                cd.setCertificate(cer);
                
                list.add(cd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }
    
    public static void main(String[] args) {
        CertificateDAO dao = new CertificateDAO();
        List<Certificate> list = dao.getCertificateByDoctorId("1");
        for (Certificate certificate : list) {
            System.out.println(certificate);
        }
    }
}
