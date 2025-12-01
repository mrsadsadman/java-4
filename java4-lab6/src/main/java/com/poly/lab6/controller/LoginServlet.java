package com.poly.lab6.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.lab6.dao.UserDAOImpl;
import com.poly.lab6.entity.User;
import com.poly.lab6.filter.AuthFilter;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        if(message != null) {
            req.setAttribute("message", message);
        }
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("username");
        String pass = req.getParameter("password");
        
        UserDAOImpl dao = new UserDAOImpl();
        User user = dao.findById(id);
        
        if (user == null) {
            req.setAttribute("message", "Invalid username");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } else if (!user.getPassword().equals(pass)) {
            req.setAttribute("message", "Invalid password");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } else {
            // Đăng nhập thành công
            HttpSession session = req.getSession();
            session.setAttribute("user", user); // Lưu user vào session
            
            // Kiểm tra xem trước đó người dùng có định vào trang bảo mật nào không
            String securityUri = (String) session.getAttribute(AuthFilter.SECURITY_URI);
            
            if (securityUri != null) {
                // Nếu có, xóa khỏi session và chuyển hướng tới đó
                session.removeAttribute(AuthFilter.SECURITY_URI);
                resp.sendRedirect(securityUri);
            } else {
                // Nếu không, về trang chủ hoặc trang mặc định
                req.setAttribute("message", "Login successfully");
                req.getRequestDispatcher("/views/page.jsp").forward(req, resp);
            }
        }
    }
}