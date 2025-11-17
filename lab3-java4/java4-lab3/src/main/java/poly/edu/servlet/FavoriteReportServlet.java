package poly.edu.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.edu.dao.FavoriteDAO;
import poly.edu.dao.imp.FavoriteDAOImpl;
import poly.edu.model.Favorite;

/**
 * Servlet implementation class b
 */
@WebServlet("/favorite-report")
public class FavoriteReportServlet extends HttpServlet {
	private FavoriteDAO favoriteDAO;

	public void init() {
		this.favoriteDAO = new FavoriteDAOImpl(); // Bạn cần tạo FavoriteDAOImpl
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Lấy TẤT CẢ các lượt thích từ CSDL
		List<Favorite> favoriteList = favoriteDAO.findAll();

		// Đặt danh sách này vào request scope
		request.setAttribute("reports", favoriteList);

		// Chuyển tiếp đến trang JSP
		request.getRequestDispatcher("/pages/favorite-report.jsp").forward(request, response);
	}
}
