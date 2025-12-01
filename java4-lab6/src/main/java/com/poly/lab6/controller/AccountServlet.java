package com.poly.lab6.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet quản lý tài khoản
@WebServlet({"/account/sign-up", "/account/change-password", "/account/edit-profile"})
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message", "Chào mừng đến trang Account: " + req.getRequestURI());
        req.getRequestDispatcher("/views/page.jsp").forward(req, resp);
    }
}

