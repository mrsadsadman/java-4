package com.poly.lab6.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "[User]") 
public class User {
    @Id
    private String id; // Username
    private String password;
    private String fullname;
    private String email;
    private boolean admin = false; // Vai trò: true là admin

    // Getter & Setter (Bắt buộc phải có)
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public boolean getAdmin() { return admin; } // Chú ý getter cho boolean
    public void setAdmin(boolean admin) { this.admin = admin; }
    // ... các getter setter khác
}