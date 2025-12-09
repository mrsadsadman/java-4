package com.poly.model;
public class Employee {
    private String id;     // Mã nhân viên
    private String name;   // Họ tên
    private boolean gender; // Giới tính (true: Male, false: Female)
    private double salary; // Lương

    // Constructor mặc định (bắt buộc cho Jackson)
    public Employee() { }

    // Constructor đầy đủ
    public Employee(String id, String name, boolean gender, double salary) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.salary = salary;
    }

    // Getter và Setter (Bắt buộc phải có để chuyển đổi JSON)
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public boolean isGender() { return gender; }
    public void setGender(boolean gender) { this.gender = gender; }
    public double getSalary() { return salary; }
    public void setSalary(double salary) { this.salary = salary; }
}