package com.poly.lab7;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.model.Employee;
import com.poly.util.RestIO;

@WebServlet("/employees/*") // Dấu * để bắt được cả ID phía sau
public class EmployeeRestServlet extends HttpServlet {

	// Giả lập Database
	private static Map<String, Employee> map = new HashMap<>();
	static {
		map.put("NV01", new Employee("NV01", "Nhân viên 01", true, 500));
		map.put("NV02", new Employee("NV02", "Nhân viên 02", false, 1500));
		map.put("NV03", new Employee("NV03", "Nhân viên 03", true, 5000));
	}

	// Lấy danh sách hoặc lấy 1 nhân viên
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String info = req.getPathInfo(); // Lấy phần sau /employees

		if (info == null || info.length() <= 1) {
			// URL: /employees -> Trả về danh sách
			RestIO.writeObject(resp, map.values());

		} else {
			// URL: /employees/NV01 -> Trả về 1 nhân viên
			String id = info.substring(1); // Bỏ dấu /
			if (map.containsKey(id)) {
				RestIO.writeObject(resp, map.get(id));
			} else {
				resp.setStatus(404); // Không tìm thấy
			}
		}
	}

	// Tạo mới nhân viên
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Employee emp = RestIO.readObject(req, Employee.class);
		map.put(emp.getId(), emp);
		RestIO.writeObject(resp, emp);
	}

	// Cập nhật nhân viên
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String info = req.getPathInfo();
		String id = info.substring(1); // Lấy ID từ URL

		Employee emp = RestIO.readObject(req, Employee.class);
		map.put(id, emp); // Cập nhật vào map
		RestIO.writeEmptyObject(resp);
	}

	// Xóa nhân viên
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String info = req.getPathInfo();
		String id = info.substring(1);

		map.remove(id);
		RestIO.writeEmptyObject(resp);
	}

}