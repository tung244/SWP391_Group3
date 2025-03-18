package dal;

import bo.GetFormatDate;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.security.Timestamp;
import model.UserProfile;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Appointment;
import model.Doctors;
import model.FaceBookAccount;
import model.GoogleAccount;
import model.Rank;
import model.Role;
import model.ServiceDetail;
import model.ServiceTypes;
import model.Services;
import model.Slots;
import model.Staffs;

public class UserProfileDAO extends DBContext {
    
    public boolean addAccount(UserProfile p) {
        
        String sqlAccount = "insert into Accounts( username, password,email,phone_number,created_date,role_id)\n"
                + "values(?,?,?,?,?,?)";
        String sqlGetAccountId = "SELECT account_id FROM dbo.Accounts WHERE username = ?";
        String sqlUserProfile = "insert into Customers(account_id,full_name,gender,image_profile_user,rankId)\n"
                + "values(?,?,?,?,?)";
        
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
                stUserProfile.setInt(5, p.getRank().getRankId());
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
        String sql = "SELECT * \n"
                + "FROM Accounts AS a \n"
                + "JOIN Customers AS u ON a.account_id = u.account_id \n"
                + "JOIN Role AS r ON r.role_id = a.role_id \n"
                + "join CustomerRank ra on ra.rankId = u.rankId\n"
                + "WHERE a.username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = new Role(rs.getInt("role_id"),
                        rs.getString("role_name"));
                Account ac = new Account(rs.getInt("account_id"),
                        rs.getString("username"),
                        "", rs.getString("email"),
                        rs.getString("phone_number"), rs.getString("created_date"), r);
                Rank rank = new Rank(rs.getInt("rankid"), rs.getString("rankName"));
                UserProfile u = new UserProfile(ac, rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("dob"),
                        rs.getString("gender"),
                        rs.getString("image_profile_user"), rank);
                return u;
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        UserProfileDAO udao = new UserProfileDAO();
        List<Appointment> list = udao.getAppointmentByAppointmentId(7);
        System.out.println(list);
        
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
    
    public double getAmountSpendingByCusId(int id) {
        String sql = "select SUM(sd.cost) from Appointment a\n"
                + "join Customers c on a.patient_id = c.account_id\n"
                + "join Services_Detail sd on a.service_detail_id = sd.service_detail_id\n"
                + "where a.patient_id = ?";
        double total = 0.0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
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
<<<<<<< HEAD

=======
    
>>>>>>> test
    public void updateUserProfile(String fullname, String email, String phonenumber, String address, String dob, String gender, int account_id) {
        String sqlCustomers = "UPDATE Customers SET full_name = ?, address = ?, dob = ?, gender = ? WHERE account_id = ?";
        String sqlAccounts = "UPDATE Accounts SET email = ?, phone_number = ? WHERE account_id = ?";
        
        try {
            // Cập nhật bảng Customers
            PreparedStatement preCustomers = connection.prepareStatement(sqlCustomers);
            preCustomers.setString(1, fullname);
            preCustomers.setString(2, address);
            preCustomers.setString(3, dob);
            preCustomers.setString(4, gender);
            preCustomers.setInt(5, account_id);
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
<<<<<<< HEAD


    public List<Appointment> getAppointmentByPatientID(int patientID) {
        List<Appointment> list = new ArrayList<>();
        String sql = """
                       SELECT a.appointment_id, a.appointment_date, 
                                     s.service_name, sd.cost, 
                                     st.service_type_name, st.duration_service
                              FROM dbo.Appointment a
                              JOIN dbo.Services_Detail sd ON sd.service_detail_id = a.service_detail_id
                              JOIN dbo.Services s ON s.service_id = sd.service_id
                              JOIN dbo.Services_Type st ON st.service_type_id = sd.service_type_id
                                     where a.patient_id = ?                                                   """;

=======
    
    public List<Appointment> getAppointmentByPatientID(int patientID) {
        List<Appointment> list = new ArrayList<>();
        String sql = """
                      SELECT * FROM dbo.Appointment a 
                                     JOIN dbo.Services_Detail s ON s.service_detail_id = a.service_detail_id 
                                     JOIN dbo.Services se ON se.service_id = s.service_id 
                                     JOIN dbo.Services_Type st ON st.service_type_id = s.service_type_id 
                                     JOIN dbo.Doctors d ON a.doctor_id = d.doctor_id
                                     JOIN dbo.Slots sl ON a.slot_id = sl.slot_id 
                                     where a.patient_id = ?                                                   """;
        
>>>>>>> test
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            ResultSet rs = st.executeQuery();
<<<<<<< HEAD

            while (rs.next()) {
                int id = rs.getInt("appointment_id");
                Date date = rs.getDate("appointment_date");
                String serviceNameResult = rs.getString("service_name");
                int cost = rs.getInt("cost");
                String serviceTypeNameResult = rs.getString("service_type_name");
                String duration = rs.getString("duration_service");

                Services service = new Services(serviceNameResult);
                ServiceTypes serviceType = new ServiceTypes(serviceTypeNameResult, duration);
                ServiceDetail serviceDetail = new ServiceDetail(cost);
                Appointment appointment = new Appointment(id, date, service, serviceDetail, serviceType);
                list.add(appointment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Appointment> getAppointmentByAppointmentId(int appointment_id) {
        List<Appointment> list = new ArrayList<>();
        String sql = """
            SELECT a.appointment_id, a.appointment_status, 
                   d.doctor_name, sl.start_time, sl.end_time, 
                   s.service_description, st.admin_fullname
            FROM dbo.Appointment a 
            JOIN dbo.Services_Detail sd ON sd.service_detail_id = a.service_detail_id 
            JOIN dbo.Services s ON s.service_id = sd.service_id 
            JOIN dbo.Staff st on a.staff_id = st.account_id
            JOIN dbo.Doctors d ON a.doctor_id = d.doctor_id
            JOIN dbo.Slots sl ON a.slot_id = sl.slot_id 
            WHERE a.appointment_id = ? """;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, appointment_id);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("appointment_id");
                    String status = rs.getString("appointment_status");
                    String doctorName = rs.getString("doctor_name");
                    LocalTime startTime = rs.getTime("start_time").toLocalTime();
                    LocalTime endTime = rs.getTime("end_time").toLocalTime();
                    String serviceDescription = rs.getString("service_description");
                    String staff_name = rs.getString("admin_fullname");
                    Staffs staff = new Staffs(staff_name);
                    Slots slot = new Slots(id, startTime, endTime);
                    Doctors doctor = new Doctors(id, doctorName);
                    Services service = new Services(doctorName, serviceDescription);

                    list.add(new Appointment(id, status, staff, doctor, slot, service));
                }
=======
            
            while (rs.next()) {
                int appointment_id = rs.getInt("appointment_id");
                Date appointment_date2 = rs.getDate("appointment_date");
                String appointment_status = rs.getString("appointment_status");
                String doctor_name = rs.getString("doctor_name");
                int doctor_id = rs.getInt("doctor_id");
                Doctors doctor = new Doctors(doctor_id, doctor_name);
                String start_time = rs.getString("start_time");
                String end_time = rs.getString("end_time");
                int slot_id = rs.getInt("slot_id");
                Slots slot = new Slots(slot_id, start_time, end_time);
                String service_description = rs.getString("service_description");
                String service_name = rs.getString("service_name");
                int type_id = rs.getInt("service_type_id");
                String service_type_name = rs.getString("service_type_name");
                String duration_service = rs.getString("duration_service");
                Services service = new Services(service_name, service_description);
                ServiceTypes serviceType = new ServiceTypes(type_id, service_type_name, duration_service);
                int cost = rs.getInt("cost");
                int service_detail_id = rs.getInt("service_detail_id");
                ServiceDetail service_detail = new ServiceDetail(service_detail_id, service, serviceType, cost);
                int account_id = rs.getInt("patient_id");
                Account account = new Account(account_id);
                UserProfile user = new UserProfile(account);
                Appointment appointment = new Appointment(appointment_id, appointment_date2, appointment_status, doctor, slot, serviceType, service, service_detail, user);
                list.add(appointment);
>>>>>>> test
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Appointment> searchAppointments(String serviceName, String serviceTypeName, String startDate, String endDate) {
    List<Appointment> list = new ArrayList<>();
    StringBuilder sql = new StringBuilder("""
        SELECT a.appointment_id, a.appointment_date, 
               s.service_name, sd.cost, 
               st.service_type_name, st.duration_service
        FROM dbo.Appointment a
        JOIN dbo.Services_Detail sd ON sd.service_detail_id = a.service_detail_id
        JOIN dbo.Services s ON s.service_id = sd.service_id
        JOIN dbo.Services_Type st ON st.service_type_id = sd.service_type_id
        WHERE 1=1
    """);

    List<String> params = new ArrayList<>();

    if (serviceName != null && !serviceName.isEmpty()) {
        sql.append(" AND s.service_name COLLATE SQL_Latin1_General_CP1_CI_AI LIKE  ? ");
        params.add("%" + serviceName + "%");
    }

    if (serviceTypeName != null && !serviceTypeName.isEmpty()) {
        sql.append(" AND st.service_type_name LIKE ? ");
        params.add("%" + serviceTypeName + "%");
    }

    if (startDate != null && !startDate.isEmpty()) {
        sql.append(" AND a.appointment_date >= ? ");
        params.add(startDate);
    }

    if (endDate != null && !endDate.isEmpty()) {
        sql.append(" AND a.appointment_date <= ? ");
        params.add(endDate);
    }

    try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
        for (int i = 0; i < params.size(); i++) {
            st.setString(i + 1, params.get(i));
        }
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("appointment_id");
                Date date = rs.getDate("appointment_date");
                String serviceNameResult = rs.getString("service_name");
                int cost = rs.getInt("cost");
                String serviceTypeNameResult = rs.getString("service_type_name");
                String duration = rs.getString("duration_service");

                Services service = new Services(serviceNameResult);
                ServiceTypes serviceType = new ServiceTypes(serviceTypeNameResult, duration);
                ServiceDetail serviceDetail = new ServiceDetail(cost);

                list.add(new Appointment(id, date, service, serviceDetail, serviceType));
            }
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return list;
}


    public List<Appointment> getAppointmentByPage(ArrayList<Appointment> list, int start, int end) {
        ArrayList<Appointment> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public boolean CheckPhoneNumber(String phone_number, int account_id) {
        String sql = "SELECT * FROM Accounts WHERE phone_number = ? AND account_id <> ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone_number);
            st.setInt(2, account_id);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("Lỗi khi kiểm tra số điện thoại: " + e.getMessage());
        }
        return false;
    }

    public boolean CheckEmail(String email, int account_id) {
        String sql = """
                 SELECT * FROM Accounts
                 WHERE email = ? AND account_id <> ?
                 """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, account_id);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("Lỗi khi kiểm tra email: " + e.getMessage());
        }
        return false;
    }

    public boolean UpdateImageProfile(String imagePath, int account_id) {
        String sql = """
                      Update Customers 
                     Set image_profile_user = ? where account_id = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, imagePath);
            st.setInt(2, account_id);
            return st.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }
    
<<<<<<< HEAD
    public static void main(String[] args) {
        UserProfileDAO dao = new UserProfileDAO();
        for (Appointment a : dao.getAppointmentByAppointmentId(7)) {
            System.out.println(a);
=======
     public List<Appointment> getAppointmentByAppointmentId(int appointment_id) {
        List<Appointment> list = new ArrayList<>();
        String sql = """
            SELECT a.appointment_id, a.appointment_status, 
                   d.doctor_name, sl.start_time, sl.end_time, 
                   s.service_description, st.admin_fullname
            FROM dbo.Appointment a 
            JOIN dbo.Services_Detail sd ON sd.service_detail_id = a.service_detail_id 
            JOIN dbo.Services s ON s.service_id = sd.service_id 
            JOIN dbo.Staff st on a.staff_id = st.staff_id
            JOIN dbo.Doctors d ON a.doctor_id = d.doctor_id
            JOIN dbo.Slots sl ON a.slot_id = sl.slot_id 
            WHERE a.appointment_id = ? """;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, appointment_id);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("appointment_id");
                    String status = rs.getString("appointment_status");
                    String doctorName = rs.getString("doctor_name");
                    String startTime = rs.getString("start_time");
                    String endTime = rs.getString("end_time");
                    String serviceDescription = rs.getString("service_description");
                    String staff_name = rs.getString("admin_fullname");
                    Staffs staff = new Staffs(staff_name);
                    Slots slot = new Slots(id, startTime, endTime);
                    Doctors doctor = new Doctors(id, doctorName);
                    Services service = new Services(doctorName, serviceDescription);

                    list.add(new Appointment(id, status, staff, doctor, slot, service));
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
>>>>>>> test
        }

    }
    
    public List<Appointment> searchAppointments(String serviceName, String serviceTypeName, String startDate, String endDate) {
        List<Appointment> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("""
        SELECT a.appointment_id, a.appointment_date, 
               s.service_name, sd.cost, 
               st.service_type_name, st.duration_service
        FROM dbo.Appointment a
        JOIN dbo.Services_Detail sd ON sd.service_detail_id = a.service_detail_id
        JOIN dbo.Services s ON s.service_id = sd.service_id
        JOIN dbo.Services_Type st ON st.service_type_id = sd.service_type_id
        WHERE 1=1
    """);
        
        List<String> params = new ArrayList<>();
        
        if (serviceName != null && !serviceName.isEmpty()) {
            sql.append(" AND s.service_name COLLATE SQL_Latin1_General_CP1_CI_AI LIKE  ? ");
            params.add("%" + serviceName + "%");
        }
        
        if (serviceTypeName != null && !serviceTypeName.isEmpty()) {
            sql.append(" AND st.service_type_name LIKE ? ");
            params.add("%" + serviceTypeName + "%");
        }
        
        if (startDate != null && !startDate.isEmpty()) {
            sql.append(" AND a.appointment_date >= ? ");
            params.add(startDate);
        }
        
        if (endDate != null && !endDate.isEmpty()) {
            sql.append(" AND a.appointment_date <= ? ");
            params.add(endDate);
        }
        
        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                st.setString(i + 1, params.get(i));
            }
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("appointment_id");
                    Date date = rs.getDate("appointment_date");
                    String serviceNameResult = rs.getString("service_name");
                    int cost = rs.getInt("cost");
                    String serviceTypeNameResult = rs.getString("service_type_name");
                    String duration = rs.getString("duration_service");
                    
                    Services service = new Services(serviceNameResult);
                    ServiceTypes serviceType = new ServiceTypes(serviceTypeNameResult, duration);
                    ServiceDetail serviceDetail = new ServiceDetail(cost);
                    
                    list.add(new Appointment(id, date, service, serviceDetail, serviceType));
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Appointment> getAppointmentByPage(ArrayList<Appointment> list, int start, int end) {
        ArrayList<Appointment> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public boolean CheckPhoneNumber(String phone_number, int account_id) {
        String sql = "SELECT * FROM Accounts WHERE phone_number = ? AND account_id <> ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone_number);
            st.setInt(2, account_id);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("Lỗi khi kiểm tra số điện thoại: " + e.getMessage());
        }
        return false;
    }
    
    public boolean CheckEmail(String email, int account_id) {
        String sql = """
                 SELECT * FROM Accounts
                 WHERE email = ? AND account_id <> ?
                 """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setInt(2, account_id);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("Lỗi khi kiểm tra email: " + e.getMessage());
        }
        return false;
    }
    
    public boolean UpdateImageProfile(String imagePath, int account_id) {
        String sql = """
                      Update Customers 
                     Set image_profile_user = ? where account_id = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, imagePath);
            st.setInt(2, account_id);
            return st.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Rank> getAllRank() {
        List<Rank> list = new ArrayList<>();
        String query = "select * from CustomerRank";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Rank(rs.getInt("rankId"), rs.getString("rankName"), rs.getDouble("minAmount")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean updateRank(int rankId, int accountId) {
        String sql = "Update Customers set rankId = ? where account_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, rankId);
            ps.setInt(2, accountId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
}
