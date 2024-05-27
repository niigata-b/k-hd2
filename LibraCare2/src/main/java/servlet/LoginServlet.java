package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.AdminDAO;

/**
 * Servlet implementation class LoginServletTest
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = null;

		request.setCharacterEncoding("UTF-8");

		String admin_id = request.getParameter("admin_id");
		String password = request.getParameter("password");
		String loginFailureMessage = ("ログインに失敗しました");

		try {
			AdminDAO adminDao = new AdminDAO();

			if (adminDao.loginCheck(admin_id, password)) {
				url = "menu";

				HttpSession session = request.getSession();
				session.setAttribute("admin_id", admin_id);

			} else {
				url = "top-menu-login.jsp";
				request.setAttribute("loginFailureMessage",loginFailureMessage);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
