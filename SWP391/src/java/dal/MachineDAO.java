/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Machine;


public class MachineDAO extends DBContext{
    public List<Machine> getAllMachine() {
        String sql = "select * from Machine";
        List<Machine> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Machine ma = new Machine(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
                list.add(ma);
            }

        } catch (Exception e) {
        }
        return list;

    }
    public static void main(String[] args) {
        MachineDAO ma = new MachineDAO();
        for (Machine machine : ma.getAllMachine()) {
            System.out.println(machine.getMachine_id());
        }
    }
}
