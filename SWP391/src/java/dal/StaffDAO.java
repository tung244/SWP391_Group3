/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.beans.Statement;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Staffs;
import java.sql.Timestamp;
import java.sql.Date;
import java.sql.SQLException;
import model.Account;
import model.Role;
import java.sql.Connection;
import model.StaffDetail;

/**
 *
 * @author DELL
 */
public class StaffDAO extends DBContext {

    PreparedStatement ps = null;
    PreparedStatement psUpdateAccount = null;
    PreparedStatement psUpdateStaff = null;

    ResultSet rs = null;

    public List<Staffs> getAllStaff() {
        List<Staffs> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    s.account_id,\n"
                + "    a.username,\n"
                + "    a.email,\n"
                + "    a.phone_number,\n"
                + "    a.created_date,\n"
                + "    r.role_id,\n"
                + "    r.role_name,\n"
                + "    s.admin_fullname,\n"
                + "    s.admin_address,\n"
                + "    s.admin_dob,\n"
                + "    s.admin_gender,\n"
                + "    s.image_profile_admin,\n"
                + "    s.admin_hired_date,\n"
                + "    s.admin_salary\n"
                + "FROM Staff s\n"
                + "JOIN Accounts a ON s.account_id = a.account_id\n"
                + "JOIN Role r ON a.role_id = r.role_id;";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                int account_id = rs.getInt("account_id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String phone_number = rs.getString("phone_number");
                String created_date = rs.getString("created_date");
                int role_id = rs.getInt("role_id");
                String role_name = rs.getString("role_name");
                String admin_fullname = rs.getString("admin_fullname");
                String admin_address = rs.getString("admin_address");
                Date admin_dob = rs.getDate("admin_dob");
                String admin_gender = rs.getString("admin_gender");
                String image_profile_admin = rs.getString("image_profile_admin");
                Timestamp admin_hired_date = rs.getTimestamp("admin_hired_date");
                BigDecimal admin_salary = rs.getBigDecimal("admin_salary");

                Role role = new Role(role_id, role_name);
                Account account = new Account(account_id, username, email, phone_number, created_date, role);
                Staffs staff = new Staffs(account, admin_fullname, admin_address, admin_dob, admin_gender, image_profile_admin, admin_hired_date, admin_salary);
                list.add(staff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public Staffs getStaffById(int id) {
        List<Staffs> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    s.account_id,\n"
                + "    a.username,\n"
                + "    a.email,\n"
                + "    a.phone_number,\n"
                + "    a.created_date,\n"
                + "    r.role_id,\n"
                + "    r.role_name,\n"
                + "    s.admin_fullname,\n"
                + "    s.admin_address,\n"
                + "    s.admin_dob,\n"
                + "    s.admin_gender,\n"
                + "    s.image_profile_admin,\n"
                + "    s.admin_hired_date,\n"
                + "    s.admin_salary\n"
                + "FROM Staff s\n"
                + "JOIN Accounts a ON s.account_id = a.account_id\n"
                + "JOIN Role r ON a.role_id = r.role_id"
                + " where s.account_id = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                int account_id = rs.getInt("account_id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String phone_number = rs.getString("phone_number");
                String created_date = rs.getString("created_date");
                int role_id = rs.getInt("role_id");
                String role_name = rs.getString("role_name");
                String admin_fullname = rs.getString("admin_fullname");
                String admin_address = rs.getString("admin_address");
                Date admin_dob = rs.getDate("admin_dob");
                String admin_gender = rs.getString("admin_gender");
                String image_profile_admin = rs.getString("image_profile_admin");
                Timestamp admin_hired_date = rs.getTimestamp("admin_hired_date");
                BigDecimal admin_salary = rs.getBigDecimal("admin_salary");

                Role role = new Role(role_id, role_name);
                Account account = new Account(account_id, username, email, phone_number, created_date, role);
                Staffs staff = new Staffs(account, admin_fullname, admin_address, admin_dob, admin_gender, image_profile_admin, admin_hired_date, admin_salary);
                return staff;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public boolean updateStaff(Staffs staff) throws SQLException {
        Connection conn = null;
        PreparedStatement psUpdateStaff = null;
        boolean success = false;

        String updateStaffQuery = "UPDATE Staff SET admin_fullname = ?, admin_address = ?, admin_dob = ?, "
                + "admin_gender = ?, image_profile_admin = ?, admin_hired_date = ?, admin_salary = ? WHERE account_id = ?";

        try {
            // Khởi tạo kết nối
            conn = connection; // Đảm bảo rằng connection đã được khởi tạo
            conn.setAutoCommit(false); // Bắt đầu giao dịch

            // Cập nhật thông tin trong bảng Staff
            psUpdateStaff = conn.prepareStatement(updateStaffQuery);
            psUpdateStaff.setString(1, staff.getAdmin_fullname());
            psUpdateStaff.setString(2, staff.getAdmin_address());
            psUpdateStaff.setDate(3, new java.sql.Date(staff.getAdmin_dob().getTime()));
            psUpdateStaff.setString(4, staff.getAdmin_gender());
            psUpdateStaff.setString(5, staff.getImage_profile_admin()); // Kiểm tra giá trị này
            psUpdateStaff.setTimestamp(6, staff.getAdmin_hired_date()); // Kiểm tra giá trị này
            psUpdateStaff.setBigDecimal(7, staff.getAdmin_salary()); // Kiểm tra giá trị này
            psUpdateStaff.setInt(8, staff.getAccount().getAccount_id());

            int rowsUpdatedStaff = psUpdateStaff.executeUpdate();

            // Commit nếu có dòng được cập nhật
            if (rowsUpdatedStaff > 0) {
                conn.commit();
                success = true;
            } else {
                conn.rollback(); // Rollback nếu không có dòng nào được cập nhật
            }
        } catch (SQLException e) {
            if (conn != null) {
                conn.rollback(); // Rollback trong trường hợp có exception
            }
            e.printStackTrace();
        } finally {
            try {
                if (psUpdateStaff != null) {
                    psUpdateStaff.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset auto commit về true
                    conn.close(); // Đảm bảo đóng kết nối
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    public boolean addStaff(Staffs staff) throws SQLException {
        Connection conn = null;
        PreparedStatement psInsertAccount = null;
        PreparedStatement psInsertStaff = null;
        boolean success = false;

        String insertAccountQuery = "INSERT INTO Accounts (username, password, email, phone_number, created_date, role_id) VALUES (?, ?, ?, ?, ?, ?)";
        String insertStaffQuery = "INSERT INTO Staff (account_id, admin_fullname, admin_address, admin_dob, admin_gender, "
                + "image_profile_admin, admin_hired_date, admin_salary) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = connection; // Đảm bảo rằng connection đã được khởi tạo
            conn.setAutoCommit(false); // Bắt đầu giao dịch

            // Xác định role_id dựa trên vai trò được chọn
            int roleId = 0;
            String roleName = staff.getAccount().getRole().getRole_name();
            if ("Sales".equals(roleName)) {
                roleId = 2; // Giả sử role_id cho Sales là 1
            } else if ("Customer Support".equals(roleName)) {
                roleId = 5; // Giả sử role_id cho Customer Support là 2
            } else {
                throw new IllegalArgumentException("Role must be Sales or Customer Support");
            }

            // Thêm tài khoản
            psInsertAccount = conn.prepareStatement(insertAccountQuery);
            psInsertAccount.setString(1, staff.getAccount().getUsername());
            psInsertAccount.setString(2, staff.getAccount().getPassword());
            psInsertAccount.setString(3, staff.getAccount().getEmail());
            psInsertAccount.setString(4, staff.getAccount().getPhonenumber());
            psInsertAccount.setTimestamp(5, new Timestamp(System.currentTimeMillis())); // Sử dụng thời gian hiện tại
            psInsertAccount.setInt(6, roleId); // Sử dụng role_id đã xác định
            psInsertAccount.executeUpdate();

            // Lấy account_id bằng cách thực hiện truy vấn SELECT
            String selectAccountIdQuery = "SELECT account_id FROM Accounts WHERE username = ?";
            try (PreparedStatement psSelectAccountId = conn.prepareStatement(selectAccountIdQuery)) {
                psSelectAccountId.setString(1, staff.getAccount().getUsername());
                ResultSet rsAccount = psSelectAccountId.executeQuery();
                if (rsAccount.next()) {
                    int accountId = rsAccount.getInt("account_id");

                    // Thêm thông tin nhân viên
                    psInsertStaff = conn.prepareStatement(insertStaffQuery);
                    psInsertStaff.setInt(1, accountId); // Sử dụng account_id vừa tạo
                    psInsertStaff.setString(2, staff.getAdmin_fullname());
                    psInsertStaff.setString(3, staff.getAdmin_address());
                    psInsertStaff.setDate(4, new java.sql.Date(staff.getAdmin_dob().getTime()));
                    psInsertStaff.setString(5, staff.getAdmin_gender());
                    psInsertStaff.setString(6, staff.getImage_profile_admin());
                    psInsertStaff.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
                    psInsertStaff.setBigDecimal(8, staff.getAdmin_salary());

                    int rowsInsertedStaff = psInsertStaff.executeUpdate();

                    // Commit nếu mọi thứ thành công
                    if (rowsInsertedStaff > 0) {
                        conn.commit();
                        success = true;
                    } else {
                        conn.rollback(); // Rollback nếu có lỗi
                    }
                }
            }
        } catch (SQLException | IllegalArgumentException e) {
            if (conn != null) {
                conn.rollback(); // Rollback trong trường hợp có exception
            }
            e.printStackTrace();
        } finally {
            try {
                if (psInsertAccount != null) {
                    psInsertAccount.close();
                }
                if (psInsertStaff != null) {
                    psInsertStaff.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset auto commit về true
                    conn.close(); // Đảm bảo đóng kết nối
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    public boolean deleteStaff(int id) {
        String deleteStaffSQL = "DELETE FROM Staff WHERE account_id = ?";
        String deleteAccountSQL = "DELETE FROM Accounts WHERE account_id = ?";

        try (PreparedStatement st1 = connection.prepareStatement(deleteStaffSQL); PreparedStatement st2 = connection.prepareStatement(deleteAccountSQL)) {

            st1.setInt(1, id);
            int rowsDeletedFromStaff = st1.executeUpdate();  

            st2.setInt(1, id);
            int rowsDeletedFromAccounts = st2.executeUpdate();  
            
            return rowsDeletedFromStaff > 0 || rowsDeletedFromAccounts > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Staffs> searchStaffs(String name, String address, String phone, String roleName) {
        List<Staffs> staffList = new ArrayList<>();
        StringBuilder sql = new StringBuilder("""
        SELECT s.account_id, a.username, a.email, a.phone_number, a.created_date, 
               r.role_id, r.role_name, s.admin_fullname, s.admin_address, 
               s.admin_dob, s.admin_gender, s.image_profile_admin, 
               s.admin_hired_date, s.admin_salary
        FROM Staff s
        JOIN Accounts a ON s.account_id = a.account_id
        JOIN Role r ON a.role_id = r.role_id
        WHERE 1=1
    """);

        List<String> params = new ArrayList<>();

        if (name != null && !name.isEmpty()) {
            sql.append(" AND s.admin_fullname COLLATE SQL_Latin1_General_CP1_CI_AI LIKE ?");
            System.out.println(name);
            params.add("%" + name + "%");
        }

        if (address != null && !address.isEmpty()) {
            sql.append(" AND s.admin_address LIKE ?");
            params.add("%" + address + "%");
        }

        if (phone != null && !phone.isEmpty()) {
            sql.append(" AND a.phone_number LIKE  ?");
            params.add("%" + phone + "%");
        }

        if (roleName != null && !roleName.isEmpty()) {
            sql.append(" AND r.role_name LIKE  ?");
            params.add("%" + roleName + "%");
        }
        
        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setString(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int accountId = rs.getInt("account_id");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phone_number");
                    String createdDate = rs.getString("created_date");
                    int roleId = rs.getInt("role_id");
                    String role_name = rs.getString("role_name");
                    String adminFullname = rs.getString("admin_fullname");
                    String adminAddress = rs.getString("admin_address");
                    Date adminDob = rs.getDate("admin_dob");
                    String adminGender = rs.getString("admin_gender");
                    String imageProfileAdmin = rs.getString("image_profile_admin");
                    Timestamp adminHiredDate = rs.getTimestamp("admin_hired_date");
                    BigDecimal adminSalary = rs.getBigDecimal("admin_salary");

                    Role role = new Role(roleId, role_name);
                    Account account = new Account(accountId, username, email, phoneNumber, createdDate, role);
                    Staffs staff = new Staffs(account, adminFullname, adminAddress, adminDob, adminGender, imageProfileAdmin, adminHiredDate, adminSalary);

                    staffList.add(staff);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return staffList;
    }

    public List<String> getAllAddresses() {
        List<String> addressList = new ArrayList<>();
        String sql = "SELECT DISTINCT admin_address FROM Staff";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                addressList.add(rs.getString("admin_address"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return addressList;
    }
    
    public List<Staffs> getStaffByPage(ArrayList<Staffs> list, int start, int end) {
        ArrayList<Staffs> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO();
        dao.deleteStaff(24);

//        for (String ss : s) {
//            System.out.println(ss);
//        }
//        int id = 8;
//        Staffs s = dao.getStaffById(id);
//        System.out.println(s);
    }
}
