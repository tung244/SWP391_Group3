/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo.listener;

import dal.AppointmentDAO;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.util.List;
import java.util.concurrent.*;
import model.Appointments;

/**
 *
 * @author APC
 */
@WebListener
public class AppointmentReminderListener implements ServletContextListener {

    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("🔹 Ứng dụng đã khởi động! Bắt đầu quét lịch hẹn...");

        scheduler = Executors.newScheduledThreadPool(1);

        scheduler.scheduleAtFixedRate(() -> {
            try {
                sendEmailReminders();
            } catch (Exception e) {
                System.err.println("⚠️ Lỗi khi gửi email nhắc nhở: " + e.getMessage());
                e.printStackTrace();
            }
        }, 0, 2, TimeUnit.HOURS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("🔸 Ứng dụng đang dừng! Dừng tác vụ gửi email...");
        if (scheduler != null) {
            scheduler.shutdown(); // Yêu cầu dừng
            try {
                if (!scheduler.awaitTermination(5, TimeUnit.SECONDS)) {
                    System.out.println("⚠️ Hủy ngay lập tức các tác vụ do không dừng đúng hạn.");
                    scheduler.shutdownNow(); // Ép dừng nếu quá 5 giây
                }
            } catch (InterruptedException e) {
                scheduler.shutdownNow();
            }
        }
    }

    private void sendEmailReminders() {
//        System.out.println("📩 Đang kiểm tra và gửi email nhắc nhở...");
//
//        try {
//            AppointmentDAO dao = new AppointmentDAO();
//            List<Appointments> list = dao.getAppointment(null);
//            for (Appointments appointments : list) {
//                if (appointments.getAppointment_status().equals("Scheduled")) {
//                    // Gọi phương thức gửi email từ class SendMail.java
//                    boolean check = bo.SendMail.MailNotifyPaymentAppointment(appointments);
//                    if (check) {
//                        System.out.println("✅ Đã gửi email nhắc nhở thành công!");
//                    } else {
//                        System.err.println("❌ Gửi email thất bại.");
//                    }
//                }
//            }
//        } catch (Exception e) {
//            System.err.println("❌ Gửi email thất bại: " + e.getMessage());
//        }
    }
}
