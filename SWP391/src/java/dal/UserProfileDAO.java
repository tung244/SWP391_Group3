package dal;

import bo.GetFormatDate;
import java.security.Timestamp;
import model.UserProfile;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Appointment;
import model.FaceBookAccount;
import model.GoogleAccount;
import model.Role;

public class UserProfileDAO extends DBContext {

    public boolean addAccount(UserProfile p) {

        String sqlAccount = "insert into Accounts( username, password,email,phone_number,created_date,role_id)\n"
                + "values(?,?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Accounts WHERE username = ?";
        String sqlUserProfile = "insert into Customers(account_id,full_name,gender,image_profile_user)\n"
                + "values(?,?,?,?)";

        try {

            connection.setAutoCommit(false);

            PreparedStatement stAccount = connection.prepareStatement(sqlAccount);
            stAccount.setString(1, p.getAccount().getUsername());
            stAccount.setString(2, p.getAccount().getPassword());
            stAccount.setString(3, p.getAccount().getEmail());
            stAccount.setString(4, p.getAccount().getPhonenumber());
            stAccount.setString(5, p.getAccount().getCreated_date());
            stAccount.setInt(6, p.getAccount().getRole().getRole_id());

            int affectedRows = stAccount.executeUpdate();

            if (affectedRows == 0) {
                System.out.println("Không thể thêm tài khoản, không có hàng nào bị ảnh hưởng.");
            }

            PreparedStatement stGetId = connection.prepareStatement(sqlGetAccountId);
            stGetId.setString(1, p.getAccount().getUsername());
            ResultSet rs = stGetId.executeQuery();

            if (rs.next()) {
                int accountId = rs.getInt("account_id");

                PreparedStatement stUserProfile = connection.prepareStatement(sqlUserProfile);
                stUserProfile.setInt(1, accountId);
                stUserProfile.setString(2, p.fullname);
                stUserProfile.setString(3, p.getGender());
                stUserProfile.setString(4, p.getImage_profile_user());

                stUserProfile.executeUpdate();

                connection.commit();
                return true;
            }

        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true); // Bật lại chế độ AutoCommit
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public UserProfile GetAccount(String username) {
        String sql = "select *\n"
                + "from Accounts a join \n"
                + "Customers u on a.account_id = u.account_id "
                + "join Role r on r.role_id = a.role_id where a.username= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = new Role(rs.getInt("role_id"),
                        rs.getString("role_name"));
                Account ac = new Account(rs.getInt("account_id"),
                        rs.getString("username"),
                        "", rs.getString("email"),
                        rs.getString("phone_number"), rs.getString("created_date"), r);
                UserProfile u = new UserProfile(ac, rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("dob"),
                        rs.getString("gender"),
                        rs.getString("image_profile_user"));
                return u;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String[] loadBasicInfoUser(String username) {
        String[] info = new String[3];
        String sql = "Select phone_number,email,account_id from Accounts where username = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                info[0] = rs.getString("phone_number");
                info[1] = rs.getString("email");
                info[2] = String.valueOf(rs.getInt("account_id"));

            }
            return info;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isertAccountGoogle(GoogleAccount gg) {
        String sqlAccount = "INSERT INTO dbo.Accounts\n"
                + "(username,email,created_date,role_id,google_id)\n"
                + "VALUES\n"
                + "(?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Accounts WHERE username = ?";
        String sqlUserProfile = "insert into Customers(account_id,full_name,image_profile_user)\n"
                + "values(?,?,?)";
        try {

            connection.setAutoCommit(false);

            PreparedStatement stAccount = connection.prepareStatement(sqlAccount);
            stAccount.setString(1, gg.getEmail());
            stAccount.setString(2, gg.getEmail());
            stAccount.setString(3, GetFormatDate.getFormString());
            stAccount.setInt(4, 5);
            stAccount.setString(5, gg.getId());

            int affectedRows = stAccount.executeUpdate();

            if (affectedRows == 0) {
                System.out.println("Không thể thêm tài khoản, không có hàng nào bị ảnh hưởng.");
            }

            PreparedStatement stGetId = connection.prepareStatement(sqlGetAccountId);

            stGetId.setString(1, gg.getEmail());

            ResultSet rs = stGetId.executeQuery();

            if (rs.next()) {
                int accountId = rs.getInt("account_id");

                PreparedStatement stUserProfile = connection.prepareStatement(sqlUserProfile);

                stUserProfile.setInt(1, accountId);
                stUserProfile.setString(2, gg.getName());

                stUserProfile.setString(3, gg.getPicture());

                stUserProfile.executeUpdate();

                connection.commit();
                return true;
            }

        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true); // Bật lại chế độ AutoCommit
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public boolean isertAccountFB(FaceBookAccount gg) {
        String sqlAccount = "INSERT INTO dbo.Accounts\n"
                + "(username,email,created_date,role_id,google_id)\n"
                + "VALUES\n"
                + "(?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Accounts WHERE username = ?";
        String sqlUserProfile = "insert into Customers(account_id,full_name,image_profile_user)\n"
                + "values(?,?,?)";
        try {

            connection.setAutoCommit(false);

            PreparedStatement stAccount = connection.prepareStatement(sqlAccount);
            stAccount.setString(1, gg.getEmail());
            stAccount.setString(2, gg.getEmail());
            stAccount.setString(3, GetFormatDate.getFormString());
            stAccount.setInt(4, 4);
            stAccount.setString(5, gg.getId());

            int affectedRows = stAccount.executeUpdate();

            if (affectedRows == 0) {
                System.out.println("Không thể thêm tài khoản, không có hàng nào bị ảnh hưởng.");
            }

            PreparedStatement stGetId = connection.prepareStatement(sqlGetAccountId);

            stGetId.setString(1, gg.getEmail());

            ResultSet rs = stGetId.executeQuery();

            if (rs.next()) {
                int accountId = rs.getInt("account_id");

                PreparedStatement stUserProfile = connection.prepareStatement(sqlUserProfile);

                stUserProfile.setInt(1, accountId);
                stUserProfile.setString(2, gg.getName());

//                stUserProfile.setString(3, gg.getPicture());
                stUserProfile.executeUpdate();

                connection.commit();
                return true;
            }

        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true); // Bật lại chế độ AutoCommit
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public void updateUserProfile(String fullname, String email, String phonenumber, String address, String dob, String gender, String imageProfile, int account_id) {
        String sqlCustomers = "UPDATE Customers SET full_name = ?, address = ?, dob = ?, gender = ?, image_profile_user = ? WHERE account_id = ?";
        String sqlAccounts = "UPDATE Accounts SET email = ?, phone_number = ? WHERE account_id = ?";

        try {
            // Cập nhật bảng Customers
            PreparedStatement preCustomers = connection.prepareStatement(sqlCustomers);
            preCustomers.setString(1, fullname);
            preCustomers.setString(2, address);
            preCustomers.setString(3, dob);
            preCustomers.setString(4, gender);
            preCustomers.setString(5, imageProfile);
            preCustomers.setInt(6, account_id);
            preCustomers.executeUpdate();

            // Cập nhật bảng Accounts
            PreparedStatement preAccounts = connection.prepareStatement(sqlAccounts);
            preAccounts.setString(1, email);
            preAccounts.setString(2, phonenumber);
            preAccounts.setInt(3, account_id);
            preAccounts.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updatePassword(String newPass, int account_id) {
        String sqlUpdatePass = "UPDATE Accounts\n"
                + "SET password = ?\n"
                + "WHERE account_id = ?;";
        try {
            PreparedStatement preUpdatePass = connection.prepareCall(sqlUpdatePass);
            preUpdatePass.setString(1, newPass);
            preUpdatePass.setInt(2, account_id);
            preUpdatePass.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        UserProfileDAO dao = new UserProfileDAO();
        for (Appointment a : dao.getAppoinmentByServiceTypeName("Cơ bản")) {
            System.out.println(a);
        }

    }

    public List<Appointment> getAppointmentByPatientID(int patientID) {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Appointment a "
                + "JOIN dbo.Services_Detail s ON s.service_detail_id = a.service_detail_id "
                + "JOIN dbo.Services se ON se.service_id = s.service_id "
                + "JOIN dbo.Services_Type st ON st.service_type_id = s.service_type_id "
                + "WHERE a.patient_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Appointment appointment = new Appointment(
                        rs.getInt("appointment_id"),
                        rs.getString("appointment_date"),
                        rs.getString("appointment_status"),
                        rs.getInt("doctor_id"),
                        rs.getInt("service_detail_id"),
                        rs.getInt("patient_id"),
                        rs.getInt("service_type_id"),
                        rs.getInt("service_id"),
                        rs.getInt("specialization_id"),
                        rs.getString("time_begin"),
                        rs.getString("time_end"),
                        rs.getString("service_name"),
                        rs.getString("service_description"),
                        rs.getString("service_type_name"),
                        rs.getString("duration_service"),
                        rs.getDouble("cost"),
                        rs.getString("phonenumber_patient")
                );
                list.add(appointment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Appointment> getAppointmentByServiceName(String service_name) {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Appointment a "
                + "LEFT JOIN dbo.Services_Detail s ON s.service_detail_id = a.service_detail_id "
                + "LEFT JOIN dbo.Services se ON se.service_id = s.service_id "
                + "LEFT JOIN dbo.Services_Type st ON st.service_type_id = s.service_type_id "
                + "WHERE se.service_name LIKE N'%' + ? + '%'";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, service_name);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Appointment appointment = new Appointment(
                        rs.getInt("appointment_id"),
                        rs.getString("appointment_date"),
                        rs.getString("appointment_status"),
                        rs.getInt("doctor_id"),
                        rs.getInt("service_detail_id"),
                        rs.getInt("patient_id"),
                        rs.getInt("service_type_id"),
                        rs.getInt("service_id"),
                        rs.getInt("specialization_id"),
                        rs.getString("time_begin"),
                        rs.getString("time_end"),
                        rs.getString("service_name"),
                        rs.getString("service_description"),
                        rs.getString("service_type_name"),
                        rs.getString("duration_service"),
                        rs.getDouble("cost"),
                        rs.getString("phonenumber_patient")
                );
                list.add(appointment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Appointment> getAppointmentByAppointmentDate(String appointment_date) {
        List<Appointment> list = new ArrayList<>();
        String sql = """
                     SELECT * FROM dbo.Appointment a 
                     JOIN dbo.Services_Detail s ON s.service_detail_id = a.service_detail_id 
                     JOIN dbo.Services se ON se.service_id = s.service_id 
                     JOIN dbo.Services_Type st ON st.service_type_id = s.service_type_id 
                     WHERE CONVERT(VARCHAR, a.appointment_date, 23) LIKE N'%' + ? + '%'""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, appointment_date);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Appointment appointment = new Appointment(
                        rs.getInt("appointment_id"),
                        rs.getString("appointment_date"),
                        rs.getString("appointment_status"),
                        rs.getInt("doctor_id"),
                        rs.getInt("service_detail_id"),
                        rs.getInt("patient_id"),
                        rs.getInt("service_type_id"),
                        rs.getInt("service_id"),
                        rs.getInt("specialization_id"),
                        rs.getString("time_begin"),
                        rs.getString("time_end"),
                        rs.getString("service_name"),
                        rs.getString("service_description"),
                        rs.getString("service_type_name"),
                        rs.getString("duration_service"),
                        rs.getDouble("cost"),
                        rs.getString("phonenumber_patient")
                );
                list.add(appointment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Appointment> getAppoinmentByAppointmentId(int appointment_id) {
        List<Appointment> list = new ArrayList<>();
        String sql = """
                     SELECT * FROM dbo.Appointment a 
                     JOIN dbo.Services_Detail s ON s.service_detail_id = a.service_detail_id 
                     JOIN dbo.Services se ON se.service_id = s.service_id 
                     JOIN dbo.Services_Type st ON st.service_type_id = s.service_type_id 
                     WHERE a.appointment_id = ? """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, appointment_id);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Appointment appointment = new Appointment(
                        rs.getInt("appointment_id"),
                        rs.getString("appointment_date"),
                        rs.getString("appointment_status"),
                        rs.getInt("doctor_id"),
                        rs.getInt("service_detail_id"),
                        rs.getInt("patient_id"),
                        rs.getInt("service_type_id"),
                        rs.getInt("service_id"),
                        rs.getInt("specialization_id"),
                        rs.getString("time_begin"),
                        rs.getString("time_end"),
                        rs.getString("service_name"),
                        rs.getString("service_description"),
                        rs.getString("service_type_name"),
                        rs.getString("duration_service"),
                        rs.getDouble("cost"),
                        rs.getString("phonenumber_patient")
                );
                list.add(appointment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Appointment> getAppoinmentByServiceTypeName(String service_type_name) {
        List<Appointment> list = new ArrayList<>();
        String sql = """
                     SELECT * FROM dbo.Appointment a 
                     JOIN dbo.Services_Detail s ON s.service_detail_id = a.service_detail_id 
                     JOIN dbo.Services se ON se.service_id = s.service_id 
                     JOIN dbo.Services_Type st ON st.service_type_id = s.service_type_id 
                     WHERE st.service_type_name LIKE N'%' + ? + '%'""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, service_type_name);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Appointment appointment = new Appointment(
                        rs.getInt("appointment_id"),
                        rs.getString("appointment_date"),
                        rs.getString("appointment_status"),
                        rs.getInt("doctor_id"),
                        rs.getInt("service_detail_id"),
                        rs.getInt("patient_id"),
                        rs.getInt("service_type_id"),
                        rs.getInt("service_id"),
                        rs.getInt("specialization_id"),
                        rs.getString("time_begin"),
                        rs.getString("time_end"),
                        rs.getString("service_name"),
                        rs.getString("service_description"),
                        rs.getString("service_type_name"),
                        rs.getString("duration_service"),
                        rs.getDouble("cost"),
                        rs.getString("phonenumber_patient")
                );
                list.add(appointment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
