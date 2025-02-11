/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import model.ServiceTypes;
import model.Slots;

/**
 *
 * @author DELL
 */
public class AppointmentDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Slots> getSlotByServiceType(int id) {
        List<Slots> list = new ArrayList<>();
        String query = "select * from Slots s join Services_Type st on s.service_type_id = st.service_type_id\n"
                + "where s.service_type_id =?";
        try{
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                int slot_id = rs.getInt("slot_id");
                java.sql.Time sqlstart_time = rs.getTime("start_time");
                java.sql.Time sqlend_time = rs.getTime("end_time");
                int service_type_id = rs.getInt("service_type_id");
                
                LocalTime start_time = sqlstart_time.toLocalTime();
                LocalTime end_time = sqlend_time.toLocalTime();
                
                ServiceTypes serviceType = new ServiceTypes(service_type_id);
                Slots slot = new Slots(slot_id, start_time, end_time, serviceType);
                list.add(slot);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args) {
        AppointmentDAO dao = new AppointmentDAO();
        List<Slots> list = dao.getSlotByServiceType(2);
        for (Slots slots : list) {
            System.out.println(slots);
        }
    }
}
