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
    
     public List<Machine> loadMachine(String machine_id) {
        String sql = "select * from Machine where 1=1 ";
        if(machine_id !=null && !machine_id.isEmpty()){
            sql+= "and machine_id = ?";
        }
        List<Machine> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if(machine_id !=null && !machine_id.isEmpty()){
                st.setString(1, machine_id);
            }
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
     
    
}
