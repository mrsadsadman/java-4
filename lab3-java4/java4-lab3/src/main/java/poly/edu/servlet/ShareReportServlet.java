package poly.edu.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.edu.dao.ShareDAO;
import poly.edu.dao.imp.ShareDAOImpl;
import poly.edu.dto.ShareReport;

/**
 * Servlet implementation class ShareReportServlet
 */
@WebServlet("/share-report")
public class ShareReportServlet extends HttpServlet {

	private ShareDAO shareDAO;

	public void init() {
		this.shareDAO = new ShareDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. Gọi DAO để lấy dữ liệu báo cáo
		List<ShareReport> reportList = shareDAO.getShareReport();

		// 2. Đặt dữ liệu vào request scope
		request.setAttribute("reportList", reportList);

		// 3. Chuyển tiếp đến trang JSP
		request.getRequestDispatcher("/pages/share-report.jsp").forward(request, response);
	}
}