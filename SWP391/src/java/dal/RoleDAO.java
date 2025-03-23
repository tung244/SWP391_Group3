/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Role;

public class RoleDAO extends DBContext {

    public List<Role> getAllRole() {
        List<Role> r = new ArrayList<>();
        String sql = "select * from Role";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2));
                r.add(role);
            }

        } catch (Exception e) {
        }

        return r;
    }
}
