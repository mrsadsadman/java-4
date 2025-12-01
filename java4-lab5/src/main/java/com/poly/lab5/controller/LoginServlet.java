package com.poly.lab5.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.poly.lab5.dao.UserDAO;
import com.poly.lab5.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String pass = req.getParameter("password");
        
        UserDAO dao = new UserDAO();
        User user = dao.findById(id);
        
        if (user == null) {
            req.setAttribute("message", "Sai tên đăng nhập!");
        } else if (!pass.equals(user.getPassword())) {
            req.setAttribute("message", "Sai mật khẩu!");
        } else {
            req.setAttribute("message", "Đăng nhập thành công!");
            // Lưu user vào session theo yêu cầu
            req.getSession().setAttribute("user", user);
            // Chuyển hướng về trang chủ hoặc load lại trang để thấy tên
            resp.sendRedirect(req.getContextPath() + "/index.jsp"); 
            return;
        }
        
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }
}