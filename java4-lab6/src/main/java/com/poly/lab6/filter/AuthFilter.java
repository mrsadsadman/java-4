package com.poly.lab6.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.lab6.entity.User;


@WebFilter({
    "/admin/*", 
    "/account/change-password", 
    "/account/edit-profile", 
    "/video/like/*", 
    "/video/share/*"
})
public class AuthFilter implements Filter {

    public static final String SECURITY_URI = "securityUri";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        
        // Lấy thông tin user từ session (giả sử key là "user")
        User user = (User) session.getAttribute("user");
        String uri = req.getRequestURI();
        
        // LOGIC KIỂM TRA (Như hình ảnh yêu cầu)
        // 1. Nếu chưa đăng nhập (user == null)
        // 2. HOẶC truy cập vào admin nhưng không phải là admin
        if (user == null || (uri.contains("/admin/") && !user.getAdmin())) {
            // Lưu lại trang người dùng định vào để sau khi login thì quay lại
            session.setAttribute(SECURITY_URI, uri);
            // Chuyển hướng sang trang đăng nhập
            resp.sendRedirect(req.getContextPath() + "/login?message=Vui long dang nhap dung vai tro");
        } else {
            // Cho phép đi tiếp
            chain.doFilter(request, response);
        }
    }
}