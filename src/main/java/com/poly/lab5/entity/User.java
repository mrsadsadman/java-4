package com.poly.lab5.entity;

import javax.persistence.*;

@Entity
@Table(name = "[User]") // Nhớ giữ dấu [] nếu dùng SQL Server
public class User {
    @Id
    @Column(name = "Id")
    private String id;
    
    @Column(name = "Password")
    private String password;
    
    @Column(name = "Fullname")
    private String fullname;
    
  
    @Column(name = "Email")
    private String email;
    
    @Column(name = "Admin")
    private boolean admin;

    public User() {}

    // --- CÁC HÀM GETTER BẮT BUỘC PHẢI CÓ ĐỂ LẤY THÔNG TIN TỪ VIEW (index.jp)---

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

  
    public String getEmail() { return email; } 
    public void setEmail(String email) { this.email = email; }

   
    public boolean isAdmin() { return admin; } 
    public void setAdmin(boolean admin) { this.admin = admin; }
}