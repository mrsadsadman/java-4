package com.poly.lab7;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig // Bắt buộc để nhận file
@WebServlet("/bai2")
public class Bai2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		try {
			// 1. Nhận file từ client (tham số 'file' trùng với key trong FormData ở JS)
			Part filePart = request.getPart("file");

			// Lấy thông tin file
			String fileName = filePart.getSubmittedFileName();
			String fileType = filePart.getContentType();
			long fileSize = filePart.getSize();

			// 2. Lưu file vào thư mục 'uploads' trong server
			// Lấy đường dẫn thực tế đến thư mục uploads
			String uploadPath = "D:/D/java3/workspade/java4-lab7/src/main/webapp/uploads";
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists())
				uploadDir.mkdir(); // Tạo thư mục nếu chưa có

			// Ghi file
			filePart.write(uploadPath + File.separator + fileName);

			// 3. Tạo chuỗi JSON trả về
			// Cấu trúc: {"name": ?, "type": ?, "size": ?}
			String jsonResult = String.format("{\"name\": \"%s\", \"type\": \"%s\", \"size\": %d}", fileName, fileType,
					fileSize);

			// Gửi về client
			response.getWriter().print(jsonResult);

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("{\"error\": \"Lỗi upload file\"}");
		}
	}
}