package com.poly.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.IOException;

public class RestIO {
    // Đối tượng của Jackson để map dữ liệu
    private static final ObjectMapper mapper = new ObjectMapper();

    /**
     * Đọc chuỗi JSON gửi từ client (Đọc từ Body của Request)
     */
    public static String readJson(HttpServletRequest req) throws IOException {
        req.setCharacterEncoding("utf-8");
        BufferedReader reader = req.getReader();
        String line;
        StringBuilder buffer = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }
        reader.close();
        return buffer.toString();
    }

    /**
     * Đọc JSON từ Client và biến đổi thành Java Object
     */
    public static <T> T readObject(HttpServletRequest req, Class<T> clazz) throws IOException {
        String json = readJson(req);
        // mapper.readValue: Biến chuỗi JSON thành Object class T
        return mapper.readValue(json, clazz);
    }

    /**
     * Gửi chuỗi JSON về Client
     */
    public static void writeJson(HttpServletResponse resp, String json) throws IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json"); // Quan trọng: báo cho client biết đây là JSON
        resp.getWriter().print(json);
        resp.flushBuffer();
    }

    /**
     * Biến Java Object thành JSON và gửi về Client
     */
    public static void writeObject(HttpServletResponse resp, Object data) throws IOException {
        // mapper.writeValueAsString: Biến Object thành chuỗi JSON
        String json = mapper.writeValueAsString(data);
        writeJson(resp, json);
    }
    
    /**
     * Gửi về một đối tượng rỗng (Dùng cho DELETE hoặc PUT khi không cần trả về dữ liệu)
     */
     public static void writeEmptyObject(HttpServletResponse resp) throws IOException {
         writeJson(resp, "{}");
     }
}