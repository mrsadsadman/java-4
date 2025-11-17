package poly.edu.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.edu.dao.FavoriteDAO;
import poly.edu.dao.UserDAO;
import poly.edu.dao.imp.UserDAOImpl;
import poly.edu.model.Favorite;
import poly.edu.model.User;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private UserDAO userDAO;
	private FavoriteDAO favoriteDAO;

	public void init() {
		this.userDAO = new UserDAOImpl();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Giả sử bạn lấy userId từ session hoặc parameter
		// Ở đây ta hardcode "NVTeo" để test
		String userId = "NVTeo"; // Thay bằng logic lấy user id thật
		User user = userDAO.findById(userId);
		List<Favorite> videos = user.getFavorites();

		if (user != null) {
			// Đặt user vào request scope để JSP có thể lấy
			request.setAttribute("user", user);
			request.setAttribute("reports", videos);
		}

		// Chuyển tiếp đến trang JSP
		request.getRequestDispatcher("/pages/profile.jsp").forward(request, response);
	}
}
