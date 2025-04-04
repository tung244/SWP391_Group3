/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author DELL
 */
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.ImagesService;
import model.Role;
import model.ServiceDetail;
import model.ServiceTypes;
import model.Services;
import model.Specialization;
import model.Staffs;

public class ServiceDao extends DBContext {

    PreparedStatement ps = null;
    PreparedStatement ps1 = null;
    ResultSet rs = null;

    public List<ServiceDetail> getServiceAll() {
        List<ServiceDetail> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    sd.service_detail_id, \n"
                + "    s.service_id, \n"
                + "    s.service_name, \n"
                + "    s.service_description,\n"
                + "    s.service_status,\n"
                + "    st.service_type_id, \n"
                + "    st.service_type_name, \n"
                + "    st.duration_service, \n"
                + "    sd.cost,\n"
                + "	sp.specialization_id,\n"
                + "	sp.specialization_name,\n"
                + "    sp.specialization_status\n"
                + "FROM \n"
                + "    Services s\n"
                + "JOIN \n"
                + "    Services_Detail sd ON s.service_id = sd.service_id\n"
                + "JOIN \n"
                + "    Services_Type st ON sd.service_type_id = st.service_type_id\n"
                + "join Specialization sp on s.specialization_id = sp.specialization_id";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                int serviceDetailId = rs.getInt("service_detail_id");
                int specialization_id = rs.getInt("specialization_id");
                String specialization_name = rs.getString("specialization_name");
                String specialization_status = rs.getString("specialization_status");
                int serviceId = rs.getInt("service_id");
                String serviceName = rs.getString("service_name");
                String serviceDescription = rs.getString("service_description");
                String serviceStatus = rs.getString("service_status");
                Specialization specialization = new Specialization(specialization_id, specialization_name, specialization_status);
                Services service = new Services(serviceId, serviceName, serviceDescription, serviceStatus, specialization);

                int serviceTypeId = rs.getInt("service_type_id");
                String serviceTypeName = rs.getString("service_type_name");
                String duration = rs.getString("duration_service");
                ServiceTypes serviceType = new ServiceTypes(serviceTypeId, serviceTypeName, duration);

                double cost = rs.getDouble("cost");

                // Tạo đối tượng ServiceDetail và thêm vào danh sách
                ServiceDetail serviceDetail = new ServiceDetail(serviceDetailId, service, serviceType, cost);
                list.add(serviceDetail);
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
    
    public List<ServiceDetail> getPaginationService(List<ServiceDetail> list, int start, int end){
        List<ServiceDetail> list1 = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list1.add(list.get(i));
        }
        return list1;
    }
    public ServiceDetail getServiceDetailById(int id) {
        String query = "SELECT \n"
                + "    sd.service_detail_id, \n"
                + "    s.service_id, \n"
                + "    s.service_name, \n"
                + "    s.service_description,\n"
                + "    s.service_introduce,\n"
                + "    s.service_benefit,\n"
                + "    s.service_status,\n"
                + "    st.service_type_id, \n"
                + "    st.service_type_name, \n"
                + "    st.duration_service, \n"
                + "    sd.cost,\n"
                + "	sp.specialization_id,\n"
                + "	sp.specialization_name,\n"
                + "    sp.specialization_status\n"
                + "FROM \n"
                + "    Services s\n"
                + "JOIN \n"
                + "    Services_Detail sd ON s.service_id = sd.service_id\n"
                + "JOIN \n"
                + "    Services_Type st ON sd.service_type_id = st.service_type_id\n"
                + "join Specialization sp on s.specialization_id = sp.specialization_id\n"
                + "	where sd.service_detail_id = ?";

        try {

            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                int serviceDetailId = rs.getInt("service_detail_id");
                int specialization_id = rs.getInt("specialization_id");
                String specialization_name = rs.getString("specialization_name");
                String specialization_status = rs.getString("specialization_status");
                int serviceId = rs.getInt("service_id");
                String serviceName = rs.getString("service_name");
                String serviceDescription = rs.getString("service_description");
                String serviceIntroduce = rs.getString("service_introduce");
                String serviceBenefit = rs.getString("service_benefit");
                String serviceStatus = rs.getString("service_status");
                Specialization specialization = new Specialization(specialization_id, specialization_name, specialization_status);
                Services service = new Services(serviceId, serviceName, serviceDescription, serviceIntroduce, serviceBenefit, serviceStatus, specialization);

                int serviceTypeId = rs.getInt("service_type_id");
                String serviceTypeName = rs.getString("service_type_name");
                String duration = rs.getString("duration_service");
                ServiceTypes serviceType = new ServiceTypes(serviceTypeId, serviceTypeName, duration);

                double cost = rs.getDouble("cost");

                // Tạo đối tượng ServiceDetail và thêm vào danh sách
                ServiceDetail serviceDetail = new ServiceDetail(serviceDetailId, service, serviceType, cost);
                return serviceDetail;
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
    public ServiceDetail getServiceDetailByServiceAndType(int sId, int tId) {
        String query = "select * from Services_Detail\n"
                + "where service_id = ? and service_type_id = ?";

        try {

            ps = connection.prepareStatement(query);
            ps.setInt(1, sId);
            ps.setInt(2, tId);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                ServiceDetail serviceDetail = new ServiceDetail();
                serviceDetail.setService_detail_id(rs.getInt(1));
                Services service = new Services();
                service.setService_id(rs.getInt(3));
                serviceDetail.setServices(service);
                ServiceTypes type = new ServiceTypes();
                type.setService_type_id(rs.getInt(2));
                serviceDetail.setServiceType(type);
                serviceDetail.setCost(rs.getDouble(4));
                return serviceDetail;
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

//    public List<ServiceDetail> getServiceByName(String name) {
//        List<ServiceDetail> list = new ArrayList<>();
//        String query = "SELECT \n"
//                + "    sd.service_detail_id, \n"
//                + "    s.service_id, \n"
//                + "    s.service_name, \n"
//                + "    s.service_description,\n"
//                + "    st.service_type_id, \n"
//                + "    st.service_type_name, \n"
//                + "    st.duration_service, \n"
//                + "    sd.cost,\n"
//                + "    sp.specialization_id,\n"
//                + "    sp.specialization_name,\n"
//                + "    sp.specialization_status\n"
//                + "FROM \n"
//                + "    Services s\n"
//                + "JOIN \n"
//                + "    Services_Detail sd ON s.service_id = sd.service_id\n"
//                + "JOIN \n"
//                + "    Services_Type st ON sd.service_type_id = st.service_type_id\n"
//                + "JOIN \n"
//                + "    Specialization sp ON s.specialization_id = sp.specialization_id\n"
//                + "WHERE \n"
//                + "    s.service_name COLLATE SQL_Latin1_General_CP1_CI_AS LIKE ?";
//
//        try {
//
//            ps = connection.prepareStatement(query);
//            ps.setString(1, "%" + name + "%");
//            rs = ps.executeQuery();
//
//            while (rs.next()) {
//                // Lấy dữ liệu từ ResultSet
//                int serviceDetailId = rs.getInt("service_detail_id");
//                int specialization_id = rs.getInt("specialization_id");
//                String specialization_name = rs.getString("specialization_name");
//                String specialization_status = rs.getString("specialization_status");
//                int serviceId = rs.getInt("service_id");
//                String serviceName = rs.getString("service_name");
//                String serviceDescription = rs.getString("service_description");
//
//                Specialization specialization = new Specialization(specialization_id, specialization_name, specialization_status);
//                Services service = new Services(serviceId, serviceName, serviceDescription, specialization);
//
//                int serviceTypeId = rs.getInt("service_type_id");
//                String serviceTypeName = rs.getString("service_type_name");
//                String duration = rs.getString("duration_service");
//                ServiceTypes serviceType = new ServiceTypes(serviceTypeId, serviceTypeName, duration);
//
//                double cost = rs.getDouble("cost");
//
//                // Tạo đối tượng ServiceDetail và thêm vào danh sách
//                ServiceDetail serviceDetail = new ServiceDetail(serviceDetailId, service, serviceType, cost);
//                list.add(serviceDetail);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            // Đóng tài nguyên
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (ps != null) {
//                    ps.close();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return list;
//    }
    public List<ServiceDetail> getServiceByName(String name) {
        List<ServiceDetail> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    sd.service_detail_id, \n"
                + "    s.service_id, \n"
                + "    s.service_name, \n"
                + "    s.service_description,\n"
                + "	s.service_introduce,\n"
                + "	s.service_benefit,\n"
                + "	s.service_status,\n"
                + "    st.service_type_id, \n"
                + "    st.service_type_name, \n"
                + "    st.duration_service, \n"
                + "    sd.cost,\n"
                + "    sp.specialization_id,\n"
                + "    sp.specialization_name,\n"
                + "    sp.specialization_status\n"
                + "FROM \n"
                + "    [Services] s\n"
                + "JOIN \n"
                + "    Services_Detail sd ON s.service_id = sd.service_id\n"
                + "JOIN \n"
                + "    Services_Type st ON sd.service_type_id = st.service_type_id\n"
                + "JOIN \n"
                + "    Specialization sp ON s.specialization_id = sp.specialization_id\n"
                + "WHERE \n"
                + "    s.service_name COLLATE SQL_Latin1_General_CP1_CI_AS LIKE ?";

        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                int serviceDetailId = rs.getInt("service_detail_id");
                int specialization_id = rs.getInt("specialization_id");
                String specialization_name = rs.getString("specialization_name");
                String specialization_status = rs.getString("specialization_status");
                int serviceId = rs.getInt("service_id");
                String serviceName = rs.getString("service_name");
                String serviceDescription = rs.getString("service_description");
                String serviceIntroduce = rs.getString("service_introduce");
                String serviceBenefit = rs.getString("service_benefit");
                String serviceStatus = rs.getString("service_status");

                Specialization specialization = new Specialization(specialization_id, specialization_name, specialization_status);
                Services service = new Services(serviceId, serviceName, serviceDescription, serviceIntroduce, serviceBenefit, serviceStatus, specialization);

                int serviceTypeId = rs.getInt("service_type_id");
                String serviceTypeName = rs.getString("service_type_name");
                String duration = rs.getString("duration_service");
                ServiceTypes serviceType = new ServiceTypes(serviceTypeId, serviceTypeName, duration);

                double cost = rs.getDouble("cost");

                // Tạo đối tượng ServiceDetail và thêm vào danh sách
                ServiceDetail serviceDetail = new ServiceDetail(serviceDetailId, service, serviceType, cost);
                list.add(serviceDetail);
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

    public List<ServiceDetail> getServiceBySpecializationId(int id) {
        List<ServiceDetail> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    sd.service_detail_id, \n"
                + "    s.service_id, \n"
                + "    s.service_name, \n"
                + "    s.service_description,\n"
                + "    s.service_status,\n"
                + "    st.service_type_id, \n"
                + "    st.service_type_name, \n"
                + "    st.duration_service, \n"
                + "    sd.cost,\n"
                + "    sp.specialization_id,\n"
                + "    sp.specialization_name,\n"
                + "    sp.specialization_status\n"
                + "FROM \n"
                + "    Services s\n"
                + "JOIN \n"
                + "    Services_Detail sd ON s.service_id = sd.service_id\n"
                + "JOIN \n"
                + "    Services_Type st ON sd.service_type_id = st.service_type_id\n"
                + "JOIN \n"
                + "    Specialization sp ON s.specialization_id = sp.specialization_id\n"
                + "WHERE \n"
                + "    sp.specialization_id = ?";

        try {

            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                int serviceDetailId = rs.getInt("service_detail_id");
                int specialization_id = rs.getInt("specialization_id");
                String specialization_name = rs.getString("specialization_name");
                String specialization_status = rs.getString("specialization_status");
                int serviceId = rs.getInt("service_id");
                String serviceName = rs.getString("service_name");
                String serviceDescription = rs.getString("service_description");
                String serviceStatus = rs.getString("service_status");
                Specialization specialization = new Specialization(specialization_id, specialization_name, specialization_status);
                Services service = new Services(serviceId, serviceName, serviceDescription, serviceStatus, specialization);

                int serviceTypeId = rs.getInt("service_type_id");
                String serviceTypeName = rs.getString("service_type_name");
                String duration = rs.getString("duration_service");
                ServiceTypes serviceType = new ServiceTypes(serviceTypeId, serviceTypeName, duration);

                double cost = rs.getDouble("cost");

                // Tạo đối tượng ServiceDetail và thêm vào danh sách
                ServiceDetail serviceDetail = new ServiceDetail(serviceDetailId, service, serviceType, cost);
                list.add(serviceDetail);
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

    public List<ServiceDetail> getSortBySpecialization(String sort) {
        List<ServiceDetail> list = new ArrayList<>();

        // Kiểm tra xem `sort` có hợp lệ không (phòng tránh SQL Injection)
        String orderBy = "ASC"; // Mặc định là tăng dần
        if ("desc".equalsIgnoreCase(sort)) {
            orderBy = "DESC";
        }

        String query = "SELECT \n"
                + "    sd.service_detail_id, \n"
                + "    s.service_id, \n"
                + "    s.service_name, \n"
                + "    s.service_description,\n"
                + "    s.service_status,\n"
                + "    st.service_type_id, \n"
                + "    st.service_type_name, \n"
                + "    st.duration_service, \n"
                + "    sd.cost,\n"
                + "    sp.specialization_id,\n"
                + "    sp.specialization_name,\n"
                + "    sp.specialization_status\n"
                + "FROM \n"
                + "    Services s\n"
                + "JOIN \n"
                + "    Services_Detail sd ON s.service_id = sd.service_id\n"
                + "JOIN \n"
                + "    Services_Type st ON sd.service_type_id = st.service_type_id\n"
                + "JOIN \n"
                + "    Specialization sp ON s.specialization_id = sp.specialization_id\n"
                + "ORDER BY sp.specialization_name " + orderBy; // Nối chuỗi trực tiếp

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Lấy dữ liệu từ ResultSet
                int serviceDetailId = rs.getInt("service_detail_id");
                int specialization_id = rs.getInt("specialization_id");
                String specialization_name = rs.getString("specialization_name");
                String specialization_status = rs.getString("specialization_status");
                int serviceId = rs.getInt("service_id");
                String serviceName = rs.getString("service_name");
                String serviceDescription = rs.getString("service_description");
                String serviceStatus = rs.getString("service_status");
                Specialization specialization = new Specialization(specialization_id, specialization_name, specialization_status);
                Services service = new Services(serviceId, serviceName, serviceDescription, serviceStatus, specialization);

                int serviceTypeId = rs.getInt("service_type_id");
                String serviceTypeName = rs.getString("service_type_name");
                String duration = rs.getString("duration_service");
                ServiceTypes serviceType = new ServiceTypes(serviceTypeId, serviceTypeName, duration);

                double cost = rs.getDouble("cost");

                // Tạo đối tượng ServiceDetail và thêm vào danh sách
                ServiceDetail serviceDetail = new ServiceDetail(serviceDetailId, service, serviceType, cost);
                list.add(serviceDetail);
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

    public List<Specialization> getAllSpecialization() {
        String query = " select * from Specialization";
        List<Specialization> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Specialization(rs.getInt("specialization_id"),
                        rs.getString("specialization_name"),
                        rs.getString("specialization_status")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Services> getAllServicesOnly() {
        String query = " select * from [Services]";
        List<Services> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Services(rs.getInt("service_id"),
                        rs.getString("service_name"),
                        rs.getString("service_description"),
                        rs.getString("service_status"),
                        new Specialization(rs.getInt("specialization_id"))));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ImagesService> getAllServiceWithImage() {
        List<ImagesService> list = new ArrayList<>();
        String query = "select * from Images_Service i join [Services] s on i.service_id = s.service_id";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int serviceId = rs.getInt("service_id");
                String serviceName = rs.getString("service_name");
                String serviceDescription = rs.getString("service_description");
                Services service = new Services(serviceId, serviceName, serviceDescription);
                String image_main = rs.getString("image_main");
                String image_before = rs.getString("image_before");
                String image_after = rs.getString("image_after");
                ImagesService image = new ImagesService(service, image_main, image_before, image_after);
                list.add(image);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ImagesService getServiceWithImageById(int id) {
        String query = "select * from Images_Service i join [Services] s on i.service_id = s.service_id where s.service_id =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int serviceId = rs.getInt("service_id");
                String serviceName = rs.getString("service_name");
                String serviceDescription = rs.getString("service_description");
                Services service = new Services(serviceId, serviceName, serviceDescription);
                String image_main = rs.getString("image_main");
                String image_before = rs.getString("image_before");
                String image_after = rs.getString("image_after");
                ImagesService image = new ImagesService(service, image_main, image_before, image_after);
                return image;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Services getOnlyServiceById(int id) {
        String query = " select * from [Services] where service_id = ?";
        List<Services> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Services(rs.getInt("service_id"),
                        rs.getString("service_name"),
                        rs.getString("service_description"),
                        rs.getString("service_status"),
                        new Specialization(rs.getInt("specialization_id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<ServiceTypes> getAllServiceType() {
        String query = "SELECT * FROM Services_Type";
        List<ServiceTypes> serviceTypesList = new ArrayList<>();
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int serviceTypeId = rs.getInt("service_type_id");
                String serviceTypeName = rs.getString("service_type_name");
                String duration = rs.getString("duration_service");
                ServiceTypes serviceType = new ServiceTypes(serviceTypeId, serviceTypeName, duration);
                serviceTypesList.add(serviceType);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return serviceTypesList;
    }

    public boolean updateServiceDetail(ServiceDetail serviceDetail) {
        Connection conn = null;
        PreparedStatement psServices = null;
        PreparedStatement psDetail = null;
        PreparedStatement psSpecialization = null;
        boolean success = false;

        // Câu lệnh SQL cập nhật cho bảng Services và Services_Detail
        String updateServicesQuery = "UPDATE Services "
                + "SET service_name = ?, "
                + "    service_description = ?, "
                + "    service_introduce = ?, "
                + "    service_benefit = ?, "
                + "    service_status = ?, "
                + "    specialization_id = (SELECT specialization_id FROM Specialization WHERE specialization_name = ?) "
                + "WHERE service_id = (SELECT service_id FROM Services_Detail WHERE service_detail_id = ?);";

        String updateServiceDetailQuery = "UPDATE Services_Detail "
                + "SET cost = ?, "
                + "    service_type_id = (SELECT service_type_id FROM Services_Type WHERE service_type_name = ?) "
                + "WHERE service_detail_id = ?;";

        try {
            conn = connection;
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Cập nhật bảng Services
            psServices = conn.prepareStatement(updateServicesQuery);
            psServices.setString(1, serviceDetail.getServices().getService_name());
            psServices.setString(2, serviceDetail.getServices().getService_description());
            psServices.setString(3, serviceDetail.getServices().getService_introduce());
            psServices.setString(4, serviceDetail.getServices().getService_benefit());
            psServices.setString(5, serviceDetail.getServices().getService_status());
            psServices.setString(6, serviceDetail.getServices().getSpecialization().getSpecialization_name());
            psServices.setInt(7, serviceDetail.getService_detail_id());

            int rowsUpdatedServices = psServices.executeUpdate();

            // Cập nhật bảng Services_Detail
            psDetail = conn.prepareStatement(updateServiceDetailQuery);
            psDetail.setDouble(1, serviceDetail.getCost());
            psDetail.setString(2, serviceDetail.getServiceType().getService_type_name());
            psDetail.setInt(3, serviceDetail.getService_detail_id());

            int rowsUpdatedDetail = psDetail.executeUpdate();

            // Cập nhật trạng thái của Specialization
            if (rowsUpdatedServices > 0 && rowsUpdatedDetail > 0) {
                conn.commit(); // Commit transaction nếu mọi thứ OK
                success = true;
            } else {
                conn.rollback(); // Rollback nếu có lỗi
            }
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback(); // Rollback trong trường hợp có exception
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (psServices != null) {
                    psServices.close();
                }
                if (psDetail != null) {
                    psDetail.close();
                }
                if (psSpecialization != null) {
                    psSpecialization.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset auto commit về true
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    public boolean addServiceDetail(ServiceDetail serviceDetail) {
        Connection conn = null;
        PreparedStatement psServices = null;
        PreparedStatement psDetail = null;
        PreparedStatement psSpecialization = null;
        boolean success = false;

        // Câu lệnh SQL để thêm vào bảng Services, Services_Detail và Specialization nếu cần
        String insertServicesQuery = "INSERT INTO Services (service_name, service_description,service_introduce,service_benefit,service_status, specialization_id) "
                + "VALUES (?, ?,?,?,?, (SELECT specialization_id FROM Specialization WHERE specialization_name = ?));";

        String insertServiceDetailQuery = "INSERT INTO Services_Detail (service_id, service_type_id, cost) "
                + "VALUES ((SELECT service_id FROM Services WHERE service_name = ?), "
                + "(SELECT service_type_id FROM Services_Type WHERE service_type_name = ?), ?);";

        try {
            conn = connection;
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Thêm vào bảng Services
            psServices = conn.prepareStatement(insertServicesQuery);
            psServices.setString(1, serviceDetail.getServices().getService_name());
            psServices.setString(2, serviceDetail.getServices().getService_description());
            psServices.setString(3, serviceDetail.getServices().getService_introduce());
            psServices.setString(4, serviceDetail.getServices().getService_benefit());
            psServices.setString(5, serviceDetail.getServices().getService_status());
            psServices.setString(6, serviceDetail.getServices().getSpecialization().getSpecialization_name());

            int rowsInsertedServices = psServices.executeUpdate();

            // Thêm vào bảng Services_Detail
            psDetail = conn.prepareStatement(insertServiceDetailQuery);
            psDetail.setString(1, serviceDetail.getServices().getService_name());
            psDetail.setString(2, serviceDetail.getServiceType().getService_type_name());
            psDetail.setDouble(3, serviceDetail.getCost());

            int rowsInsertedDetail = psDetail.executeUpdate();

            if (rowsInsertedServices > 0 && rowsInsertedDetail > 0) {
                conn.commit(); // Commit transaction nếu mọi thứ OK
                success = true;
            } else {
                conn.rollback(); // Rollback nếu có lỗi
            }
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback(); // Rollback trong trường hợp có exception
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (psServices != null) {
                    psServices.close();
                }
                if (psDetail != null) {
                    psDetail.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset auto commit về true
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    public boolean deleteService(int serviceDetailId) {
        Connection conn = null;
        PreparedStatement psDetail = null;
        PreparedStatement psService = null;
        boolean success = false;

        // Câu lệnh SQL để xóa từ bảng Services_Detail và Services
        String getServiceIdQuery = "SELECT service_id FROM Services_Detail WHERE service_detail_id = ?";
        String deleteServiceDetailQuery = "DELETE FROM Services_Detail WHERE service_detail_id = ?";
        String deleteServiceQuery = "DELETE FROM Services WHERE service_id = ?";

        try {
            conn = connection;
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Lấy service_id trước khi xóa
            PreparedStatement psGetId = conn.prepareStatement(getServiceIdQuery);
            psGetId.setInt(1, serviceDetailId);
            ResultSet rs = psGetId.executeQuery();

            if (rs.next()) {
                int serviceId = rs.getInt("service_id");

                // Xóa từ bảng Services_Detail trước
                psDetail = conn.prepareStatement(deleteServiceDetailQuery);
                psDetail.setInt(1, serviceDetailId);
                int rowsDeletedDetail = psDetail.executeUpdate();

                // Sau đó xóa từ bảng Services
                if (rowsDeletedDetail > 0) {
                    psService = conn.prepareStatement(deleteServiceQuery);
                    psService.setInt(1, serviceId);
                    int rowsDeletedService = psService.executeUpdate();

                    if (rowsDeletedService > 0) {
                        conn.commit();
                        success = true;
                    } else {
                        conn.rollback();
                    }
                } else {
                    conn.rollback();
                }
            }
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (psDetail != null) {
                    psDetail.close();
                }
                if (psService != null) {
                    psService.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    public static void main(String[] args) {
        ServiceDao dao = new ServiceDao();
        String name = "Khám mắt tổng quát";
        List<ImagesService> list = dao.getAllServiceWithImage();
        for (ImagesService serviceDetail : list) {
            System.out.println(serviceDetail);
        }

//        ServiceDetail s = dao.getServiceDetailById(1);
//        System.out.println(s);
    }
}
