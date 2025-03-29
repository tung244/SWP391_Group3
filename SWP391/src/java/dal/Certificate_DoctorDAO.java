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
        String sql = "SELECT cd.*, d.doctor_name, c.certificate_name\n"
                + "FROM Certificate_Doctor cd\n"
                + "JOIN (\n"
                + "    SELECT doctor_id, certificate_id, MAX(version) AS last_version\n"
                + "    FROM Certificate_Doctor\n"
                + "    GROUP BY doctor_id, certificate_id\n"
                + ") latest ON cd.doctor_id = latest.doctor_id \n"
                + "        AND cd.certificate_id = latest.certificate_id\n"
                + "        AND cd.version = latest.last_version \n"
                + "JOIN dbo.Doctors d ON d.doctor_id = cd.doctor_id\n"
                + "JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + "WHERE cd.doctor_id = ?";
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
                cd.setVersion(rs.getInt("version"));
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

    public boolean addNewCertificate(String cername, String did, String img, String cerdate, String status, String issued) {
        String CertificateSql = "INSERT INTO dbo.Certificate(certificate_name) VALUES (?) ";
        String getcertificateIdSql = "SELECT certificate_id FROM dbo.Certificate WHERE certificate_name = ?";
        String Certificate_DoctorSql = "INSERT INTO dbo.Certificate_Doctor(certificate_id, doctor_id, date_certificate, status, issued_by, certificate_image) VALUES (?,?,?,?,?,?)";

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Thêm cer vào bảng Certificate
            try (PreparedStatement stmt = connection.prepareStatement(CertificateSql)) {
                stmt.setString(1, cername);
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted == 0) {
                    connection.rollback();
                    return false;
                }
            }

            // Lấy certificate_id vừa tạo bằng cách truy vấn theo certificate_name
            int certificate_id = -1;
            try (PreparedStatement stmt = connection.prepareStatement(getcertificateIdSql)) {
                stmt.setString(1, cername);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        certificate_id = rs.getInt("certificate_id");
                    } else {
                        connection.rollback();
                        return false;
                    }
                }
            }

            // Thêm thông tin bác sĩ vào bảng Doctors
            try (PreparedStatement stmt = connection.prepareStatement(Certificate_DoctorSql)) {
                stmt.setInt(1, certificate_id);
                stmt.setString(2, did);
                stmt.setString(3, cerdate);
                stmt.setString(4, status);
                stmt.setString(5, issued);
                stmt.setString(6, img);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted == 0) {
                    connection.rollback();
                    return false;
                }
            }

            connection.commit(); // Xác nhận transaction
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback(); // Nếu có lỗi, hoàn tác transaction
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true); // Khôi phục chế độ tự động commit
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public boolean addCertificate(String cerid, String did, String img, String date, String status, String issued) {
        String sql = "INSERT INTO dbo.Certificate_Doctor(certificate_id, doctor_id, date_certificate, status, issued_by, certificate_image) VALUES (?,?,?,?,?,?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, cerid);
            stmt.setString(2, did);
            stmt.setString(3, date);  // Đặt đúng thứ tự tham số
            stmt.setString(4, status);
            stmt.setString(5, issued);
            stmt.setString(6, img);

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu có ít nhất một dòng được chèn
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

    //check trung
    public boolean getCertificateByName(String name) {
        String sql = "SELECT * FROM Certificate WHERE LOWER(certificate_name) = LOWER(?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);

            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            System.err.println("Error while checking Certificate  existence: " + e.getMessage());
        }

        return false;
    }

    public boolean checkExistCertificate(String cerid, String did, String date) {
        String sql = "SELECT * FROM dbo.Certificate_Doctor WHERE doctor_id = ? AND certificate_id = ? AND CAST(date_certificate AS date) = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, did);
            st.setString(2, cerid);
            st.setString(3, date);

            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            System.err.println("Error while checking Certificate  existence: " + e.getMessage());
        }

        return false;
    }

    public List<Certificate_Doctor> getCerDocAddToCheck() {
        List<Certificate_Doctor> list = new ArrayList<>();
        String sql = " SELECT cd.*, d.doctor_name, c.certificate_name FROM dbo.Certificate_Doctor cd\n"
                + "JOIN dbo.Doctors d ON d.doctor_id = cd.doctor_id\n"
                + "JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + "WHERE status = 'InProgress' AND cd.date_change IS NULL";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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

    public boolean updateStatus(String doctor_id, String certificate_id, String status) {
        String sql = "UPDATE dbo.Certificate_Doctor SET status = ? WHERE certificate_id = ? AND doctor_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, status);
            st.setString(2, certificate_id);
            st.setString(3, doctor_id);

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCertificate(String doctor_id, String certificate_id) {
        try {
            // First check how many doctors are associated with this certificate
            String countSql = "SELECT COUNT(*) FROM dbo.Certificate_Doctor WHERE certificate_id = ?";
            int count = 0;

            try (PreparedStatement countSt = connection.prepareStatement(countSql)) {
                countSt.setString(1, certificate_id);
                try (ResultSet rs = countSt.executeQuery()) {
                    if (rs.next()) {
                        count = rs.getInt(1);
                    }
                }
            }

            // Begin transaction since we might need to delete from multiple tables
            connection.setAutoCommit(false);

            // Always delete from Certificate_Doctor table
            String deleteCertDocSql = "DELETE FROM dbo.Certificate_Doctor WHERE doctor_id = ? AND certificate_id = ?";
            try (PreparedStatement st = connection.prepareStatement(deleteCertDocSql)) {
                st.setString(1, doctor_id);
                st.setString(2, certificate_id);
                st.executeUpdate();
            }

            // If this is the only doctor with this certificate, also delete from Certificate table
            if (count == 1) {
                String deleteCertSql = "DELETE FROM dbo.Certificate WHERE certificate_id = ?";
                try (PreparedStatement st = connection.prepareStatement(deleteCertSql)) {
                    st.setString(1, certificate_id);
                    st.executeUpdate();
                }
            }

            // Commit the transaction
            connection.commit();
            return true;

        } catch (Exception e) {
            // If anything goes wrong, roll back the transaction
            try {
                connection.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<Certificate_Doctor> getDoctorCertificateHistory() {
        List<Certificate_Doctor> list = new ArrayList<>();
        String sql = "SELECT cd.*, d.doctor_name, c.certificate_name FROM dbo.Certificate_Doctor cd\n"
                + "JOIN dbo.Doctors d ON d.doctor_id = cd.doctor_id\n"
                + "JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + "WHERE status = 'Accept'";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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

    public boolean updateCertificateDoctorWithHistory(Certificate_Doctor cerDoc) {

        try {
            //  Cập nhật trạng thái của bản ghi cũ thành "Archive"
            String updateOldSQL = "UPDATE dbo.Certificate_Doctor SET status = 'Archive' WHERE doctor_id = ? AND certificate_id = ?";

            PreparedStatement psUpdateOld = connection.prepareStatement(updateOldSQL);
            psUpdateOld.setInt(1, cerDoc.getDoctor_id());
            psUpdateOld.setInt(2, cerDoc.getCertificate_id());
            psUpdateOld.executeUpdate();

            // Chèn bản ghi mới với trạng thái "InProgress"
            String insertNewSQL = "INSERT INTO dbo.Certificate_Doctor(doctor_id, certificate_id, certificate_image, date_certificate, date_change, status, issued_by, version)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement psInsertNew = connection.prepareStatement(insertNewSQL);
            psInsertNew.setInt(1, cerDoc.getDoctor_id());
            psInsertNew.setInt(2, cerDoc.getCertificate_id());
            psInsertNew.setString(3, cerDoc.getCertificate_image());
            psInsertNew.setString(4, cerDoc.getDate_certificate());
            psInsertNew.setString(5, cerDoc.getDate_change());
            psInsertNew.setString(6, cerDoc.getStatus());
            psInsertNew.setString(7, cerDoc.getIssued_by());
            psInsertNew.setInt(8, cerDoc.getVersion() + 1);

            psInsertNew.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Certificate_Doctor> getCensorUpdateDoctorCertificate() {
        List<Certificate_Doctor> list = new ArrayList<>();
        String sql = "SELECT cd.*, c.certificate_name, d.doctor_name \n"
                + "FROM dbo.Certificate_Doctor cd \n"
                + "JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + "JOIN dbo.Doctors d ON d.doctor_id = cd.doctor_id\n"
                + "WHERE cd.status = 'InProgress' \n"
                + "AND cd.date_change IS NOT NULL ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
                cd.setVersion(rs.getInt("version"));

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

    public boolean acceptUpdateCertificateDoctor(String did, String cerid) {

        try {

            String updateOldSQL = "UPDATE dbo.Certificate_Doctor SET status = 'Accept' WHERE doctor_id = ? AND certificate_id = ? AND status = 'InProgress'";

            PreparedStatement psUpdateOld = connection.prepareStatement(updateOldSQL);
            psUpdateOld.setString(1, did);
            psUpdateOld.setString(2, cerid);

            psUpdateOld.executeUpdate();

            String insertNewSQL = "DELETE FROM dbo.Certificate_Doctor  WHERE doctor_id = ? AND certificate_id = ? AND status = 'Archive'";

            PreparedStatement psInsertNew = connection.prepareStatement(insertNewSQL);
            psInsertNew.setString(1, did);
            psInsertNew.setString(2, cerid);

            psInsertNew.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean rejectUpdateCertificateDoctor(String did, String cerid) {

        try {

            String insertNewSQL = "DELETE FROM dbo.Certificate_Doctor WHERE doctor_id = ? AND certificate_id = ? AND status = 'InProgress'";

            PreparedStatement psInsertNew = connection.prepareStatement(insertNewSQL);
            psInsertNew.setString(1, did);
            psInsertNew.setString(2, cerid);

            psInsertNew.executeUpdate();

            String updateOldSQL = " UPDATE dbo.Certificate_Doctor SET status = 'Accept'  WHERE doctor_id = ? AND certificate_id = ? AND status = 'Archive'";

            PreparedStatement psUpdateOld = connection.prepareStatement(updateOldSQL);

            psUpdateOld.setString(1, did);
            psUpdateOld.setString(2, cerid);

            psUpdateOld.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public List<Certificate_Doctor> getUpdateDoctorCertificateHistory() {
        List<Certificate_Doctor> list = new ArrayList<>();
        String sql = "SELECT cd.*, c.certificate_name, d.doctor_name \n"
                + "FROM dbo.Certificate_Doctor cd \n"
                + "JOIN dbo.Certificate c ON c.certificate_id = cd.certificate_id\n"
                + "JOIN dbo.Doctors d ON d.doctor_id = cd.doctor_id\n"
                + "WHERE cd.status = 'Accept' \n"
                + "AND cd.date_change IS NOT NULL ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
                cd.setVersion(rs.getInt("version"));

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
        Certificate_DoctorDAO dao = new Certificate_DoctorDAO();
        List<Certificate_Doctor> list = dao.getCensorUpdateDoctorCertificate();
        for (Certificate_Doctor certificate_Doctor : list) {
            System.out.println(certificate_Doctor);

        }

//        System.out.println(dao.addNewCertificate("A", "1", "abc.jpg", "2025/01/16", "InProgress", "FPTU"));
//        System.out.println(dao.addCertificate("1", "2", "abc.jpg", "2025/01/16", "InProgress", "FPTU"));
    }
}
