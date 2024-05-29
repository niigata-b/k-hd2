package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AdminDAO;
import model.entity.AdminBean;

/**
 * Servlet implementation class AdminUpdateServlet
 */
@WebServlet("/adminupdate")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String admin_id = request.getParameter("admin_id");
		String admin_name = request.getParameter("admin_name");
		String password = request.getParameter("password");

		int count = 0;
		String url = null;

		AdminBean admin = new AdminBean();
		AdminDAO dao = new AdminDAO();

		admin.setAdmin_id(admin_id);
		admin.setAdmin_name(admin_name);
		admin.setPassword(password);

		// リクエストスコープへの属性の設定
		request.setAttribute("admin", admin);

		try {
			count = dao.adminupdate(admin);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		if (count != 0) {
			url = "admin-update-result.jsp";
		} else {
			url = "admin-update-failure.jsp";
		}

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}