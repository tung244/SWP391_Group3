/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import bo.GetFormatDate;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CamPaign;
import model.Degree;

public class CamPaignDAO extends DBContext {

    public boolean saveCompain(CamPaign c) {
        int reuslt = 0;
        String sql = "INSERT INTO dbo.email_campaigns(name_company, group_patient,"
                + " subject_mail, content_mail, total_emails, sent_emails, created_at,status)\n"
                + "VALUES(?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName_company());
            st.setString(2, c.getGroup_patient());
            st.setString(3, c.getSubject_mail());
            st.setString(4, c.getContent_mail());
            st.setInt(5, c.getTotal_emails());
            st.setInt(6, c.getSent_emails());
            st.setString(7, c.getCreated_at());
            st.setString(8, c.getStatus());
            int row = st.executeUpdate();
            if (row > 0) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int UpdateSendEmails(int campId) {
        int result = 0;
        String sql = "UPDATE dbo.email_campaigns\n"
                + "SET sent_emails = sent_emails + 1\n"
                + "WHERE campaign_id = ? AND sent_emails < total_emails;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, campId);
            result = st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int UpdateStatus(int campId) {
        int result = 0;
        String sql = "UPDATE dbo.email_campaigns \n"
                + "SET status = 'complete' WHERE campaign_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, campId);
            result = st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int LoadCapainNewest() {
        int reuslt = 0;
        String sql = "SELECT TOP 1 campaign_id \n"
                + "FROM dbo.email_campaigns \n"
                + "ORDER BY CONVERT(DATETIME, created_at, 120) DESC;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                reuslt = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return reuslt;
    }

    public static void main(String[] args) {
        CamPaignDAO c = new CamPaignDAO();
        CamPaign ca = new CamPaign("Luong",
                "nguyenluongk2k4@gmail.com;luongndhe181876@fpt.edu.vn",
                "EYECAREEE",
                "Cảm ơn bạn đã quan tâm",
                2,
                0, GetFormatDate.getFormString(), "pending");

    }
}
