package com.poly.lab5.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. Hủy bỏ Session hiện tại (Xóa thông tin user, xóa giỏ hàng...)
        // Lệnh này sẽ kích hoạt hàm sessionDestroyed() bên Listener
        req.getSession().invalidate(); 
        
        // 2. Chuyển hướng về trang đăng nhập
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}