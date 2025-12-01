package com.poly.lab5.test;

import com.poly.lab5.dao.UserDAO;
import com.poly.lab5.entity.User;

public class TestConnection {
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        
        // Thay "admin" bằng một ID chắc chắn có trong SQL của bạn
        String testId = "admin"; 
        
        System.out.println("Đang kiểm tra kết nối...");
        User u = dao.findById(testId);
        
        if (u != null) {
            System.out.println("--> THÀNH CÔNG! Đã lấy được user: " + u.getFullname());
        } else {
            System.out.println("--> THẤT BẠI! Kết nối được nhưng không tìm thấy ID: " + testId);
            System.out.println("Hãy kiểm tra lại tên bảng và tên cột trong Entity User.");
        }
    }
}