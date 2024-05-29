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
 * Servlet implementation class AdminUpdateConfirmServlet
 */
@WebServlet("/adminupdateconfirm")
public class AdminUpdateConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUpdateConfirmServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストオブジェクトのエンコーディング方式の指定
		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの取得
		String admin_id = request.getParameter("admin_id");
		String admin_name = request.getParameter("admin_name");
		String password = request.getParameter("password");

		String messageNull;
		String passwordFail;
		String url = "admin-update-confirm.jsp";

		if (admin_id.equals("") || admin_name.equals("")  ) {
			messageNull = "入力内容に不備があります";
			url = "admin-update.jsp";
			request.setAttribute("messageNull", messageNull);
			
		}
		
		if (password.length() < 8 || password.equals("")) {
			passwordFail = "8文字以上のパスワードを入力してください";
			System.out.print("a");
			url = "admin-update.jsp";
			request.setAttribute("passwordFail", passwordFail);
		}

		
		AdminBean admin = new AdminBean();
		admin.setAdmin_id(admin_id);
		admin.setAdmin_name(admin_name);
		admin.setPassword(password);

		// リクエストスコープへの属性の設定
		request.setAttribute("admin", admin);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
