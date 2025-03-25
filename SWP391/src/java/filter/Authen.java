/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.DispatcherType;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebFilter(filterName = "Authen", urlPatterns = {"/admin/*"}, dispatcherTypes = {DispatcherType.REQUEST})
public class Authen implements Filter {

    private AccountDAO adao = new AccountDAO();
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");

        String contextPath = request.getContextPath();
        String requestPath = request.getRequestURI().substring(contextPath.length());
        
        System.out.println("Context Path: " + contextPath);
        System.out.println("Request URI: " + request.getRequestURI());
        System.out.println("Final Request Path: " + requestPath);
        
        if (requestPath.equals("/admin/loginAdmin")) {
            chain.doFilter(request, response);
            return;
        }
        if (requestPath.equals("/admin/login_show_email") || requestPath.equals("/admin/callback") || requestPath.equals("/admin/dang_xuat")) {
            chain.doFilter(request, response);
            return;
        }
        
        if (requestPath.matches(".+\\.(css|js|png|jpg|gif|ico|woff2|woff|ttf|svg)$")) {
            chain.doFilter(request, response);
            return;
        }

        if (a == null) {
            request.getSession().setAttribute("error", "Đã có lỗi xảy ra! Vui lòng đăng nhập lại!");
            response.sendRedirect("loginAdmin");
            return;
        }
        if (a.getRole().getRole_id() == 5) {
            request.getSession().setAttribute("error", "Bạn không có quyền để truy cập vào đường dẫn này!");
            response.sendRedirect("loginAdmin");
            return;
        }
        if(!adao.hasPermission(a.getRole().getRole_id(), requestPath)){
            request.getSession().setAttribute("error", "hehe");
            response.sendRedirect("dashboard");
            return;
        }

        chain.doFilter(request, response);

    }
}
