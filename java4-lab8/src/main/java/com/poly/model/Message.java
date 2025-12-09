package com.poly.model; // Nhớ sửa package này cho đúng với cấu trúc thư mục của em

public class Message {
    
    // 1. Khai báo các thuộc tính
    private String text;
    private int type;      // 0: Join, 1: Left, 2: Chat
    private String sender; // Tên người gửi
    private int count;     // Số lượng người đang online

    // 2. Constructor rỗng (No-Args Constructor) - RẤT QUAN TRỌNG với thư viện JSON
    public Message() {
    }

    // 3. Constructor đầy đủ tham số (All-Args Constructor)
    public Message(String text, int type, String sender, int count) {
        this.text = text;
        this.type = type;
        this.sender = sender;
        this.count = count;
    }

    // 4. Các phương thức Getter và Setter
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    // (Tuỳ chọn) Hàm toString để debug cho dễ nếu cần
    @Override
    public String toString() {
        return "Message [text=" + text + ", type=" + type + ", sender=" + sender + ", count=" + count + "]";
    }
}