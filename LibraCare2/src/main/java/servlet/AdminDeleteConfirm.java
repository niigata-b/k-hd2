package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.AdminBean;



/**
 * Servlet implementation class AdminDeleteConfirm
 */
@WebServlet("/admindeleteconfirm")
public class AdminDeleteConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteConfirm() {
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


		String url = "admin-delete-confirm.jsp";

		AdminBean admindeleteconfirm = new AdminBean();

		admindeleteconfirm.setAdmin_id(admin_id);
		admindeleteconfirm.setAdmin_name(admin_name);
		admindeleteconfirm.setPassword(password);

		// リクエストスコープへの属性の設定
		request.setAttribute("admindeleteconfirm", admindeleteconfirm);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
